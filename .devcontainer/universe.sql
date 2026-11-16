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
    description text,
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth numeric(10,2),
    is_visible boolean
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    radius integer NOT NULL,
    orbital_period numeric,
    is_spherical boolean
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
    name character varying(50) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    distance_from_star numeric,
    has_life boolean
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
-- Name: space_missions; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_missions (
    space_missions_id integer NOT NULL,
    name character varying(50) NOT NULL,
    agency character varying(50) NOT NULL,
    launch_year integer,
    is_active boolean
);


ALTER TABLE public.space_missions OWNER TO freecodecamp;

--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_missions_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_missions_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_missions_mission_id_seq OWNED BY public.space_missions.space_missions_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions integer NOT NULL,
    temperature numeric,
    is_spherical boolean
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: space_missions space_missions_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions ALTER COLUMN space_missions_id SET DEFAULT nextval('public.space_missions_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 'Spiral', 0.00, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major galaxy', 'Spiral', 2537000.00, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral galaxy', 'Spiral', 2730000.00, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Galaxy M51', 'Spiral', 23000000.00, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy M104', 'Spiral', 29000000.00, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Giant elliptical galaxy', 'Elliptical', 53000000.00, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, 27.3, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, 0.3, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, 1.3, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, 1.8, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, 3.5, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, 7.1, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, 16.7, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, 15.9, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, 1.4, true);
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 764, 4.5, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 734, 79.3, true);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 198, 0.9, true);
INSERT INTO public.moon VALUES (13, 'Ariel', 7, 579, 2.5, true);
INSERT INTO public.moon VALUES (14, 'Umbriel', 7, 585, 4.1, true);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 789, 8.7, true);
INSERT INTO public.moon VALUES (16, 'Oberon', 7, 761, 13.5, true);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 1353, 5.9, true);
INSERT INTO public.moon VALUES (18, 'Proteus', 8, 210, 1.1, false);
INSERT INTO public.moon VALUES (19, 'Charon', 8, 606, 6.4, true);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170, 360, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 57.9, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 108.2, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 149.6, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 227.9, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 778.5, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 1434, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 2871, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 4495, false);
INSERT INTO public.planet VALUES (9, 'Planet9', 2, 'Unknown', 5000, false);
INSERT INTO public.planet VALUES (10, 'Kepler22b', 3, 'Exoplanet', 600, false);
INSERT INTO public.planet VALUES (11, 'ProximaB', 4, 'Exoplanet', 7.5, false);
INSERT INTO public.planet VALUES (12, 'Planet12', 5, 'Exoplanet', 100, false);


--
-- Data for Name: space_missions; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_missions VALUES (1, 'Apollo 11', 'NASA', 1969, false);
INSERT INTO public.space_missions VALUES (2, 'Voyager 1', 'NASA', 1977, true);
INSERT INTO public.space_missions VALUES (3, 'Artemis', 'NASA', 2022, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, 5778, true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 242, 9940, true);
INSERT INTO public.star VALUES (3, 'Vega', 1, 455, 9602, true);
INSERT INTO public.star VALUES (4, 'Polaris', 1, 7000, 6015, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 10000, 3500, true);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 8000, 11000, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_missions_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_missions_mission_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: space_missions space_missions_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_name_key UNIQUE (name);


--
-- Name: space_missions space_missions_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_missions
    ADD CONSTRAINT space_missions_pkey PRIMARY KEY (space_missions_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

