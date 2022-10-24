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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(50),
    magnitude integer NOT NULL,
    major_axis character varying(50),
    discovery_year integer NOT NULL,
    random_count integer DEFAULT 0 NOT NULL,
    randosm_count integer DEFAULT 12 NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    galaxy_age numeric(20,10),
    galaxy_type text NOT NULL,
    galaxy_distance character varying(50) NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    namer character varying(50) NOT NULL,
    name character varying(50) NOT NULL,
    moon_planet character varying(50) NOT NULL,
    moon_discovery_date numeric NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    planet_age character varying(50) NOT NULL,
    planet_type character varying(50) NOT NULL,
    planet_distance_in_light_years character varying(50) NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    magnitude integer NOT NULL,
    star_in_our_solar_system boolean,
    star_within_twenty_light_years boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Apophis', 3, '0.922', 2004, 0, 12);
INSERT INTO public.asteroid VALUES (2, 'Vasta', 5, '2.361', 1807, 0, 12);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 6, '2.773', 1802, 0, 12);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 30000.0000000000, 'Spiral', 'two million light years');
INSERT INTO public.galaxy VALUES (2, 'Andromeada', 40000.0000000000, 'Spiral', 'four million light years');
INSERT INTO public.galaxy VALUES (3, 'Antennae Galaxies', 50000.0000000000, 'Spiral', 'three million years');
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 60000.0000000000, 'Spiral', 'four million light years');
INSERT INTO public.galaxy VALUES (5, 'Black Eye', 60000.0000000000, 'Spiral', 'four million light years');
INSERT INTO public.galaxy VALUES (6, 'Bode Galaxy', 80000.0000000000, 'Spiral', 'five million light years');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Simon Marius', 'Io', 'Jupiter I', 1610, 1);
INSERT INTO public.moon VALUES (2, 'Simon Marius', 'Europa', 'Jupiter', 1610, 2);
INSERT INTO public.moon VALUES (3, 'Simon Marius', 'Ganymede', 'Jupiter III', 1610, 3);
INSERT INTO public.moon VALUES (4, 'Simon Marius', 'Callisto', 'Jupiter IV', 1610, 4);
INSERT INTO public.moon VALUES (5, 'John Herschel', ' Mimas', 'Saturn I', 1789, 5);
INSERT INTO public.moon VALUES (6, 'John Herschel', 'Enceladus', 'Saturn II', 1789, 6);
INSERT INTO public.moon VALUES (7, 'John Herschel', 'Tethys', 'Saturn III', 1684, 7);
INSERT INTO public.moon VALUES (8, 'John Herschel', 'Dione', 'Saturn IV', 1684, 8);
INSERT INTO public.moon VALUES (9, 'John Herschel', 'Rhea', 'Saturn V', 1672, 9);
INSERT INTO public.moon VALUES (10, 'John Herschel', 'Titan', 'Saturn VI', 1655, 10);
INSERT INTO public.moon VALUES (11, 'John Herschel', 'Iapetus', 'Saturn VIII', 1671, 11);
INSERT INTO public.moon VALUES (12, 'William Lassel', 'Hyperion', 'Saturn VII', 1847, 12);
INSERT INTO public.moon VALUES (13, 'John Herschel', 'Ariel', 'Uranus I', 1851, 13);
INSERT INTO public.moon VALUES (14, 'john Herschel', 'Umbriel', 'Uranus II', 1851, 14);
INSERT INTO public.moon VALUES (15, 'John Herschel', 'Titania', 'Uranus III', 1787, 15);
INSERT INTO public.moon VALUES (16, 'John Herschel', 'Oberon', 'Uranus IV', 1787, 16);
INSERT INTO public.moon VALUES (17, 'Asaph Hall', 'Phobos', 'Mars I', 1876, 17);
INSERT INTO public.moon VALUES (18, 'Asaph Hall', 'Deimos', 'Mars II', 1877, 18);
INSERT INTO public.moon VALUES (19, 'Camille Flammarion', 'Triton', 'Neptune I', 1846, 19);
INSERT INTO public.moon VALUES (20, 'Camille Flammarion', 'Amalthea', 'Jupiter V', 1892, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'four and a half billion years', 'terrestrial', 'one hundred and six million light years', 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'four and a half billion years', 'terrestrial', 'two hundred and forty two million km', 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'four and a half billion years', 'terrestrial', 'not aplicable if you are on earth tbh', 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'four and a half billion years', 'terrestrial', 'one hundred and fifty four million km', 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'four and a half billion years', 'gas giant', 'six hundred and twenty one million km', 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 'four and a half billion years', 'gas giant', 'one point three billion km', 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 'four and a half billion years', 'ice giant', 'two billion km', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'four and a half billion years', 'ice giant', 'four point three billion km', 8);
INSERT INTO public.planet VALUES (9, 'Ceres', 'four and a half billion years', 'dwarf', 'four hundred and thirteen million km', 9);
INSERT INTO public.planet VALUES (10, 'Pluto', 'four and a half billion years', 'dwarf', 'five billion km', 10);
INSERT INTO public.planet VALUES (11, 'Haumea', 'four and a half billion years', 'dwarf', 'seven billion km', 11);
INSERT INTO public.planet VALUES (12, 'Makemake', 'four and a half billion years', 'dwarf', 'five and a half billion km', 12);
INSERT INTO public.planet VALUES (13, 'unknown', 'four billion years', 'dwarf', 'five billion km', 13);
INSERT INTO public.planet VALUES (14, 'Proxima Centauri b', 'four billion years', 'super Earth sxoplanet', 'four light years', 14);
INSERT INTO public.planet VALUES (15, 'Proxima Centauri c', 'four billion years', 'super Earth exoplanet', 'four billion years', 15);
INSERT INTO public.planet VALUES (16, 'Barnards Star b', 'ten billion years', 'red dwarf star', 'five light years', 16);
INSERT INTO public.planet VALUES (17, 'Ross b', 'nine billion years', 'super Earth exoplanet', 'one light year', 17);
INSERT INTO public.planet VALUES (18, 'Luyten b', 'eight billion years', 'exoplanet', 'twelve light years', 18);
INSERT INTO public.planet VALUES (19, 'Wolf b', 'unknown', 'super Earth exoplanet', 'thirteen light years', 19);
INSERT INTO public.planet VALUES (20, 'Wolf c', 'unknown', 'super Earth exoplanet', 'thirteen light years', 20);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Absolutno', 4, false, false, 1);
INSERT INTO public.star VALUES (2, 'Acamar', 3, false, false, 2);
INSERT INTO public.star VALUES (3, 'Achemar', 3, false, false, 3);
INSERT INTO public.star VALUES (4, 'Achird', 2, false, true, 4);
INSERT INTO public.star VALUES (5, 'Acrab', 3, false, false, 5);
INSERT INTO public.star VALUES (6, 'Acrux', 3, false, false, 6);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 20, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 20, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 6, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

