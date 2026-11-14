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
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
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
    name character varying(40) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean NOT NULL
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
    name character varying(40) NOT NULL,
    star_id integer NOT NULL,
    planet_types_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    is_spherical boolean NOT NULL
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(40) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric NOT NULL,
    has_life boolean,
    is_spherical boolean NOT NULL
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral', 13600, 0, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest large spiral, will collide with us in about 4 billion years', 10000, 2537000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Small spiral, third member of the Local Group', 10000, 2730000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Bright bulge and dust lane, looks like a hat', 13000, 29000000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Satellite galaxy of the Milky Way, visible from the south', 13000, 163000, true, false);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Smaller satellite galaxy, neighbor of the LMC', 13000, 200000, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 'Our companion, keeps our tilt steady', 4500, 0.0000026, false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 'Doomed moon slowly falling into Mars', 4500, 0.0000187, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Tiny outer moon of Mars', 4500, 0.0000187, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 'Most volcanic body in the solar system', 4500, 0.0000577, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 'Ice shell over a global ocean, best bet for life', 4500, 0.0000577, false, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 'Largest moon, bigger than Mercury', 4500, 0.0000577, false, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 'Most cratered body known', 4500, 0.0000577, false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 'Thick atmosphere and methane lakes', 4500, 0.0000954, false, true);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 'Geysers of water from a subsurface ocean', 4500, 0.0000954, false, true);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Death Star lookalike with crater Herschel', 4500, 0.0000954, false, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 'Second largest moon of Saturn', 4500, 0.0000954, false, true);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 'Two-toned moon, one side dark one bright', 4500, 0.0000954, false, true);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 'Frankenstein moon with giant cliffs', 4500, 0.000192, false, true);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 'Brightest moon of Uranus', 4500, 0.000192, false, true);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 'Darkest moon of Uranus', 4500, 0.000192, false, true);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 'Largest moon of Uranus', 4500, 0.000192, false, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 'Outermost major moon of Uranus', 4500, 0.000192, false, true);
INSERT INTO public.moon VALUES (18, 'Triton', 8, 'Captured Kuiper belt object with nitrogen geysers', 4500, 0.000301, false, true);
INSERT INTO public.moon VALUES (19, 'Proteus', 8, 'Boxy dark moon of Neptune', 4500, 0.000301, false, false);
INSERT INTO public.moon VALUES (20, 'Charon', 9, 'Half the size of Pluto, they orbit a common point', 4500, 0.0004, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 1, 'Smallest planet, scorched and cratered', 4600, 0.0000061, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 1, 'Runaway greenhouse, hottest planet of all', 4600, 0.0000114, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1, 'The only known world with life', 4600, 0, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 1, 'The red planet, home of the tallest volcano', 4600, 0.0000187, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, 'King of the planets, fits 1300 Earths inside', 4600, 0.0000577, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 2, 'Famous for its magnificent rings', 4600, 0.0000954, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, 'Ice giant rolling on its side', 4600, 0.000192, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, 'Windiest planet, deep blue', 4600, 0.000301, false, true);
INSERT INTO public.planet VALUES (9, 'Pluto', 1, 4, 'Beloved dwarf planet in the Kuiper belt', 4600, 0.0004, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima b', 2, 1, 'Rocky world in the habitable zone of Proxima Centauri', 4600, 4.24, false, true);
INSERT INTO public.planet VALUES (11, 'Proxima c', 2, 4, 'Possible super-Earth orbiting far out', 4600, 4.24, false, true);
INSERT INTO public.planet VALUES (12, 'Barnard b', 3, 1, 'Candidate planet around Barnards Star', 4600, 5.96, false, true);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 6, 1, 'One of seven Earth-sized worlds around a red dwarf', 7600, 40.7, false, true);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'terrestrial', 'Rocky world with a solid surface, like Earth or Mars');
INSERT INTO public.planet_types VALUES (2, 'gas giant', 'Mostly hydrogen and helium, no solid surface, like Jupiter');
INSERT INTO public.planet_types VALUES (3, 'ice giant', 'Water, ammonia and methane ices, like Neptune');
INSERT INTO public.planet_types VALUES (4, 'dwarf', 'Small body that did not clear its orbital neighborhood');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Our star, a G-type main sequence star', 4600, 0.0000158, true, true);
INSERT INTO public.star VALUES (2, 'Alpha Centauri A', 1, 'Star of the closest system to the Sun', 5000, 4.37, false, true);
INSERT INTO public.star VALUES (3, 'Barnards Star', 1, 'Red dwarf with the fastest proper motion of any star', 10000, 5.96, false, true);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'Brightest star in the night sky', 250, 8.6, false, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 'Red supergiant in Orion, will go supernova one day', 10, 548, false, true);
INSERT INTO public.star VALUES (6, 'TRAPPIST-1', 1, 'Ultra-cool red dwarf with seven Earth-sized planets', 7600, 40.7, false, true);
INSERT INTO public.star VALUES (7, 'S Doradus', 5, 'Luminous blue variable in the Large Magellanic Cloud', 20, 169000, false, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


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

