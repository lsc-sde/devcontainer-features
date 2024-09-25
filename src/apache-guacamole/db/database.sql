--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.0

-- Started on 2024-09-25 14:53:59

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

--
-- TOC entry 871 (class 1247 OID 57348)
-- Name: guacamole_connection_group_type; Type: TYPE; Schema: public; Owner: guacamole
--

CREATE TYPE public.guacamole_connection_group_type AS ENUM (
    'ORGANIZATIONAL',
    'BALANCING'
);


ALTER TYPE public.guacamole_connection_group_type OWNER TO guacamole;

--
-- TOC entry 874 (class 1247 OID 57354)
-- Name: guacamole_entity_type; Type: TYPE; Schema: public; Owner: guacamole
--

CREATE TYPE public.guacamole_entity_type AS ENUM (
    'USER',
    'USER_GROUP'
);


ALTER TYPE public.guacamole_entity_type OWNER TO guacamole;

--
-- TOC entry 877 (class 1247 OID 57360)
-- Name: guacamole_object_permission_type; Type: TYPE; Schema: public; Owner: guacamole
--

CREATE TYPE public.guacamole_object_permission_type AS ENUM (
    'READ',
    'UPDATE',
    'DELETE',
    'ADMINISTER'
);


ALTER TYPE public.guacamole_object_permission_type OWNER TO guacamole;

--
-- TOC entry 883 (class 1247 OID 57384)
-- Name: guacamole_proxy_encryption_method; Type: TYPE; Schema: public; Owner: guacamole
--

CREATE TYPE public.guacamole_proxy_encryption_method AS ENUM (
    'NONE',
    'SSL'
);


ALTER TYPE public.guacamole_proxy_encryption_method OWNER TO guacamole;

--
-- TOC entry 880 (class 1247 OID 57370)
-- Name: guacamole_system_permission_type; Type: TYPE; Schema: public; Owner: guacamole
--

CREATE TYPE public.guacamole_system_permission_type AS ENUM (
    'CREATE_CONNECTION',
    'CREATE_CONNECTION_GROUP',
    'CREATE_SHARING_PROFILE',
    'CREATE_USER',
    'CREATE_USER_GROUP',
    'ADMINISTER'
);


ALTER TYPE public.guacamole_system_permission_type OWNER TO guacamole;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 57407)
-- Name: guacamole_connection; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection (
    connection_id integer NOT NULL,
    connection_name character varying(128) NOT NULL,
    parent_id integer,
    protocol character varying(32) NOT NULL,
    max_connections integer,
    max_connections_per_user integer,
    connection_weight integer,
    failover_only boolean DEFAULT false NOT NULL,
    proxy_port integer,
    proxy_hostname character varying(512),
    proxy_encryption_method public.guacamole_proxy_encryption_method
);


ALTER TABLE public.guacamole_connection OWNER TO guacamole;

--
-- TOC entry 232 (class 1259 OID 57548)
-- Name: guacamole_connection_attribute; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_attribute (
    connection_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_connection_attribute OWNER TO guacamole;

--
-- TOC entry 217 (class 1259 OID 57406)
-- Name: guacamole_connection_connection_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_connection_connection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_connection_connection_id_seq OWNER TO guacamole;

--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 217
-- Name: guacamole_connection_connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_connection_connection_id_seq OWNED BY public.guacamole_connection.connection_id;


--
-- TOC entry 216 (class 1259 OID 57390)
-- Name: guacamole_connection_group; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_group (
    connection_group_id integer NOT NULL,
    parent_id integer,
    connection_group_name character varying(128) NOT NULL,
    type public.guacamole_connection_group_type DEFAULT 'ORGANIZATIONAL'::public.guacamole_connection_group_type NOT NULL,
    max_connections integer,
    max_connections_per_user integer,
    enable_session_affinity boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guacamole_connection_group OWNER TO guacamole;

--
-- TOC entry 233 (class 1259 OID 57561)
-- Name: guacamole_connection_group_attribute; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_group_attribute (
    connection_group_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_connection_group_attribute OWNER TO guacamole;

--
-- TOC entry 215 (class 1259 OID 57389)
-- Name: guacamole_connection_group_connection_group_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_connection_group_connection_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_connection_group_connection_group_id_seq OWNER TO guacamole;

--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 215
-- Name: guacamole_connection_group_connection_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_connection_group_connection_group_id_seq OWNED BY public.guacamole_connection_group.connection_group_id;


--
-- TOC entry 236 (class 1259 OID 57604)
-- Name: guacamole_connection_group_permission; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_group_permission (
    entity_id integer NOT NULL,
    connection_group_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_connection_group_permission OWNER TO guacamole;

--
-- TOC entry 242 (class 1259 OID 57684)
-- Name: guacamole_connection_history; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_history (
    history_id integer NOT NULL,
    user_id integer,
    username character varying(128) NOT NULL,
    remote_host character varying(256) DEFAULT NULL::character varying,
    connection_id integer,
    connection_name character varying(128) NOT NULL,
    sharing_profile_id integer,
    sharing_profile_name character varying(128) DEFAULT NULL::character varying,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone
);


ALTER TABLE public.guacamole_connection_history OWNER TO guacamole;

--
-- TOC entry 241 (class 1259 OID 57683)
-- Name: guacamole_connection_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_connection_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_connection_history_history_id_seq OWNER TO guacamole;

--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 241
-- Name: guacamole_connection_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_connection_history_history_id_seq OWNED BY public.guacamole_connection_history.history_id;


--
-- TOC entry 228 (class 1259 OID 57496)
-- Name: guacamole_connection_parameter; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_parameter (
    connection_id integer NOT NULL,
    parameter_name character varying(128) NOT NULL,
    parameter_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_connection_parameter OWNER TO guacamole;

--
-- TOC entry 235 (class 1259 OID 57587)
-- Name: guacamole_connection_permission; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_connection_permission (
    entity_id integer NOT NULL,
    connection_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_connection_permission OWNER TO guacamole;

--
-- TOC entry 220 (class 1259 OID 57425)
-- Name: guacamole_entity; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_entity (
    entity_id integer NOT NULL,
    name character varying(128) NOT NULL,
    type public.guacamole_entity_type NOT NULL
);


ALTER TABLE public.guacamole_entity OWNER TO guacamole;

--
-- TOC entry 219 (class 1259 OID 57424)
-- Name: guacamole_entity_entity_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_entity_entity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_entity_entity_id_seq OWNER TO guacamole;

--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 219
-- Name: guacamole_entity_entity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_entity_entity_id_seq OWNED BY public.guacamole_entity.entity_id;


--
-- TOC entry 227 (class 1259 OID 57482)
-- Name: guacamole_sharing_profile; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_sharing_profile (
    sharing_profile_id integer NOT NULL,
    sharing_profile_name character varying(128) NOT NULL,
    primary_connection_id integer NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile OWNER TO guacamole;

--
-- TOC entry 234 (class 1259 OID 57574)
-- Name: guacamole_sharing_profile_attribute; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_sharing_profile_attribute (
    sharing_profile_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile_attribute OWNER TO guacamole;

--
-- TOC entry 229 (class 1259 OID 57509)
-- Name: guacamole_sharing_profile_parameter; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_sharing_profile_parameter (
    sharing_profile_id integer NOT NULL,
    parameter_name character varying(128) NOT NULL,
    parameter_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile_parameter OWNER TO guacamole;

--
-- TOC entry 237 (class 1259 OID 57621)
-- Name: guacamole_sharing_profile_permission; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_sharing_profile_permission (
    entity_id integer NOT NULL,
    sharing_profile_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_sharing_profile_permission OWNER TO guacamole;

--
-- TOC entry 226 (class 1259 OID 57481)
-- Name: guacamole_sharing_profile_sharing_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_sharing_profile_sharing_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_sharing_profile_sharing_profile_id_seq OWNER TO guacamole;

--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 226
-- Name: guacamole_sharing_profile_sharing_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_sharing_profile_sharing_profile_id_seq OWNED BY public.guacamole_sharing_profile.sharing_profile_id;


--
-- TOC entry 238 (class 1259 OID 57638)
-- Name: guacamole_system_permission; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_system_permission (
    entity_id integer NOT NULL,
    permission public.guacamole_system_permission_type NOT NULL
);


ALTER TABLE public.guacamole_system_permission OWNER TO guacamole;

--
-- TOC entry 222 (class 1259 OID 57434)
-- Name: guacamole_user; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user (
    user_id integer NOT NULL,
    entity_id integer NOT NULL,
    password_hash bytea NOT NULL,
    password_salt bytea,
    password_date timestamp with time zone NOT NULL,
    disabled boolean DEFAULT false NOT NULL,
    expired boolean DEFAULT false NOT NULL,
    access_window_start time without time zone,
    access_window_end time without time zone,
    valid_from date,
    valid_until date,
    timezone character varying(64),
    full_name character varying(256),
    email_address character varying(256),
    organization character varying(256),
    organizational_role character varying(256)
);


ALTER TABLE public.guacamole_user OWNER TO guacamole;

--
-- TOC entry 230 (class 1259 OID 57522)
-- Name: guacamole_user_attribute; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_attribute (
    user_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_user_attribute OWNER TO guacamole;

--
-- TOC entry 224 (class 1259 OID 57452)
-- Name: guacamole_user_group; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_group (
    user_group_id integer NOT NULL,
    entity_id integer NOT NULL,
    disabled boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guacamole_user_group OWNER TO guacamole;

--
-- TOC entry 231 (class 1259 OID 57535)
-- Name: guacamole_user_group_attribute; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_group_attribute (
    user_group_id integer NOT NULL,
    attribute_name character varying(128) NOT NULL,
    attribute_value character varying(4096) NOT NULL
);


ALTER TABLE public.guacamole_user_group_attribute OWNER TO guacamole;

--
-- TOC entry 225 (class 1259 OID 57466)
-- Name: guacamole_user_group_member; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_group_member (
    user_group_id integer NOT NULL,
    member_entity_id integer NOT NULL
);


ALTER TABLE public.guacamole_user_group_member OWNER TO guacamole;

--
-- TOC entry 240 (class 1259 OID 57666)
-- Name: guacamole_user_group_permission; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_group_permission (
    entity_id integer NOT NULL,
    affected_user_group_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_user_group_permission OWNER TO guacamole;

--
-- TOC entry 223 (class 1259 OID 57451)
-- Name: guacamole_user_group_user_group_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_user_group_user_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_user_group_user_group_id_seq OWNER TO guacamole;

--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 223
-- Name: guacamole_user_group_user_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_user_group_user_group_id_seq OWNED BY public.guacamole_user_group.user_group_id;


--
-- TOC entry 244 (class 1259 OID 57716)
-- Name: guacamole_user_history; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_history (
    history_id integer NOT NULL,
    user_id integer,
    username character varying(128) NOT NULL,
    remote_host character varying(256) DEFAULT NULL::character varying,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone
);


ALTER TABLE public.guacamole_user_history OWNER TO guacamole;

--
-- TOC entry 243 (class 1259 OID 57715)
-- Name: guacamole_user_history_history_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_user_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_user_history_history_id_seq OWNER TO guacamole;

--
-- TOC entry 3638 (class 0 OID 0)
-- Dependencies: 243
-- Name: guacamole_user_history_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_user_history_history_id_seq OWNED BY public.guacamole_user_history.history_id;


--
-- TOC entry 246 (class 1259 OID 57733)
-- Name: guacamole_user_password_history; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_password_history (
    password_history_id integer NOT NULL,
    user_id integer NOT NULL,
    password_hash bytea NOT NULL,
    password_salt bytea,
    password_date timestamp with time zone NOT NULL
);


ALTER TABLE public.guacamole_user_password_history OWNER TO guacamole;

--
-- TOC entry 245 (class 1259 OID 57732)
-- Name: guacamole_user_password_history_password_history_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_user_password_history_password_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_user_password_history_password_history_id_seq OWNER TO guacamole;

--
-- TOC entry 3639 (class 0 OID 0)
-- Dependencies: 245
-- Name: guacamole_user_password_history_password_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_user_password_history_password_history_id_seq OWNED BY public.guacamole_user_password_history.password_history_id;


--
-- TOC entry 239 (class 1259 OID 57649)
-- Name: guacamole_user_permission; Type: TABLE; Schema: public; Owner: guacamole
--

CREATE TABLE public.guacamole_user_permission (
    entity_id integer NOT NULL,
    affected_user_id integer NOT NULL,
    permission public.guacamole_object_permission_type NOT NULL
);


ALTER TABLE public.guacamole_user_permission OWNER TO guacamole;

--
-- TOC entry 221 (class 1259 OID 57433)
-- Name: guacamole_user_user_id_seq; Type: SEQUENCE; Schema: public; Owner: guacamole
--

CREATE SEQUENCE public.guacamole_user_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.guacamole_user_user_id_seq OWNER TO guacamole;

--
-- TOC entry 3640 (class 0 OID 0)
-- Dependencies: 221
-- Name: guacamole_user_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: guacamole
--

ALTER SEQUENCE public.guacamole_user_user_id_seq OWNED BY public.guacamole_user.user_id;


--
-- TOC entry 3317 (class 2604 OID 57410)
-- Name: guacamole_connection connection_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection ALTER COLUMN connection_id SET DEFAULT nextval('public.guacamole_connection_connection_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 57393)
-- Name: guacamole_connection_group connection_group_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group ALTER COLUMN connection_group_id SET DEFAULT nextval('public.guacamole_connection_group_connection_group_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 57687)
-- Name: guacamole_connection_history history_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_history ALTER COLUMN history_id SET DEFAULT nextval('public.guacamole_connection_history_history_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 57428)
-- Name: guacamole_entity entity_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_entity ALTER COLUMN entity_id SET DEFAULT nextval('public.guacamole_entity_entity_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 57485)
-- Name: guacamole_sharing_profile sharing_profile_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile ALTER COLUMN sharing_profile_id SET DEFAULT nextval('public.guacamole_sharing_profile_sharing_profile_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 57437)
-- Name: guacamole_user user_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user ALTER COLUMN user_id SET DEFAULT nextval('public.guacamole_user_user_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 57455)
-- Name: guacamole_user_group user_group_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group ALTER COLUMN user_group_id SET DEFAULT nextval('public.guacamole_user_group_user_group_id_seq'::regclass);


--
-- TOC entry 3329 (class 2604 OID 57719)
-- Name: guacamole_user_history history_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_history ALTER COLUMN history_id SET DEFAULT nextval('public.guacamole_user_history_history_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 57736)
-- Name: guacamole_user_password_history password_history_id; Type: DEFAULT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_password_history ALTER COLUMN password_history_id SET DEFAULT nextval('public.guacamole_user_password_history_password_history_id_seq'::regclass);


--
-- TOC entry 3598 (class 0 OID 57407)
-- Dependencies: 218
-- Data for Name: guacamole_connection; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection (connection_id, connection_name, parent_id, protocol, max_connections, max_connections_per_user, connection_weight, failover_only, proxy_port, proxy_hostname, proxy_encryption_method) FROM stdin;
1	default	1	vnc	1000	1000	\N	f	\N	\N	\N
2185	jovyan	2210	vnc	1000	1000	\N	f	\N	\N	\N
2187	jovyan	2211	vnc	1000	1000	\N	f	\N	\N	\N
2186	jovyan	2212	vnc	1000	1000	\N	f	\N	\N	\N
2188	jovyan	2213	vnc	1000	1000	\N	f	\N	\N	\N
2181	jovyan	2206	vnc	1000	1000	\N	f	\N	\N	\N
\.


--
-- TOC entry 3612 (class 0 OID 57548)
-- Dependencies: 232
-- Data for Name: guacamole_connection_attribute; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_attribute (connection_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- TOC entry 3596 (class 0 OID 57390)
-- Dependencies: 216
-- Data for Name: guacamole_connection_group; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_group (connection_group_id, parent_id, connection_group_name, type, max_connections, max_connections_per_user, enable_session_affinity) FROM stdin;
1	\N	jovyan	ORGANIZATIONAL	1	1	f
2206	\N	default-generic-workspace	ORGANIZATIONAL	1	1	t
2210	\N	test-workspace	ORGANIZATIONAL	1	1	t
2212	\N	omop-workspace	ORGANIZATIONAL	1	1	t
2211	\N	test-workspace-tolerations	ORGANIZATIONAL	1	1	t
2213	\N	omop-workspace	ORGANIZATIONAL	1	1	t
\.


--
-- TOC entry 3613 (class 0 OID 57561)
-- Dependencies: 233
-- Data for Name: guacamole_connection_group_attribute; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_group_attribute (connection_group_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- TOC entry 3616 (class 0 OID 57604)
-- Dependencies: 236
-- Data for Name: guacamole_connection_group_permission; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_group_permission (entity_id, connection_group_id, permission) FROM stdin;
2187	2206	READ
2188	2212	READ
2189	2210	READ
2190	2211	READ
\.


--
-- TOC entry 3622 (class 0 OID 57684)
-- Dependencies: 242
-- Data for Name: guacamole_connection_history; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_history (history_id, user_id, username, remote_host, connection_id, connection_name, sharing_profile_id, sharing_profile_name, start_date, end_date) FROM stdin;
57	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 10:23:18.167+00	2024-09-17 10:23:28.233+00
1	\N	jovyan	192.168.85.186	1	default	\N	\N	2024-08-30 06:47:30.787+00	2024-08-30 06:47:35.9+00
2	4	test-workspace-tolerations\\jovyan	192.168.85.183	1	default	\N	\N	2024-09-06 08:02:32.279+00	2024-09-06 08:02:37.927+00
58	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 10:23:55.069+00	2024-09-17 10:24:05.11+00
3	4	test-workspace-tolerations\\jovyan	192.168.85.185	2181	jovyan	\N	\N	2024-09-10 14:54:54.822+00	2024-09-10 14:55:04.893+00
133	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 08:42:14.775+00	2024-09-19 08:45:25.518+00
4	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:22:16.752+00	2024-09-13 10:22:23.934+00
59	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 10:27:55.718+00	2024-09-17 10:28:05.748+00
5	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:22:25.025+00	2024-09-13 10:22:35.065+00
56	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 08:36:27.796+00	2024-09-17 11:22:48.722+00
6	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:22:40.436+00	2024-09-13 10:22:50.469+00
7	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:39:20.746+00	2024-09-13 10:39:22.778+00
60	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:23:15.992+00	2024-09-17 11:35:42.442+00
8	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:39:39.037+00	2024-09-13 10:39:41.013+00
9	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:39:57.232+00	2024-09-13 10:39:59.172+00
10	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:40:15.491+00	2024-09-13 10:40:17.447+00
62	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:45:42.601+00	2024-09-17 11:45:44.026+00
11	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:40:33.494+00	2024-09-13 10:40:35.47+00
12	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:40:47.697+00	2024-09-13 10:40:49.698+00
63	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:46:00.642+00	2024-09-17 11:46:01.967+00
13	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:41:05.785+00	2024-09-13 10:41:07.73+00
14	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:41:23.998+00	2024-09-13 10:41:25.948+00
64	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:46:17.957+00	2024-09-17 11:46:19.438+00
15	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:41:42.563+00	2024-09-13 10:41:44.545+00
16	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:42:00.859+00	2024-09-13 10:42:10.932+00
17	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:50:31.82+00	2024-09-13 10:50:41.864+00
18	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:54:02.137+00	2024-09-13 10:54:12.185+00
19	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:54:44.908+00	2024-09-13 10:54:54.939+00
20	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 10:59:59.389+00	2024-09-13 11:00:09.467+00
21	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:04:57.68+00	2024-09-13 11:05:07.735+00
22	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:05:17.263+00	2024-09-13 11:05:27.311+00
23	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:06:11.826+00	2024-09-13 11:11:28.256+00
61	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:36:03.633+00	2024-09-17 13:01:17.058+00
24	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:11:34.97+00	2024-09-13 11:16:43.895+00
25	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:16:45.011+00	2024-09-13 11:16:46.514+00
26	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:16:51.835+00	2024-09-13 11:16:52.201+00
27	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:17:07.754+00	2024-09-13 11:40:10.004+00
28	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 11:53:11.736+00	2024-09-13 12:00:37.392+00
29	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 12:00:52.865+00	2024-09-13 12:14:55.264+00
30	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-13 12:15:14.767+00	2024-09-13 13:37:56.643+00
31	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 12:46:01.697+00	2024-09-16 12:46:11.778+00
32	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 13:08:28.634+00	2024-09-16 13:08:38.772+00
33	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 13:08:48.452+00	2024-09-16 13:08:58.481+00
34	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 13:21:51.524+00	2024-09-16 13:22:01.582+00
35	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 13:22:32.058+00	2024-09-16 13:22:42.109+00
36	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 13:34:13.943+00	2024-09-16 13:34:23.974+00
37	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 13:39:42.969+00	2024-09-16 13:39:53.012+00
38	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 13:47:07.537+00	2024-09-16 13:47:11.185+00
39	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 13:47:32.218+00	2024-09-16 13:47:42.249+00
40	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 13:52:11.038+00	2024-09-16 13:52:21.086+00
41	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 14:02:20.162+00	2024-09-16 14:02:30.206+00
42	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 14:15:59.623+00	2024-09-16 14:16:09.671+00
43	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-16 14:22:13.33+00	2024-09-16 14:22:23.372+00
44	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 14:25:08.683+00	2024-09-16 14:25:18.71+00
45	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 16:18:32.003+00	2024-09-16 16:18:32.896+00
46	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 16:21:09.422+00	2024-09-16 16:21:17.314+00
47	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 16:21:46.931+00	2024-09-16 16:21:56.964+00
48	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 16:26:09.292+00	2024-09-16 16:26:19.33+00
49	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-16 16:36:53.489+00	2024-09-16 16:48:40.843+00
50	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 08:22:32.436+00	2024-09-17 08:25:21.347+00
51	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 08:25:23.092+00	2024-09-17 08:25:33.15+00
52	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 08:25:36.066+00	2024-09-17 08:25:46.095+00
53	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 08:26:53.463+00	2024-09-17 08:32:39.895+00
54	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 08:34:01.355+00	2024-09-17 08:34:11.401+00
55	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 08:34:27.999+00	2024-09-17 08:36:19.179+00
65	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:46:35.334+00	2024-09-17 11:46:36.878+00
129	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 07:33:44.213+00	2024-09-19 07:37:27.437+00
66	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:46:52.57+00	2024-09-17 11:46:54.085+00
69	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:47:45.085+00	2024-09-17 11:47:46.7+00
130	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 07:37:44.24+00	2024-09-19 07:53:22.482+00
70	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:47:57.658+00	2024-09-17 11:47:59.155+00
73	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:48:51.11+00	2024-09-17 11:48:52.445+00
134	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 08:42:48.585+00	2024-09-19 08:42:58.607+00
76	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:49:42.983+00	2024-09-17 11:49:44.503+00
135	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 08:45:35.691+00	2024-09-19 08:45:45.711+00
79	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:50:36.137+00	2024-09-17 11:50:37.524+00
82	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:51:28.428+00	2024-09-17 11:51:28.853+00
137	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 08:46:44.035+00	2024-09-19 09:10:32.226+00
139	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 09:24:56.698+00	2024-09-19 09:25:06.768+00
141	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 09:31:26.113+00	2024-09-19 09:31:36.197+00
143	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 09:52:05.213+00	2024-09-19 09:52:06.096+00
144	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 09:52:22.673+00	2024-09-19 09:52:32.73+00
145	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 09:52:23.129+00	2024-09-19 09:52:33.205+00
147	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 09:53:39.202+00	2024-09-19 09:58:39.885+00
149	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 10:02:56.934+00	2024-09-19 10:03:06.105+00
150	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 10:03:28.2+00	2024-09-19 10:03:38.251+00
152	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 10:10:08.343+00	2024-09-19 10:22:31.901+00
153	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 10:22:59.249+00	2024-09-19 10:27:39.416+00
154	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 10:29:05.807+00	2024-09-19 11:27:00.68+00
155	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 11:27:29.334+00	2024-09-19 12:53:44.442+00
156	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 12:54:10.109+00	2024-09-19 15:40:43.788+00
157	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 15:41:34.189+00	2024-09-19 16:42:27.726+00
158	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 16:42:54.011+00	2024-09-19 16:53:28.61+00
159	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 16:53:49.909+00	2024-09-19 16:54:12.701+00
160	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 16:54:53.315+00	2024-09-19 23:06:14.569+00
161	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 23:06:35.523+00	2024-09-19 23:07:02.218+00
162	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 23:07:20.426+00	2024-09-20 04:03:07.675+00
163	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-20 09:13:18.376+00	2024-09-20 09:18:16.543+00
164	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-20 09:18:23.471+00	2024-09-20 09:18:50.445+00
165	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-20 09:19:48.656+00	2024-09-20 09:21:21.882+00
166	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-20 09:21:45.945+00	2024-09-20 14:56:07.803+00
167	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-20 17:27:06.34+00	2024-09-20 23:06:30.033+00
67	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:47:09.817+00	2024-09-17 11:47:10.982+00
68	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:47:27.175+00	2024-09-17 11:47:27.923+00
71	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:48:14.992+00	2024-09-17 11:48:16.31+00
72	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:48:32.965+00	2024-09-17 11:48:34.251+00
74	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:49:08.474+00	2024-09-17 11:49:09.383+00
132	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 08:42:02.423+00	2024-09-19 08:42:12.65+00
75	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:49:25.67+00	2024-09-17 11:49:26.291+00
77	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:50:00.685+00	2024-09-17 11:50:02.329+00
131	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 07:55:26.978+00	2024-09-19 08:42:30.997+00
78	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:50:18.858+00	2024-09-17 11:50:20.379+00
80	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:50:54.019+00	2024-09-17 11:50:54.987+00
81	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:51:11.172+00	2024-09-17 11:51:11.908+00
83	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:51:44.687+00	2024-09-17 11:51:45.739+00
136	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 08:46:31.826+00	2024-09-19 08:46:41.858+00
84	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:52:02.151+00	2024-09-17 11:52:02.742+00
138	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 09:11:18.974+00	2024-09-19 09:21:54.077+00
85	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 11:52:19.3+00	2024-09-17 11:52:29.345+00
140	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 09:25:09.231+00	2024-09-19 09:30:08.691+00
86	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:26:57.984+00	2024-09-17 12:26:59.433+00
87	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:27:17.601+00	2024-09-17 12:27:27.635+00
142	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 09:31:42.093+00	2024-09-19 09:52:10.455+00
88	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:27:34.175+00	2024-09-17 12:27:44.199+00
89	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:27:45.921+00	2024-09-17 12:27:55.946+00
146	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 09:52:35.461+00	2024-09-19 09:53:35.497+00
90	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:29:49.782+00	2024-09-17 12:29:59.817+00
91	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:56:56.723+00	2024-09-17 12:56:57.449+00
148	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 10:02:28.498+00	2024-09-19 10:02:52.91+00
92	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:57:03.819+00	2024-09-17 12:57:13.839+00
93	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 12:58:06.825+00	2024-09-17 12:58:16.853+00
151	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-19 10:03:40.648+00	2024-09-19 10:09:30.314+00
94	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:58:37.855+00	2024-09-17 12:58:39.388+00
95	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:58:46.144+00	2024-09-17 12:58:47.668+00
96	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:58:49.831+00	2024-09-17 12:58:51.199+00
97	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:59:07.028+00	2024-09-17 12:59:08.419+00
98	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:59:13.421+00	2024-09-17 12:59:14.868+00
99	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:59:31.2+00	2024-09-17 12:59:31.81+00
100	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 12:59:48.428+00	2024-09-17 12:59:58.491+00
101	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 13:00:03.055+00	2024-09-17 13:00:04.561+00
102	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 13:00:20.288+00	2024-09-17 13:00:21.759+00
103	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 13:00:37.892+00	2024-09-17 13:00:39.363+00
104	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 13:00:55.497+00	2024-09-17 13:00:56.402+00
105	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-17 13:01:06.14+00	2024-09-17 13:01:07.534+00
106	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 13:01:37.2+00	2024-09-17 13:01:47.256+00
107	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 13:02:22.552+00	2024-09-17 13:04:25.721+00
108	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 13:04:30.025+00	2024-09-17 13:45:59.938+00
109	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 13:50:13.604+00	2024-09-17 18:21:19.335+00
110	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 18:21:55.953+00	2024-09-17 19:59:22.016+00
111	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 20:03:04.299+00	2024-09-17 20:17:18.081+00
112	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-17 20:17:39.844+00	2024-09-18 00:38:35.677+00
113	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-18 05:28:55.561+00	2024-09-18 07:17:54.755+00
114	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-18 07:18:29.996+00	2024-09-18 08:20:45.202+00
116	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-18 08:28:35.456+00	2024-09-18 08:28:36.447+00
115	87	test-workspace@jovyan	192.168.85.134	2185	jovyan	\N	\N	2024-09-18 08:21:02.551+00	2024-09-18 08:28:51.514+00
117	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 08:29:09.593+00	2024-09-18 08:43:20.738+00
118	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 08:43:37.219+00	2024-09-18 08:48:13.493+00
119	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 08:48:22.133+00	2024-09-18 08:58:58.687+00
120	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 08:59:14.787+00	2024-09-18 08:59:52.877+00
121	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 09:00:08.612+00	2024-09-18 09:09:46.427+00
122	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 09:09:52.595+00	2024-09-18 09:12:59.998+00
123	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 09:13:05.943+00	2024-09-18 14:07:11.121+00
124	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 14:07:34.601+00	2024-09-18 18:56:26.218+00
125	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-18 18:57:00.979+00	2024-09-19 04:39:19.297+00
126	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 04:39:46.678+00	2024-09-19 07:12:51.477+00
127	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 07:15:02.401+00	2024-09-19 07:32:15.204+00
128	85	default-generic-workspace@jovyan	192.168.85.134	2181	jovyan	\N	\N	2024-09-19 07:32:31.754+00	2024-09-19 07:33:28.304+00
\.


--
-- TOC entry 3608 (class 0 OID 57496)
-- Dependencies: 228
-- Data for Name: guacamole_connection_parameter; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_parameter (connection_id, parameter_name, parameter_value) FROM stdin;
1	disable-copy	true
1	hostname	test
1	password	test
1	disable-paste	true
2186	disable-copy	true
2186	disable-paste	true
2186	hostname	client-6df924b2ae5e5ec6b9bfe50078713dd8.guacamole.svc.cluster.local
2186	password	1234
2186	port	5900
2181	disable-copy	true
2181	disable-paste	true
2181	hostname	client-897058694bb051b186d83b514ad204a5.guacamole.svc.cluster.local
2181	password	1234
2188	password	root
2181	port	5900
2187	disable-copy	true
2187	disable-paste	true
2187	hostname	client-eee2a26df77b5e948a258effdedb7a1f.guacamole.svc.cluster.local
2187	password	1234
2187	port	5900
2185	disable-copy	true
2185	disable-paste	true
2185	hostname	client-1650b50f8d495d69a1ddc8453da48e53.guacamole.svc.cluster.local
2185	password	1234
2185	port	5900
2188	disable-copy	true
2188	disable-paste	true
2188	hostname	guacamole-client
\.


--
-- TOC entry 3615 (class 0 OID 57587)
-- Dependencies: 235
-- Data for Name: guacamole_connection_permission; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_connection_permission (entity_id, connection_id, permission) FROM stdin;
1	1	READ
2180	2181	READ
2180	2186	READ
2180	2187	READ
2180	2185	READ
2180	2188	READ
4	2181	READ
5	2187	READ
2185	2186	READ
2186	2185	READ
2187	2181	READ
2188	2186	READ
2189	2185	READ
2190	2187	READ
\.


--
-- TOC entry 3600 (class 0 OID 57425)
-- Dependencies: 220
-- Data for Name: guacamole_entity; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_entity (entity_id, name, type) FROM stdin;
1	guacadmin	USER
3	guacamole-admin	USER_GROUP
4	default-generic-workspace\\jovyan	USER
5	test-workspace-tolerations\\jovyan	USER
2180	jovyan	USER
2185	omop-workspace\\jovyan	USER
2186	test-workspace\\jovyan	USER
2187	default-generic-workspace@jovyan	USER
2188	omop-workspace@jovyan	USER
2189	test-workspace@jovyan	USER
2190	test-workspace-tolerations@jovyan	USER
\.


--
-- TOC entry 3607 (class 0 OID 57482)
-- Dependencies: 227
-- Data for Name: guacamole_sharing_profile; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_sharing_profile (sharing_profile_id, sharing_profile_name, primary_connection_id) FROM stdin;
\.


--
-- TOC entry 3614 (class 0 OID 57574)
-- Dependencies: 234
-- Data for Name: guacamole_sharing_profile_attribute; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_sharing_profile_attribute (sharing_profile_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- TOC entry 3609 (class 0 OID 57509)
-- Dependencies: 229
-- Data for Name: guacamole_sharing_profile_parameter; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_sharing_profile_parameter (sharing_profile_id, parameter_name, parameter_value) FROM stdin;
\.


--
-- TOC entry 3617 (class 0 OID 57621)
-- Dependencies: 237
-- Data for Name: guacamole_sharing_profile_permission; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_sharing_profile_permission (entity_id, sharing_profile_id, permission) FROM stdin;
\.


--
-- TOC entry 3618 (class 0 OID 57638)
-- Dependencies: 238
-- Data for Name: guacamole_system_permission; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_system_permission (entity_id, permission) FROM stdin;
1	CREATE_CONNECTION
1	CREATE_CONNECTION_GROUP
1	CREATE_SHARING_PROFILE
1	CREATE_USER
1	CREATE_USER_GROUP
1	ADMINISTER
3	CREATE_CONNECTION
3	CREATE_CONNECTION_GROUP
3	CREATE_SHARING_PROFILE
3	CREATE_USER
3	CREATE_USER_GROUP
3	ADMINISTER
\.


--
-- TOC entry 3602 (class 0 OID 57434)
-- Dependencies: 222
-- Data for Name: guacamole_user; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user (user_id, entity_id, password_hash, password_salt, password_date, disabled, expired, access_window_start, access_window_end, valid_from, valid_until, timezone, full_name, email_address, organization, organizational_role) FROM stdin;
3	4	\\x156f1f837fca63a595a80fa736064d4b9b63fb14728683b25e53fb087d3a699f	\\xab2864c12a26d9c1b29409e2c92439fe124cebbe89b911cb6f0ca76f333df4f2	2024-09-04 12:53:38.439+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
4	5	\\xa42b83d79d300dbcd585c8d8f12564d3c5951578d057879c428bc553d84b7ede	\\xe52dc1ea654a674ece9232116bba5bb4f8aed12baeb797d09109807d63f9027b	2024-09-06 08:02:22.818+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	1	\\xca458a7d494e3be824f5e1e175a1556c0f8eef2c2d7df3633bec4a29c4411960	\\xfe24adc5e11e2b25288d1704abe67a79e342ecc26064ce69c5b3177795a82264	2024-08-28 11:37:16.388988+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
85	2187	\\x6b8d9bf3777bf5ddf4d1d6dc779f3973c77c7f5db9eb8777739f79d79efc774e7bf3bf5ce36f1b739e7777ce1bede75e	\\x7b9d9d73579aeb9e1aebbe1e71ef76df6d75e9b6dae5b6f87fc69e775d9b69e6fbf7b774f75d3df34eddeb77fdd36edb	2024-09-13 09:59:39.081814+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
86	2188	\\x6b8d9bf3777bf5ddf4d1d6dc779f3973c77c7f5db9eb8777739f79d79efc774e7bf3bf5ce36f1b739e7777ce1bede75e	\\x7b9d9d73579aeb9e1aebbe1e71ef76df6d75e9b6dae5b6f87fc69e775d9b69e6fbf7b774f75d3df34eddeb77fdd36edb	2024-09-13 09:59:39.447637+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
87	2189	\\x6b8d9bf3777bf5ddf4d1d6dc779f3973c77c7f5db9eb8777739f79d79efc774e7bf3bf5ce36f1b739e7777ce1bede75e	\\x7b9d9d73579aeb9e1aebbe1e71ef76df6d75e9b6dae5b6f87fc69e775d9b69e6fbf7b774f75d3df34eddeb77fdd36edb	2024-09-13 09:59:39.89612+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
88	2190	\\x6b8d9bf3777bf5ddf4d1d6dc779f3973c77c7f5db9eb8777739f79d79efc774e7bf3bf5ce36f1b739e7777ce1bede75e	\\x7b9d9d73579aeb9e1aebbe1e71ef76df6d75e9b6dae5b6f87fc69e775d9b69e6fbf7b774f75d3df34eddeb77fdd36edb	2024-09-13 09:59:40.244862+00	f	f	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- TOC entry 3610 (class 0 OID 57522)
-- Dependencies: 230
-- Data for Name: guacamole_user_attribute; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_attribute (user_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- TOC entry 3604 (class 0 OID 57452)
-- Dependencies: 224
-- Data for Name: guacamole_user_group; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_group (user_group_id, entity_id, disabled) FROM stdin;
1	3	f
\.


--
-- TOC entry 3611 (class 0 OID 57535)
-- Dependencies: 231
-- Data for Name: guacamole_user_group_attribute; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_group_attribute (user_group_id, attribute_name, attribute_value) FROM stdin;
\.


--
-- TOC entry 3605 (class 0 OID 57466)
-- Dependencies: 225
-- Data for Name: guacamole_user_group_member; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_group_member (user_group_id, member_entity_id) FROM stdin;
\.


--
-- TOC entry 3620 (class 0 OID 57666)
-- Dependencies: 240
-- Data for Name: guacamole_user_group_permission; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_group_permission (entity_id, affected_user_group_id, permission) FROM stdin;
1	1	READ
1	1	UPDATE
1	1	DELETE
1	1	ADMINISTER
\.


--
-- TOC entry 3624 (class 0 OID 57716)
-- Dependencies: 244
-- Data for Name: guacamole_user_history; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_history (history_id, user_id, username, remote_host, start_date, end_date) FROM stdin;
52	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-18 08:29:08.937+00	2024-09-19 07:12:51.537+00
1	1	guacadmin	192.168.85.162	2024-08-28 11:37:57.496+00	2024-08-28 11:44:58.995+00
53	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 07:15:01.69+00	2024-09-19 08:39:49.78+00
55	87	test-workspace@jovyan	192.168.85.134	2024-09-19 08:42:01.092+00	2024-09-19 08:45:49.174+00
54	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 07:55:25.86+00	2024-09-19 09:43:11.214+00
58	87	test-workspace@jovyan	192.168.85.134	2024-09-19 09:31:25.282+00	2024-09-19 09:52:10.487+00
59	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 09:52:21.94+00	2024-09-19 09:53:35.605+00
8	1	guacadmin	192.168.85.186	2024-08-29 11:11:22.918+00	2024-08-29 13:02:41.058+00
60	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 09:53:38.551+00	2024-09-19 09:58:39.997+00
61	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 10:02:27.807+00	2024-09-19 10:02:53.018+00
56	87	test-workspace@jovyan	192.168.85.134	2024-09-19 08:46:31.168+00	2024-09-19 10:11:35.821+00
57	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 09:24:55.816+00	2024-09-19 10:25:35.738+00
2	\N	jovyan	192.168.85.186	2024-08-29 10:58:28.155+00	2024-08-29 10:58:33.318+00
3	\N	jovyan	192.168.85.186	2024-08-29 10:58:35.886+00	2024-08-29 11:07:25.949+00
4	\N	jovyan	192.168.85.186	2024-08-29 10:58:45.122+00	2024-08-29 13:02:41.109+00
5	\N	jovyan	192.168.85.186	2024-08-29 11:07:27.919+00	2024-08-29 11:09:36.642+00
6	\N	jovyan	192.168.85.186	2024-08-29 11:09:06.131+00	2024-08-29 13:02:41.086+00
7	\N	jovyan	192.168.85.186	2024-08-29 11:11:14.924+00	2024-08-29 11:14:53.899+00
9	\N	jovyan	192.168.85.186	2024-08-29 11:14:55.454+00	2024-08-29 13:02:41.097+00
10	\N	jovyan	192.168.85.186	2024-08-29 11:50:30.917+00	2024-08-29 13:02:41.092+00
11	\N	jovyan	192.168.85.186	2024-08-30 06:47:19.932+00	2024-08-30 07:48:04.291+00
12	\N	jovyan	192.168.85.186	2024-08-30 09:00:10.803+00	2024-08-30 11:05:21.14+00
13	3	default-generic-workspace\\jovyan	192.168.85.183	2024-09-04 12:53:38.506+00	2024-09-04 14:00:22.763+00
62	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 10:02:56.04+00	2024-09-19 11:03:35.541+00
14	4	test-workspace-tolerations\\jovyan	192.168.85.183	2024-09-06 08:02:23.045+00	2024-09-06 09:04:03.65+00
63	87	test-workspace@jovyan	192.168.85.134	2024-09-19 10:03:27.486+00	2024-09-19 11:10:35.502+00
64	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 10:22:58.378+00	2024-09-19 11:27:05.112+00
15	4	test-workspace-tolerations\\jovyan	192.168.85.185	2024-09-10 14:48:29.116+00	2024-09-10 19:39:40.836+00
16	4	test-workspace-tolerations\\jovyan	192.168.85.185	2024-09-10 14:59:54.617+00	2024-09-10 19:39:40.893+00
65	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-19 10:29:04.72+00	2024-09-20 04:03:09.737+00
17	4	test-workspace-tolerations\\jovyan	192.168.85.185	2024-09-10 22:14:14.67+00	2024-09-11 01:33:07.416+00
18	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-13 10:00:56.003+00	\N
66	87	test-workspace@jovyan	192.168.85.134	2024-09-20 09:13:16.263+00	2024-09-20 09:18:16.545+00
20	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-13 11:05:09.793+00	2024-09-13 12:10:21.537+00
19	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-13 10:03:11.236+00	2024-09-13 13:38:21.19+00
67	87	test-workspace@jovyan	192.168.85.134	2024-09-20 09:18:22.026+00	2024-09-20 10:19:09.479+00
24	87	test-workspace@jovyan	192.168.85.134	2024-09-16 13:34:13.241+00	2024-09-16 13:39:32.839+00
68	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-20 09:19:47.287+00	2024-09-20 10:20:09.467+00
69	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-20 09:21:44.856+00	2024-09-23 13:05:03.786+00
22	87	test-workspace@jovyan	192.168.85.134	2024-09-16 13:08:47.615+00	2024-09-16 14:22:44.293+00
23	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-16 13:22:31.587+00	2024-09-16 14:22:44.298+00
21	87	test-workspace@jovyan	192.168.85.134	2024-09-16 12:46:00.861+00	2024-09-16 14:22:44.304+00
25	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-16 13:39:42.382+00	2024-09-16 14:40:05.647+00
27	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-16 13:47:31.578+00	2024-09-16 14:48:05.614+00
26	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-16 13:47:06.797+00	2024-09-16 14:48:05.631+00
28	87	test-workspace@jovyan	192.168.85.134	2024-09-16 13:52:10.437+00	2024-09-16 14:53:05.594+00
29	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-16 14:02:19.563+00	2024-09-16 15:17:05.509+00
30	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-16 14:22:12.662+00	2024-09-16 15:23:05.488+00
31	87	test-workspace@jovyan	192.168.85.134	2024-09-16 14:25:07.94+00	2024-09-16 15:26:05.475+00
34	87	test-workspace@jovyan	192.168.85.134	2024-09-16 16:26:08.724+00	2024-09-16 18:49:50.821+00
33	87	test-workspace@jovyan	192.168.85.134	2024-09-16 16:21:46.1+00	2024-09-16 18:49:50.83+00
32	87	test-workspace@jovyan	192.168.85.134	2024-09-16 16:18:31.243+00	2024-09-16 18:49:50.838+00
35	87	test-workspace@jovyan	192.168.85.134	2024-09-17 08:22:31.386+00	2024-09-17 09:26:58.885+00
37	87	test-workspace@jovyan	192.168.85.134	2024-09-17 10:23:17.566+00	2024-09-17 10:23:29.242+00
38	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 10:23:38.64+00	2024-09-17 10:23:48.723+00
39	87	test-workspace@jovyan	192.168.85.134	2024-09-17 10:23:54.408+00	2024-09-17 10:28:06.896+00
40	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 10:28:38.569+00	2024-09-17 10:28:54.315+00
41	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 10:28:56.864+00	2024-09-17 10:29:04.772+00
42	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 10:29:06.557+00	2024-09-17 11:36:24.683+00
43	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 11:38:32.608+00	2024-09-17 11:38:35.047+00
44	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 11:38:37.035+00	2024-09-17 11:38:38.787+00
45	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 11:38:40.241+00	2024-09-17 11:39:02.217+00
46	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 11:39:04.267+00	2024-09-17 11:39:06.951+00
47	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 11:45:41.751+00	2024-09-17 12:27:04.094+00
48	87	test-workspace@jovyan	192.168.85.134	2024-09-17 12:27:17.165+00	2024-09-17 12:58:20.419+00
50	87	test-workspace@jovyan	192.168.85.134	2024-09-17 13:01:36.414+00	2024-09-17 13:04:25.748+00
36	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 08:34:00.618+00	2024-09-17 14:01:14.641+00
49	85	default-generic-workspace@jovyan	192.168.85.134	2024-09-17 12:58:36.507+00	2024-09-17 14:01:14.674+00
51	87	test-workspace@jovyan	192.168.85.134	2024-09-17 13:04:29.336+00	2024-09-18 09:28:48.541+00
\.


--
-- TOC entry 3626 (class 0 OID 57733)
-- Dependencies: 246
-- Data for Name: guacamole_user_password_history; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_password_history (password_history_id, user_id, password_hash, password_salt, password_date) FROM stdin;
\.


--
-- TOC entry 3619 (class 0 OID 57649)
-- Dependencies: 239
-- Data for Name: guacamole_user_permission; Type: TABLE DATA; Schema: public; Owner: guacamole
--

COPY public.guacamole_user_permission (entity_id, affected_user_id, permission) FROM stdin;
1	1	READ
1	1	UPDATE
1	1	ADMINISTER
4	3	READ
5	4	READ
2187	85	READ
2188	86	READ
2189	87	READ
2190	88	READ
\.


--
-- TOC entry 3641 (class 0 OID 0)
-- Dependencies: 217
-- Name: guacamole_connection_connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_connection_connection_id_seq', 2188, true);


--
-- TOC entry 3642 (class 0 OID 0)
-- Dependencies: 215
-- Name: guacamole_connection_group_connection_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_connection_group_connection_group_id_seq', 2213, true);


--
-- TOC entry 3643 (class 0 OID 0)
-- Dependencies: 241
-- Name: guacamole_connection_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_connection_history_history_id_seq', 167, true);


--
-- TOC entry 3644 (class 0 OID 0)
-- Dependencies: 219
-- Name: guacamole_entity_entity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_entity_entity_id_seq', 2193, true);


--
-- TOC entry 3645 (class 0 OID 0)
-- Dependencies: 226
-- Name: guacamole_sharing_profile_sharing_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_sharing_profile_sharing_profile_id_seq', 1, false);


--
-- TOC entry 3646 (class 0 OID 0)
-- Dependencies: 223
-- Name: guacamole_user_group_user_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_user_group_user_group_id_seq', 1, true);


--
-- TOC entry 3647 (class 0 OID 0)
-- Dependencies: 243
-- Name: guacamole_user_history_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_user_history_history_id_seq', 69, true);


--
-- TOC entry 3648 (class 0 OID 0)
-- Dependencies: 245
-- Name: guacamole_user_password_history_password_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_user_password_history_password_history_id_seq', 1, false);


--
-- TOC entry 3649 (class 0 OID 0)
-- Dependencies: 221
-- Name: guacamole_user_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: guacamole
--

SELECT pg_catalog.setval('public.guacamole_user_user_id_seq', 88, true);


--
-- TOC entry 3333 (class 2606 OID 57399)
-- Name: guacamole_connection_group connection_group_name_parent; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group
    ADD CONSTRAINT connection_group_name_parent UNIQUE (connection_group_name, parent_id);


--
-- TOC entry 3338 (class 2606 OID 57417)
-- Name: guacamole_connection connection_name_parent; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection
    ADD CONSTRAINT connection_name_parent UNIQUE (connection_name, parent_id);


--
-- TOC entry 3375 (class 2606 OID 57554)
-- Name: guacamole_connection_attribute guacamole_connection_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_attribute
    ADD CONSTRAINT guacamole_connection_attribute_pkey PRIMARY KEY (connection_id, attribute_name);


--
-- TOC entry 3378 (class 2606 OID 57567)
-- Name: guacamole_connection_group_attribute guacamole_connection_group_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group_attribute
    ADD CONSTRAINT guacamole_connection_group_attribute_pkey PRIMARY KEY (connection_group_id, attribute_name);


--
-- TOC entry 3389 (class 2606 OID 57608)
-- Name: guacamole_connection_group_permission guacamole_connection_group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group_permission
    ADD CONSTRAINT guacamole_connection_group_permission_pkey PRIMARY KEY (entity_id, connection_group_id, permission);


--
-- TOC entry 3336 (class 2606 OID 57397)
-- Name: guacamole_connection_group guacamole_connection_group_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group
    ADD CONSTRAINT guacamole_connection_group_pkey PRIMARY KEY (connection_group_id);


--
-- TOC entry 3409 (class 2606 OID 57693)
-- Name: guacamole_connection_history guacamole_connection_history_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3363 (class 2606 OID 57502)
-- Name: guacamole_connection_parameter guacamole_connection_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_parameter
    ADD CONSTRAINT guacamole_connection_parameter_pkey PRIMARY KEY (connection_id, parameter_name);


--
-- TOC entry 3385 (class 2606 OID 57591)
-- Name: guacamole_connection_permission guacamole_connection_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_permission
    ADD CONSTRAINT guacamole_connection_permission_pkey PRIMARY KEY (entity_id, connection_id, permission);


--
-- TOC entry 3341 (class 2606 OID 57415)
-- Name: guacamole_connection guacamole_connection_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection
    ADD CONSTRAINT guacamole_connection_pkey PRIMARY KEY (connection_id);


--
-- TOC entry 3343 (class 2606 OID 57432)
-- Name: guacamole_entity guacamole_entity_name_scope; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_entity
    ADD CONSTRAINT guacamole_entity_name_scope UNIQUE (type, name);


--
-- TOC entry 3345 (class 2606 OID 57430)
-- Name: guacamole_entity guacamole_entity_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_entity
    ADD CONSTRAINT guacamole_entity_pkey PRIMARY KEY (entity_id);


--
-- TOC entry 3380 (class 2606 OID 57580)
-- Name: guacamole_sharing_profile_attribute guacamole_sharing_profile_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_attribute
    ADD CONSTRAINT guacamole_sharing_profile_attribute_pkey PRIMARY KEY (sharing_profile_id, attribute_name);


--
-- TOC entry 3365 (class 2606 OID 57515)
-- Name: guacamole_sharing_profile_parameter guacamole_sharing_profile_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_parameter
    ADD CONSTRAINT guacamole_sharing_profile_parameter_pkey PRIMARY KEY (sharing_profile_id, parameter_name);


--
-- TOC entry 3392 (class 2606 OID 57625)
-- Name: guacamole_sharing_profile_permission guacamole_sharing_profile_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_permission
    ADD CONSTRAINT guacamole_sharing_profile_permission_pkey PRIMARY KEY (entity_id, sharing_profile_id, permission);


--
-- TOC entry 3357 (class 2606 OID 57487)
-- Name: guacamole_sharing_profile guacamole_sharing_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile
    ADD CONSTRAINT guacamole_sharing_profile_pkey PRIMARY KEY (sharing_profile_id);


--
-- TOC entry 3396 (class 2606 OID 57642)
-- Name: guacamole_system_permission guacamole_system_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_system_permission
    ADD CONSTRAINT guacamole_system_permission_pkey PRIMARY KEY (entity_id, permission);


--
-- TOC entry 3368 (class 2606 OID 57528)
-- Name: guacamole_user_attribute guacamole_user_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_attribute
    ADD CONSTRAINT guacamole_user_attribute_pkey PRIMARY KEY (user_id, attribute_name);


--
-- TOC entry 3371 (class 2606 OID 57541)
-- Name: guacamole_user_group_attribute guacamole_user_group_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_attribute
    ADD CONSTRAINT guacamole_user_group_attribute_pkey PRIMARY KEY (user_group_id, attribute_name);


--
-- TOC entry 3355 (class 2606 OID 57470)
-- Name: guacamole_user_group_member guacamole_user_group_member_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_member
    ADD CONSTRAINT guacamole_user_group_member_pkey PRIMARY KEY (user_group_id, member_entity_id);


--
-- TOC entry 3404 (class 2606 OID 57670)
-- Name: guacamole_user_group_permission guacamole_user_group_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_permission
    ADD CONSTRAINT guacamole_user_group_permission_pkey PRIMARY KEY (entity_id, affected_user_group_id, permission);


--
-- TOC entry 3351 (class 2606 OID 57458)
-- Name: guacamole_user_group guacamole_user_group_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group
    ADD CONSTRAINT guacamole_user_group_pkey PRIMARY KEY (user_group_id);


--
-- TOC entry 3353 (class 2606 OID 57460)
-- Name: guacamole_user_group guacamole_user_group_single_entity; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group
    ADD CONSTRAINT guacamole_user_group_single_entity UNIQUE (entity_id);


--
-- TOC entry 3415 (class 2606 OID 57722)
-- Name: guacamole_user_history guacamole_user_history_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_history
    ADD CONSTRAINT guacamole_user_history_pkey PRIMARY KEY (history_id);


--
-- TOC entry 3420 (class 2606 OID 57740)
-- Name: guacamole_user_password_history guacamole_user_password_history_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_password_history
    ADD CONSTRAINT guacamole_user_password_history_pkey PRIMARY KEY (password_history_id);


--
-- TOC entry 3400 (class 2606 OID 57653)
-- Name: guacamole_user_permission guacamole_user_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_permission
    ADD CONSTRAINT guacamole_user_permission_pkey PRIMARY KEY (entity_id, affected_user_id, permission);


--
-- TOC entry 3347 (class 2606 OID 57443)
-- Name: guacamole_user guacamole_user_pkey; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user
    ADD CONSTRAINT guacamole_user_pkey PRIMARY KEY (user_id);


--
-- TOC entry 3349 (class 2606 OID 57445)
-- Name: guacamole_user guacamole_user_single_entity; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user
    ADD CONSTRAINT guacamole_user_single_entity UNIQUE (entity_id);


--
-- TOC entry 3360 (class 2606 OID 57489)
-- Name: guacamole_sharing_profile sharing_profile_name_primary; Type: CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile
    ADD CONSTRAINT sharing_profile_name_primary UNIQUE (sharing_profile_name, primary_connection_id);


--
-- TOC entry 3373 (class 1259 OID 57560)
-- Name: guacamole_connection_attribute_connection_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_attribute_connection_id ON public.guacamole_connection_attribute USING btree (connection_id);


--
-- TOC entry 3376 (class 1259 OID 57573)
-- Name: guacamole_connection_group_attribute_connection_group_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_group_attribute_connection_group_id ON public.guacamole_connection_group_attribute USING btree (connection_group_id);


--
-- TOC entry 3334 (class 1259 OID 57405)
-- Name: guacamole_connection_group_parent_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_group_parent_id ON public.guacamole_connection_group USING btree (parent_id);


--
-- TOC entry 3386 (class 1259 OID 57619)
-- Name: guacamole_connection_group_permission_connection_group_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_group_permission_connection_group_id ON public.guacamole_connection_group_permission USING btree (connection_group_id);


--
-- TOC entry 3387 (class 1259 OID 57620)
-- Name: guacamole_connection_group_permission_entity_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_group_permission_entity_id ON public.guacamole_connection_group_permission USING btree (entity_id);


--
-- TOC entry 3405 (class 1259 OID 57710)
-- Name: guacamole_connection_history_connection_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_history_connection_id ON public.guacamole_connection_history USING btree (connection_id);


--
-- TOC entry 3406 (class 1259 OID 57714)
-- Name: guacamole_connection_history_connection_id_start_date; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_history_connection_id_start_date ON public.guacamole_connection_history USING btree (connection_id, start_date);


--
-- TOC entry 3407 (class 1259 OID 57713)
-- Name: guacamole_connection_history_end_date; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_history_end_date ON public.guacamole_connection_history USING btree (end_date);


--
-- TOC entry 3410 (class 1259 OID 57711)
-- Name: guacamole_connection_history_sharing_profile_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_history_sharing_profile_id ON public.guacamole_connection_history USING btree (sharing_profile_id);


--
-- TOC entry 3411 (class 1259 OID 57712)
-- Name: guacamole_connection_history_start_date; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_history_start_date ON public.guacamole_connection_history USING btree (start_date);


--
-- TOC entry 3412 (class 1259 OID 57709)
-- Name: guacamole_connection_history_user_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_history_user_id ON public.guacamole_connection_history USING btree (user_id);


--
-- TOC entry 3361 (class 1259 OID 57508)
-- Name: guacamole_connection_parameter_connection_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_parameter_connection_id ON public.guacamole_connection_parameter USING btree (connection_id);


--
-- TOC entry 3339 (class 1259 OID 57423)
-- Name: guacamole_connection_parent_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_parent_id ON public.guacamole_connection USING btree (parent_id);


--
-- TOC entry 3382 (class 1259 OID 57602)
-- Name: guacamole_connection_permission_connection_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_permission_connection_id ON public.guacamole_connection_permission USING btree (connection_id);


--
-- TOC entry 3383 (class 1259 OID 57603)
-- Name: guacamole_connection_permission_entity_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_connection_permission_entity_id ON public.guacamole_connection_permission USING btree (entity_id);


--
-- TOC entry 3381 (class 1259 OID 57586)
-- Name: guacamole_sharing_profile_attribute_sharing_profile_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_sharing_profile_attribute_sharing_profile_id ON public.guacamole_sharing_profile_attribute USING btree (sharing_profile_id);


--
-- TOC entry 3366 (class 1259 OID 57521)
-- Name: guacamole_sharing_profile_parameter_sharing_profile_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_sharing_profile_parameter_sharing_profile_id ON public.guacamole_sharing_profile_parameter USING btree (sharing_profile_id);


--
-- TOC entry 3390 (class 1259 OID 57637)
-- Name: guacamole_sharing_profile_permission_entity_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_sharing_profile_permission_entity_id ON public.guacamole_sharing_profile_permission USING btree (entity_id);


--
-- TOC entry 3393 (class 1259 OID 57636)
-- Name: guacamole_sharing_profile_permission_sharing_profile_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_sharing_profile_permission_sharing_profile_id ON public.guacamole_sharing_profile_permission USING btree (sharing_profile_id);


--
-- TOC entry 3358 (class 1259 OID 57495)
-- Name: guacamole_sharing_profile_primary_connection_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_sharing_profile_primary_connection_id ON public.guacamole_sharing_profile USING btree (primary_connection_id);


--
-- TOC entry 3394 (class 1259 OID 57648)
-- Name: guacamole_system_permission_entity_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_system_permission_entity_id ON public.guacamole_system_permission USING btree (entity_id);


--
-- TOC entry 3369 (class 1259 OID 57534)
-- Name: guacamole_user_attribute_user_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_attribute_user_id ON public.guacamole_user_attribute USING btree (user_id);


--
-- TOC entry 3372 (class 1259 OID 57547)
-- Name: guacamole_user_group_attribute_user_group_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_group_attribute_user_group_id ON public.guacamole_user_group_attribute USING btree (user_group_id);


--
-- TOC entry 3401 (class 1259 OID 57681)
-- Name: guacamole_user_group_permission_affected_user_group_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_group_permission_affected_user_group_id ON public.guacamole_user_group_permission USING btree (affected_user_group_id);


--
-- TOC entry 3402 (class 1259 OID 57682)
-- Name: guacamole_user_group_permission_entity_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_group_permission_entity_id ON public.guacamole_user_group_permission USING btree (entity_id);


--
-- TOC entry 3413 (class 1259 OID 57730)
-- Name: guacamole_user_history_end_date; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_history_end_date ON public.guacamole_user_history USING btree (end_date);


--
-- TOC entry 3416 (class 1259 OID 57729)
-- Name: guacamole_user_history_start_date; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_history_start_date ON public.guacamole_user_history USING btree (start_date);


--
-- TOC entry 3417 (class 1259 OID 57728)
-- Name: guacamole_user_history_user_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_history_user_id ON public.guacamole_user_history USING btree (user_id);


--
-- TOC entry 3418 (class 1259 OID 57731)
-- Name: guacamole_user_history_user_id_start_date; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_history_user_id_start_date ON public.guacamole_user_history USING btree (user_id, start_date);


--
-- TOC entry 3421 (class 1259 OID 57746)
-- Name: guacamole_user_password_history_user_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_password_history_user_id ON public.guacamole_user_password_history USING btree (user_id);


--
-- TOC entry 3397 (class 1259 OID 57664)
-- Name: guacamole_user_permission_affected_user_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_permission_affected_user_id ON public.guacamole_user_permission USING btree (affected_user_id);


--
-- TOC entry 3398 (class 1259 OID 57665)
-- Name: guacamole_user_permission_entity_id; Type: INDEX; Schema: public; Owner: guacamole
--

CREATE INDEX guacamole_user_permission_entity_id ON public.guacamole_user_permission USING btree (entity_id);


--
-- TOC entry 3433 (class 2606 OID 57555)
-- Name: guacamole_connection_attribute guacamole_connection_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_attribute
    ADD CONSTRAINT guacamole_connection_attribute_ibfk_1 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- TOC entry 3434 (class 2606 OID 57568)
-- Name: guacamole_connection_group_attribute guacamole_connection_group_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group_attribute
    ADD CONSTRAINT guacamole_connection_group_attribute_ibfk_1 FOREIGN KEY (connection_group_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- TOC entry 3422 (class 2606 OID 57400)
-- Name: guacamole_connection_group guacamole_connection_group_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group
    ADD CONSTRAINT guacamole_connection_group_ibfk_1 FOREIGN KEY (parent_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- TOC entry 3438 (class 2606 OID 57614)
-- Name: guacamole_connection_group_permission guacamole_connection_group_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group_permission
    ADD CONSTRAINT guacamole_connection_group_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3439 (class 2606 OID 57609)
-- Name: guacamole_connection_group_permission guacamole_connection_group_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_group_permission
    ADD CONSTRAINT guacamole_connection_group_permission_ibfk_1 FOREIGN KEY (connection_group_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- TOC entry 3447 (class 2606 OID 57694)
-- Name: guacamole_connection_history guacamole_connection_history_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE SET NULL;


--
-- TOC entry 3448 (class 2606 OID 57699)
-- Name: guacamole_connection_history guacamole_connection_history_ibfk_2; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_ibfk_2 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE SET NULL;


--
-- TOC entry 3449 (class 2606 OID 57704)
-- Name: guacamole_connection_history guacamole_connection_history_ibfk_3; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_history
    ADD CONSTRAINT guacamole_connection_history_ibfk_3 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE SET NULL;


--
-- TOC entry 3423 (class 2606 OID 57418)
-- Name: guacamole_connection guacamole_connection_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection
    ADD CONSTRAINT guacamole_connection_ibfk_1 FOREIGN KEY (parent_id) REFERENCES public.guacamole_connection_group(connection_group_id) ON DELETE CASCADE;


--
-- TOC entry 3429 (class 2606 OID 57503)
-- Name: guacamole_connection_parameter guacamole_connection_parameter_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_parameter
    ADD CONSTRAINT guacamole_connection_parameter_ibfk_1 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- TOC entry 3436 (class 2606 OID 57597)
-- Name: guacamole_connection_permission guacamole_connection_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_permission
    ADD CONSTRAINT guacamole_connection_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3437 (class 2606 OID 57592)
-- Name: guacamole_connection_permission guacamole_connection_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_connection_permission
    ADD CONSTRAINT guacamole_connection_permission_ibfk_1 FOREIGN KEY (connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- TOC entry 3435 (class 2606 OID 57581)
-- Name: guacamole_sharing_profile_attribute guacamole_sharing_profile_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_attribute
    ADD CONSTRAINT guacamole_sharing_profile_attribute_ibfk_1 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE CASCADE;


--
-- TOC entry 3428 (class 2606 OID 57490)
-- Name: guacamole_sharing_profile guacamole_sharing_profile_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile
    ADD CONSTRAINT guacamole_sharing_profile_ibfk_1 FOREIGN KEY (primary_connection_id) REFERENCES public.guacamole_connection(connection_id) ON DELETE CASCADE;


--
-- TOC entry 3430 (class 2606 OID 57516)
-- Name: guacamole_sharing_profile_parameter guacamole_sharing_profile_parameter_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_parameter
    ADD CONSTRAINT guacamole_sharing_profile_parameter_ibfk_1 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE CASCADE;


--
-- TOC entry 3440 (class 2606 OID 57631)
-- Name: guacamole_sharing_profile_permission guacamole_sharing_profile_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_permission
    ADD CONSTRAINT guacamole_sharing_profile_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3441 (class 2606 OID 57626)
-- Name: guacamole_sharing_profile_permission guacamole_sharing_profile_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_sharing_profile_permission
    ADD CONSTRAINT guacamole_sharing_profile_permission_ibfk_1 FOREIGN KEY (sharing_profile_id) REFERENCES public.guacamole_sharing_profile(sharing_profile_id) ON DELETE CASCADE;


--
-- TOC entry 3442 (class 2606 OID 57643)
-- Name: guacamole_system_permission guacamole_system_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_system_permission
    ADD CONSTRAINT guacamole_system_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3431 (class 2606 OID 57529)
-- Name: guacamole_user_attribute guacamole_user_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_attribute
    ADD CONSTRAINT guacamole_user_attribute_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE CASCADE;


--
-- TOC entry 3424 (class 2606 OID 57446)
-- Name: guacamole_user guacamole_user_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user
    ADD CONSTRAINT guacamole_user_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3432 (class 2606 OID 57542)
-- Name: guacamole_user_group_attribute guacamole_user_group_attribute_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_attribute
    ADD CONSTRAINT guacamole_user_group_attribute_ibfk_1 FOREIGN KEY (user_group_id) REFERENCES public.guacamole_user_group(user_group_id) ON DELETE CASCADE;


--
-- TOC entry 3425 (class 2606 OID 57461)
-- Name: guacamole_user_group guacamole_user_group_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group
    ADD CONSTRAINT guacamole_user_group_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3426 (class 2606 OID 57476)
-- Name: guacamole_user_group_member guacamole_user_group_member_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_member
    ADD CONSTRAINT guacamole_user_group_member_entity FOREIGN KEY (member_entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3427 (class 2606 OID 57471)
-- Name: guacamole_user_group_member guacamole_user_group_member_parent; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_member
    ADD CONSTRAINT guacamole_user_group_member_parent FOREIGN KEY (user_group_id) REFERENCES public.guacamole_user_group(user_group_id) ON DELETE CASCADE;


--
-- TOC entry 3445 (class 2606 OID 57671)
-- Name: guacamole_user_group_permission guacamole_user_group_permission_affected_user_group; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_permission
    ADD CONSTRAINT guacamole_user_group_permission_affected_user_group FOREIGN KEY (affected_user_group_id) REFERENCES public.guacamole_user_group(user_group_id) ON DELETE CASCADE;


--
-- TOC entry 3446 (class 2606 OID 57676)
-- Name: guacamole_user_group_permission guacamole_user_group_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_group_permission
    ADD CONSTRAINT guacamole_user_group_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3450 (class 2606 OID 57723)
-- Name: guacamole_user_history guacamole_user_history_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_history
    ADD CONSTRAINT guacamole_user_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE SET NULL;


--
-- TOC entry 3451 (class 2606 OID 57741)
-- Name: guacamole_user_password_history guacamole_user_password_history_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_password_history
    ADD CONSTRAINT guacamole_user_password_history_ibfk_1 FOREIGN KEY (user_id) REFERENCES public.guacamole_user(user_id) ON DELETE CASCADE;


--
-- TOC entry 3443 (class 2606 OID 57659)
-- Name: guacamole_user_permission guacamole_user_permission_entity; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_permission
    ADD CONSTRAINT guacamole_user_permission_entity FOREIGN KEY (entity_id) REFERENCES public.guacamole_entity(entity_id) ON DELETE CASCADE;


--
-- TOC entry 3444 (class 2606 OID 57654)
-- Name: guacamole_user_permission guacamole_user_permission_ibfk_1; Type: FK CONSTRAINT; Schema: public; Owner: guacamole
--

ALTER TABLE ONLY public.guacamole_user_permission
    ADD CONSTRAINT guacamole_user_permission_ibfk_1 FOREIGN KEY (affected_user_id) REFERENCES public.guacamole_user(user_id) ON DELETE CASCADE;


-- Completed on 2024-09-25 14:54:02

--
-- PostgreSQL database dump complete
--

