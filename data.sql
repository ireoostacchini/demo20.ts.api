--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-07-22 21:01:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 204 (class 1259 OID 16426)
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16431)
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 205
-- Name: country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.country_id_seq OWNED BY public.countries.id;


--
-- TOC entry 203 (class 1259 OID 16421)
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(10) NOT NULL,
    duration bigint,
    size bigint,
    user_id uuid NOT NULL
);


ALTER TABLE public.files OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16416)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    country_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 2695 (class 2604 OID 16450)
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);


--
-- TOC entry 2834 (class 0 OID 16426)
-- Dependencies: 204
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name) FROM stdin;
1	UK
2	Italy
\.


--
-- TOC entry 2833 (class 0 OID 16421)
-- Dependencies: 203
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, name, type, duration, size, user_id) FROM stdin;
1d9e697c-9059-4544-ba46-ef698ea2ee1c	last file	mp4	1000	2500	1ac2d866-d5a0-4de7-9736-20b660e4b675
273dcc39-454c-4fa1-a1e0-2e6ae0978a63	another file	wav	50000	1234500	c316091e-c09a-4c75-b95b-87f1913a3c5c
644727e3-abac-4ea7-a889-3141979b40f3	yet another file	wav	8848484	\N	1ac2d866-d5a0-4de7-9736-20b660e4b675
867c2226-2433-4681-b125-1f83e6801e06	first file	mp4	\N	200000	c316091e-c09a-4c75-b95b-87f1913a3c5c
e25613ff-a115-4a07-b809-9cc095c6c505	third file	mp4	345654	20000	1ac2d866-d5a0-4de7-9736-20b660e4b675
\.


--
-- TOC entry 2832 (class 0 OID 16416)
-- Dependencies: 202
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, country_id) FROM stdin;
1ac2d866-d5a0-4de7-9736-20b660e4b675	user1	1
f33a49d9-5487-4b23-a7db-cf3fcc994c08	user2	1
c316091e-c09a-4c75-b95b-87f1913a3c5c	user3	2
\.


--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 205
-- Name: country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.country_id_seq', 2, true);


--
-- TOC entry 2697 (class 2606 OID 16420)
-- Name: users Users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 16438)
-- Name: countries country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 16425)
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- TOC entry 2698 (class 1259 OID 16483)
-- Name: IX_files_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_files_type" ON public.files USING btree (type);


--
-- TOC entry 2699 (class 1259 OID 16482)
-- Name: IX_files_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "IX_files_user_id" ON public.files USING btree (user_id);


--
-- TOC entry 2704 (class 2606 OID 16439)
-- Name: users FK_country_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_country_id" FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE RESTRICT NOT VALID;


--
-- TOC entry 2705 (class 2606 OID 16444)
-- Name: files FK_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT "FK_user_id" FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE RESTRICT NOT VALID;


-- Completed on 2020-07-22 21:01:18

--
-- PostgreSQL database dump complete
--

