
# SkillBridge Rwanda

## Project Overview

SkillBridge Rwanda is a career-readiness web application
designed to help university students identify skills gaps
and prepare for entry-level technology careers.

The application allows students to compare their current
skills with career requirements and receive prioritized
recommendations for improving their competencies.

## Problem Statement

Many university students struggle to identify the specific
skills required to transition successfully from education
to employment.

Without clear guidance, students may spend time learning
skills that are less relevant to their desired careers.

SkillBridge Rwanda addresses this challenge by providing
career-specific skills assessments, gap analysis, and
learning recommendations.

## Project Objectives

- Help students explore entry-level career pathways.
- Identify skills required for selected careers.
- Allow students to assess their current proficiency.
- Calculate and prioritize skills gaps.
- Recommend learning resources and practice projects.
- Support students in planning their career development.

## Technologies Used

### Backend
- Node.js
- Express.js
- JavaScript

### Database
- PostgreSQL 18

### Frontend
- HTML
- CSS
- JavaScript

### Development Tools
- Visual Studio Code
- Git
- GitHub

## Current Prototype Features

1. Career selection
2. Career-specific skills requirements
3. Student skills self-assessment (0–5 scale)
4. Automatic skills-gap calculations
5. Skills prioritization using importance weights
6. Personalized learning-resource recommendations
7. Responsive browser-based interface

## Available Career Pathways

- Junior Software Developer
- Junior Data Analyst
- Junior Cybersecurity Analyst

## Skills-Gap Calculation

The system calculates each skills gap using:

Gap = MAX(Required Level - Current Level, 0)

Then it determines learning priority:

Priority Score = Gap × Importance Weight

Skills with higher priority scores appear first.

## Project Structure

SkillBridge-Rwanda/
|
|-- public/
|   |-- index.html
|
|-- server.js
|-- package.json
|-- package-lock.json
|-- .gitignore
|-- README.md

## How to Run the Project Locally

### Prerequisites

Install the following:

- Node.js
- npm
- PostgreSQL 18
- Git (optional for downloading a ZIP archive)

### 1. Clone the Repository

Run:

    git clone <YOUR-REPOSITORY-URL>

Then open the project folder:

    cd SkillBridge-Rwanda

### 2. Install Dependencies

Run:

    npm install

### 3. Configure PostgreSQL

Create a PostgreSQL database named:

    skillbridge_rwanda

The database must contain the project's tables,
career records, skills, career-skill relationships,
and learning resources.

The current prototype requires the database to be
initialized before it can run successfully.

A reusable SQL setup script is not yet included
in this repository.

### 4. Configure Environment Variables

Create a file named .env in the main project folder.

Add:

    DB_HOST=127.0.0.1
    DB_PORT=5432
    DB_NAME=skillbridge_rwanda
    DB_USER=postgres
    DB_PASSWORD=YOUR_LOCAL_DATABASE_PASSWORD
    PORT=3000

Replace YOUR_LOCAL_DATABASE_PASSWORD with the password
for your local PostgreSQL database.

Do not upload the .env file to GitHub.

### 5. Start the Application

Run:

    node server.js

The server should start on port 3000.

### 6. Open the Application

Visit:

    http://localhost:3000/app/

## API Endpoints

GET /api/careers
- Retrieves available career pathways.

GET /api/careers/:careerId/skills
- Retrieves required skills for a selected career.

POST /api/assessments/calculate
- Calculates skills gaps and priority scores.

GET /api/skills/:skillId/resources
- Retrieves learning resources for a skill.

## Current Development Status

The initial student skills-assessment workflow works
locally.

Features still planned or incomplete include:

- Student registration and secure login
- Assessment history and database persistence
- Learning roadmap progress tracking
- Administrator management features
- Public production deployment
- Expanded testing and security hardening

This repository currently represents a functional
local prototype rather than a complete production system.

## Security Notes

- Database credentials are stored in .env.
- The .env file must not be committed to Git.
- Production deployment requires appropriate database
  credentials, security configuration, and testing.

## Academic Project

SkillBridge Rwanda was developed as a university
software engineering prototype focused on supporting
the transition from higher education to employment
in Rwanda and across Africa.
