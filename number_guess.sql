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

DROP DATABASE guess_game;
--
-- Name: guess_game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE guess_game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE guess_game OWNER TO freecodecamp;

\connect guess_game

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    num_guesses integer,
    id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Name: guesses_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesses_id_seq OWNER TO freecodecamp;

--
-- Name: guesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesses_id_seq OWNED BY public.guesses.id;


--
-- Name: guesses id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses ALTER COLUMN id SET DEFAULT nextval('public.guesses_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES (12, 1, 'zivi');
INSERT INTO public.guesses VALUES (8, 3, 'zivi');
INSERT INTO public.guesses VALUES (384, 4, 'user_1671910183545');
INSERT INTO public.guesses VALUES (983, 5, 'user_1671910183545');
INSERT INTO public.guesses VALUES (587, 6, 'user_1671910183544');
INSERT INTO public.guesses VALUES (17, 7, 'user_1671910183544');
INSERT INTO public.guesses VALUES (714, 8, 'user_1671910183545');
INSERT INTO public.guesses VALUES (673, 9, 'user_1671910183545');
INSERT INTO public.guesses VALUES (663, 10, 'user_1671910319889');
INSERT INTO public.guesses VALUES (932, 11, 'user_1671910319889');
INSERT INTO public.guesses VALUES (932, 12, 'user_1671910319888');
INSERT INTO public.guesses VALUES (731, 13, 'user_1671910319888');
INSERT INTO public.guesses VALUES (950, 14, 'user_1671910319889');
INSERT INTO public.guesses VALUES (646, 15, 'user_1671910319889');
INSERT INTO public.guesses VALUES (900, 16, 'user_1671910830106');
INSERT INTO public.guesses VALUES (710, 17, 'user_1671910830106');
INSERT INTO public.guesses VALUES (289, 18, 'user_1671910830105');
INSERT INTO public.guesses VALUES (896, 19, 'user_1671910830105');
INSERT INTO public.guesses VALUES (581, 20, 'user_1671910830106');
INSERT INTO public.guesses VALUES (594, 21, 'user_1671910830106');
INSERT INTO public.guesses VALUES (10, 22, 'bibi');
INSERT INTO public.guesses VALUES (11, 23, 'bibi');
INSERT INTO public.guesses VALUES (790, 24, 'user_1671911258565');
INSERT INTO public.guesses VALUES (274, 25, 'user_1671911258565');
INSERT INTO public.guesses VALUES (12, 26, 'user_1671911258564');
INSERT INTO public.guesses VALUES (73, 27, 'user_1671911258564');
INSERT INTO public.guesses VALUES (142, 28, 'user_1671911258565');
INSERT INTO public.guesses VALUES (671, 29, 'user_1671911258565');
INSERT INTO public.guesses VALUES (992, 30, 'user_1671911258565');
INSERT INTO public.guesses VALUES (12, 31, 'cici');
INSERT INTO public.guesses VALUES (11, 32, 'cici');
INSERT INTO public.guesses VALUES (7, 33, 'cici');
INSERT INTO public.guesses VALUES (835, 34, 'user_1671911962253');
INSERT INTO public.guesses VALUES (505, 35, 'user_1671911962253');
INSERT INTO public.guesses VALUES (309, 36, 'user_1671911962252');
INSERT INTO public.guesses VALUES (514, 37, 'user_1671911962252');
INSERT INTO public.guesses VALUES (157, 38, 'user_1671911962253');
INSERT INTO public.guesses VALUES (70, 39, 'user_1671911962253');
INSERT INTO public.guesses VALUES (302, 40, 'user_1671911962253');


--
-- Name: guesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesses_id_seq', 40, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--


