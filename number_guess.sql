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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    user_id integer,
    guess integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
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
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (318, 11);
INSERT INTO public.games VALUES (318, 12);
INSERT INTO public.games VALUES (319, 702);
INSERT INTO public.games VALUES (319, 407);
INSERT INTO public.games VALUES (320, 678);
INSERT INTO public.games VALUES (320, 279);
INSERT INTO public.games VALUES (319, 705);
INSERT INTO public.games VALUES (319, 52);
INSERT INTO public.games VALUES (319, 981);
INSERT INTO public.games VALUES (318, 9);
INSERT INTO public.games VALUES (321, 380);
INSERT INTO public.games VALUES (321, 834);
INSERT INTO public.games VALUES (322, 220);
INSERT INTO public.games VALUES (322, 176);
INSERT INTO public.games VALUES (321, 237);
INSERT INTO public.games VALUES (321, 725);
INSERT INTO public.games VALUES (321, 883);
INSERT INTO public.games VALUES (323, 59);
INSERT INTO public.games VALUES (323, 108);
INSERT INTO public.games VALUES (324, 454);
INSERT INTO public.games VALUES (324, 277);
INSERT INTO public.games VALUES (323, 729);
INSERT INTO public.games VALUES (323, 404);
INSERT INTO public.games VALUES (323, 209);
INSERT INTO public.games VALUES (325, 439);
INSERT INTO public.games VALUES (325, 149);
INSERT INTO public.games VALUES (326, 524);
INSERT INTO public.games VALUES (326, 632);
INSERT INTO public.games VALUES (325, 612);
INSERT INTO public.games VALUES (325, 697);
INSERT INTO public.games VALUES (325, 652);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (318, 'tyagi');
INSERT INTO public.users VALUES (319, 'user_1678329801951');
INSERT INTO public.users VALUES (320, 'user_1678329801950');
INSERT INTO public.users VALUES (321, 'user_1678330317232');
INSERT INTO public.users VALUES (322, 'user_1678330317231');
INSERT INTO public.users VALUES (323, 'user_1678330352344');
INSERT INTO public.users VALUES (324, 'user_1678330352343');
INSERT INTO public.users VALUES (325, 'user_1678330461776');
INSERT INTO public.users VALUES (326, 'user_1678330461775');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 326, true);


--
-- PostgreSQL database dump complete
--