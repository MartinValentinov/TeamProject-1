--
-- PostgreSQL database dump
--

\restrict JIk3sfAiysHLoYYBTfAs63Np3aHIXvK2EB6uRvckQnPfmZohq3pYaKDDPYduWqt

-- Dumped from database version 17.8
-- Dumped by pg_dump version 17.8

-- Started on 2026-02-25 15:50:36

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
-- TOC entry 2 (class 3079 OID 16393)
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16430)
-- Name: results; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.results (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    subject character varying(30) NOT NULL,
    score integer NOT NULL,
    total_questions integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.results OWNER TO postgres;

--
-- TOC entry 4929 (class 0 OID 16430)
-- Dependencies: 218
-- Data for Name: results; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.results (id, user_id, subject, score, total_questions, created_at) FROM stdin;
\.


--
-- TOC entry 4783 (class 2606 OID 16436)
-- Name: results results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 1259 OID 16438)
-- Name: idx_results_subject; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_results_subject ON public.results USING btree (subject);


--
-- TOC entry 4781 (class 1259 OID 16437)
-- Name: idx_results_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_results_user_id ON public.results USING btree (user_id);


-- Completed on 2026-02-25 15:50:36

--
-- PostgreSQL database dump complete
--

\unrestrict JIk3sfAiysHLoYYBTfAs63Np3aHIXvK2EB6uRvckQnPfmZohq3pYaKDDPYduWqt

