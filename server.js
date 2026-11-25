
require('dotenv').config();

const express = require('express');
const { Pool } = require('pg');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.json());
// STEP 31 - NEW: Serve the student webpage.
app.use('/app', express.static('public'));

// ====================================================
//CONNECT TO NEON POSTGRESQL
// ====================================================

const pool = new Pool(
    process.env.DATABASE_URL
        ? {
            connectionString: process.env.DATABASE_URL
          }
        : {
            host: process.env.DB_HOST,
            port: process.env.DB_PORT,
            database: process.env.DB_NAME,
            user: process.env.DB_USER,
            password: process.env.DB_PASSWORD
          }
);

// Home page
app.get('/', (req, res) => {
    res.send('Welcome to SkillBridge Rwanda!');
});

// Database connection test
app.get('/db-test', async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT current_database() AS database_name'
        );

        res.json({
            status: 'success',
            database: result.rows[0].database_name
        });

    } catch (error) {
        console.error('Database connection error:', error);

        res.status(500).json({
            status: 'error',
            message: 'Database connection failed'
        });
    }
});

app.get('/api/careers', async (req, res) => {
    try {
        const result = await pool.query(
            `SELECT career_id, career_name, description
             FROM careers
             WHERE is_active = TRUE
             ORDER BY career_name`
        );

        res.json({
            status: 'success',
            total: result.rows.length,
            careers: result.rows
        });

    } catch (error) {
        console.error('Error fetching careers:', error);

        res.status(500).json({
            status: 'error',
            message: 'Unable to retrieve careers'
        });
    }
});

app.get('/api/careers/:careerId/skills', async (req, res) => {
    try {
        const careerId = req.params.careerId;

        if (!/^[1-9]\d*$/.test(careerId)) {
            return res.status(400).json({
                status: 'error',
                message: 'Please provide a valid career ID'
            });
        }

        const careerResult = await pool.query(
            `SELECT career_id, career_name
             FROM careers
             WHERE career_id = $1
               AND is_active = TRUE`,
            [careerId]
        );

        if (careerResult.rows.length === 0) {
            return res.status(404).json({
                status: 'error',
                message: 'Career not found'
            });
        }

        const skillsResult = await pool.query(
            `SELECT
                s.skill_id,
                s.skill_name,
                s.description,
                cs.required_level,
                cs.importance_weight
             FROM career_skills cs
             JOIN skills s ON cs.skill_id = s.skill_id
             WHERE cs.career_id = $1
               AND s.is_active = TRUE
             ORDER BY cs.importance_weight DESC,
                      s.skill_name ASC`,
            [careerId]
        );

        res.json({
            status: 'success',
            career: careerResult.rows[0],
            total_skills: skillsResult.rows.length,
            skills: skillsResult.rows
        });

    } catch (error) {
        console.error('Error fetching career skills:', error);

        res.status(500).json({
            status: 'error',
            message: 'Unable to retrieve career skills'
        });
    }
});

app.post('/api/assessments/calculate', async (req, res) => {
    try {
        const { career_id, skills } = req.body || {};

        // Check that a valid career ID was provided.
        if (!/^[1-9]\d*$/.test(String(career_id ?? ''))) {
            return res.status(400).json({
                status: 'error',
                message: 'A valid career_id is required'
            });
        }

        // Check that skill assessments were provided.
        if (!Array.isArray(skills) || skills.length === 0) {
            return res.status(400).json({
                status: 'error',
                message: 'Please provide your skill levels'
            });
        }

        // Retrieve the career and its required skills.
        const result = await pool.query(
            `SELECT
                c.career_name,
                s.skill_id,
                s.skill_name,
                cs.required_level,
                cs.importance_weight
             FROM careers c
             JOIN career_skills cs
                 ON c.career_id = cs.career_id
             JOIN skills s
                 ON cs.skill_id = s.skill_id
             WHERE c.career_id = $1
               AND c.is_active = TRUE
               AND s.is_active = TRUE`,
            [career_id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({
                status: 'error',
                message: 'Career not found or has no active skills'
            });
        }

        // Build a lookup using each skill's ID.
        const providedLevels = new Map();

        for (const item of skills) {
            if (
                !item ||
                !/^[1-9]\d*$/.test(String(item.skill_id ?? '')) ||
                !Number.isInteger(item.current_level) ||
                item.current_level < 0 ||
                item.current_level > 5
            ) {
                return res.status(400).json({
                    status: 'error',
                    message: 'Each skill needs a valid skill_id and a current_level from 0 to 5'
                });
            }

            const skillId = String(item.skill_id);

            if (providedLevels.has(skillId)) {
                return res.status(400).json({
                    status: 'error',
                    message: 'Duplicate skill IDs are not allowed'
                });
            }

            providedLevels.set(skillId, item.current_level);
        }

        // Require one assessment for every career skill.
        const requiredIds = new Set(
            result.rows.map(row => String(row.skill_id))
        );

        if (
            providedLevels.size !== requiredIds.size ||
            [...providedLevels.keys()].some(id => !requiredIds.has(id))
        ) {
            return res.status(400).json({
                status: 'error',
                message: 'Please assess exactly the skills required for this career'
            });
        }

        // Calculate each gap and its priority.
        const gaps = result.rows.map(row => {
            const currentLevel = providedLevels.get(
                String(row.skill_id)
            );

            const gapScore = Math.max(
                row.required_level - currentLevel,
                0
            );

            const priorityScore =
                gapScore * row.importance_weight;

            return {
                skill_id: row.skill_id,
                skill_name: row.skill_name,
                current_level: currentLevel,
                required_level: row.required_level,
                importance_weight: row.importance_weight,
                gap_score: gapScore,
                priority_score: priorityScore
            };
        });

        // Put the highest-priority skills first.
        gaps.sort((a, b) =>
            b.priority_score - a.priority_score
        );

        res.json({
            status: 'success',
            career_name: result.rows[0].career_name,
            total_skills: gaps.length,
            skills_needing_improvement: gaps.filter(
                skill => skill.gap_score > 0
            ).length,
            gaps: gaps
        });

    } catch (error) {
        console.error('Skills-gap calculation error:', error);

        res.status(500).json({
            status: 'error',
            message: 'Unable to calculate skills gaps'
        });
    }
});



// Start the Express server.


app.get('/api/skills/:skillId/resources', async (req, res) => {
    try {
        const skillId = req.params.skillId;

        if (!/^[1-9]\d*$/.test(skillId)) {
            return res.status(400).json({
                status: 'error',
                message: 'Invalid skill ID'
            });
        }

        const result = await pool.query(
            `SELECT resource_id, title, description,
                    resource_type, resource_url
             FROM resources
             WHERE skill_id = $1
               AND is_active = TRUE
             ORDER BY title`,
            [skillId]
        );

        res.json({
            status: 'success',
            total: result.rows.length,
            resources: result.rows
        });

    } catch (error) {
        console.error('Resources API error:', error);

        res.status(500).json({
            status: 'error',
            message: 'Unable to retrieve resources'
        });
    }
});


app.listen(PORT, () => {
    console.log(
        `SkillBridge Rwanda server running on port ${PORT}`
    );
});
