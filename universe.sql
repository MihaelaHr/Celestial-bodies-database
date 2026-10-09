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

ALTER TABLE ONLY public.star DROP CONSTRAINT star_galaxy_id_fkey;
ALTER TABLE ONLY public.space_mission DROP CONSTRAINT space_mission_planet_id_fkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_star_id_fkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_planet_id_fkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_pkey;
ALTER TABLE ONLY public.star DROP CONSTRAINT star_name_key;
ALTER TABLE ONLY public.space_mission DROP CONSTRAINT space_mission_pkey;
ALTER TABLE ONLY public.space_mission DROP CONSTRAINT space_mission_name_key;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_pkey;
ALTER TABLE ONLY public.planet DROP CONSTRAINT planet_name_key;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_pkey;
ALTER TABLE ONLY public.moon DROP CONSTRAINT moon_name_key;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_pkey;
ALTER TABLE ONLY public.galaxy DROP CONSTRAINT galaxy_name_key;
ALTER TABLE public.star ALTER COLUMN galaxy_id DROP DEFAULT;
ALTER TABLE public.star ALTER COLUMN star_id DROP DEFAULT;
ALTER TABLE public.space_mission ALTER COLUMN space_mission_id DROP DEFAULT;
ALTER TABLE public.planet ALTER COLUMN planet_id DROP DEFAULT;
ALTER TABLE public.moon ALTER COLUMN moon_id DROP DEFAULT;
ALTER TABLE public.galaxy ALTER COLUMN galaxy_id DROP DEFAULT;
DROP SEQUENCE public.star_star_id_seq;
DROP SEQUENCE public.star_galaxy_id_seq;
DROP TABLE public.star;
DROP SEQUENCE public.space_mission_space_mission_id_seq;
DROP TABLE public.space_mission;
DROP SEQUENCE public.planet_planet_id_seq;
DROP TABLE public.planet;
DROP SEQUENCE public.moon_moon_id_seq;
DROP TABLE public.moon;
DROP SEQUENCE public.galaxy_galaxy_id_seq;
DROP TABLE public.galaxy;
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    catalog_number character varying(30),
    age_in_millions_of_years integer,
    description text
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
    name character varying(30) NOT NULL,
    radius_km numeric(10,2),
    discovery_year integer,
    planet_id integer
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
    name character varying(30) NOT NULL,
    radius_km numeric(10,2),
    mass numeric(10,3),
    rings boolean,
    number_of_moons integer,
    star_id integer,
    inhabited boolean
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
-- Name: space_mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_mission (
    space_mission_id integer NOT NULL,
    name character varying(30) NOT NULL,
    year integer,
    mission_type character varying(50) NOT NULL,
    operator character varying(50) NOT NULL,
    is_successful boolean,
    description text,
    planet_id integer
);


ALTER TABLE public.space_mission OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_mission_space_mission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_mission_space_mission_id_seq OWNER TO freecodecamp;

--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_mission_space_mission_id_seq OWNED BY public.space_mission.space_mission_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass numeric(10,2),
    temperature_kelvin integer,
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
-- Name: space_mission space_mission_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission ALTER COLUMN space_mission_id SET DEFAULT nextval('public.space_mission_space_mission_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, galaxy_type, catalog_number, age_in_millions_of_years, description) FROM stdin;
1	Mliječna staza	Spiralna	-	13600	Galaksija u kojoj se nalazi Zemlja, Sunčev sustav i milijarde zvijezda.
2	Andromeda	Spiralna	M31/NGC 224	10000	Velika spiralna galaksija najbliža Mliječnoj stazi s kojoj će se sudariti za oko 4.5 milijarde godina.
3	Trokut	Spiralna	M33/NGC 598	12000	Treća po veličini galaksija poznata po rodilištima novih zvijezda.
4	Sombrero	Eliptična/Spiralna	M104/NGC 4594	13200	Prepoznatljiva po sjajnoj srednjoj izbočini i tamnom prstenu prašine koji joj daje izgled šešira.
5	Vrtlog	Spiralna	M51/NGC 5194	400	Spiralna galaksija u izravnoj interakciji sa susjednom galaksijom NGC 5195.
6	Kola	Prstenasta	ESO 350-40	500	Neobična prstenasta galaksija nastala nakon silovitog sudara s manjom galaksijom.
7	Veliki Magellanov Oblak	Nepravilna	ESO 56-29	11010	Patuljasta satelitska galaksija Mliječne staze, vidljiva golim okom s južne Zemljine polutke.
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, name, radius_km, discovery_year, planet_id) FROM stdin;
1	Test Mjesec1	133.50	1602	1
2	Test Mjesec2	256.90	1604	1
3	Test Mjesec3	380.40	1606	1
4	Test Mjesec4	503.80	1608	1
5	Test Mjesec5	627.30	1610	1
6	Test Mjesec6	750.70	1612	1
7	Test Mjesec7	874.20	1614	1
8	Test Mjesec8	997.60	1616	1
9	Test Mjesec9	1121.10	1618	1
10	Test Mjesec10	1244.50	1620	1
11	Test Mjesec11	1368.00	1622	1
12	Test Mjesec12	1491.40	1624	1
13	Test Mjesec13	1614.90	1626	1
14	Test Mjesec14	1738.30	1628	1
15	Test Mjesec15	1861.80	1630	1
16	Test Mjesec16	1985.20	1632	1
17	Test Mjesec17	2108.70	1634	1
18	Test Mjesec18	2232.10	1636	1
19	Test Mjesec19	2355.60	1638	1
20	Test Mjesec20	2479.00	1640	1
21	Test Mjesec21	2602.50	1642	1
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, name, radius_km, mass, rings, number_of_moons, star_id, inhabited) FROM stdin;
1	Merkur	2439.70	0.055	f	0	1	f
2	Venera	6051.80	0.815	f	0	1	f
3	Zemlja	6371.00	1.000	f	1	1	t
4	Mars	3389.50	0.107	f	2	1	f
5	Jupiter	69911.00	317.800	t	95	1	f
6	Saturn	58232.00	95.160	t	146	1	f
7	Uran	25362.00	14.450	t	28	1	f
8	Neptun	24622.00	17.150	t	16	1	f
9	Proxyma Centauri b	6820.00	1.070	f	0	1	f
10	Kepler-22b	15290.00	9.100	f	0	1	f
11	TRAPPIST-1e	5861.00	0.692	f	0	1	f
12	Kepler-186f	7454.00	1.710	f	0	1	f
\.


--
-- Data for Name: space_mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.space_mission (space_mission_id, name, year, mission_type, operator, is_successful, description, planet_id) FROM stdin;
1	Apolo 11	1969	Lander/Posada	NASA	t	Prva misija s ljudskom posadom koja je uspješno sletjela na Mjesec.	\N
2	Venera 7	1970	Lander	Sovjetski Savez	t	Prva letjelica koja je uspješno sletjela na površinu drugog planeta (Venera).	\N
3	Voyager 1	1977	Flyby/Interstelarna	NASA	t	Istražila vanjske planete...	\N
4	Cassini-Huygens	1997	Orbiter/Lander	NASA/ESA	t	Proučavala je Saturn, njegove prstenove i pustila sondu u Huygens na mjesec Titan.	\N
5	Curiosity	2011	Rover	NASA	t	Istražuje krater Gale na Marsu potrazi za uvjetima koji su nekada mogli podržavati život.	\N
6	James Webb Space Telescope	2021	Svemirski opservatorij	NASA/ESA/CSA	t	Infracrveni svemirski teleskop visoke rezolucije namijenjen promatranju najudaljenijih galaksija u svemiru.	\N
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, name, age_in_millions_of_years, mass, temperature_kelvin, galaxy_id) FROM stdin;
1	Sunce	4600	1.00	5778	1
2	Proxima Centauri	4850	0.12	3042	2
3	Sirij A	242	2.06	9940	3
4	Betelgez	10	16.50	3600	4
5	Vega	455	2.14	9602	5
6	Rigel	8	21.00	12100	6
\.


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_mission_space_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_mission_space_mission_id_seq', 6, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 6, true);


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
-- Name: space_mission space_mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_name_key UNIQUE (name);


--
-- Name: space_mission space_mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_pkey PRIMARY KEY (space_mission_id);


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
-- Name: space_mission space_mission_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_mission
    ADD CONSTRAINT space_mission_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

