--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

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
-- Name: scores; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scores (
    score_id integer NOT NULL,
    user_id integer,
    n_guesses integer NOT NULL
);


ALTER TABLE public.scores OWNER TO freecodecamp;

--
-- Name: scores_score_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scores_score_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scores_score_id_seq OWNER TO freecodecamp;

--
-- Name: scores_score_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scores_score_id_seq OWNED BY public.scores.score_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: scores score_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores ALTER COLUMN score_id SET DEFAULT nextval('public.scores_score_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: scores; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scores VALUES (1, 1, 25);
INSERT INTO public.scores VALUES (2, 1, 10);
INSERT INTO public.scores VALUES (3, 1, 8);
INSERT INTO public.scores VALUES (4, 1, 10);
INSERT INTO public.scores VALUES (12, 25, 414);
INSERT INTO public.scores VALUES (13, 25, 102);
INSERT INTO public.scores VALUES (14, 26, 326);
INSERT INTO public.scores VALUES (15, 26, 640);
INSERT INTO public.scores VALUES (16, 25, 318);
INSERT INTO public.scores VALUES (17, 25, 547);
INSERT INTO public.scores VALUES (18, 25, 43);
INSERT INTO public.scores VALUES (19, 1, 10);
INSERT INTO public.scores VALUES (20, 27, 936);
INSERT INTO public.scores VALUES (21, 27, 881);
INSERT INTO public.scores VALUES (22, 28, 233);
INSERT INTO public.scores VALUES (23, 28, 859);
INSERT INTO public.scores VALUES (24, 27, 984);
INSERT INTO public.scores VALUES (25, 27, 994);
INSERT INTO public.scores VALUES (26, 27, 55);
INSERT INTO public.scores VALUES (27, 29, 958);
INSERT INTO public.scores VALUES (28, 29, 615);
INSERT INTO public.scores VALUES (29, 30, 59);
INSERT INTO public.scores VALUES (30, 30, 860);
INSERT INTO public.scores VALUES (31, 29, 291);
INSERT INTO public.scores VALUES (32, 29, 902);
INSERT INTO public.scores VALUES (33, 29, 697);
INSERT INTO public.scores VALUES (34, 33, 9);
INSERT INTO public.scores VALUES (35, 34, 801);
INSERT INTO public.scores VALUES (36, 34, 542);
INSERT INTO public.scores VALUES (37, 35, 950);
INSERT INTO public.scores VALUES (38, 35, 448);
INSERT INTO public.scores VALUES (39, 34, 811);
INSERT INTO public.scores VALUES (40, 34, 956);
INSERT INTO public.scores VALUES (41, 34, 984);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'micgab', 6);
INSERT INTO public.users VALUES (28, 'user_1705663784500', 2);
INSERT INTO public.users VALUES (27, 'user_1705663784501', 5);
INSERT INTO public.users VALUES (30, 'user_1705663881729', 2);
INSERT INTO public.users VALUES (29, 'user_1705663881730', 5);
INSERT INTO public.users VALUES (31, 'test', 0);
INSERT INTO public.users VALUES (32, 'e', 0);
INSERT INTO public.users VALUES (33, 'rwe', 1);
INSERT INTO public.users VALUES (35, 'user_1705664044189', 2);
INSERT INTO public.users VALUES (34, 'user_1705664044190', 5);
INSERT INTO public.users VALUES (26, 'user_1705663569215', 2);
INSERT INTO public.users VALUES (25, 'user_1705663569216', 5);


--
-- Name: scores_score_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scores_score_id_seq', 41, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 35, true);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (score_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: scores scores_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scores
    ADD CONSTRAINT scores_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

