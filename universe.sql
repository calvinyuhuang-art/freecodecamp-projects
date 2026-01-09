--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    number_of_stars integer,
    number_of_planets integer,
    note text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: landing; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.landing (
    landing_id integer NOT NULL,
    name character varying(50) NOT NULL,
    x_coord integer,
    y_coord integer,
    orbit_period integer,
    moon_id integer
);


ALTER TABLE public.landing OWNER TO freecodecamp;

--
-- Name: landing_landing_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.landing_landing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.landing_landing_id_seq OWNER TO freecodecamp;

--
-- Name: landing_landing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.landing_landing_id_seq OWNED BY public.landing.landing_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    planet_id integer NOT NULL,
    number_of_landings integer,
    size character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    radius numeric(10,1),
    description text,
    is_there_water boolean,
    is_there_air boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    galaxy_id integer NOT NULL,
    size character varying(20),
    number_of_planets integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: landing landing_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing ALTER COLUMN landing_id SET DEFAULT nextval('public.landing_landing_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy 1', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'galaxy 2', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'galaxy 4', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'galaxy 5', NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'galaxy 6', NULL, NULL, NULL);


--
-- Data for Name: landing; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.landing VALUES (1, 'landing a', NULL, NULL, NULL, NULL);
INSERT INTO public.landing VALUES (2, 'landing b', NULL, NULL, NULL, NULL);
INSERT INTO public.landing VALUES (3, 'landing c', NULL, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon a', 1, NULL, NULL);
INSERT INTO public.moon VALUES (2, 'moon b', 1, NULL, NULL);
INSERT INTO public.moon VALUES (3, 'moon c', 1, NULL, NULL);
INSERT INTO public.moon VALUES (4, 'landing d', 1, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'landing e', 1, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'landing f', 1, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'landing g', 1, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'landing h', 1, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'landing i', 1, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'landing j', 1, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'landing k', 1, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'landing l', 1, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'landing m', 1, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'landing n', 1, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'landing o', 1, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'landing p', 2, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'landing q', 1, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'landing r', 1, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'landing s', 2, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'landing t', 1, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'landing u', 1, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet 1', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (2, 'planet 2', 12321.1, 'small', false, false, 1);
INSERT INTO public.planet VALUES (3, 'planet 3', 999999.1, 'medium', true, true, 1);
INSERT INTO public.planet VALUES (4, 'planet 4', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (5, 'planet 5', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (6, 'planet 6', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (7, 'planet 7', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (8, 'planet 8', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (9, 'planet 9', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (10, 'planet 10', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (11, 'planet 11', 1232321.1, 'big', false, false, 1);
INSERT INTO public.planet VALUES (12, 'planet 12', 1232321.1, 'big', false, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star a', 1, NULL, NULL);
INSERT INTO public.star VALUES (2, 'star b', 1, NULL, NULL);
INSERT INTO public.star VALUES (3, 'star c', 1, NULL, NULL);
INSERT INTO public.star VALUES (5, 'star 4', 1, NULL, NULL);
INSERT INTO public.star VALUES (6, 'star 5', 1, NULL, NULL);
INSERT INTO public.star VALUES (7, 'star 6', 1, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: landing_landing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.landing_landing_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: landing landing_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing
    ADD CONSTRAINT landing_pkey PRIMARY KEY (landing_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy u_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT u_galaxy_name UNIQUE (name);


--
-- Name: moon u_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT u_moon_name UNIQUE (name);


--
-- Name: landing u_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing
    ADD CONSTRAINT u_name UNIQUE (name);


--
-- Name: planet u_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT u_planet_name UNIQUE (name);


--
-- Name: star u_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT u_star_name UNIQUE (name);


--
-- Name: landing landing_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.landing
    ADD CONSTRAINT landing_fk FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: moon moon_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

