--
-- PostgreSQL database dump
--

\restrict mVGFj0505sXuyGrKOdVOpyJe61Ne2sOlGnu10gTTVVRMbK9soH7zqpGUccSgixy

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: -
--

-- CREATE SCHEMA public;


--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: assessment_responses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessment_responses (
    response_id bigint NOT NULL,
    assessment_id bigint NOT NULL,
    skill_id bigint NOT NULL,
    current_level integer NOT NULL,
    required_level integer NOT NULL,
    gap_score integer NOT NULL,
    priority_score integer NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT assessment_responses_current_level_check CHECK (((current_level >= 0) AND (current_level <= 5))),
    CONSTRAINT assessment_responses_gap_score_check CHECK (((gap_score >= 0) AND (gap_score <= 5))),
    CONSTRAINT assessment_responses_priority_score_check CHECK (((priority_score >= 0) AND (priority_score <= 25))),
    CONSTRAINT assessment_responses_required_level_check CHECK (((required_level >= 1) AND (required_level <= 5)))
);


--
-- Name: assessment_responses_response_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.assessment_responses ALTER COLUMN response_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.assessment_responses_response_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: assessments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.assessments (
    assessment_id bigint NOT NULL,
    user_id bigint NOT NULL,
    career_id bigint NOT NULL,
    assessment_date timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    status character varying(20) DEFAULT 'completed'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT assessments_status_check CHECK (((status)::text = ANY ((ARRAY['in_progress'::character varying, 'completed'::character varying])::text[])))
);


--
-- Name: assessments_assessment_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.assessments ALTER COLUMN assessment_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.assessments_assessment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: career_skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.career_skills (
    career_skill_id bigint NOT NULL,
    career_id bigint NOT NULL,
    skill_id bigint NOT NULL,
    required_level integer NOT NULL,
    importance_weight integer DEFAULT 1 NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT career_skills_importance_weight_check CHECK (((importance_weight >= 1) AND (importance_weight <= 5))),
    CONSTRAINT career_skills_required_level_check CHECK (((required_level >= 1) AND (required_level <= 5)))
);


--
-- Name: career_skills_career_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.career_skills ALTER COLUMN career_skill_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.career_skills_career_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: careers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.careers (
    career_id bigint NOT NULL,
    career_name character varying(150) NOT NULL,
    description text NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: careers_career_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.careers ALTER COLUMN career_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.careers_career_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: resources; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.resources (
    resource_id bigint NOT NULL,
    skill_id bigint NOT NULL,
    title character varying(200) NOT NULL,
    description text,
    resource_type character varying(30) NOT NULL,
    resource_url text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT resources_resource_type_check CHECK (((resource_type)::text = ANY ((ARRAY['course'::character varying, 'tutorial'::character varying, 'article'::character varying, 'video'::character varying, 'practice_project'::character varying])::text[])))
);


--
-- Name: resources_resource_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.resources ALTER COLUMN resource_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.resources_resource_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: roadmap_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roadmap_items (
    roadmap_item_id bigint NOT NULL,
    user_id bigint NOT NULL,
    assessment_id bigint NOT NULL,
    resource_id bigint NOT NULL,
    status character varying(20) DEFAULT 'not_started'::character varying NOT NULL,
    completed_at timestamp with time zone,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT roadmap_items_status_check CHECK (((status)::text = ANY ((ARRAY['not_started'::character varying, 'in_progress'::character varying, 'completed'::character varying])::text[]))),
    CONSTRAINT valid_completion_date CHECK ((((status)::text = 'completed'::text) OR (completed_at IS NULL)))
);


--
-- Name: roadmap_items_roadmap_item_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.roadmap_items ALTER COLUMN roadmap_item_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.roadmap_items_roadmap_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: skills; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.skills (
    skill_id bigint NOT NULL,
    skill_name character varying(150) NOT NULL,
    description text,
    is_active boolean DEFAULT true NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: skills_skill_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.skills ALTER COLUMN skill_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.skills_skill_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    full_name character varying(150) NOT NULL,
    email character varying(255) NOT NULL,
    password_hash text NOT NULL,
    role character varying(20) DEFAULT 'student'::character varying NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['student'::character varying, 'admin'::character varying])::text[])))
);


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: assessment_responses assessment_responses_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_responses
    ADD CONSTRAINT assessment_responses_pkey PRIMARY KEY (response_id);


--
-- Name: assessments assessments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_pkey PRIMARY KEY (assessment_id);


--
-- Name: career_skills career_skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.career_skills
    ADD CONSTRAINT career_skills_pkey PRIMARY KEY (career_skill_id);


--
-- Name: careers careers_career_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.careers
    ADD CONSTRAINT careers_career_name_key UNIQUE (career_name);


--
-- Name: careers careers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.careers
    ADD CONSTRAINT careers_pkey PRIMARY KEY (career_id);


--
-- Name: resources resources_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (resource_id);


--
-- Name: roadmap_items roadmap_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roadmap_items
    ADD CONSTRAINT roadmap_items_pkey PRIMARY KEY (roadmap_item_id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (skill_id);


--
-- Name: skills skills_skill_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_skill_name_key UNIQUE (skill_name);


--
-- Name: roadmap_items unique_assessment_resource; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roadmap_items
    ADD CONSTRAINT unique_assessment_resource UNIQUE (assessment_id, resource_id);


--
-- Name: assessment_responses unique_assessment_skill; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_responses
    ADD CONSTRAINT unique_assessment_skill UNIQUE (assessment_id, skill_id);


--
-- Name: career_skills unique_career_skill; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.career_skills
    ADD CONSTRAINT unique_career_skill UNIQUE (career_id, skill_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: assessment_responses assessment_responses_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_responses
    ADD CONSTRAINT assessment_responses_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES public.assessments(assessment_id) ON DELETE RESTRICT;


--
-- Name: assessment_responses assessment_responses_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessment_responses
    ADD CONSTRAINT assessment_responses_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id) ON DELETE RESTRICT;


--
-- Name: assessments assessments_career_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_career_id_fkey FOREIGN KEY (career_id) REFERENCES public.careers(career_id) ON DELETE RESTRICT;


--
-- Name: assessments assessments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.assessments
    ADD CONSTRAINT assessments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE RESTRICT;


--
-- Name: career_skills career_skills_career_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.career_skills
    ADD CONSTRAINT career_skills_career_id_fkey FOREIGN KEY (career_id) REFERENCES public.careers(career_id) ON DELETE RESTRICT;


--
-- Name: career_skills career_skills_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.career_skills
    ADD CONSTRAINT career_skills_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id) ON DELETE RESTRICT;


--
-- Name: resources resources_skill_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.resources
    ADD CONSTRAINT resources_skill_id_fkey FOREIGN KEY (skill_id) REFERENCES public.skills(skill_id) ON DELETE RESTRICT;


--
-- Name: roadmap_items roadmap_items_assessment_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roadmap_items
    ADD CONSTRAINT roadmap_items_assessment_id_fkey FOREIGN KEY (assessment_id) REFERENCES public.assessments(assessment_id) ON DELETE RESTRICT;


--
-- Name: roadmap_items roadmap_items_resource_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roadmap_items
    ADD CONSTRAINT roadmap_items_resource_id_fkey FOREIGN KEY (resource_id) REFERENCES public.resources(resource_id) ON DELETE RESTRICT;


--
-- Name: roadmap_items roadmap_items_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roadmap_items
    ADD CONSTRAINT roadmap_items_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict mVGFj0505sXuyGrKOdVOpyJe61Ne2sOlGnu10gTTVVRMbK9soH7zqpGUccSgixy

