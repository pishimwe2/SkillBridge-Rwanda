--
-- PostgreSQL database dump
--

\restrict NgmQvEZzBLbP1S1mFK8RxMyddXXcSWiD3GkovR35DWNxtRZZAVXnT2Q5YLVWc9J

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: careers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.careers (career_id, career_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (1, 'Junior Software Developer', 'An entry-level professional who develops, tests, and maintains software applications using programming languages and development tools.', true, '2026-11-24 18:45:38.196254+02', '2026-11-24 18:45:38.196254+02');
INSERT INTO public.careers (career_id, career_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (2, 'Junior Data Analyst', 'An entry-level professional who collects, cleans, analyzes, and visualizes data to support business decisions.', true, '2026-11-24 18:45:38.196254+02', '2026-11-24 18:45:38.196254+02');
INSERT INTO public.careers (career_id, career_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (3, 'Junior Cybersecurity Analyst', 'An entry-level professional who helps protect computer systems, networks, and information by monitoring security threats and supporting incident response.', true, '2026-11-24 18:45:38.196254+02', '2026-11-24 18:45:38.196254+02');


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (1, 'JavaScript', 'Writing and understanding JavaScript code for software development.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (2, 'Python', 'Using Python for programming, automation, and data analysis.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (3, 'SQL', 'Writing queries to retrieve, filter, and manage database information.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (4, 'Git and GitHub', 'Using version control to manage and collaborate on software projects.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (5, 'HTML and CSS', 'Creating and styling web pages and user interfaces.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (6, 'Problem Solving', 'Analyzing problems and developing logical solutions.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (7, 'Data Cleaning', 'Identifying and correcting errors, missing values, and inconsistencies in datasets.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (8, 'Data Visualization', 'Presenting data through charts, dashboards, and other visual formats.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (9, 'Microsoft Excel', 'Using spreadsheets, formulas, and analysis tools to organize and interpret data.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (10, 'Network Security', 'Understanding and protecting computer networks against security threats.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (11, 'Incident Response', 'Identifying, investigating, and responding to information security incidents.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');
INSERT INTO public.skills (skill_id, skill_name, description, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (12, 'Cybersecurity Fundamentals', 'Understanding basic cybersecurity principles, threats, vulnerabilities, and controls.', true, '2026-11-24 18:47:04.460822+02', '2026-11-24 18:47:04.460822+02');


--
-- Data for Name: career_skills; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (1, 1, 1, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (2, 3, 2, 2, 3, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (3, 2, 2, 3, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (4, 1, 2, 3, 3, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (5, 3, 3, 2, 2, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (6, 2, 3, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (7, 1, 3, 3, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (8, 1, 4, 4, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (9, 1, 5, 4, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (10, 3, 6, 4, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (11, 2, 6, 4, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (12, 1, 6, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (13, 2, 7, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (14, 2, 8, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (15, 2, 9, 4, 4, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (16, 3, 10, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (17, 3, 11, 4, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');
INSERT INTO public.career_skills (career_skill_id, career_id, skill_id, required_level, importance_weight, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (18, 3, 12, 5, 5, '2026-11-24 18:50:02.760342+02', '2026-11-24 18:50:02.760342+02');


--
-- Data for Name: resources; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (1, 1, 'JavaScript Guide - MDN', 'Learn JavaScript programming fundamentals.', 'tutorial', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (2, 2, 'Python Official Tutorial', 'Learn Python programming basics.', 'tutorial', 'https://docs.python.org/3/tutorial/', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (3, 3, 'PostgreSQL SQL Tutorial', 'Learn SQL queries and database fundamentals.', 'tutorial', 'https://www.postgresql.org/docs/current/tutorial-sql.html', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (4, 4, 'GitHub Skills', 'Learn how to use GitHub and version control.', 'course', 'https://skills.github.com/', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (5, 5, 'Learn Web Development - MDN', 'Practice creating and styling web pages.', 'tutorial', 'https://developer.mozilla.org/en-US/docs/Learn_web_development', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (6, 6, 'Build a Simple Task Manager', 'Practice breaking problems into smaller steps by building a task manager.', 'practice_project', NULL, true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (7, 7, 'Data Cleaning Practice Project', 'Clean a sample dataset by removing duplicates and handling missing values.', 'practice_project', NULL, true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (8, 8, 'Create a Data Dashboard', 'Build charts and a dashboard from a sample dataset.', 'practice_project', NULL, true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (9, 9, 'Microsoft Excel Help and Learning', 'Learn spreadsheet formulas, charts, and data analysis.', 'tutorial', 'https://support.microsoft.com/en-us/excel', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (10, 10, 'Cisco Networking Academy', 'Explore networking fundamentals and security learning resources.', 'course', 'https://www.netacad.com/', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (11, 11, 'Incident Response Exercise', 'Create a simple incident report and response checklist.', 'practice_project', NULL, true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');
INSERT INTO public.resources (resource_id, skill_id, title, description, resource_type, resource_url, is_active, created_at, updated_at) OVERRIDING SYSTEM VALUE VALUES (12, 12, 'OWASP Top 10', 'Learn about common web application security risks.', 'article', 'https://owasp.org/www-project-top-ten/', true, '2026-11-24 18:51:52.988372+02', '2026-11-24 18:51:52.988372+02');


--
-- Name: career_skills_career_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.career_skills_career_skill_id_seq', 18, true);


--
-- Name: careers_career_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.careers_career_id_seq', 3, true);


--
-- Name: resources_resource_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.resources_resource_id_seq', 12, true);


--
-- Name: skills_skill_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.skills_skill_id_seq', 12, true);


--
-- PostgreSQL database dump complete
--

\unrestrict NgmQvEZzBLbP1S1mFK8RxMyddXXcSWiD3GkovR35DWNxtRZZAVXnT2Q5YLVWc9J

