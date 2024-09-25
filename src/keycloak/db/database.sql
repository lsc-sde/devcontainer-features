--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.0

-- Started on 2024-09-25 12:22:22

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
-- TOC entry 256 (class 1259 OID 49786)
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO keycloak;

--
-- TOC entry 285 (class 1259 OID 50229)
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO keycloak;

--
-- TOC entry 259 (class 1259 OID 49801)
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO keycloak;

--
-- TOC entry 258 (class 1259 OID 49796)
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO keycloak;

--
-- TOC entry 257 (class 1259 OID 49791)
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO keycloak;

--
-- TOC entry 260 (class 1259 OID 49806)
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO keycloak;

--
-- TOC entry 286 (class 1259 OID 50244)
-- Name: broker_link; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO keycloak;

--
-- TOC entry 217 (class 1259 OID 49167)
-- Name: client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO keycloak;

--
-- TOC entry 240 (class 1259 OID 49525)
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.client_attributes OWNER TO keycloak;

--
-- TOC entry 297 (class 1259 OID 50493)
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO keycloak;

--
-- TOC entry 296 (class 1259 OID 50368)
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO keycloak;

--
-- TOC entry 242 (class 1259 OID 49535)
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO keycloak;

--
-- TOC entry 274 (class 1259 OID 50034)
-- Name: client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO keycloak;

--
-- TOC entry 275 (class 1259 OID 50048)
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO keycloak;

--
-- TOC entry 298 (class 1259 OID 50534)
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO keycloak;

--
-- TOC entry 276 (class 1259 OID 50053)
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO keycloak;

--
-- TOC entry 218 (class 1259 OID 49178)
-- Name: client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO keycloak;

--
-- TOC entry 263 (class 1259 OID 49824)
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO keycloak;

--
-- TOC entry 241 (class 1259 OID 49530)
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO keycloak;

--
-- TOC entry 255 (class 1259 OID 49708)
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO keycloak;

--
-- TOC entry 219 (class 1259 OID 49183)
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO keycloak;

--
-- TOC entry 264 (class 1259 OID 49905)
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO keycloak;

--
-- TOC entry 294 (class 1259 OID 50289)
-- Name: component; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO keycloak;

--
-- TOC entry 293 (class 1259 OID 50284)
-- Name: component_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.component_config OWNER TO keycloak;

--
-- TOC entry 220 (class 1259 OID 49186)
-- Name: composite_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO keycloak;

--
-- TOC entry 221 (class 1259 OID 49189)
-- Name: credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO keycloak;

--
-- TOC entry 216 (class 1259 OID 49159)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO keycloak;

--
-- TOC entry 215 (class 1259 OID 49154)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO keycloak;

--
-- TOC entry 299 (class 1259 OID 50550)
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO keycloak;

--
-- TOC entry 222 (class 1259 OID 49194)
-- Name: event_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255),
    details_json_long_value text
);


ALTER TABLE public.event_entity OWNER TO keycloak;

--
-- TOC entry 287 (class 1259 OID 50249)
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024),
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.fed_user_attribute OWNER TO keycloak;

--
-- TOC entry 288 (class 1259 OID 50254)
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO keycloak;

--
-- TOC entry 301 (class 1259 OID 50576)
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO keycloak;

--
-- TOC entry 289 (class 1259 OID 50263)
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO keycloak;

--
-- TOC entry 290 (class 1259 OID 50272)
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO keycloak;

--
-- TOC entry 291 (class 1259 OID 50275)
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO keycloak;

--
-- TOC entry 292 (class 1259 OID 50281)
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO keycloak;

--
-- TOC entry 245 (class 1259 OID 49571)
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO keycloak;

--
-- TOC entry 295 (class 1259 OID 50346)
-- Name: federated_user; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO keycloak;

--
-- TOC entry 271 (class 1259 OID 49973)
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO keycloak;

--
-- TOC entry 270 (class 1259 OID 49970)
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO keycloak;

--
-- TOC entry 246 (class 1259 OID 49576)
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO keycloak;

--
-- TOC entry 247 (class 1259 OID 49585)
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO keycloak;

--
-- TOC entry 252 (class 1259 OID 49689)
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO keycloak;

--
-- TOC entry 253 (class 1259 OID 49694)
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO keycloak;

--
-- TOC entry 269 (class 1259 OID 49967)
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO keycloak;

--
-- TOC entry 223 (class 1259 OID 49202)
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO keycloak;

--
-- TOC entry 251 (class 1259 OID 49686)
-- Name: migration_model; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO keycloak;

--
-- TOC entry 268 (class 1259 OID 49958)
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL,
    version integer DEFAULT 0
);


ALTER TABLE public.offline_client_session OWNER TO keycloak;

--
-- TOC entry 267 (class 1259 OID 49953)
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL,
    broker_session_id character varying(1024),
    version integer DEFAULT 0
);


ALTER TABLE public.offline_user_session OWNER TO keycloak;

--
-- TOC entry 307 (class 1259 OID 57761)
-- Name: org; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org (
    id character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    realm_id character varying(255) NOT NULL,
    group_id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(4000)
);


ALTER TABLE public.org OWNER TO keycloak;

--
-- TOC entry 308 (class 1259 OID 57772)
-- Name: org_domain; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.org_domain (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    verified boolean NOT NULL,
    org_id character varying(255) NOT NULL
);


ALTER TABLE public.org_domain OWNER TO keycloak;

--
-- TOC entry 281 (class 1259 OID 50172)
-- Name: policy_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO keycloak;

--
-- TOC entry 243 (class 1259 OID 49560)
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO keycloak;

--
-- TOC entry 244 (class 1259 OID 49566)
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO keycloak;

--
-- TOC entry 224 (class 1259 OID 49208)
-- Name: realm; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO keycloak;

--
-- TOC entry 225 (class 1259 OID 49225)
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO keycloak;

--
-- TOC entry 273 (class 1259 OID 49982)
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO keycloak;

--
-- TOC entry 250 (class 1259 OID 49678)
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO keycloak;

--
-- TOC entry 226 (class 1259 OID 49233)
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO keycloak;

--
-- TOC entry 306 (class 1259 OID 50684)
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO keycloak;

--
-- TOC entry 227 (class 1259 OID 49236)
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO keycloak;

--
-- TOC entry 228 (class 1259 OID 49243)
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO keycloak;

--
-- TOC entry 248 (class 1259 OID 49594)
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO keycloak;

--
-- TOC entry 229 (class 1259 OID 49253)
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO keycloak;

--
-- TOC entry 266 (class 1259 OID 49917)
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO keycloak;

--
-- TOC entry 265 (class 1259 OID 49910)
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO keycloak;

--
-- TOC entry 303 (class 1259 OID 50615)
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO keycloak;

--
-- TOC entry 283 (class 1259 OID 50199)
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO keycloak;

--
-- TOC entry 282 (class 1259 OID 50184)
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO keycloak;

--
-- TOC entry 277 (class 1259 OID 50122)
-- Name: resource_server; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode smallint NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO keycloak;

--
-- TOC entry 302 (class 1259 OID 50591)
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO keycloak;

--
-- TOC entry 280 (class 1259 OID 50158)
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy smallint,
    logic smallint,
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO keycloak;

--
-- TOC entry 278 (class 1259 OID 50130)
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO keycloak;

--
-- TOC entry 279 (class 1259 OID 50144)
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO keycloak;

--
-- TOC entry 304 (class 1259 OID 50633)
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO keycloak;

--
-- TOC entry 305 (class 1259 OID 50643)
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO keycloak;

--
-- TOC entry 230 (class 1259 OID 49256)
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO keycloak;

--
-- TOC entry 284 (class 1259 OID 50214)
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO keycloak;

--
-- TOC entry 232 (class 1259 OID 49262)
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    long_value_hash bytea,
    long_value_hash_lower_case bytea,
    long_value text
);


ALTER TABLE public.user_attribute OWNER TO keycloak;

--
-- TOC entry 254 (class 1259 OID 49699)
-- Name: user_consent; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO keycloak;

--
-- TOC entry 300 (class 1259 OID 50566)
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO keycloak;

--
-- TOC entry 233 (class 1259 OID 49267)
-- Name: user_entity; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO keycloak;

--
-- TOC entry 234 (class 1259 OID 49275)
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO keycloak;

--
-- TOC entry 261 (class 1259 OID 49811)
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO keycloak;

--
-- TOC entry 262 (class 1259 OID 49816)
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO keycloak;

--
-- TOC entry 235 (class 1259 OID 49280)
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO keycloak;

--
-- TOC entry 272 (class 1259 OID 49979)
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO keycloak;

--
-- TOC entry 236 (class 1259 OID 49285)
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO keycloak;

--
-- TOC entry 237 (class 1259 OID 49288)
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO keycloak;

--
-- TOC entry 238 (class 1259 OID 49291)
-- Name: user_session; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO keycloak;

--
-- TOC entry 249 (class 1259 OID 49597)
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO keycloak;

--
-- TOC entry 231 (class 1259 OID 49259)
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO keycloak;

--
-- TOC entry 239 (class 1259 OID 49302)
-- Name: web_origins; Type: TABLE; Schema: public; Owner: keycloak
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO keycloak;

--
-- TOC entry 4217 (class 0 OID 49786)
-- Dependencies: 256
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- TOC entry 4246 (class 0 OID 50229)
-- Dependencies: 285
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
\.


--
-- TOC entry 4220 (class 0 OID 49801)
-- Dependencies: 259
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
f4b3c3cb-d8ee-462d-a1e3-71e4adaeec40	\N	auth-cookie	f99aa1dc-f2b1-4820-a912-450227263613	091a67f5-0812-460c-984a-49afd042ce70	2	10	f	\N	\N
45f41151-103b-49d7-953b-01c699e0650e	\N	auth-spnego	f99aa1dc-f2b1-4820-a912-450227263613	091a67f5-0812-460c-984a-49afd042ce70	3	20	f	\N	\N
59abd84e-1530-44f3-ba0c-739fac580236	\N	identity-provider-redirector	f99aa1dc-f2b1-4820-a912-450227263613	091a67f5-0812-460c-984a-49afd042ce70	2	25	f	\N	\N
ca356f49-06fd-4d2e-bd8f-4f8f124391e5	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	091a67f5-0812-460c-984a-49afd042ce70	2	30	t	144f0910-2b5c-4da7-9fc2-8262e2ba8022	\N
e95ea9d2-6c20-441c-8188-8c945b526fa4	\N	auth-username-password-form	f99aa1dc-f2b1-4820-a912-450227263613	144f0910-2b5c-4da7-9fc2-8262e2ba8022	0	10	f	\N	\N
6f346794-c01b-4f21-b0f5-5acc84f21cfa	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	144f0910-2b5c-4da7-9fc2-8262e2ba8022	1	20	t	06d83c64-39dc-4aa8-8b31-f7f4a0e58f43	\N
db8d3367-d2c5-4251-abf1-59bb9d3cf4b6	\N	conditional-user-configured	f99aa1dc-f2b1-4820-a912-450227263613	06d83c64-39dc-4aa8-8b31-f7f4a0e58f43	0	10	f	\N	\N
b9ec7cde-f895-49ec-8ad1-31d4ad1bccf6	\N	auth-otp-form	f99aa1dc-f2b1-4820-a912-450227263613	06d83c64-39dc-4aa8-8b31-f7f4a0e58f43	0	20	f	\N	\N
ec4e2da7-d5f4-4973-8018-0a8a84a73b3e	\N	direct-grant-validate-username	f99aa1dc-f2b1-4820-a912-450227263613	8e80301f-f287-45a0-8afd-bcb71ae2b2da	0	10	f	\N	\N
bce85d34-3d2b-4f27-b438-966ee8c133db	\N	direct-grant-validate-password	f99aa1dc-f2b1-4820-a912-450227263613	8e80301f-f287-45a0-8afd-bcb71ae2b2da	0	20	f	\N	\N
2aefa3b2-1cd5-40ef-950c-80fc085b78b1	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	8e80301f-f287-45a0-8afd-bcb71ae2b2da	1	30	t	3c9a5a92-29c0-4a9f-bb1d-cbd55e67f5e2	\N
7f339e38-7188-400e-a297-a1282c0b1f1d	\N	conditional-user-configured	f99aa1dc-f2b1-4820-a912-450227263613	3c9a5a92-29c0-4a9f-bb1d-cbd55e67f5e2	0	10	f	\N	\N
d16beb00-e30e-4ec9-8fba-2c310df953c6	\N	direct-grant-validate-otp	f99aa1dc-f2b1-4820-a912-450227263613	3c9a5a92-29c0-4a9f-bb1d-cbd55e67f5e2	0	20	f	\N	\N
f809b12b-75c5-4024-b765-b3121d697420	\N	registration-page-form	f99aa1dc-f2b1-4820-a912-450227263613	5249c9f2-d37f-47b1-8438-b128144360d9	0	10	t	0e73d703-eac8-4482-82ab-5c482a81cc2d	\N
43217c29-4d82-4738-a24a-a6da7ec5b974	\N	registration-user-creation	f99aa1dc-f2b1-4820-a912-450227263613	0e73d703-eac8-4482-82ab-5c482a81cc2d	0	20	f	\N	\N
c30d92de-779a-4bff-8935-87895ccbd2fc	\N	registration-password-action	f99aa1dc-f2b1-4820-a912-450227263613	0e73d703-eac8-4482-82ab-5c482a81cc2d	0	50	f	\N	\N
896f4412-0592-43be-add6-08537bdda586	\N	registration-recaptcha-action	f99aa1dc-f2b1-4820-a912-450227263613	0e73d703-eac8-4482-82ab-5c482a81cc2d	3	60	f	\N	\N
9eb86fab-8bb2-40e2-9825-022946b6d9dc	\N	registration-terms-and-conditions	f99aa1dc-f2b1-4820-a912-450227263613	0e73d703-eac8-4482-82ab-5c482a81cc2d	3	70	f	\N	\N
f033cc26-f43d-43eb-b0ed-41a82e892d38	\N	reset-credentials-choose-user	f99aa1dc-f2b1-4820-a912-450227263613	9575c53d-84b3-44f1-98a4-3d6dac58745d	0	10	f	\N	\N
88a08709-9fb7-4645-8e51-cd3dd134d596	\N	reset-credential-email	f99aa1dc-f2b1-4820-a912-450227263613	9575c53d-84b3-44f1-98a4-3d6dac58745d	0	20	f	\N	\N
b84fb7b2-9bc3-4f1e-961b-f7dfd914905b	\N	reset-password	f99aa1dc-f2b1-4820-a912-450227263613	9575c53d-84b3-44f1-98a4-3d6dac58745d	0	30	f	\N	\N
ea67ff3d-872e-4317-ae4f-c5321c8276d0	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	9575c53d-84b3-44f1-98a4-3d6dac58745d	1	40	t	b32316d2-cb43-4248-ba67-86658f508323	\N
4dfa38ce-93bd-4e03-a41c-e5680759c1ef	\N	conditional-user-configured	f99aa1dc-f2b1-4820-a912-450227263613	b32316d2-cb43-4248-ba67-86658f508323	0	10	f	\N	\N
7ea49b18-14e3-4e36-b267-2b139154dcba	\N	reset-otp	f99aa1dc-f2b1-4820-a912-450227263613	b32316d2-cb43-4248-ba67-86658f508323	0	20	f	\N	\N
0beb09cf-64c8-4729-a0c8-5fcf332fcac7	\N	client-secret	f99aa1dc-f2b1-4820-a912-450227263613	4e679209-a18f-4815-9047-afee0e64eea1	2	10	f	\N	\N
2fb78088-049c-4127-bf2d-b78f6d9084d5	\N	client-jwt	f99aa1dc-f2b1-4820-a912-450227263613	4e679209-a18f-4815-9047-afee0e64eea1	2	20	f	\N	\N
20cee7c6-5b84-49ba-a1ff-2536f469e2bc	\N	client-secret-jwt	f99aa1dc-f2b1-4820-a912-450227263613	4e679209-a18f-4815-9047-afee0e64eea1	2	30	f	\N	\N
d3f927d1-75ea-474d-af94-f1ef918c4962	\N	client-x509	f99aa1dc-f2b1-4820-a912-450227263613	4e679209-a18f-4815-9047-afee0e64eea1	2	40	f	\N	\N
490148db-2c02-44c3-be13-813a0a3e7819	\N	idp-review-profile	f99aa1dc-f2b1-4820-a912-450227263613	fe424eae-1577-4f27-84f6-0e4942ddacb7	0	10	f	\N	a2dd8fff-a94e-414f-a3b8-7a6ae3bb58b9
60c71a4b-582b-4e96-a22f-8a90a2092e30	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	fe424eae-1577-4f27-84f6-0e4942ddacb7	0	20	t	d8c5ce86-d28b-4c27-b345-1924ebfa4158	\N
770aff30-4cb3-459a-b72c-d7fecb779dd5	\N	idp-create-user-if-unique	f99aa1dc-f2b1-4820-a912-450227263613	d8c5ce86-d28b-4c27-b345-1924ebfa4158	2	10	f	\N	9b5ca327-7c19-47aa-98b3-0598d5989713
b254b07a-3efa-40a3-ae3c-b064251e1aaf	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	d8c5ce86-d28b-4c27-b345-1924ebfa4158	2	20	t	9c861ff6-307f-4378-97ef-e514db799cc8	\N
773a2029-0e65-457d-8c5f-b6048fce9ea2	\N	idp-confirm-link	f99aa1dc-f2b1-4820-a912-450227263613	9c861ff6-307f-4378-97ef-e514db799cc8	0	10	f	\N	\N
7a6cf365-bd73-49e3-9ba4-b501904fb78e	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	9c861ff6-307f-4378-97ef-e514db799cc8	0	20	t	90f10ea8-8f52-423b-a6f4-d0dcde0a3fcd	\N
8eec37ad-bc15-498b-90f5-b97662eb566c	\N	idp-email-verification	f99aa1dc-f2b1-4820-a912-450227263613	90f10ea8-8f52-423b-a6f4-d0dcde0a3fcd	2	10	f	\N	\N
071fa502-f912-4037-875c-9ce1ff1a0b56	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	90f10ea8-8f52-423b-a6f4-d0dcde0a3fcd	2	20	t	698eda0e-d923-4596-b296-d9806dcd28ff	\N
5a3f0d2a-3735-42fb-b9f8-e69116f0ddce	\N	idp-username-password-form	f99aa1dc-f2b1-4820-a912-450227263613	698eda0e-d923-4596-b296-d9806dcd28ff	0	10	f	\N	\N
6a0ccdae-66ca-491f-b351-c18a9eb132ce	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	698eda0e-d923-4596-b296-d9806dcd28ff	1	20	t	a2084859-6f0d-4b8b-a55d-2fdca046d91b	\N
0a893b27-801a-4992-8673-4a6c6d889bde	\N	conditional-user-configured	f99aa1dc-f2b1-4820-a912-450227263613	a2084859-6f0d-4b8b-a55d-2fdca046d91b	0	10	f	\N	\N
1f0c6cfe-dbed-4202-b6a7-8fd2bf82cb15	\N	auth-otp-form	f99aa1dc-f2b1-4820-a912-450227263613	a2084859-6f0d-4b8b-a55d-2fdca046d91b	0	20	f	\N	\N
e5eb271b-52ac-49f9-b7ca-3fb72b02e0f4	\N	http-basic-authenticator	f99aa1dc-f2b1-4820-a912-450227263613	9abdb94f-8a82-4a79-a8d2-fbb315c80838	0	10	f	\N	\N
5c22b771-bf50-4823-a23c-88a73c10ccb1	\N	docker-http-basic-authenticator	f99aa1dc-f2b1-4820-a912-450227263613	3d53b51f-4db6-4cdc-b4fe-6a7f7c6c1259	0	10	f	\N	\N
be5eec67-12e0-4eeb-8a73-780a7f7d373d	\N	auth-cookie	lsc-sde	e719f37a-eb49-4ba9-b2de-fc993c12138b	2	10	f	\N	\N
f060f374-4be3-4b1a-95b7-d3900bb8754f	\N	auth-spnego	lsc-sde	e719f37a-eb49-4ba9-b2de-fc993c12138b	3	20	f	\N	\N
d4aa34fa-41b8-48dc-af2c-d5b50463a796	\N	identity-provider-redirector	lsc-sde	e719f37a-eb49-4ba9-b2de-fc993c12138b	2	25	f	\N	\N
08f70cff-2245-4353-bf36-e35eaf43b3af	\N	\N	lsc-sde	e719f37a-eb49-4ba9-b2de-fc993c12138b	2	30	t	3e5480ef-1e51-4ba2-ae20-0e37d1e4688e	\N
91d4f8d2-d544-437f-911c-52379e30dc16	\N	auth-username-password-form	lsc-sde	3e5480ef-1e51-4ba2-ae20-0e37d1e4688e	0	10	f	\N	\N
317e0027-4bc6-4160-bce0-278471f18cde	\N	\N	lsc-sde	3e5480ef-1e51-4ba2-ae20-0e37d1e4688e	1	20	t	03ad76e0-3f80-46b7-9872-dd6d432f4be2	\N
2ea9502f-9ae2-44ff-9620-9cbe88debd1f	\N	conditional-user-configured	lsc-sde	03ad76e0-3f80-46b7-9872-dd6d432f4be2	0	10	f	\N	\N
43a5af7e-ea7e-4bb3-a314-21593a54112f	\N	auth-otp-form	lsc-sde	03ad76e0-3f80-46b7-9872-dd6d432f4be2	0	20	f	\N	\N
7d79654d-a371-4154-bb39-6a7de97b7d4e	\N	direct-grant-validate-username	lsc-sde	879df8b1-98ad-42d2-91e5-6f8efa86b61f	0	10	f	\N	\N
1ef77171-9978-4131-a16d-9e0caf7d64d5	\N	direct-grant-validate-password	lsc-sde	879df8b1-98ad-42d2-91e5-6f8efa86b61f	0	20	f	\N	\N
1b580998-68e7-4025-9fd8-934064fbdc5c	\N	\N	lsc-sde	879df8b1-98ad-42d2-91e5-6f8efa86b61f	1	30	t	d51c33d7-0312-4a23-a615-6389d4094499	\N
43d9cb04-c2a5-43e8-b206-fafd67f15a7c	\N	conditional-user-configured	lsc-sde	d51c33d7-0312-4a23-a615-6389d4094499	0	10	f	\N	\N
99dd1b88-a135-4a85-be68-e1b57d4e8176	\N	direct-grant-validate-otp	lsc-sde	d51c33d7-0312-4a23-a615-6389d4094499	0	20	f	\N	\N
432dc32a-809a-4981-ad97-3f6d25dc6467	\N	registration-page-form	lsc-sde	c3294b65-dde4-4489-8c11-03949f436d36	0	10	t	d412ad8e-a038-4acd-ba6f-118a5c31d7ba	\N
2a6fde47-f61b-42db-b04d-7055478fbec0	\N	registration-user-creation	lsc-sde	d412ad8e-a038-4acd-ba6f-118a5c31d7ba	0	20	f	\N	\N
645501cc-59f2-4cd1-9fdf-dd7f25e58fb4	\N	registration-password-action	lsc-sde	d412ad8e-a038-4acd-ba6f-118a5c31d7ba	0	50	f	\N	\N
b5fc3a91-d60b-42bc-890d-cecd7ee0cdf5	\N	registration-recaptcha-action	lsc-sde	d412ad8e-a038-4acd-ba6f-118a5c31d7ba	3	60	f	\N	\N
0f8d3921-d25c-4ae0-a1dc-84744b2cc5c3	\N	reset-credentials-choose-user	lsc-sde	41814deb-f4b2-4e92-befe-59a800759466	0	10	f	\N	\N
be844ad2-42f7-41de-99f3-a6e722089ae5	\N	reset-credential-email	lsc-sde	41814deb-f4b2-4e92-befe-59a800759466	0	20	f	\N	\N
899429f9-130a-42ba-9a98-badb7e0a1495	\N	reset-password	lsc-sde	41814deb-f4b2-4e92-befe-59a800759466	0	30	f	\N	\N
94f9b6df-e329-458a-8dae-2e7aab9b6c2f	\N	\N	lsc-sde	41814deb-f4b2-4e92-befe-59a800759466	1	40	t	491cff1e-6ce2-4afa-ae45-a83e5765aa3e	\N
424fb331-6b8d-4896-b8b8-d99cefdcde74	\N	conditional-user-configured	lsc-sde	491cff1e-6ce2-4afa-ae45-a83e5765aa3e	0	10	f	\N	\N
26803795-6ca3-48e6-a8fd-bd1d1e7762cb	\N	reset-otp	lsc-sde	491cff1e-6ce2-4afa-ae45-a83e5765aa3e	0	20	f	\N	\N
0ced081e-55f9-451f-957f-05d420c3d738	\N	client-secret	lsc-sde	27162f58-b959-46fa-babb-70824c933152	2	10	f	\N	\N
91d829a7-d25e-4d41-86cc-c09eaa081995	\N	client-jwt	lsc-sde	27162f58-b959-46fa-babb-70824c933152	2	20	f	\N	\N
b4433851-cc70-4228-aebb-bc870543d4e6	\N	client-secret-jwt	lsc-sde	27162f58-b959-46fa-babb-70824c933152	2	30	f	\N	\N
2c935622-84f9-4886-a155-0623daf27c80	\N	client-x509	lsc-sde	27162f58-b959-46fa-babb-70824c933152	2	40	f	\N	\N
587df19a-ef25-45c4-b4a2-12e27f13cbe1	\N	idp-review-profile	lsc-sde	b7d541a0-e83c-4e92-9f20-c244122a648e	0	10	f	\N	4b932b77-1b5d-4295-85a2-62784b186f9c
da7e67b4-22b1-4553-9c2c-41a5d1302138	\N	\N	lsc-sde	b7d541a0-e83c-4e92-9f20-c244122a648e	0	20	t	0086b79b-f349-4758-a52c-aebd2a6d5aa2	\N
92889c5d-5ce1-43f9-abd4-e9cd64fdc0c7	\N	idp-create-user-if-unique	lsc-sde	0086b79b-f349-4758-a52c-aebd2a6d5aa2	2	10	f	\N	9cf7b6a7-2732-41f5-b6cb-ea55385c3b6f
670b316c-fe0c-4f89-9ea9-e26eea641566	\N	\N	lsc-sde	0086b79b-f349-4758-a52c-aebd2a6d5aa2	2	20	t	3bc2ae17-f86e-46ab-976b-a875850a1e1a	\N
7ccd43fb-c634-4188-a787-50d832cdbd83	\N	idp-confirm-link	lsc-sde	3bc2ae17-f86e-46ab-976b-a875850a1e1a	0	10	f	\N	\N
d74a6409-8496-4c74-a5a4-ae69e48ba2ba	\N	\N	lsc-sde	3bc2ae17-f86e-46ab-976b-a875850a1e1a	0	20	t	0de72c5c-4f29-48ac-a4eb-93e0c771a66c	\N
b857ea39-9be6-45b1-ac7c-830286b2c74f	\N	idp-email-verification	lsc-sde	0de72c5c-4f29-48ac-a4eb-93e0c771a66c	2	10	f	\N	\N
a552347c-1575-40fd-a91b-29d115ac4920	\N	\N	lsc-sde	0de72c5c-4f29-48ac-a4eb-93e0c771a66c	2	20	t	a4f800ae-d651-4482-ba83-e03163be319e	\N
331746f6-2249-4012-b214-1ad3d61f55ef	\N	idp-username-password-form	lsc-sde	a4f800ae-d651-4482-ba83-e03163be319e	0	10	f	\N	\N
322585be-2ce8-4f5d-b399-49153a6af660	\N	\N	lsc-sde	a4f800ae-d651-4482-ba83-e03163be319e	1	20	t	35534a19-3f5c-432b-8db4-83a0069a3cf0	\N
26226fb5-4d89-429b-baa7-d50d31509309	\N	conditional-user-configured	lsc-sde	35534a19-3f5c-432b-8db4-83a0069a3cf0	0	10	f	\N	\N
d36a61f0-5155-4e96-b067-435e260faed0	\N	auth-otp-form	lsc-sde	35534a19-3f5c-432b-8db4-83a0069a3cf0	0	20	f	\N	\N
6bc6c0b5-9d04-4934-aeda-e2eca25f1671	\N	http-basic-authenticator	lsc-sde	f950b316-3a9d-4c4c-aa37-292cf5bd1555	0	10	f	\N	\N
2b329a84-0c75-48eb-8b78-a326640ca33d	\N	docker-http-basic-authenticator	lsc-sde	66c4611e-7364-4dfb-a510-644034e908c8	0	10	f	\N	\N
\.


--
-- TOC entry 4219 (class 0 OID 49796)
-- Dependencies: 258
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
091a67f5-0812-460c-984a-49afd042ce70	browser	browser based authentication	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
144f0910-2b5c-4da7-9fc2-8262e2ba8022	forms	Username, password, otp and other auth forms.	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
06d83c64-39dc-4aa8-8b31-f7f4a0e58f43	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
8e80301f-f287-45a0-8afd-bcb71ae2b2da	direct grant	OpenID Connect Resource Owner Grant	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
3c9a5a92-29c0-4a9f-bb1d-cbd55e67f5e2	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
5249c9f2-d37f-47b1-8438-b128144360d9	registration	registration flow	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
0e73d703-eac8-4482-82ab-5c482a81cc2d	registration form	registration form	f99aa1dc-f2b1-4820-a912-450227263613	form-flow	f	t
9575c53d-84b3-44f1-98a4-3d6dac58745d	reset credentials	Reset credentials for a user if they forgot their password or something	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
b32316d2-cb43-4248-ba67-86658f508323	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
4e679209-a18f-4815-9047-afee0e64eea1	clients	Base authentication for clients	f99aa1dc-f2b1-4820-a912-450227263613	client-flow	t	t
fe424eae-1577-4f27-84f6-0e4942ddacb7	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
d8c5ce86-d28b-4c27-b345-1924ebfa4158	User creation or linking	Flow for the existing/non-existing user alternatives	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
9c861ff6-307f-4378-97ef-e514db799cc8	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
90f10ea8-8f52-423b-a6f4-d0dcde0a3fcd	Account verification options	Method with which to verity the existing account	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
698eda0e-d923-4596-b296-d9806dcd28ff	Verify Existing Account by Re-authentication	Reauthentication of existing account	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
a2084859-6f0d-4b8b-a55d-2fdca046d91b	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	f	t
9abdb94f-8a82-4a79-a8d2-fbb315c80838	saml ecp	SAML ECP Profile Authentication Flow	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
3d53b51f-4db6-4cdc-b4fe-6a7f7c6c1259	docker auth	Used by Docker clients to authenticate against the IDP	f99aa1dc-f2b1-4820-a912-450227263613	basic-flow	t	t
e719f37a-eb49-4ba9-b2de-fc993c12138b	browser	browser based authentication	lsc-sde	basic-flow	t	t
3e5480ef-1e51-4ba2-ae20-0e37d1e4688e	forms	Username, password, otp and other auth forms.	lsc-sde	basic-flow	f	t
03ad76e0-3f80-46b7-9872-dd6d432f4be2	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	lsc-sde	basic-flow	f	t
879df8b1-98ad-42d2-91e5-6f8efa86b61f	direct grant	OpenID Connect Resource Owner Grant	lsc-sde	basic-flow	t	t
d51c33d7-0312-4a23-a615-6389d4094499	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	lsc-sde	basic-flow	f	t
c3294b65-dde4-4489-8c11-03949f436d36	registration	registration flow	lsc-sde	basic-flow	t	t
d412ad8e-a038-4acd-ba6f-118a5c31d7ba	registration form	registration form	lsc-sde	form-flow	f	t
41814deb-f4b2-4e92-befe-59a800759466	reset credentials	Reset credentials for a user if they forgot their password or something	lsc-sde	basic-flow	t	t
491cff1e-6ce2-4afa-ae45-a83e5765aa3e	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	lsc-sde	basic-flow	f	t
27162f58-b959-46fa-babb-70824c933152	clients	Base authentication for clients	lsc-sde	client-flow	t	t
b7d541a0-e83c-4e92-9f20-c244122a648e	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	lsc-sde	basic-flow	t	t
0086b79b-f349-4758-a52c-aebd2a6d5aa2	User creation or linking	Flow for the existing/non-existing user alternatives	lsc-sde	basic-flow	f	t
3bc2ae17-f86e-46ab-976b-a875850a1e1a	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	lsc-sde	basic-flow	f	t
0de72c5c-4f29-48ac-a4eb-93e0c771a66c	Account verification options	Method with which to verity the existing account	lsc-sde	basic-flow	f	t
a4f800ae-d651-4482-ba83-e03163be319e	Verify Existing Account by Re-authentication	Reauthentication of existing account	lsc-sde	basic-flow	f	t
35534a19-3f5c-432b-8db4-83a0069a3cf0	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	lsc-sde	basic-flow	f	t
f950b316-3a9d-4c4c-aa37-292cf5bd1555	saml ecp	SAML ECP Profile Authentication Flow	lsc-sde	basic-flow	t	t
66c4611e-7364-4dfb-a510-644034e908c8	docker auth	Used by Docker clients to authenticate against the IDP	lsc-sde	basic-flow	t	t
\.


--
-- TOC entry 4218 (class 0 OID 49791)
-- Dependencies: 257
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
a2dd8fff-a94e-414f-a3b8-7a6ae3bb58b9	review profile config	f99aa1dc-f2b1-4820-a912-450227263613
9b5ca327-7c19-47aa-98b3-0598d5989713	create unique user config	f99aa1dc-f2b1-4820-a912-450227263613
4b932b77-1b5d-4295-85a2-62784b186f9c	review profile config	lsc-sde
9cf7b6a7-2732-41f5-b6cb-ea55385c3b6f	create unique user config	lsc-sde
\.


--
-- TOC entry 4221 (class 0 OID 49806)
-- Dependencies: 260
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
9b5ca327-7c19-47aa-98b3-0598d5989713	false	require.password.update.after.registration
a2dd8fff-a94e-414f-a3b8-7a6ae3bb58b9	missing	update.profile.on.first.login
4b932b77-1b5d-4295-85a2-62784b186f9c	missing	update.profile.on.first.login
9cf7b6a7-2732-41f5-b6cb-ea55385c3b6f	false	require.password.update.after.registration
\.


--
-- TOC entry 4247 (class 0 OID 50244)
-- Dependencies: 286
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4178 (class 0 OID 49167)
-- Dependencies: 217
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
5f90ed0c-91c0-499f-8154-edd7647d7f58	t	f	master-realm	0	f	\N	\N	t	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
d16900ed-96bc-4896-af77-882c0c784bb8	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
9915d853-4d77-4b1f-8457-2a463162ce9c	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
6039373d-1a1c-4041-88ad-81d13fcb3605	t	f	broker	0	f	\N	\N	t	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
f531a235-7cae-4f9f-8852-84f0d4e58628	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
e4fd74d8-0750-4ab9-9005-ea997b7abec9	t	f	admin-cli	0	t	\N	\N	f	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
6c08232b-efec-4c9c-b349-26fb70b09c59	t	f	lsc-sde-realm	0	f	\N	\N	t	\N	f	f99aa1dc-f2b1-4820-a912-450227263613	\N	0	f	f	lsc-sde Realm	f	client-secret	\N	\N	\N	t	f	f	f
354de25a-1128-468b-a726-867bd39b4c33	t	f	realm-management	0	f	\N	\N	t	\N	f	lsc-sde	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
c4f43793-9562-448d-a44f-412fedd8e021	t	f	account	0	t	\N	/realms/lsc-sde/account/	f	\N	f	lsc-sde	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	t	f	account-console	0	t	\N	/realms/lsc-sde/account/	f	\N	f	lsc-sde	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
3498b894-3628-4122-8454-509b8eb80ab3	t	f	broker	0	f	\N	\N	t	\N	f	lsc-sde	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
91bddfee-ddb6-4434-a774-179625ffe54b	t	f	security-admin-console	0	t	\N	/admin/lsc-sde/console/	f	\N	f	lsc-sde	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	t	f	admin-cli	0	t	\N	\N	f	\N	f	lsc-sde	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
9db82257-cb10-4b8c-bfe5-4417ed09eab6	t	t	jupyter	0	f	jupyter	https://jupyter.xlscsde.local	f	https://jupyter.xlscsde.local	f	lsc-sde	openid-connect	-1	f	f	Jupyter Hub	t	client-secret	https://jupyter.xlscsde.local	Client Used for Jupyter Hub	\N	t	f	t	f
4b8efa9f-d47d-4173-8be4-295248734273	t	t	guacamole	0	t	\N	https://guacamole.xlscsde.local	f	https://guacamole.xlscsde.local	f	lsc-sde	openid-connect	-1	t	f	guacamole	f	client-secret	https://guacamole.xlscsde.local		\N	f	t	t	f
\.


--
-- TOC entry 4201 (class 0 OID 49525)
-- Dependencies: 240
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_attributes (client_id, name, value) FROM stdin;
d16900ed-96bc-4896-af77-882c0c784bb8	post.logout.redirect.uris	+
9915d853-4d77-4b1f-8457-2a463162ce9c	post.logout.redirect.uris	+
9915d853-4d77-4b1f-8457-2a463162ce9c	pkce.code.challenge.method	S256
f531a235-7cae-4f9f-8852-84f0d4e58628	post.logout.redirect.uris	+
f531a235-7cae-4f9f-8852-84f0d4e58628	pkce.code.challenge.method	S256
c4f43793-9562-448d-a44f-412fedd8e021	post.logout.redirect.uris	+
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	post.logout.redirect.uris	+
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	pkce.code.challenge.method	S256
91bddfee-ddb6-4434-a774-179625ffe54b	post.logout.redirect.uris	+
91bddfee-ddb6-4434-a774-179625ffe54b	pkce.code.challenge.method	S256
9db82257-cb10-4b8c-bfe5-4417ed09eab6	post.logout.redirect.uris	+
9db82257-cb10-4b8c-bfe5-4417ed09eab6	oauth2.device.authorization.grant.enabled	false
9db82257-cb10-4b8c-bfe5-4417ed09eab6	oidc.ciba.grant.enabled	false
9db82257-cb10-4b8c-bfe5-4417ed09eab6	display.on.consent.screen	false
9db82257-cb10-4b8c-bfe5-4417ed09eab6	backchannel.logout.session.required	true
9db82257-cb10-4b8c-bfe5-4417ed09eab6	backchannel.logout.revoke.offline.tokens	false
4b8efa9f-d47d-4173-8be4-295248734273	oauth2.device.authorization.grant.enabled	false
4b8efa9f-d47d-4173-8be4-295248734273	oidc.ciba.grant.enabled	false
4b8efa9f-d47d-4173-8be4-295248734273	backchannel.logout.session.required	true
4b8efa9f-d47d-4173-8be4-295248734273	backchannel.logout.revoke.offline.tokens	false
4b8efa9f-d47d-4173-8be4-295248734273	display.on.consent.screen	false
\.


--
-- TOC entry 4258 (class 0 OID 50493)
-- Dependencies: 297
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- TOC entry 4257 (class 0 OID 50368)
-- Dependencies: 296
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- TOC entry 4203 (class 0 OID 49535)
-- Dependencies: 242
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- TOC entry 4235 (class 0 OID 50034)
-- Dependencies: 274
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	offline_access	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect built-in scope: offline_access	openid-connect
9e9fedc7-ec8e-4fdd-a222-e7616f2a18f2	role_list	f99aa1dc-f2b1-4820-a912-450227263613	SAML role list	saml
a5b97960-6f5f-4132-bb67-a7051e8397e2	profile	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect built-in scope: profile	openid-connect
d351ddef-76ec-47c7-8f50-c4664e031a0e	email	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect built-in scope: email	openid-connect
b840bfa3-132a-4e02-b149-300b6368de98	address	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect built-in scope: address	openid-connect
57218572-7a2a-470d-93b4-a3a68a8bb5de	phone	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect built-in scope: phone	openid-connect
27208c72-a2db-4e0a-90f4-116e0f481262	roles	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect scope for add user roles to the access token	openid-connect
452fdcff-d2fe-4ceb-92ab-f87d934f302f	web-origins	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect scope for add allowed web origins to the access token	openid-connect
a05d75f3-2ae4-485d-94cf-f62bf69ba96d	microprofile-jwt	f99aa1dc-f2b1-4820-a912-450227263613	Microprofile - JWT built-in scope	openid-connect
3880a174-0c78-4687-8aaa-ae9d7c9f15d4	acr	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
b66f1519-195f-45cf-b0a5-9f1161e41359	profile	lsc-sde	OpenID Connect built-in scope: profile	openid-connect
27967490-8b88-4fd7-82cf-701f67157570	email	lsc-sde	OpenID Connect built-in scope: email	openid-connect
d2bad27e-e137-413b-880a-9f5867e1378a	address	lsc-sde	OpenID Connect built-in scope: address	openid-connect
e83c2567-4f05-4c86-962b-48b5fabd8ff1	phone	lsc-sde	OpenID Connect built-in scope: phone	openid-connect
fd832d02-be3c-4046-9580-4a9239cc2c3e	roles	lsc-sde	OpenID Connect scope for add user roles to the access token	openid-connect
366ba51b-e8ca-4f9e-90af-661c4474edcc	web-origins	lsc-sde	OpenID Connect scope for add allowed web origins to the access token	openid-connect
8e16ab6b-5fd3-4263-9d49-4cec4ba86679	microprofile-jwt	lsc-sde	Microprofile - JWT built-in scope	openid-connect
43ecf762-4a98-4d6d-9eb0-127817f953df	acr	lsc-sde	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
9512f761-9595-47f5-8794-e5b8c97e82d2	realm_groups	lsc-sde	Realm Groups	openid-connect
2ed35979-216a-499a-b584-f9fd8e007032	offline_access	lsc-sde	OpenID Connect built-in scope: offline_access	openid-connect
374c8259-648e-4d44-9770-0a4c398dcea6	role_list	lsc-sde	SAML role list	saml
2318c3b6-b908-4ad5-aed3-de0c887dbf39	basic	lsc-sde	OpenID Connect scope for add all basic claims to the token	openid-connect
5e5e1fa7-d2da-4618-9163-9df389369b44	basic	f99aa1dc-f2b1-4820-a912-450227263613	OpenID Connect scope for add all basic claims to the token	openid-connect
b030bd61-cc94-47b5-b8a2-6685db20cfb0	workspace_id	lsc-sde	Username prefixed with the workspace name.	openid-connect
4847dbf3-d340-43c1-86e9-e90e639691c0	workspace_name	lsc-sde	Name of the Analytics Workspace	openid-connect
5bb6dba7-9128-4fc5-92c4-38bbc93e2946	workspace_id_formatted	lsc-sde	Formatted Username prefixed with the workspace id	openid-connect
\.


--
-- TOC entry 4236 (class 0 OID 50048)
-- Dependencies: 275
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	true	display.on.consent.screen
b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	${offlineAccessScopeConsentText}	consent.screen.text
9e9fedc7-ec8e-4fdd-a222-e7616f2a18f2	true	display.on.consent.screen
9e9fedc7-ec8e-4fdd-a222-e7616f2a18f2	${samlRoleListScopeConsentText}	consent.screen.text
a5b97960-6f5f-4132-bb67-a7051e8397e2	true	display.on.consent.screen
a5b97960-6f5f-4132-bb67-a7051e8397e2	${profileScopeConsentText}	consent.screen.text
a5b97960-6f5f-4132-bb67-a7051e8397e2	true	include.in.token.scope
d351ddef-76ec-47c7-8f50-c4664e031a0e	true	display.on.consent.screen
d351ddef-76ec-47c7-8f50-c4664e031a0e	${emailScopeConsentText}	consent.screen.text
d351ddef-76ec-47c7-8f50-c4664e031a0e	true	include.in.token.scope
b840bfa3-132a-4e02-b149-300b6368de98	true	display.on.consent.screen
b840bfa3-132a-4e02-b149-300b6368de98	${addressScopeConsentText}	consent.screen.text
b840bfa3-132a-4e02-b149-300b6368de98	true	include.in.token.scope
57218572-7a2a-470d-93b4-a3a68a8bb5de	true	display.on.consent.screen
57218572-7a2a-470d-93b4-a3a68a8bb5de	${phoneScopeConsentText}	consent.screen.text
57218572-7a2a-470d-93b4-a3a68a8bb5de	true	include.in.token.scope
27208c72-a2db-4e0a-90f4-116e0f481262	true	display.on.consent.screen
27208c72-a2db-4e0a-90f4-116e0f481262	${rolesScopeConsentText}	consent.screen.text
27208c72-a2db-4e0a-90f4-116e0f481262	false	include.in.token.scope
452fdcff-d2fe-4ceb-92ab-f87d934f302f	false	display.on.consent.screen
452fdcff-d2fe-4ceb-92ab-f87d934f302f		consent.screen.text
452fdcff-d2fe-4ceb-92ab-f87d934f302f	false	include.in.token.scope
a05d75f3-2ae4-485d-94cf-f62bf69ba96d	false	display.on.consent.screen
a05d75f3-2ae4-485d-94cf-f62bf69ba96d	true	include.in.token.scope
3880a174-0c78-4687-8aaa-ae9d7c9f15d4	false	display.on.consent.screen
3880a174-0c78-4687-8aaa-ae9d7c9f15d4	false	include.in.token.scope
2ed35979-216a-499a-b584-f9fd8e007032	true	display.on.consent.screen
2ed35979-216a-499a-b584-f9fd8e007032	${offlineAccessScopeConsentText}	consent.screen.text
374c8259-648e-4d44-9770-0a4c398dcea6	true	display.on.consent.screen
374c8259-648e-4d44-9770-0a4c398dcea6	${samlRoleListScopeConsentText}	consent.screen.text
b66f1519-195f-45cf-b0a5-9f1161e41359	true	display.on.consent.screen
b66f1519-195f-45cf-b0a5-9f1161e41359	${profileScopeConsentText}	consent.screen.text
b66f1519-195f-45cf-b0a5-9f1161e41359	true	include.in.token.scope
27967490-8b88-4fd7-82cf-701f67157570	true	display.on.consent.screen
27967490-8b88-4fd7-82cf-701f67157570	${emailScopeConsentText}	consent.screen.text
27967490-8b88-4fd7-82cf-701f67157570	true	include.in.token.scope
d2bad27e-e137-413b-880a-9f5867e1378a	true	display.on.consent.screen
d2bad27e-e137-413b-880a-9f5867e1378a	${addressScopeConsentText}	consent.screen.text
d2bad27e-e137-413b-880a-9f5867e1378a	true	include.in.token.scope
e83c2567-4f05-4c86-962b-48b5fabd8ff1	true	display.on.consent.screen
e83c2567-4f05-4c86-962b-48b5fabd8ff1	${phoneScopeConsentText}	consent.screen.text
e83c2567-4f05-4c86-962b-48b5fabd8ff1	true	include.in.token.scope
fd832d02-be3c-4046-9580-4a9239cc2c3e	true	display.on.consent.screen
fd832d02-be3c-4046-9580-4a9239cc2c3e	${rolesScopeConsentText}	consent.screen.text
fd832d02-be3c-4046-9580-4a9239cc2c3e	false	include.in.token.scope
366ba51b-e8ca-4f9e-90af-661c4474edcc	false	display.on.consent.screen
366ba51b-e8ca-4f9e-90af-661c4474edcc		consent.screen.text
366ba51b-e8ca-4f9e-90af-661c4474edcc	false	include.in.token.scope
8e16ab6b-5fd3-4263-9d49-4cec4ba86679	false	display.on.consent.screen
8e16ab6b-5fd3-4263-9d49-4cec4ba86679	true	include.in.token.scope
43ecf762-4a98-4d6d-9eb0-127817f953df	false	display.on.consent.screen
43ecf762-4a98-4d6d-9eb0-127817f953df	false	include.in.token.scope
9512f761-9595-47f5-8794-e5b8c97e82d2		consent.screen.text
9512f761-9595-47f5-8794-e5b8c97e82d2	true	display.on.consent.screen
9512f761-9595-47f5-8794-e5b8c97e82d2	true	include.in.token.scope
9512f761-9595-47f5-8794-e5b8c97e82d2		gui.order
2318c3b6-b908-4ad5-aed3-de0c887dbf39	false	display.on.consent.screen
2318c3b6-b908-4ad5-aed3-de0c887dbf39	false	include.in.token.scope
5e5e1fa7-d2da-4618-9163-9df389369b44	false	display.on.consent.screen
5e5e1fa7-d2da-4618-9163-9df389369b44	false	include.in.token.scope
b030bd61-cc94-47b5-b8a2-6685db20cfb0	true	display.on.consent.screen
b030bd61-cc94-47b5-b8a2-6685db20cfb0		consent.screen.text
b030bd61-cc94-47b5-b8a2-6685db20cfb0	false	include.in.token.scope
b030bd61-cc94-47b5-b8a2-6685db20cfb0		gui.order
4847dbf3-d340-43c1-86e9-e90e639691c0	true	display.on.consent.screen
4847dbf3-d340-43c1-86e9-e90e639691c0		consent.screen.text
4847dbf3-d340-43c1-86e9-e90e639691c0	false	include.in.token.scope
4847dbf3-d340-43c1-86e9-e90e639691c0		gui.order
5bb6dba7-9128-4fc5-92c4-38bbc93e2946	true	display.on.consent.screen
5bb6dba7-9128-4fc5-92c4-38bbc93e2946		consent.screen.text
5bb6dba7-9128-4fc5-92c4-38bbc93e2946	false	include.in.token.scope
5bb6dba7-9128-4fc5-92c4-38bbc93e2946		gui.order
\.


--
-- TOC entry 4259 (class 0 OID 50534)
-- Dependencies: 298
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
d16900ed-96bc-4896-af77-882c0c784bb8	27208c72-a2db-4e0a-90f4-116e0f481262	t
d16900ed-96bc-4896-af77-882c0c784bb8	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
d16900ed-96bc-4896-af77-882c0c784bb8	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
d16900ed-96bc-4896-af77-882c0c784bb8	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
d16900ed-96bc-4896-af77-882c0c784bb8	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
d16900ed-96bc-4896-af77-882c0c784bb8	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
d16900ed-96bc-4896-af77-882c0c784bb8	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
d16900ed-96bc-4896-af77-882c0c784bb8	b840bfa3-132a-4e02-b149-300b6368de98	f
d16900ed-96bc-4896-af77-882c0c784bb8	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
9915d853-4d77-4b1f-8457-2a463162ce9c	27208c72-a2db-4e0a-90f4-116e0f481262	t
9915d853-4d77-4b1f-8457-2a463162ce9c	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
9915d853-4d77-4b1f-8457-2a463162ce9c	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
9915d853-4d77-4b1f-8457-2a463162ce9c	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
9915d853-4d77-4b1f-8457-2a463162ce9c	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
9915d853-4d77-4b1f-8457-2a463162ce9c	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
9915d853-4d77-4b1f-8457-2a463162ce9c	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
9915d853-4d77-4b1f-8457-2a463162ce9c	b840bfa3-132a-4e02-b149-300b6368de98	f
9915d853-4d77-4b1f-8457-2a463162ce9c	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
e4fd74d8-0750-4ab9-9005-ea997b7abec9	27208c72-a2db-4e0a-90f4-116e0f481262	t
e4fd74d8-0750-4ab9-9005-ea997b7abec9	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
e4fd74d8-0750-4ab9-9005-ea997b7abec9	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
e4fd74d8-0750-4ab9-9005-ea997b7abec9	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
e4fd74d8-0750-4ab9-9005-ea997b7abec9	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
e4fd74d8-0750-4ab9-9005-ea997b7abec9	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
e4fd74d8-0750-4ab9-9005-ea997b7abec9	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
e4fd74d8-0750-4ab9-9005-ea997b7abec9	b840bfa3-132a-4e02-b149-300b6368de98	f
e4fd74d8-0750-4ab9-9005-ea997b7abec9	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
6039373d-1a1c-4041-88ad-81d13fcb3605	27208c72-a2db-4e0a-90f4-116e0f481262	t
6039373d-1a1c-4041-88ad-81d13fcb3605	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
6039373d-1a1c-4041-88ad-81d13fcb3605	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
6039373d-1a1c-4041-88ad-81d13fcb3605	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
6039373d-1a1c-4041-88ad-81d13fcb3605	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
6039373d-1a1c-4041-88ad-81d13fcb3605	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
6039373d-1a1c-4041-88ad-81d13fcb3605	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
6039373d-1a1c-4041-88ad-81d13fcb3605	b840bfa3-132a-4e02-b149-300b6368de98	f
6039373d-1a1c-4041-88ad-81d13fcb3605	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
5f90ed0c-91c0-499f-8154-edd7647d7f58	27208c72-a2db-4e0a-90f4-116e0f481262	t
5f90ed0c-91c0-499f-8154-edd7647d7f58	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
5f90ed0c-91c0-499f-8154-edd7647d7f58	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
5f90ed0c-91c0-499f-8154-edd7647d7f58	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
5f90ed0c-91c0-499f-8154-edd7647d7f58	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
5f90ed0c-91c0-499f-8154-edd7647d7f58	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
5f90ed0c-91c0-499f-8154-edd7647d7f58	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
5f90ed0c-91c0-499f-8154-edd7647d7f58	b840bfa3-132a-4e02-b149-300b6368de98	f
5f90ed0c-91c0-499f-8154-edd7647d7f58	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
f531a235-7cae-4f9f-8852-84f0d4e58628	27208c72-a2db-4e0a-90f4-116e0f481262	t
f531a235-7cae-4f9f-8852-84f0d4e58628	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
f531a235-7cae-4f9f-8852-84f0d4e58628	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
f531a235-7cae-4f9f-8852-84f0d4e58628	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
f531a235-7cae-4f9f-8852-84f0d4e58628	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
f531a235-7cae-4f9f-8852-84f0d4e58628	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
f531a235-7cae-4f9f-8852-84f0d4e58628	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
f531a235-7cae-4f9f-8852-84f0d4e58628	b840bfa3-132a-4e02-b149-300b6368de98	f
f531a235-7cae-4f9f-8852-84f0d4e58628	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
c4f43793-9562-448d-a44f-412fedd8e021	27967490-8b88-4fd7-82cf-701f67157570	t
c4f43793-9562-448d-a44f-412fedd8e021	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
c4f43793-9562-448d-a44f-412fedd8e021	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
c4f43793-9562-448d-a44f-412fedd8e021	43ecf762-4a98-4d6d-9eb0-127817f953df	t
c4f43793-9562-448d-a44f-412fedd8e021	b66f1519-195f-45cf-b0a5-9f1161e41359	t
c4f43793-9562-448d-a44f-412fedd8e021	2ed35979-216a-499a-b584-f9fd8e007032	f
c4f43793-9562-448d-a44f-412fedd8e021	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
c4f43793-9562-448d-a44f-412fedd8e021	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
c4f43793-9562-448d-a44f-412fedd8e021	d2bad27e-e137-413b-880a-9f5867e1378a	f
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	27967490-8b88-4fd7-82cf-701f67157570	t
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	43ecf762-4a98-4d6d-9eb0-127817f953df	t
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	b66f1519-195f-45cf-b0a5-9f1161e41359	t
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	2ed35979-216a-499a-b584-f9fd8e007032	f
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	d2bad27e-e137-413b-880a-9f5867e1378a	f
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	27967490-8b88-4fd7-82cf-701f67157570	t
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	43ecf762-4a98-4d6d-9eb0-127817f953df	t
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	b66f1519-195f-45cf-b0a5-9f1161e41359	t
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	2ed35979-216a-499a-b584-f9fd8e007032	f
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	d2bad27e-e137-413b-880a-9f5867e1378a	f
3498b894-3628-4122-8454-509b8eb80ab3	27967490-8b88-4fd7-82cf-701f67157570	t
3498b894-3628-4122-8454-509b8eb80ab3	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
3498b894-3628-4122-8454-509b8eb80ab3	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
3498b894-3628-4122-8454-509b8eb80ab3	43ecf762-4a98-4d6d-9eb0-127817f953df	t
3498b894-3628-4122-8454-509b8eb80ab3	b66f1519-195f-45cf-b0a5-9f1161e41359	t
3498b894-3628-4122-8454-509b8eb80ab3	2ed35979-216a-499a-b584-f9fd8e007032	f
3498b894-3628-4122-8454-509b8eb80ab3	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
3498b894-3628-4122-8454-509b8eb80ab3	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
3498b894-3628-4122-8454-509b8eb80ab3	d2bad27e-e137-413b-880a-9f5867e1378a	f
354de25a-1128-468b-a726-867bd39b4c33	27967490-8b88-4fd7-82cf-701f67157570	t
354de25a-1128-468b-a726-867bd39b4c33	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
354de25a-1128-468b-a726-867bd39b4c33	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
354de25a-1128-468b-a726-867bd39b4c33	43ecf762-4a98-4d6d-9eb0-127817f953df	t
354de25a-1128-468b-a726-867bd39b4c33	b66f1519-195f-45cf-b0a5-9f1161e41359	t
354de25a-1128-468b-a726-867bd39b4c33	2ed35979-216a-499a-b584-f9fd8e007032	f
354de25a-1128-468b-a726-867bd39b4c33	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
354de25a-1128-468b-a726-867bd39b4c33	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
354de25a-1128-468b-a726-867bd39b4c33	d2bad27e-e137-413b-880a-9f5867e1378a	f
91bddfee-ddb6-4434-a774-179625ffe54b	27967490-8b88-4fd7-82cf-701f67157570	t
91bddfee-ddb6-4434-a774-179625ffe54b	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
91bddfee-ddb6-4434-a774-179625ffe54b	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
91bddfee-ddb6-4434-a774-179625ffe54b	43ecf762-4a98-4d6d-9eb0-127817f953df	t
91bddfee-ddb6-4434-a774-179625ffe54b	b66f1519-195f-45cf-b0a5-9f1161e41359	t
91bddfee-ddb6-4434-a774-179625ffe54b	2ed35979-216a-499a-b584-f9fd8e007032	f
91bddfee-ddb6-4434-a774-179625ffe54b	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
91bddfee-ddb6-4434-a774-179625ffe54b	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
91bddfee-ddb6-4434-a774-179625ffe54b	d2bad27e-e137-413b-880a-9f5867e1378a	f
9db82257-cb10-4b8c-bfe5-4417ed09eab6	27967490-8b88-4fd7-82cf-701f67157570	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	43ecf762-4a98-4d6d-9eb0-127817f953df	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	b66f1519-195f-45cf-b0a5-9f1161e41359	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	2ed35979-216a-499a-b584-f9fd8e007032	f
9db82257-cb10-4b8c-bfe5-4417ed09eab6	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
9db82257-cb10-4b8c-bfe5-4417ed09eab6	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
9db82257-cb10-4b8c-bfe5-4417ed09eab6	d2bad27e-e137-413b-880a-9f5867e1378a	f
9db82257-cb10-4b8c-bfe5-4417ed09eab6	9512f761-9595-47f5-8794-e5b8c97e82d2	t
4b8efa9f-d47d-4173-8be4-295248734273	27967490-8b88-4fd7-82cf-701f67157570	t
4b8efa9f-d47d-4173-8be4-295248734273	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
4b8efa9f-d47d-4173-8be4-295248734273	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
4b8efa9f-d47d-4173-8be4-295248734273	43ecf762-4a98-4d6d-9eb0-127817f953df	t
4b8efa9f-d47d-4173-8be4-295248734273	9512f761-9595-47f5-8794-e5b8c97e82d2	t
4b8efa9f-d47d-4173-8be4-295248734273	b66f1519-195f-45cf-b0a5-9f1161e41359	t
4b8efa9f-d47d-4173-8be4-295248734273	2ed35979-216a-499a-b584-f9fd8e007032	f
4b8efa9f-d47d-4173-8be4-295248734273	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
4b8efa9f-d47d-4173-8be4-295248734273	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
4b8efa9f-d47d-4173-8be4-295248734273	d2bad27e-e137-413b-880a-9f5867e1378a	f
c4f43793-9562-448d-a44f-412fedd8e021	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
91bddfee-ddb6-4434-a774-179625ffe54b	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
b4e70c0a-6da7-4549-9f5e-5859ac3f713e	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
4b8efa9f-d47d-4173-8be4-295248734273	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
d16900ed-96bc-4896-af77-882c0c784bb8	5e5e1fa7-d2da-4618-9163-9df389369b44	t
9915d853-4d77-4b1f-8457-2a463162ce9c	5e5e1fa7-d2da-4618-9163-9df389369b44	t
f531a235-7cae-4f9f-8852-84f0d4e58628	5e5e1fa7-d2da-4618-9163-9df389369b44	t
e4fd74d8-0750-4ab9-9005-ea997b7abec9	5e5e1fa7-d2da-4618-9163-9df389369b44	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	b030bd61-cc94-47b5-b8a2-6685db20cfb0	t
9db82257-cb10-4b8c-bfe5-4417ed09eab6	4847dbf3-d340-43c1-86e9-e90e639691c0	t
4b8efa9f-d47d-4173-8be4-295248734273	4847dbf3-d340-43c1-86e9-e90e639691c0	t
4b8efa9f-d47d-4173-8be4-295248734273	5bb6dba7-9128-4fc5-92c4-38bbc93e2946	t
\.


--
-- TOC entry 4237 (class 0 OID 50053)
-- Dependencies: 276
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	954e4afa-9ab0-498d-b681-a7b9a0fff2bd
2ed35979-216a-499a-b584-f9fd8e007032	84472d55-4874-4c2a-8f9f-4f6a26fb5811
\.


--
-- TOC entry 4179 (class 0 OID 49178)
-- Dependencies: 218
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- TOC entry 4224 (class 0 OID 49824)
-- Dependencies: 263
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- TOC entry 4202 (class 0 OID 49530)
-- Dependencies: 241
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 4216 (class 0 OID 49708)
-- Dependencies: 255
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- TOC entry 4180 (class 0 OID 49183)
-- Dependencies: 219
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- TOC entry 4225 (class 0 OID 49905)
-- Dependencies: 264
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- TOC entry 4255 (class 0 OID 50289)
-- Dependencies: 294
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
694a7e4d-8eb0-46b0-b3e8-0816b90e88fb	Trusted Hosts	f99aa1dc-f2b1-4820-a912-450227263613	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	anonymous
357e2a39-7ccb-4baa-b7c5-4aff5356795b	Consent Required	f99aa1dc-f2b1-4820-a912-450227263613	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	anonymous
75bb0ec7-3e9a-4f2e-9e6d-2139c13982d0	Full Scope Disabled	f99aa1dc-f2b1-4820-a912-450227263613	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	anonymous
d238516a-aeeb-44c6-91e1-561c011c6ab5	Max Clients Limit	f99aa1dc-f2b1-4820-a912-450227263613	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	anonymous
ab3e998c-9aaa-4b21-bd40-b4f71fb672db	Allowed Protocol Mapper Types	f99aa1dc-f2b1-4820-a912-450227263613	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	anonymous
5a890e4f-b0c0-42d3-95e1-45239aaa60fb	Allowed Client Scopes	f99aa1dc-f2b1-4820-a912-450227263613	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	anonymous
18d97a18-ddcc-4ce4-9c71-8953eed8809a	Allowed Protocol Mapper Types	f99aa1dc-f2b1-4820-a912-450227263613	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	authenticated
284c5319-9953-410f-95bd-cf3447ab4be0	Allowed Client Scopes	f99aa1dc-f2b1-4820-a912-450227263613	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	f99aa1dc-f2b1-4820-a912-450227263613	authenticated
3766d5ce-7080-47b1-8188-0feb7db2ec37	rsa-generated	f99aa1dc-f2b1-4820-a912-450227263613	rsa-generated	org.keycloak.keys.KeyProvider	f99aa1dc-f2b1-4820-a912-450227263613	\N
cd97774f-ce8e-410a-b800-1b5a4943056c	rsa-enc-generated	f99aa1dc-f2b1-4820-a912-450227263613	rsa-enc-generated	org.keycloak.keys.KeyProvider	f99aa1dc-f2b1-4820-a912-450227263613	\N
1da61779-9a08-4aa5-b0d5-8402fdcee305	hmac-generated	f99aa1dc-f2b1-4820-a912-450227263613	hmac-generated	org.keycloak.keys.KeyProvider	f99aa1dc-f2b1-4820-a912-450227263613	\N
e3b665e8-e6d8-4449-857f-037da63dc820	aes-generated	f99aa1dc-f2b1-4820-a912-450227263613	aes-generated	org.keycloak.keys.KeyProvider	f99aa1dc-f2b1-4820-a912-450227263613	\N
ba3e9150-55ea-4ee1-9e7c-07db010317e3	rsa-generated	lsc-sde	rsa-generated	org.keycloak.keys.KeyProvider	lsc-sde	\N
77a902b4-c277-454a-91cd-19f78c76e8db	rsa-enc-generated	lsc-sde	rsa-enc-generated	org.keycloak.keys.KeyProvider	lsc-sde	\N
10afb08f-db65-4e89-b6df-64a49da8f066	hmac-generated	lsc-sde	hmac-generated	org.keycloak.keys.KeyProvider	lsc-sde	\N
c291669e-084f-48dc-8006-4155782bf4c5	aes-generated	lsc-sde	aes-generated	org.keycloak.keys.KeyProvider	lsc-sde	\N
6f400634-8c8c-4f41-9a3b-5244a88c610c	Trusted Hosts	lsc-sde	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	anonymous
2c842d09-ce25-4bca-bb5a-e164870a2c43	Consent Required	lsc-sde	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	anonymous
2d38a042-bc70-4d64-8f1f-4bc45d5c960c	Full Scope Disabled	lsc-sde	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	anonymous
6e162461-386c-49a7-9ed1-c7bdce49f702	Max Clients Limit	lsc-sde	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	anonymous
5e752409-5fbc-4ced-868e-f82dd27bc8c4	Allowed Protocol Mapper Types	lsc-sde	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	anonymous
f5a7e925-d7dd-4c74-a790-7017a15e07d3	Allowed Client Scopes	lsc-sde	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	anonymous
2fea9ea8-0ed0-42bf-9385-77553c26dc8e	Allowed Protocol Mapper Types	lsc-sde	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	authenticated
d63b8720-6bb7-421a-8247-df8f056e31dc	Allowed Client Scopes	lsc-sde	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	lsc-sde	authenticated
c15feace-082d-47f4-b846-c228e7948d01	\N	lsc-sde	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	lsc-sde	\N
e5f0c576-f75f-4fe7-8e38-9ddafeb715c5	hmac-generated-hs512	lsc-sde	hmac-generated	org.keycloak.keys.KeyProvider	lsc-sde	\N
0137b5c9-d33c-45cb-805a-399ecc4c54ba	\N	f99aa1dc-f2b1-4820-a912-450227263613	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	f99aa1dc-f2b1-4820-a912-450227263613	\N
617fa98f-4a58-4cdc-b143-e28caa57fc93	hmac-generated-hs512	f99aa1dc-f2b1-4820-a912-450227263613	hmac-generated	org.keycloak.keys.KeyProvider	f99aa1dc-f2b1-4820-a912-450227263613	\N
\.


--
-- TOC entry 4254 (class 0 OID 50284)
-- Dependencies: 293
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
687f1b6c-a5fc-45ba-9478-48fad9ff6626	d238516a-aeeb-44c6-91e1-561c011c6ab5	max-clients	200
79f4554c-1217-48cf-a0cc-0ac8e10add01	5a890e4f-b0c0-42d3-95e1-45239aaa60fb	allow-default-scopes	true
13f5c764-42aa-4133-85d2-721791a6daa5	284c5319-9953-410f-95bd-cf3447ab4be0	allow-default-scopes	true
4d151dc2-4cef-4b60-85dc-094fbf2bcf76	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	saml-role-list-mapper
69546dce-97ae-4563-bfe3-231c5f2448c8	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	saml-user-property-mapper
28b5906c-8185-414c-adc5-3036856e7327	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	oidc-address-mapper
95fb9f3e-6b1f-4731-9ec8-2c15667ca88d	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
773715d2-a9c5-4e19-901e-ecd9d992d303	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	saml-user-attribute-mapper
ae98e27b-87b2-40ce-bc0c-cf45636b14de	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
6f171471-48b7-46d3-9ca5-e3406549486b	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	oidc-full-name-mapper
e0b8a10d-1971-4a67-8b62-79427b45c6ae	18d97a18-ddcc-4ce4-9c71-8953eed8809a	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
645631e6-82f1-4ac1-a3eb-af174a5b45a6	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
635807df-e2a7-45ef-84d6-a2ff1803bb15	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	saml-user-property-mapper
41f621a9-7d71-4dd7-9ea6-22c63e76cfa0	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	oidc-full-name-mapper
d23b5ee2-0e1f-47cf-852a-a101e22d57aa	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	oidc-address-mapper
d32e4a58-5a6b-4eba-96b2-a9b8a8546f22	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
f4a88041-f3e5-409e-9e44-f9a981df7cfb	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	saml-role-list-mapper
2549729a-459b-4bb3-9e7f-2538d1a1cfea	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	saml-user-attribute-mapper
05b9fdeb-422c-4281-ad89-1e77944c9c3b	ab3e998c-9aaa-4b21-bd40-b4f71fb672db	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
3d04e7ea-4e43-4fb4-aa13-2c52b4af6e7f	694a7e4d-8eb0-46b0-b3e8-0816b90e88fb	client-uris-must-match	true
2f10f631-bf33-4d49-b133-4f4e17bbe870	694a7e4d-8eb0-46b0-b3e8-0816b90e88fb	host-sending-registration-request-must-match	true
3ff338ba-da01-460d-be82-bb78b4baf2e5	3766d5ce-7080-47b1-8188-0feb7db2ec37	priority	100
90ed5927-9d09-4aba-8cc9-d1c5775e70c6	3766d5ce-7080-47b1-8188-0feb7db2ec37	privateKey	MIIEoAIBAAKCAQEAvoeQBw1ViMJmig0Hl0BWw0XPqYbjC18uYmxcfnQjpF/NH1UQLofu370mIMl6pV+UShhQGHXWkcM8f6hr1eePdq6ekxQktofqy630LNunUiji3AdMyHidqFnFUAsfmRwcBcDjLb1hyGpU6PkYqie30S8S9H2iTA3CIBmNGOvXhPdMBEi8aNUDhGwDg4J3QJr1emm0EQKBRGK5hUHjgJe5Q5RLxo9yjoL6hwa87m9iMP+CdEKC5o0Q2TFOulmf7E79jJGob+Q0Y+w+2cpIhoZpMkry7FFo7+X4c002rK7ZLCaWUpDP8cc9EuzoBqV3LVP4L9QcoFsw7AoG241hCevYVQIDAQABAoH/EL7ZacVCP0LWwEtk32ZIOeFo3v179wPmj7/2YSbT+x5waNCRG4XW+NMnBrqujNpZril04LF6qlT+fDnRQHuZoFS4mzSqBWDswfoH++lSS2ZMigoaNYRkVueM7/wKSuqti9PoI50BexvdWpyKDmpvPXNltxdTrFuJNEkKnaYcyxLJ4UqP7x8Nx4xXSHdKm6dyGY5GmjKWKF5yUpwJhXVfDL/uRU6xyEDJmIlaMhdWSeYIs80vZmvAGh+Ur2sow/MnaEFncs6+UHBzLviYDgNxbfs/KH/cnKhP5WBQMWAVhfzIiHN424o2/A+t3eCVzAaXzr/WuGquLCg/b195j06RAoGBAP8wonGPLvLYYXwBuc4u9m2Q3+S6fdczpTcfIYr9de9ORWNbdPe/x8xvnAv7mMKn2pP5fQ/7a70K9GaJ0QeIY2YrIyUb6O9mJ7l6jpzKi1FFMbZLriXIqjFO3Mh+kDPXBXfVLZ8CTSmjk+cpOGL9nbwO8eZzid8j0X+ZRF5rNgXZAoGBAL8iYq6vvPVbPFvqYWmmLHP05j9RIc3YW5ypwTqUP3SH16mbmAgChy/PdqieJeUrcOekdxWaR2/9L3Lmlb4eaaoS0V7fy5M/9Lcs7o7/Bn75Vc7zK5GHucw5DVajcNP++3734EneRg13lbe6poP7QAUirVinEQbPwff8pQ7DU6zdAoGAKiOXz3S7ZfKBNn76daefnbwcnKKHATBQCegkG9V60gd0wdFqYTbUAVg0xm3Hbe1V1LWQB0GXKuJSNVRwpfPJpiddaFVRg6a0zJYGUrHHi6YHbXjVyvt1zyqcnqb3nPfWuVEEdYtlvoh6deOCoiYLE/DL1SgjDivV/mIKviSqCRECgYBNZvNnoqt3AReUcXo5ep4N52NGyOhToAaZjvU9b8OywUBI40XSGJP+fJmk90aJY+o5JJVFHlFHvNR2R4LklxRbV3uKXD7oxsGnXH7PUd+jk/137Wn7aWeImKIaL94FPAFFDcS6pVThJ0huOxwr3peyfLSObjmq9H+smZeOPvOn0QKBgGUKI+psrpJYHeYgwYWcZnW82HrtYIjRh5AvDpGUx2XwmHkFg4E0RYbDJG9i9is77Ff9zxAktgwoLaZsIHV3XZIRcngteMUTiAZ74HFBJHMqih9xo3XeohuIRwhoJTCD5q972/qCJWE84v3fTSYUb9eLAt8xei0N/avVeI6WT5F7
8530a2ec-9a91-4256-a497-4e87aedcfef4	3766d5ce-7080-47b1-8188-0feb7db2ec37	certificate	MIICmzCCAYMCBgGRkq6wEDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwODI3MDcxMTQ3WhcNMzQwODI3MDcxMzI3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC+h5AHDVWIwmaKDQeXQFbDRc+phuMLXy5ibFx+dCOkX80fVRAuh+7fvSYgyXqlX5RKGFAYddaRwzx/qGvV5492rp6TFCS2h+rLrfQs26dSKOLcB0zIeJ2oWcVQCx+ZHBwFwOMtvWHIalTo+RiqJ7fRLxL0faJMDcIgGY0Y69eE90wESLxo1QOEbAODgndAmvV6abQRAoFEYrmFQeOAl7lDlEvGj3KOgvqHBrzub2Iw/4J0QoLmjRDZMU66WZ/sTv2Mkahv5DRj7D7ZykiGhmkySvLsUWjv5fhzTTasrtksJpZSkM/xxz0S7OgGpXctU/gv1BygWzDsCgbbjWEJ69hVAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAGk6NO0d2FMEmHDIoXeX1mJkUvF134g+tPlriTk4fb+YEVhUH+j1kujXdaQK945hYGv9WE/Y8EnuIx/z8zrtrQ2NstxiFPCScct6Kd5fS1wgj2LQddD7wRuLBVKYxC4kz9vsxKQJHKgFPnCm2w2TSy08bdw1lK15lgF/J0/wUkGSo2hq2oCyxmXRJeTR0dXT8ob50kxDQGk5nF74aHVzTM1nKgm3IjPIDkMOk6j4hVVUhIrD1FLy1umCbKYKfPI4zyo/DYlW9uzY97NE8XXQ4HUYIiKIbiuL2+izGWG9AOP1nrmAVl33qaaUDk2P4QVLbibAkodZxFLbz64dB8oS4hY=
01237a93-b5d6-4615-b199-83a1eb38c761	3766d5ce-7080-47b1-8188-0feb7db2ec37	keyUse	SIG
82015e45-315c-4062-bd34-f11a00c11369	cd97774f-ce8e-410a-b800-1b5a4943056c	privateKey	MIIEowIBAAKCAQEAzG0iuksgZ9k6D2mAi4h6N1z0WTpMDz1W5FjWDyLy7pUWU3Qn0m/KKzJb3yBb6DYGDsicgLxduK22KnQjsz/v8NTJerY5JCpQEJZ3tlIy4bLmmpHFooXpUBgHYfBOLkYFTLNqiLVUjyy3V7nFzf86bysaBoSnVN8A89C+BZoM7cpdVABQd45j0C66YRVuq32ORnDITgKmTpCOX5VadJWzeL2dw1ffC3aGmKJTm2JLb5OSDW5DlEoyFG7uX+XwANWwCQkACdx0Hh3C9CTyOn19EdFduTRFLMPXAuVk5gpvVITotS0kjjUeNn9yytFArwNWIzO4vZSoji+WQsm+EtavewIDAQABAoIBACSh6fc4PzZc1uqsHTzj2ALTxXW33KledJO216UevinCzZ1m0zwCjFfxTkVNpyqVg8BicqkfGCxf9KTm6v7UFksx1mkG/nZcnrxaOlmRoUyQooJQXPoixQx1Qd1rEpd4NLrp681TsTN27+PohmnDstT5BFDmtJWg4KrQXTzjvi1eI6RU39fsbLGEUDSWAUFKE9J62vVcTAssvWWWuDLE4KRhRsUfA//Eav1y/uarRqKGMW2ttLeMkTPeo0CwaY44/dlkr+Q5SjH07imzkK8eBSIQ9/hIsgHcXLEamSvnVp1gXXvzqLbYHcKZY5FX8LD7E3VezVtx6BKpmc1nzQvTHQECgYEA/saRLJJWX/eQQHZMV9GA4APpSy5PEaR8UzeusJmKOCZ3N0haP1aGAq6bxkmZXIscskQOTUOFDZYeY+23/R09jENz6wzmLCTD4Gqa+Jx6Fi1XL2GFIAIzpnse3Ygyl4cvWkr5akexCeULr3XHdg8feOpP8z1fkkSvexxSpHrpYdUCgYEAzWigkzlayrEvh1NIQ68wiV1p5hmdOoSRmlIDT6pHvsgeZaS3q5d1gy0IuWcv4VaVIZ7X413+2SYUDDRd2zPBur0oD+k7BijNrNsdR68hpxCjd2IiBCbDJGDnFutvJ+rT7KoAtHdTf9sP4RfAgTAGpQ9WHB9DqKwqu8hC56PIJA8CgYAlXeI081GPybNygOc5ihSoxmoVCLm4ELPbULNiW2KWUa3ygb4axAnrosheELVZiV2wF6MxWdHN6FKUvWzaxsscI1iBBOdNWicQZxJLnEebsRK0dE0eILSKmkwwmaUx7DXZvF1QZStmFB3eohubCSTIizUmq720qjZCjCjiztQj8QKBgAznVrcI8lgrW1X/+FkwJzdp494tm7/yVgdAwa5+fvVQMwCloVgpMpuj95lWDx7zxniPNva0j+7qQnYl0AOWM8RcX6joOOoBJDKIrUU0jkOleu9j/ckO+lFNuRaqgZgbW2bRoyuzF06/3zZ/vHshHjm+ReWMXT66WhDj2rgchNUnAoGBAMz+2VAJg0uXhzB5Y4oTQOQtE3gqcOU64jaJgqmJAcs0KJAtPh1nKM9whtXXluNNIktFXOf1SxHDooScZsR+mLBa7pSd//apJmHhSZ9WgovFP+TB8UcneEQymZ4wPfMrYlqmIBOzz6r6Mz22ov8upGZi6PuMDHtqxioI40kQWpNK
df29937c-94f1-4c55-bfc1-98dafb9b447d	cd97774f-ce8e-410a-b800-1b5a4943056c	priority	100
54a13976-276e-42e4-8a26-4ad61bbed411	cd97774f-ce8e-410a-b800-1b5a4943056c	algorithm	RSA-OAEP
2dc76a5b-6e2e-469b-8a16-541da7f1eeca	cd97774f-ce8e-410a-b800-1b5a4943056c	keyUse	ENC
a8f447d9-f881-4667-b128-c76922f4ed48	cd97774f-ce8e-410a-b800-1b5a4943056c	certificate	MIICmzCCAYMCBgGRkq6w1TANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjQwODI3MDcxMTQ3WhcNMzQwODI3MDcxMzI3WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMbSK6SyBn2ToPaYCLiHo3XPRZOkwPPVbkWNYPIvLulRZTdCfSb8orMlvfIFvoNgYOyJyAvF24rbYqdCOzP+/w1Ml6tjkkKlAQlne2UjLhsuaakcWihelQGAdh8E4uRgVMs2qItVSPLLdXucXN/zpvKxoGhKdU3wDz0L4Fmgztyl1UAFB3jmPQLrphFW6rfY5GcMhOAqZOkI5flVp0lbN4vZ3DV98LdoaYolObYktvk5INbkOUSjIUbu5f5fAA1bAJCQAJ3HQeHcL0JPI6fX0R0V25NEUsw9cC5WTmCm9UhOi1LSSONR42f3LK0UCvA1YjM7i9lKiOL5ZCyb4S1q97AgMBAAEwDQYJKoZIhvcNAQELBQADggEBAFq5Vz0ZN6eyJ3LvucaRvqZMKU6HARSGjpPveYoH7ALiGZAiwy51ctiEhtzwZWMgdaI0iVTi8TOEJ04hAwktKP6gGpSjQaOPV5VFp+QD7y4BaEFr5e/ob5UHROVzY1LKZcW7/YsB3g9uIT2jq2kXMaqOF1uShvfEv0A+7MLLZNAsiB2tSndwY+NDU88kH7p9qQVUEhu3DumG5dDWlLOVa8Kxw7HW6cXFtrCAGyyyow5GbodSAjnU7l1I3ExvxoOz7vLUJTH+T7Ws0Jdd4MFFogC6d5CHMfUIQjaua35O2yohjNMU69unul8H2oB5O4HOnnjbwG/EAXFcTFDKqI69PUI=
24874626-76ee-4820-b535-047f9c67476d	e3b665e8-e6d8-4449-857f-037da63dc820	kid	f19728b1-3955-4f5f-ac25-e3e5f2c5c409
f55eba3f-fcc1-43b6-93ea-0ade8a1174ed	e3b665e8-e6d8-4449-857f-037da63dc820	secret	_OknYr6TTB64O_yQQhnsYA
b1519121-c50a-4bfc-ae2e-067008f5382d	e3b665e8-e6d8-4449-857f-037da63dc820	priority	100
3eb3025e-addd-421f-bf6c-6014627cdd47	1da61779-9a08-4aa5-b0d5-8402fdcee305	priority	100
e479d01f-a283-4360-aba0-a98bb7690486	1da61779-9a08-4aa5-b0d5-8402fdcee305	kid	8e6e1964-973c-42f2-9b2d-9ccbc70f392d
8cc772c8-bfc1-409d-93a5-50ef7d7a167e	1da61779-9a08-4aa5-b0d5-8402fdcee305	algorithm	HS256
35088082-cc42-4dea-a565-0b06b6fd78c3	1da61779-9a08-4aa5-b0d5-8402fdcee305	secret	fUf8aooiepXCiC6LylSsVUABTvlPpM8gTgLemU58V2MImHDkpI9QpjqTQd18HLTI1sM_bOJU7RAHzjrxjtTavQ
025107df-80ee-4f96-84ab-496c9e0297a0	c291669e-084f-48dc-8006-4155782bf4c5	secret	YVqegN2b_8Catk9zmAxsWg
3a8abe35-9400-428c-baea-7a856b6247ad	c291669e-084f-48dc-8006-4155782bf4c5	priority	100
0471828c-f5d9-4ced-a1a1-4863a10f6125	c291669e-084f-48dc-8006-4155782bf4c5	kid	988f4a1a-4711-4d2b-9ce5-1f8209c100ba
c5851194-728f-4315-87e7-a990f7c970df	ba3e9150-55ea-4ee1-9e7c-07db010317e3	privateKey	MIIEpAIBAAKCAQEAufBXVk/rj05JJci+ILHwwHAq29fRgUTT3MEBcj3N2Cf85pV3cPzgfEz623CCPfWxpvJdNl6404PNGnbwKsjNlR+24yjORK5fu4ushUOCyCMF40cIdTAM6F9iyEfqlvppNR90rTfZo/7H29tNYHR828Nyd/g2qjANkzqfRvCndOvhehTq/rVKqzvOnLLQXsFElaPYk4rT8HyurXVmf4U2bXkLTxNrU10K5Ib2mdKH4UCMRNWmRldaWaZoVP0QZyQl+3fXKocrWv+tmFlKtL9Q4TQBwlmTh1CSLSWpUWwxFA9s7PrUO/2J4J7M7rdM8VkuIxptKQOQf+UYft8Qz0yCDQIDAQABAoIBAAjfuU9Xe5rIhfGtcbN+Qorwn38D/w3wErtpo6/H1tPe3rFDh2KHUxBjnSJNbY3W9L5OuVefsCr6EpcVf5NPJ46bJ5+SQjvhZZS+DwMCLJLwJvcInBT5sNgDO2PrGL1RYKWGJYuhy3uJ7JBn2DrG/HGBk6w5lqRLLE6vQMxCLn/EMFCl8Wpbg5kEwZtyv2ZXc1ee8cpVXrHsxHn/JRB/kSKYY3iEh6/IMzzCmI4CgfUZ6BfnBvn6onPHmTNnLY0yTUab1uxilZK6Sq+7NOn2VNE7R1KA1SKsVHjJ4vj2GY5uFOwVlf9ftFRz7p/57S8PQ8yJ1bWQzmkfImIbs14tOMkCgYEA5ngS/qAhITEuEFkEXVw2b7t2cQF+wiSOuHSxCQiMvmqJKBurBBVCSJr2hYC4R4BVusfUbLBsi671BZ6DoIoOZWbaOeOqG/wVFsAFPPpkWIwTk9aSkJdnxxZJ/5+6+SNtd8lsEEaqEaABRi4TvzmnZC/rA7KW4GZKqXl/ec8IBtUCgYEAzolsoJ1xmvoOLt7WDj9t0l7ZlDya7s2Mkh7aLC43qjt9+F2+XixAHvaFy9adzefAoVYd++RmfDZCkKZcOJCr4lmigIzdBcTee5Z4TOaYNdtJwhlaoibFUiD1GKGKtST7zD4DrbgrSUJAVgo8iOj925A4VWXEaQ/W1ksUnnrOmlkCgYEAnlGF2txtZbu/BQPhd7DMxFxmtKJuTTeHwzaGFsqExJmytparGBbyfaXWC0etT5DdU33Kcw+OwTXio4WMrk+oLAhHiNTYGnlEk2g9MPJg1GMFX91auXEInT62fp9fdZ3cqRj43wVr9sePmII2lnoofy5bpyKbenNKfrkz1J1fyjECgYAvarF7tmnMkLgM3q/6GWnXMFt3gup3BM3PBjJEjl/NP1dOXAdGi5Y1BZf2ElGsYhaBc8nyeJ9myPZDS05E1kH/92AtbymXF3mUmhkIXrB3PN8UJsn+DDSlBFgAzaWQrOr6GwqxKWUWrpUiq7r2G7ecXuHwCSssi6xhCl+zerJQEQKBgQDAD9oG2DAVVORDaYIW+Fav1WFXcPP5Oce+0Z9yu3c2p4E+0y26empnTkKFjkXjQ6uOODBnyRpTFDGNLaW0hfJvQR9sdkv84wwKzX2YwH6KRIqWAKI2Tx3yUA+SomI0Guk0T6X50DinmN4XH926jDydU+s0niW07lINxywvkBC+rw==
d7562605-553c-405e-b4b1-f9da2d64c55a	ba3e9150-55ea-4ee1-9e7c-07db010317e3	keyUse	SIG
440b7bdb-ca60-4402-af3a-3f550454e4b2	ba3e9150-55ea-4ee1-9e7c-07db010317e3	certificate	MIICnTCCAYUCBgGRkwSquzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdsc2Mtc2RlMB4XDTI0MDgyNzA4NDU0MloXDTM0MDgyNzA4NDcyMlowEjEQMA4GA1UEAwwHbHNjLXNkZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALnwV1ZP649OSSXIviCx8MBwKtvX0YFE09zBAXI9zdgn/OaVd3D84HxM+ttwgj31sabyXTZeuNODzRp28CrIzZUftuMozkSuX7uLrIVDgsgjBeNHCHUwDOhfYshH6pb6aTUfdK032aP+x9vbTWB0fNvDcnf4NqowDZM6n0bwp3Tr4XoU6v61Sqs7zpyy0F7BRJWj2JOK0/B8rq11Zn+FNm15C08Ta1NdCuSG9pnSh+FAjETVpkZXWlmmaFT9EGckJft31yqHK1r/rZhZSrS/UOE0AcJZk4dQki0lqVFsMRQPbOz61Dv9ieCezO63TPFZLiMabSkDkH/lGH7fEM9Mgg0CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAkd+JSk7gKbfnx/nn8JPLzE4gOPXdSzoAvqIoTTheBLY3EQy5w/GyocwsXpb7dnQWSb5FUUQjMqYHL1xIUHtgkd3Jt7cMJQ8TXWrdny4Of9XOYDZ/bnFsTHsPV3cJnEYvzSpxq2hDaAvi4gTjlEa/bevPGUhVceRcRKF0rj9TCjb9cjjOtuRB+YyXWWY+fUM5UZL9i0u2GoAQVN4N7DtL/iEZY9COwPDXh8PAoLqzSA1oKITMaAU1Tdz4oMpZ0Ev9u4HbflyaoK0NGJw5RWwrQUJjQpueeEABOb3KytuErfhOqRKGUlrDTTMqIFIpqeBilo6kYdHBvxQpPjNJJ/mTNQ==
7e39baef-4a2c-4028-b28c-10367dacf4e5	ba3e9150-55ea-4ee1-9e7c-07db010317e3	priority	100
0a2d9d98-522b-4dca-9688-0df7e00d183b	77a902b4-c277-454a-91cd-19f78c76e8db	privateKey	MIIEpAIBAAKCAQEApXWoNu4a0SRzNtBdw9OIPWkYTnpZOmlCb2MIns/CEIQBQ4UxObzVKlPyUA4P8CgraS2HvuiD4Q+u1iHCRua3z/DOm+FF+zNuqMHz/ond9qOWaZUD+C/d3Sp7Np4qOG7gcPDfgVNwL0HR1vyVP97UGT2GVH4pNUEsF3pHeaLnYlBxuyOOSbv/NyNVCXvA80fRXXAhOdYmgPySUeKL87fOpwwKU0EP2VuMF+oPb031CuhIsuEmhRNA3YU7Ka9nco5dKSmXFEfx4jGnDcP519VdKK1GF9Cxh/aN4e7xVIC7tkKoPljMEGzCWbAltTqnM5szSB110218z6siWO8+NXYGuwIDAQABAoIBAFDbQvV4/UToLZ+DStcIN+NeyOCM/K7FQpCBUnSdbaY5hA6Vd71R8M/LDzac8J/5WWGAPP6HzO6+hb+h5rlURU5KTQUzHMpJ05GHmq9wezZssfPtvO9boO3UNTs3JsXGNUssAuVFu6R0Y1HOxDbes0KUZOFEd+nM6/mbKXOhLrbFdM+s4ySJ4iLp7C3X6U/Jb7//engM6KlThMNVGE7hiDbTB0QdCFaEOdEzGgT1+FBQj+bVk8G2nLK/DI+r8OK5xkeQexnF5wkCumpLlRcbe+idQE17F2/D1w4K3n3TJTH+wh68DZ9sGrIvq8AreNb1Pr6frW8n5rn9EQiODYCM870CgYEA1TDSoc60RPaxmpfz78bFeMv18ZXa6KXflPoNKDsvsAIpa7gJe7P9dBaCBXxSQ2q/iC8UxAuAQOC2+rF/cEwUeWAgUwyHcFneybXLN1dflaFJ9CaADQAtQDWHoIzJO9W9j8tRLKDH17kvUpLTL2XLMnXUlaXAQ6Wh6NFl3LuGgtUCgYEAxq8xJcQHjuvWfPTOGwsI7yj7ZDBVi47EW7njtWOu6jFSr5+C21Od4uLWHCZK8zR9RbSS+8UGWFsAboupyLo3bL7DOvzcaI3MC3w4wnr0vwLZNABnQrh2vLr89JIp/x1SaZ06vNP1lbLv4JWjkvpe9Y5JHXLy17Oo42lqucdCi08CgYEAiIVrXRLxffg8Y7NLExFHA8QZC0vbk4AlXVGDe2/radr4i3KfIAhzFhQTz099no6NeLgtpB15VBKTGpbv9QnDUrar/ILZeKkUcjdom1fobfmLUj4VYj3qvGOLJtUBSL/nVF3u7ZVIZGzCUS6U7pVROk8ag3pRVQCMXns5r9CmosECgYA3pUt7i0qeobjB6IJtGosXCIBYEB11Z7fhBNActl1/4+6Hl4I70VBwAh37ZlIpiXLoeemMsCLVzi7xxxX3TQhG4aqmM7m7YrNaKCFxfqRbdv3ETbSeADHpK+m6ydEPTXQOdmXECw1GLwZ1/RMCEDNWTNJ3eAFBnmTXxGeKvp8JiwKBgQCBritY8iXMKdQG2iiehFEc+8TdIuy6AyllEX4PTJUebpz9K/PYa9Mi67YyaMgIJFSz5AhU6J6C8l2HK51QbsSqHR7aH0UvqJxWmEMVhDkXa6tDD2OiYC9l57Yb/k99ODcAxg6nMds0CGGZPWSuGfifiEj4eRl0HLVONVxVfl3ohw==
00bfe130-d150-4a04-a4ec-fe54832f3e02	77a902b4-c277-454a-91cd-19f78c76e8db	priority	100
f6bc38b7-613e-42fc-b93d-7f1b860834a9	77a902b4-c277-454a-91cd-19f78c76e8db	algorithm	RSA-OAEP
5916e77d-51d5-4e43-84e3-e7a0a2718100	77a902b4-c277-454a-91cd-19f78c76e8db	keyUse	ENC
811c8c12-7b54-4802-8ce1-3203ab9f4d6a	77a902b4-c277-454a-91cd-19f78c76e8db	certificate	MIICnTCCAYUCBgGRkwSrnjANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdsc2Mtc2RlMB4XDTI0MDgyNzA4NDU0MloXDTM0MDgyNzA4NDcyMlowEjEQMA4GA1UEAwwHbHNjLXNkZTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKV1qDbuGtEkczbQXcPTiD1pGE56WTppQm9jCJ7PwhCEAUOFMTm81SpT8lAOD/AoK2kth77og+EPrtYhwkbmt8/wzpvhRfszbqjB8/6J3fajlmmVA/gv3d0qezaeKjhu4HDw34FTcC9B0db8lT/e1Bk9hlR+KTVBLBd6R3mi52JQcbsjjkm7/zcjVQl7wPNH0V1wITnWJoD8klHii/O3zqcMClNBD9lbjBfqD29N9QroSLLhJoUTQN2FOymvZ3KOXSkplxRH8eIxpw3D+dfVXSitRhfQsYf2jeHu8VSAu7ZCqD5YzBBswlmwJbU6pzObM0gdddNtfM+rIljvPjV2BrsCAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAg/nirxuVbzQ1lDuYfFu1AsGkh4Kbh9zr/o+0fhsoZs/5AsqyK47f5GQYJQc2piQEhYIO95EjCy3w+bPk/D2Ql70n5BwASDZLG3Nbk3FeAFs9vLrT4QcwDdR8crD6yILVomduWvF2wCe4A7D9fhRbQOLXEfy4UvagWK+O3mFPbWhSZygZPkDBPLWQlAKgwMEjNeINj6PnRUBJdqkN1OmP1b0U4AZhg8eE8PKiPiimzo3NeKGP3rPQ4QmzZIlAO4cq7zYo1ftcf0kNRR0YzCg+PbG9XSzKaZ/HIbsgCZlxUPFPWoOHh+qDaA453D04h5lsb1SSW+1M0PTEOc5pv4gYew==
1c0b7f71-7328-4dd8-9cb6-e3847cf7698c	10afb08f-db65-4e89-b6df-64a49da8f066	kid	92a4d7c7-85eb-41d1-8cb9-fad220362813
f14bca19-1c0f-4d71-8f14-17c4c9000b49	10afb08f-db65-4e89-b6df-64a49da8f066	priority	100
17ffe119-6d44-4723-a58d-5d3668cd14bd	10afb08f-db65-4e89-b6df-64a49da8f066	algorithm	HS256
d9b00685-fe95-4767-91e1-e808a2ea7524	10afb08f-db65-4e89-b6df-64a49da8f066	secret	EGQfxWbHCyDU9baChXpHEqT8n8uEMWQocnyscOu3OAcJmaSmEZw1e4Wiqwrwufd7X_0taKv2Yc5YpFND5urxfg
1d06eb22-5e8e-40a4-8ad3-94bc136651bb	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
70378565-b005-41f3-a29b-1c45ceb9930a	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	oidc-address-mapper
598f334e-1fc2-434b-8c0c-91e3192657ce	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
9ce551c5-dceb-4728-bee6-6da919a7c89b	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	saml-user-property-mapper
7fd9ce43-bc5e-4e27-8304-7d0a7eaeb7bc	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	oidc-full-name-mapper
bbd47c46-ca01-4f91-b695-0f7f5dea4329	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	saml-user-attribute-mapper
229895ec-b613-49db-95ca-7b6159907e73	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
091f67cd-60bc-48ba-a129-53c3114fd56b	2fea9ea8-0ed0-42bf-9385-77553c26dc8e	allowed-protocol-mapper-types	saml-role-list-mapper
8f3e588e-db1d-473f-9653-d76155817608	6f400634-8c8c-4f41-9a3b-5244a88c610c	client-uris-must-match	true
7ca11ed1-bfd5-4f70-bb76-76242d6c7f12	6f400634-8c8c-4f41-9a3b-5244a88c610c	host-sending-registration-request-must-match	true
d6369bea-5e15-4db5-8fb0-ad0f592f3605	f5a7e925-d7dd-4c74-a790-7017a15e07d3	allow-default-scopes	true
a1339930-308a-42fb-82ef-0f335995d649	d63b8720-6bb7-421a-8247-df8f056e31dc	allow-default-scopes	true
a430b24b-a2a2-4961-857e-23c67fa88642	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	saml-user-attribute-mapper
d4b1986c-6d21-418c-8782-d822303ca53d	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	saml-user-property-mapper
aa335ee4-9fb6-4718-80e2-8c5af3aca4d0	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
b177c707-0974-41c3-9950-79972f817d15	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	oidc-full-name-mapper
72506c28-76c9-4f71-a616-ce0fa3e58bd5	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
06fd0fb2-db2b-4521-934d-6a505077dddd	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
f4e5282b-d585-435e-93a5-e1b979b9797e	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	oidc-address-mapper
688a5841-d793-4d9a-b45a-10a01586c1d4	5e752409-5fbc-4ced-868e-f82dd27bc8c4	allowed-protocol-mapper-types	saml-role-list-mapper
f2ac6583-4bcd-411b-aeda-99b1ca0cf8a8	6e162461-386c-49a7-9ed1-c7bdce49f702	max-clients	200
cece33ce-4c4f-4e83-940b-6518b2cbaca0	c15feace-082d-47f4-b846-c228e7948d01	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}],"unmanagedAttributePolicy":"ENABLED"}
55345b2c-ca0a-4a9a-b980-82d23e676001	e5f0c576-f75f-4fe7-8e38-9ddafeb715c5	kid	f1d7dda0-d3f3-4854-9ff5-591c6154e387
9b7e124a-9c59-486d-b990-11c1a500f7f1	e5f0c576-f75f-4fe7-8e38-9ddafeb715c5	priority	100
4ad18742-ecc2-44fc-9ebd-1fecb0179723	e5f0c576-f75f-4fe7-8e38-9ddafeb715c5	algorithm	HS512
e7ad9933-80f6-477c-aaae-84251a546ca1	e5f0c576-f75f-4fe7-8e38-9ddafeb715c5	secret	r-3xqJ8C3g_EFgmiRSbuGqVGw2wbvEIKjcq3XKQOA5t22zJNEI8okeaNytv4nLOyfQkbQqK0H0XEeEcDLpu9egqw4qL5HUhyCpaImuBmkTDenuQxitkQfoOkIpcAbfH0T-VmLUI23aFgxedZL9gqoy_MNey8-2-qo1uR4Q05z0E
ba942bf5-36ca-4332-9333-418883186b59	617fa98f-4a58-4cdc-b143-e28caa57fc93	secret	SwXoUfvjxECyUp0EB_2Q5v4DvLx7FmYq81Os4QMnI_lhaVHsQZYlbSCZZS3bJiFCb_FklfCVP0itlwTmZPi1lRD_zHmy6v_ydMO3J7DSCUqDPShuWfgEy9YT4eTONk3U0i2OziKB_RhMV9WrjN6YuxqNWuO-9QNJvT8PoiEe4jE
e5822a67-633f-42de-aa5f-87f587485ee9	617fa98f-4a58-4cdc-b143-e28caa57fc93	priority	100
f368d7c0-d62d-4af5-a8cf-0f93dbd90722	617fa98f-4a58-4cdc-b143-e28caa57fc93	kid	ff32bb9a-2fa6-4df5-acd7-6b15b07ab504
7063fce1-3b19-43dc-be5d-125426f968da	617fa98f-4a58-4cdc-b143-e28caa57fc93	algorithm	HS512
73b032c7-4a47-4cbf-8ecf-0b14829ee22a	0137b5c9-d33c-45cb-805a-399ecc4c54ba	kc.user.profile.config	{"attributes":[{"name":"username","displayName":"${username}","validations":{"length":{"min":3,"max":255},"username-prohibited-characters":{},"up-username-not-idn-homograph":{}},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"email","displayName":"${email}","validations":{"email":{},"length":{"max":255}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"firstName","displayName":"${firstName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false},{"name":"lastName","displayName":"${lastName}","validations":{"length":{"max":255},"person-name-prohibited-characters":{}},"required":{"roles":["user"]},"permissions":{"view":["admin","user"],"edit":["admin","user"]},"multivalued":false}],"groups":[{"name":"user-metadata","displayHeader":"User metadata","displayDescription":"Attributes, which refer to user metadata"}],"unmanagedAttributePolicy":"ENABLED"}
\.


--
-- TOC entry 4181 (class 0 OID 49186)
-- Dependencies: 220
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.composite_role (composite, child_role) FROM stdin;
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	c2333286-b659-4636-96d6-03c1c15f6c8e
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	83e016df-31fc-49e7-b9c0-324eff2830b3
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	a0200624-64a6-4d36-a521-1e5ebe8e5e64
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	265b973a-ff4f-4a40-bf0f-8051869c1b60
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	5d1e5b2e-0b3f-4976-93fd-9a43327f377a
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	405a2999-3fbb-48e5-856e-aac9156aa1b7
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	f36eb087-f5ae-4d67-8f3f-52cc476fa779
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	cff85847-774a-4487-9c25-f0873bf4443c
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	c5fbdd59-8af1-4544-8014-93ebd9615d23
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	38e596f9-144c-4085-aee3-038fcc1d1a0e
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	bf39b0ae-c0c1-4a0b-b2fb-fa3861d6536b
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	eb6dddc6-7cdf-4519-97bc-3bc84829eac4
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	40445fb3-5d9c-4897-be6c-b3e422d28f34
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	cf210067-8f3c-4184-917e-5c0d2a791cd9
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	e683d1e5-3dc2-466a-99dd-0a6cc9c6dcb0
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	e70f0b74-220e-4085-9d44-f49a46745a0b
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	262efdb9-9ade-452b-9bd3-879ec68e4efd
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	3a6cb500-c9ff-4c70-a1d3-12bf855ffeab
265b973a-ff4f-4a40-bf0f-8051869c1b60	e683d1e5-3dc2-466a-99dd-0a6cc9c6dcb0
265b973a-ff4f-4a40-bf0f-8051869c1b60	3a6cb500-c9ff-4c70-a1d3-12bf855ffeab
5d1e5b2e-0b3f-4976-93fd-9a43327f377a	e70f0b74-220e-4085-9d44-f49a46745a0b
8c38a6d4-d929-4f3a-a53a-395877120476	c9ab0817-c5bb-4f5c-820e-0d213f9f9de7
8c38a6d4-d929-4f3a-a53a-395877120476	ffa23dba-fdae-4e61-9c55-07916e2cc72c
ffa23dba-fdae-4e61-9c55-07916e2cc72c	615acb84-7114-45d3-9d70-b322cd1e5ac8
55001171-9128-453c-bff8-fafb57b980b5	85b0886c-c59d-4452-855b-0dd2f766764a
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	732f9274-08c7-45e5-8eb0-716fc0f9f241
8c38a6d4-d929-4f3a-a53a-395877120476	954e4afa-9ab0-498d-b681-a7b9a0fff2bd
8c38a6d4-d929-4f3a-a53a-395877120476	835af0fa-12eb-40fb-a7b5-05945d1dc23a
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	9d1eccae-24f7-4649-87ec-1a52da1ed1fe
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	8db5330a-0b93-4f70-987a-b704380566df
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	cea07935-b348-4c16-a25b-745328cf675e
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	e56dc830-abef-45a7-b71a-68136ab2b1d0
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	3835d219-a00d-449a-a51c-b103a10b0e2b
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	a89bfc91-5efc-4f48-8b55-4d932809d625
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	78f09002-55d0-42eb-bf47-d998f2846a0c
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	eeb1fed8-a20b-48e6-b6a5-30a9237d1be2
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	ecf0dc62-66e8-45e6-a8d5-ed4da69f9de3
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	0b612efe-8f96-4cd9-930a-2ae0f16455f2
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	8f39efd2-8f16-4c47-85f8-c540da37054d
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	0b4d6a6f-fc0c-4bef-95ff-d15d891e64e2
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	10657207-119a-4e4c-b1e7-e0daba5c9484
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	13336944-a997-4626-a676-8260dda0bc7d
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	28f8bfe3-7243-4772-b6b0-ff0e3c144146
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	9ce5c905-fd9b-43c3-8685-6f745a03c809
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	435361ca-1095-4201-9a9c-ddd0cd06471d
cea07935-b348-4c16-a25b-745328cf675e	13336944-a997-4626-a676-8260dda0bc7d
cea07935-b348-4c16-a25b-745328cf675e	435361ca-1095-4201-9a9c-ddd0cd06471d
e56dc830-abef-45a7-b71a-68136ab2b1d0	28f8bfe3-7243-4772-b6b0-ff0e3c144146
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	2385ecd8-deec-4ce9-a2b8-c503dc2059ab
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	9890b8fc-be7c-4eb8-aac7-92ed96a1d4cf
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	38bc2569-3708-403f-b746-5771abe43b25
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	c07bf760-9916-40c7-8d77-d91954462f19
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	7c58dd93-487e-4f02-a08e-e0f9b074d6ec
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	3f32da9e-7de5-4680-9e5b-eb45e783a4ad
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	2eb88ac0-0754-46e8-89cf-7c40fd8e3c5c
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	d0c1f9db-0b21-4b0b-bf60-874215b7cb50
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	494f530b-8969-4ed9-8f28-9043cebdefaa
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	2d5850a0-958d-4e0e-be4a-eef6ca89eefa
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	4d4d52fd-c665-4fb0-8656-006ebce95675
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	4452eb90-1e2f-471e-ab40-5aba8394a5e0
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	bab24537-ab1d-4c1f-bc0e-d9bc41b6613d
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	e2a30b2f-1bbe-4603-b2be-a169a8d9b756
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	743164b0-6b03-4251-a007-8c5b03c78edc
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	1c3a33ec-3cea-4cdc-a060-e8b7b2f3a995
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	c90f8b3a-6cae-4fcb-afb7-faea46ac4157
38bc2569-3708-403f-b746-5771abe43b25	e2a30b2f-1bbe-4603-b2be-a169a8d9b756
38bc2569-3708-403f-b746-5771abe43b25	c90f8b3a-6cae-4fcb-afb7-faea46ac4157
c07bf760-9916-40c7-8d77-d91954462f19	743164b0-6b03-4251-a007-8c5b03c78edc
d90521ee-a37b-4206-a8cd-4e51ad090ad1	786f5620-92bb-487f-abd8-307305ddf3f9
d90521ee-a37b-4206-a8cd-4e51ad090ad1	a2ea4cb3-7976-4354-8e30-e7e24855a388
a2ea4cb3-7976-4354-8e30-e7e24855a388	ca7e1158-a6b5-4efa-b4e0-72316832fe5f
7636c65a-5c78-481b-87bb-06ed87ab7001	3b9fa51b-8e5f-48de-b37f-ddac12a2df84
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	31a111cd-7f62-4331-b7d0-343a55b53922
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	bc2030f0-3561-4612-a43f-fab89e971827
d90521ee-a37b-4206-a8cd-4e51ad090ad1	84472d55-4874-4c2a-8f9f-4f6a26fb5811
d90521ee-a37b-4206-a8cd-4e51ad090ad1	14803da4-860e-406b-a75f-c04f06bd26ca
\.


--
-- TOC entry 4182 (class 0 OID 49189)
-- Dependencies: 221
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
21fbe5ab-8137-46dc-847c-a8fd5afb5a93	\N	password	485ecbfe-4983-47d4-a703-013c0efd31bb	1724929860487	My password	{"value":"pGTlQr+VW3xQ3t6SRybd6PktqIxfPiLHDQG2vtzB3LY=","salt":"j5QQq0EogW/U3cRQwM1Mrw==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
81afd4a7-5ea5-4e71-b0ba-2b9d187188c5	\N	password	f314d3d8-b5d8-4be0-849c-44839ab05418	1724742939501	My password	{"value":"dgve2esD/3RBduG0MfxPxAMRf1sHf/CvNYCkHESbiRs=","salt":"b4V3lEgQDphkxOLCAH/PYA==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
466c20a7-0ddb-40e6-b5be-14e1a3ac434a	\N	password	4d302489-4eb5-4280-93bc-6be629c80b2c	1724761601299	My password	{"value":"sTznvU5XWq96e6XAg5lNj+f9oDUlVcWrderWPgJc6Co=","salt":"0Ytha2NGO+G7LTK7WP5DrQ==","additionalParameters":{}}	{"hashIterations":5,"algorithm":"argon2","additionalParameters":{"hashLength":["32"],"memory":["7168"],"type":["id"],"version":["1.3"],"parallelism":["1"]}}	10
\.


--
-- TOC entry 4177 (class 0 OID 49159)
-- Dependencies: 216
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2024-08-27 07:13:18.864053	1	EXECUTED	9:6f1016664e21e16d26517a4418f5e3df	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	4742797226
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2024-08-27 07:13:18.907124	2	MARK_RAN	9:828775b1596a07d1200ba1d49e5e3941	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.23.2	\N	\N	4742797226
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2024-08-27 07:13:19.093484	3	EXECUTED	9:5f090e44a7d595883c1fb61f4b41fd38	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.23.2	\N	\N	4742797226
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2024-08-27 07:13:19.103415	4	EXECUTED	9:c07e577387a3d2c04d1adc9aaad8730e	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4742797226
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2024-08-27 07:13:19.553212	5	EXECUTED	9:b68ce996c655922dbcd2fe6b6ae72686	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	4742797226
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2024-08-27 07:13:19.575784	6	MARK_RAN	9:543b5c9989f024fe35c6f6c5a97de88e	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.23.2	\N	\N	4742797226
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2024-08-27 07:13:19.901259	7	EXECUTED	9:765afebbe21cf5bbca048e632df38336	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	4742797226
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2024-08-27 07:13:19.930708	8	MARK_RAN	9:db4a145ba11a6fdaefb397f6dbf829a1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.23.2	\N	\N	4742797226
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2024-08-27 07:13:19.939986	9	EXECUTED	9:9d05c7be10cdb873f8bcb41bc3a8ab23	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.23.2	\N	\N	4742797226
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2024-08-27 07:13:20.357003	10	EXECUTED	9:18593702353128d53111f9b1ff0b82b8	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.23.2	\N	\N	4742797226
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2024-08-27 07:13:20.534401	11	EXECUTED	9:6122efe5f090e41a85c0f1c9e52cbb62	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4742797226
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2024-08-27 07:13:20.546186	12	MARK_RAN	9:e1ff28bf7568451453f844c5d54bb0b5	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4742797226
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2024-08-27 07:13:20.566793	13	EXECUTED	9:7af32cd8957fbc069f796b61217483fd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.23.2	\N	\N	4742797226
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-27 07:13:20.634675	14	EXECUTED	9:6005e15e84714cd83226bf7879f54190	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.23.2	\N	\N	4742797226
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-27 07:13:20.637405	15	MARK_RAN	9:bf656f5a2b055d07f314431cae76f06c	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4742797226
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-27 07:13:20.642621	16	MARK_RAN	9:f8dadc9284440469dcf71e25ca6ab99b	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.23.2	\N	\N	4742797226
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2024-08-27 07:13:20.646341	17	EXECUTED	9:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.23.2	\N	\N	4742797226
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2024-08-27 07:13:20.824186	18	EXECUTED	9:3368ff0be4c2855ee2dd9ca813b38d8e	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.23.2	\N	\N	4742797226
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2024-08-27 07:13:21.11953	19	EXECUTED	9:8ac2fb5dd030b24c0570a763ed75ed20	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	4742797226
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2024-08-27 07:13:21.14053	20	EXECUTED	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	4742797226
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2024-08-27 07:13:21.155031	21	MARK_RAN	9:831e82914316dc8a57dc09d755f23c51	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.23.2	\N	\N	4742797226
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2024-08-27 07:13:21.164375	22	MARK_RAN	9:f91ddca9b19743db60e3057679810e6c	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.23.2	\N	\N	4742797226
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2024-08-27 07:13:21.220031	23	EXECUTED	9:bc3d0f9e823a69dc21e23e94c7a94bb1	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.23.2	\N	\N	4742797226
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2024-08-27 07:13:21.225675	24	EXECUTED	9:c9999da42f543575ab790e76439a2679	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	4742797226
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2024-08-27 07:13:21.228131	25	MARK_RAN	9:0d6c65c6f58732d81569e77b10ba301d	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.23.2	\N	\N	4742797226
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2024-08-27 07:13:21.394122	26	EXECUTED	9:fc576660fc016ae53d2d4778d84d86d0	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.23.2	\N	\N	4742797226
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2024-08-27 07:13:21.891768	27	EXECUTED	9:43ed6b0da89ff77206289e87eaa9c024	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.23.2	\N	\N	4742797226
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2024-08-27 07:13:21.914753	28	EXECUTED	9:44bae577f551b3738740281eceb4ea70	update tableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	4742797226
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2024-08-27 07:13:22.286616	29	EXECUTED	9:bd88e1f833df0420b01e114533aee5e8	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.23.2	\N	\N	4742797226
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2024-08-27 07:13:22.372186	30	EXECUTED	9:a7022af5267f019d020edfe316ef4371	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.23.2	\N	\N	4742797226
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2024-08-27 07:13:22.425509	31	EXECUTED	9:fc155c394040654d6a79227e56f5e25a	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.23.2	\N	\N	4742797226
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2024-08-27 07:13:22.432098	32	EXECUTED	9:eac4ffb2a14795e5dc7b426063e54d88	customChange		\N	4.23.2	\N	\N	4742797226
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-27 07:13:22.438925	33	EXECUTED	9:54937c05672568c4c64fc9524c1e9462	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4742797226
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-27 07:13:22.444574	34	MARK_RAN	9:3a32bace77c84d7678d035a7f5a8084e	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	4742797226
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-27 07:13:22.527701	35	EXECUTED	9:33d72168746f81f98ae3a1e8e0ca3554	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.23.2	\N	\N	4742797226
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2024-08-27 07:13:22.535039	36	EXECUTED	9:61b6d3d7a4c0e0024b0c839da283da0c	addColumn tableName=REALM		\N	4.23.2	\N	\N	4742797226
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2024-08-27 07:13:22.550777	37	EXECUTED	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4742797226
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2024-08-27 07:13:22.558836	38	EXECUTED	9:a2b870802540cb3faa72098db5388af3	addColumn tableName=FED_USER_CONSENT		\N	4.23.2	\N	\N	4742797226
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2024-08-27 07:13:22.566386	39	EXECUTED	9:132a67499ba24bcc54fb5cbdcfe7e4c0	addColumn tableName=IDENTITY_PROVIDER		\N	4.23.2	\N	\N	4742797226
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-08-27 07:13:22.570326	40	MARK_RAN	9:938f894c032f5430f2b0fafb1a243462	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	4742797226
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-08-27 07:13:22.575882	41	MARK_RAN	9:845c332ff1874dc5d35974b0babf3006	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.23.2	\N	\N	4742797226
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2024-08-27 07:13:22.588275	42	EXECUTED	9:fc86359c079781adc577c5a217e4d04c	customChange		\N	4.23.2	\N	\N	4742797226
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2024-08-27 07:13:23.332658	43	EXECUTED	9:59a64800e3c0d09b825f8a3b444fa8f4	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.23.2	\N	\N	4742797226
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2024-08-27 07:13:23.340215	44	EXECUTED	9:d48d6da5c6ccf667807f633fe489ce88	addColumn tableName=USER_ENTITY		\N	4.23.2	\N	\N	4742797226
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-27 07:13:23.35213	45	EXECUTED	9:dde36f7973e80d71fceee683bc5d2951	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	4742797226
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-27 07:13:23.369793	46	EXECUTED	9:b855e9b0a406b34fa323235a0cf4f640	customChange		\N	4.23.2	\N	\N	4742797226
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-27 07:13:23.375261	47	MARK_RAN	9:51abbacd7b416c50c4421a8cabf7927e	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.23.2	\N	\N	4742797226
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-27 07:13:23.638986	48	EXECUTED	9:bdc99e567b3398bac83263d375aad143	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.23.2	\N	\N	4742797226
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2024-08-27 07:13:23.651257	49	EXECUTED	9:d198654156881c46bfba39abd7769e69	addColumn tableName=REALM		\N	4.23.2	\N	\N	4742797226
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2024-08-27 07:13:23.846716	50	EXECUTED	9:cfdd8736332ccdd72c5256ccb42335db	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.23.2	\N	\N	4742797226
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2024-08-27 07:13:24.063766	51	EXECUTED	9:7c84de3d9bd84d7f077607c1a4dcb714	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.23.2	\N	\N	4742797226
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2024-08-27 07:13:24.073104	52	EXECUTED	9:5a6bb36cbefb6a9d6928452c0852af2d	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4742797226
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2024-08-27 07:13:24.083352	53	EXECUTED	9:8f23e334dbc59f82e0a328373ca6ced0	update tableName=REALM		\N	4.23.2	\N	\N	4742797226
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2024-08-27 07:13:24.088449	54	EXECUTED	9:9156214268f09d970cdf0e1564d866af	update tableName=CLIENT		\N	4.23.2	\N	\N	4742797226
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-27 07:13:24.122271	55	EXECUTED	9:db806613b1ed154826c02610b7dbdf74	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.23.2	\N	\N	4742797226
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-27 07:13:24.146325	56	EXECUTED	9:229a041fb72d5beac76bb94a5fa709de	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.23.2	\N	\N	4742797226
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-27 07:13:24.233936	57	EXECUTED	9:079899dade9c1e683f26b2aa9ca6ff04	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.23.2	\N	\N	4742797226
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2024-08-27 07:13:24.766214	58	EXECUTED	9:139b79bcbbfe903bb1c2d2a4dbf001d9	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.23.2	\N	\N	4742797226
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2024-08-27 07:13:24.917392	59	EXECUTED	9:b55738ad889860c625ba2bf483495a04	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.23.2	\N	\N	4742797226
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2024-08-27 07:13:24.980711	60	EXECUTED	9:e0057eac39aa8fc8e09ac6cfa4ae15fe	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.23.2	\N	\N	4742797226
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-08-27 07:13:25.009515	61	EXECUTED	9:42a33806f3a0443fe0e7feeec821326c	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.23.2	\N	\N	4742797226
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2024-08-27 07:13:25.036687	62	EXECUTED	9:9968206fca46eecc1f51db9c024bfe56	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.23.2	\N	\N	4742797226
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2024-08-27 07:13:25.047089	63	EXECUTED	9:92143a6daea0a3f3b8f598c97ce55c3d	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	4742797226
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2024-08-27 07:13:25.062435	64	EXECUTED	9:82bab26a27195d889fb0429003b18f40	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.23.2	\N	\N	4742797226
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2024-08-27 07:13:25.071383	65	EXECUTED	9:e590c88ddc0b38b0ae4249bbfcb5abc3	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.23.2	\N	\N	4742797226
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2024-08-27 07:13:25.139136	66	EXECUTED	9:5c1f475536118dbdc38d5d7977950cc0	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.23.2	\N	\N	4742797226
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2024-08-27 07:13:25.163728	67	EXECUTED	9:e7c9f5f9c4d67ccbbcc215440c718a17	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.23.2	\N	\N	4742797226
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2024-08-27 07:13:25.179059	68	EXECUTED	9:88e0bfdda924690d6f4e430c53447dd5	addColumn tableName=REALM		\N	4.23.2	\N	\N	4742797226
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2024-08-27 07:13:25.225932	69	EXECUTED	9:f53177f137e1c46b6a88c59ec1cb5218	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.23.2	\N	\N	4742797226
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2024-08-27 07:13:25.247559	70	EXECUTED	9:a74d33da4dc42a37ec27121580d1459f	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.23.2	\N	\N	4742797226
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2024-08-27 07:13:25.261874	71	EXECUTED	9:fd4ade7b90c3b67fae0bfcfcb42dfb5f	addColumn tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	4742797226
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-27 07:13:25.276416	72	EXECUTED	9:aa072ad090bbba210d8f18781b8cebf4	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4742797226
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-27 07:13:25.295155	73	EXECUTED	9:1ae6be29bab7c2aa376f6983b932be37	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4742797226
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-27 07:13:25.300168	74	MARK_RAN	9:14706f286953fc9a25286dbd8fb30d97	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.23.2	\N	\N	4742797226
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-27 07:13:25.349214	75	EXECUTED	9:2b9cc12779be32c5b40e2e67711a218b	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.23.2	\N	\N	4742797226
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2024-08-27 07:13:25.358899	76	EXECUTED	9:91fa186ce7a5af127a2d7a91ee083cc5	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.23.2	\N	\N	4742797226
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-27 07:13:25.365322	77	EXECUTED	9:6335e5c94e83a2639ccd68dd24e2e5ad	addColumn tableName=CLIENT		\N	4.23.2	\N	\N	4742797226
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-27 07:13:25.368863	78	MARK_RAN	9:6bdb5658951e028bfe16fa0a8228b530	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.23.2	\N	\N	4742797226
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-27 07:13:25.39925	79	EXECUTED	9:d5bc15a64117ccad481ce8792d4c608f	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.23.2	\N	\N	4742797226
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2024-08-27 07:13:25.405566	80	MARK_RAN	9:077cba51999515f4d3e7ad5619ab592c	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.23.2	\N	\N	4742797226
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-27 07:13:25.418415	81	EXECUTED	9:be969f08a163bf47c6b9e9ead8ac2afb	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.23.2	\N	\N	4742797226
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-27 07:13:25.420947	82	MARK_RAN	9:6d3bb4408ba5a72f39bd8a0b301ec6e3	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4742797226
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-27 07:13:25.44052	83	EXECUTED	9:966bda61e46bebf3cc39518fbed52fa7	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4742797226
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-27 07:13:25.444925	84	MARK_RAN	9:8dcac7bdf7378e7d823cdfddebf72fda	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.23.2	\N	\N	4742797226
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2024-08-27 07:13:25.46123	85	EXECUTED	9:7d93d602352a30c0c317e6a609b56599	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4742797226
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2024-08-27 07:13:25.47637	86	EXECUTED	9:71c5969e6cdd8d7b6f47cebc86d37627	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.23.2	\N	\N	4742797226
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-08-27 07:13:25.490921	87	EXECUTED	9:a9ba7d47f065f041b7da856a81762021	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.23.2	\N	\N	4742797226
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2024-08-27 07:13:25.530776	88	EXECUTED	9:fffabce2bc01e1a8f5110d5278500065	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.23.2	\N	\N	4742797226
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.549386	89	EXECUTED	9:fa8a5b5445e3857f4b010bafb5009957	addColumn tableName=REALM; customChange		\N	4.23.2	\N	\N	4742797226
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.584094	90	EXECUTED	9:67ac3241df9a8582d591c5ed87125f39	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.23.2	\N	\N	4742797226
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.599733	91	EXECUTED	9:ad1194d66c937e3ffc82386c050ba089	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4742797226
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.61551	92	EXECUTED	9:d9be619d94af5a2f5d07b9f003543b91	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.23.2	\N	\N	4742797226
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.620021	93	MARK_RAN	9:544d201116a0fcc5a5da0925fbbc3bde	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	4742797226
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.648922	94	EXECUTED	9:43c0c1055b6761b4b3e89de76d612ccf	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.23.2	\N	\N	4742797226
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.657299	95	MARK_RAN	9:8bd711fd0330f4fe980494ca43ab1139	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.23.2	\N	\N	4742797226
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2024-08-27 07:13:25.680232	96	EXECUTED	9:e07d2bc0970c348bb06fb63b1f82ddbf	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.23.2	\N	\N	4742797226
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.730583	97	EXECUTED	9:24fb8611e97f29989bea412aa38d12b7	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.23.2	\N	\N	4742797226
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.734969	98	MARK_RAN	9:259f89014ce2506ee84740cbf7163aa7	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4742797226
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.76079	99	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4742797226
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.783252	100	EXECUTED	9:60ca84a0f8c94ec8c3504a5a3bc88ee8	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4742797226
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.787936	101	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4742797226
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.814457	102	EXECUTED	9:0b305d8d1277f3a89a0a53a659ad274c	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.23.2	\N	\N	4742797226
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2024-08-27 07:13:25.825077	103	EXECUTED	9:2c374ad2cdfe20e2905a84c8fac48460	customChange		\N	4.23.2	\N	\N	4742797226
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2024-08-27 07:13:25.848178	104	EXECUTED	9:47a760639ac597360a8219f5b768b4de	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.23.2	\N	\N	4742797226
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2024-08-27 07:13:25.867083	105	EXECUTED	9:a6272f0576727dd8cad2522335f5d99e	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.23.2	\N	\N	4742797226
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2024-08-27 07:13:25.886516	106	EXECUTED	9:015479dbd691d9cc8669282f4828c41d	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.23.2	\N	\N	4742797226
19.0.0-10135	keycloak	META-INF/jpa-changelog-19.0.0.xml	2024-08-27 07:13:25.894044	107	EXECUTED	9:9518e495fdd22f78ad6425cc30630221	customChange		\N	4.23.2	\N	\N	4742797226
20.0.0-12964-supported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-08-27 07:13:25.923306	108	EXECUTED	9:e5f243877199fd96bcc842f27a1656ac	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	4742797226
20.0.0-12964-unsupported-dbs	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-08-27 07:13:25.9295	109	MARK_RAN	9:1a6fcaa85e20bdeae0a9ce49b41946a5	createIndex indexName=IDX_GROUP_ATT_BY_NAME_VALUE, tableName=GROUP_ATTRIBUTE		\N	4.23.2	\N	\N	4742797226
client-attributes-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-20.0.0.xml	2024-08-27 07:13:25.956251	110	EXECUTED	9:3f332e13e90739ed0c35b0b25b7822ca	addColumn tableName=CLIENT_ATTRIBUTES; update tableName=CLIENT_ATTRIBUTES; dropColumn columnName=VALUE, tableName=CLIENT_ATTRIBUTES; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=CLIENT_ATTRIBUTES		\N	4.23.2	\N	\N	4742797226
21.0.2-17277	keycloak	META-INF/jpa-changelog-21.0.2.xml	2024-08-27 07:13:25.964162	111	EXECUTED	9:7ee1f7a3fb8f5588f171fb9a6ab623c0	customChange		\N	4.23.2	\N	\N	4742797226
21.1.0-19404	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-08-27 07:13:26.234468	112	EXECUTED	9:3d7e830b52f33676b9d64f7f2b2ea634	modifyDataType columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=LOGIC, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=POLICY_ENFORCE_MODE, tableName=RESOURCE_SERVER		\N	4.23.2	\N	\N	4742797226
21.1.0-19404-2	keycloak	META-INF/jpa-changelog-21.1.0.xml	2024-08-27 07:13:26.243727	113	MARK_RAN	9:627d032e3ef2c06c0e1f73d2ae25c26c	addColumn tableName=RESOURCE_SERVER_POLICY; update tableName=RESOURCE_SERVER_POLICY; dropColumn columnName=DECISION_STRATEGY, tableName=RESOURCE_SERVER_POLICY; renameColumn newColumnName=DECISION_STRATEGY, oldColumnName=DECISION_STRATEGY_NEW, tabl...		\N	4.23.2	\N	\N	4742797226
22.0.0-17484-updated	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-08-27 07:13:26.253068	114	EXECUTED	9:90af0bfd30cafc17b9f4d6eccd92b8b3	customChange		\N	4.23.2	\N	\N	4742797226
22.0.5-24031	keycloak	META-INF/jpa-changelog-22.0.0.xml	2024-08-27 07:13:26.256012	115	MARK_RAN	9:a60d2d7b315ec2d3eba9e2f145f9df28	customChange		\N	4.23.2	\N	\N	4742797226
23.0.0-12062	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-08-27 07:13:26.2679	116	EXECUTED	9:2168fbe728fec46ae9baf15bf80927b8	addColumn tableName=COMPONENT_CONFIG; update tableName=COMPONENT_CONFIG; dropColumn columnName=VALUE, tableName=COMPONENT_CONFIG; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=COMPONENT_CONFIG		\N	4.23.2	\N	\N	4742797226
23.0.0-17258	keycloak	META-INF/jpa-changelog-23.0.0.xml	2024-08-27 07:13:26.272003	117	EXECUTED	9:36506d679a83bbfda85a27ea1864dca8	addColumn tableName=EVENT_ENTITY		\N	4.23.2	\N	\N	4742797226
18.0.15-30992-index-consent	keycloak	META-INF/jpa-changelog-18.0.15.xml	2024-08-29 11:49:06.734971	118	EXECUTED	9:80071ede7a05604b1f4906f3bf3b00f0	createIndex indexName=IDX_USCONSENT_SCOPE_ID, tableName=USER_CONSENT_CLIENT_SCOPE		\N	4.25.1	\N	\N	4932146592
24.0.0-9758	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-08-29 11:49:06.823726	119	EXECUTED	9:502c557a5189f600f0f445a9b49ebbce	addColumn tableName=USER_ATTRIBUTE; addColumn tableName=FED_USER_ATTRIBUTE; createIndex indexName=USER_ATTR_LONG_VALUES, tableName=USER_ATTRIBUTE; createIndex indexName=FED_USER_ATTR_LONG_VALUES, tableName=FED_USER_ATTRIBUTE; createIndex indexName...		\N	4.25.1	\N	\N	4932146592
24.0.0-9758-2	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-08-29 11:49:06.853085	120	EXECUTED	9:bf0fdee10afdf597a987adbf291db7b2	customChange		\N	4.25.1	\N	\N	4932146592
24.0.0-26618-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-08-29 11:49:06.868841	121	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4932146592
24.0.0-26618-reindex	keycloak	META-INF/jpa-changelog-24.0.0.xml	2024-08-29 11:49:06.899021	122	EXECUTED	9:08707c0f0db1cef6b352db03a60edc7f	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4932146592
24.0.2-27228	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-08-29 11:49:06.930464	123	EXECUTED	9:eaee11f6b8aa25d2cc6a84fb86fc6238	customChange		\N	4.25.1	\N	\N	4932146592
24.0.2-27967-drop-index-if-present	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-08-29 11:49:06.933719	124	MARK_RAN	9:04baaf56c116ed19951cbc2cca584022	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4932146592
24.0.2-27967-reindex	keycloak	META-INF/jpa-changelog-24.0.2.xml	2024-08-29 11:49:06.939071	125	MARK_RAN	9:d3d977031d431db16e2c181ce49d73e9	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.25.1	\N	\N	4932146592
25.0.0-28265-tables	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:06.964144	126	EXECUTED	9:deda2df035df23388af95bbd36c17cef	addColumn tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_CLIENT_SESSION		\N	4.25.1	\N	\N	4932146592
25.0.0-28265-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:06.983764	127	EXECUTED	9:3e96709818458ae49f3c679ae58d263a	createIndex indexName=IDX_OFFLINE_USS_BY_LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4932146592
25.0.0-28265-index-cleanup	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.03269	128	EXECUTED	9:8c0cfa341a0474385b324f5c4b2dfcc1	dropIndex indexName=IDX_OFFLINE_USS_CREATEDON, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION; dropIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION; dropIndex ...		\N	4.25.1	\N	\N	4932146592
25.0.0-28265-index-2-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.036779	129	MARK_RAN	9:b7ef76036d3126bb83c2423bf4d449d6	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4932146592
25.0.0-28265-index-2-not-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.059255	130	EXECUTED	9:23396cf51ab8bc1ae6f0cac7f9f6fcf7	createIndex indexName=IDX_OFFLINE_USS_BY_BROKER_SESSION_ID, tableName=OFFLINE_USER_SESSION		\N	4.25.1	\N	\N	4932146592
25.0.0-org	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.20826	131	EXECUTED	9:5c859965c2c9b9c72136c360649af157	createTable tableName=ORG; addUniqueConstraint constraintName=UK_ORG_NAME, tableName=ORG; addUniqueConstraint constraintName=UK_ORG_GROUP, tableName=ORG; createTable tableName=ORG_DOMAIN		\N	4.25.1	\N	\N	4932146592
unique-consentuser	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.28804	132	EXECUTED	9:5857626a2ea8767e9a6c66bf3a2cb32f	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.25.1	\N	\N	4932146592
unique-consentuser-mysql	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.29331	133	MARK_RAN	9:b79478aad5adaa1bc428e31563f55e8e	customChange; dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_LOCAL_CONSENT, tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_EXTERNAL_CONSENT, tableName=...		\N	4.25.1	\N	\N	4932146592
25.0.0-28861-index-creation	keycloak	META-INF/jpa-changelog-25.0.0.xml	2024-08-29 11:49:07.347814	134	EXECUTED	9:b9acb58ac958d9ada0fe12a5d4794ab1	createIndex indexName=IDX_PERM_TICKET_REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; createIndex indexName=IDX_PERM_TICKET_OWNER, tableName=RESOURCE_SERVER_PERM_TICKET		\N	4.25.1	\N	\N	4932146592
\.


--
-- TOC entry 4176 (class 0 OID 49154)
-- Dependencies: 215
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- TOC entry 4260 (class 0 OID 50550)
-- Dependencies: 299
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
f99aa1dc-f2b1-4820-a912-450227263613	b40ba9ad-4a97-4c8a-9617-44717c6b6ba0	f
f99aa1dc-f2b1-4820-a912-450227263613	9e9fedc7-ec8e-4fdd-a222-e7616f2a18f2	t
f99aa1dc-f2b1-4820-a912-450227263613	a5b97960-6f5f-4132-bb67-a7051e8397e2	t
f99aa1dc-f2b1-4820-a912-450227263613	d351ddef-76ec-47c7-8f50-c4664e031a0e	t
f99aa1dc-f2b1-4820-a912-450227263613	b840bfa3-132a-4e02-b149-300b6368de98	f
f99aa1dc-f2b1-4820-a912-450227263613	57218572-7a2a-470d-93b4-a3a68a8bb5de	f
f99aa1dc-f2b1-4820-a912-450227263613	27208c72-a2db-4e0a-90f4-116e0f481262	t
f99aa1dc-f2b1-4820-a912-450227263613	452fdcff-d2fe-4ceb-92ab-f87d934f302f	t
f99aa1dc-f2b1-4820-a912-450227263613	a05d75f3-2ae4-485d-94cf-f62bf69ba96d	f
f99aa1dc-f2b1-4820-a912-450227263613	3880a174-0c78-4687-8aaa-ae9d7c9f15d4	t
lsc-sde	2ed35979-216a-499a-b584-f9fd8e007032	f
lsc-sde	374c8259-648e-4d44-9770-0a4c398dcea6	t
lsc-sde	b66f1519-195f-45cf-b0a5-9f1161e41359	t
lsc-sde	27967490-8b88-4fd7-82cf-701f67157570	t
lsc-sde	d2bad27e-e137-413b-880a-9f5867e1378a	f
lsc-sde	e83c2567-4f05-4c86-962b-48b5fabd8ff1	f
lsc-sde	fd832d02-be3c-4046-9580-4a9239cc2c3e	t
lsc-sde	366ba51b-e8ca-4f9e-90af-661c4474edcc	t
lsc-sde	8e16ab6b-5fd3-4263-9d49-4cec4ba86679	f
lsc-sde	43ecf762-4a98-4d6d-9eb0-127817f953df	t
lsc-sde	9512f761-9595-47f5-8794-e5b8c97e82d2	t
lsc-sde	2318c3b6-b908-4ad5-aed3-de0c887dbf39	t
f99aa1dc-f2b1-4820-a912-450227263613	5e5e1fa7-d2da-4618-9163-9df389369b44	t
lsc-sde	b030bd61-cc94-47b5-b8a2-6685db20cfb0	t
lsc-sde	4847dbf3-d340-43c1-86e9-e90e639691c0	t
lsc-sde	5bb6dba7-9128-4fc5-92c4-38bbc93e2946	t
\.


--
-- TOC entry 4183 (class 0 OID 49194)
-- Dependencies: 222
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id, details_json_long_value) FROM stdin;
\.


--
-- TOC entry 4248 (class 0 OID 50249)
-- Dependencies: 287
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
\.


--
-- TOC entry 4249 (class 0 OID 50254)
-- Dependencies: 288
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4262 (class 0 OID 50576)
-- Dependencies: 301
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4250 (class 0 OID 50263)
-- Dependencies: 289
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- TOC entry 4251 (class 0 OID 50272)
-- Dependencies: 290
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4252 (class 0 OID 50275)
-- Dependencies: 291
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4253 (class 0 OID 50281)
-- Dependencies: 292
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- TOC entry 4206 (class 0 OID 49571)
-- Dependencies: 245
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- TOC entry 4256 (class 0 OID 50346)
-- Dependencies: 295
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- TOC entry 4232 (class 0 OID 49973)
-- Dependencies: 271
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- TOC entry 4231 (class 0 OID 49970)
-- Dependencies: 270
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- TOC entry 4207 (class 0 OID 49576)
-- Dependencies: 246
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- TOC entry 4208 (class 0 OID 49585)
-- Dependencies: 247
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4213 (class 0 OID 49689)
-- Dependencies: 252
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4214 (class 0 OID 49694)
-- Dependencies: 253
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4230 (class 0 OID 49967)
-- Dependencies: 269
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- TOC entry 4184 (class 0 OID 49202)
-- Dependencies: 223
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
8c38a6d4-d929-4f3a-a53a-395877120476	f99aa1dc-f2b1-4820-a912-450227263613	f	${role_default-roles}	default-roles-master	f99aa1dc-f2b1-4820-a912-450227263613	\N	\N
c2333286-b659-4636-96d6-03c1c15f6c8e	f99aa1dc-f2b1-4820-a912-450227263613	f	${role_create-realm}	create-realm	f99aa1dc-f2b1-4820-a912-450227263613	\N	\N
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	f99aa1dc-f2b1-4820-a912-450227263613	f	${role_admin}	admin	f99aa1dc-f2b1-4820-a912-450227263613	\N	\N
83e016df-31fc-49e7-b9c0-324eff2830b3	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_create-client}	create-client	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
a0200624-64a6-4d36-a521-1e5ebe8e5e64	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_view-realm}	view-realm	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
265b973a-ff4f-4a40-bf0f-8051869c1b60	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_view-users}	view-users	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
5d1e5b2e-0b3f-4976-93fd-9a43327f377a	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_view-clients}	view-clients	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
405a2999-3fbb-48e5-856e-aac9156aa1b7	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_view-events}	view-events	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
f36eb087-f5ae-4d67-8f3f-52cc476fa779	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_view-identity-providers}	view-identity-providers	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
cff85847-774a-4487-9c25-f0873bf4443c	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_view-authorization}	view-authorization	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
c5fbdd59-8af1-4544-8014-93ebd9615d23	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_manage-realm}	manage-realm	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
38e596f9-144c-4085-aee3-038fcc1d1a0e	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_manage-users}	manage-users	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
bf39b0ae-c0c1-4a0b-b2fb-fa3861d6536b	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_manage-clients}	manage-clients	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
eb6dddc6-7cdf-4519-97bc-3bc84829eac4	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_manage-events}	manage-events	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
40445fb3-5d9c-4897-be6c-b3e422d28f34	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_manage-identity-providers}	manage-identity-providers	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
cf210067-8f3c-4184-917e-5c0d2a791cd9	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_manage-authorization}	manage-authorization	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
e683d1e5-3dc2-466a-99dd-0a6cc9c6dcb0	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_query-users}	query-users	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
e70f0b74-220e-4085-9d44-f49a46745a0b	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_query-clients}	query-clients	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
262efdb9-9ade-452b-9bd3-879ec68e4efd	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_query-realms}	query-realms	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
d90521ee-a37b-4206-a8cd-4e51ad090ad1	lsc-sde	f	${role_default-roles}	default-roles-lsc-sde	lsc-sde	\N	\N
9d1eccae-24f7-4649-87ec-1a52da1ed1fe	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_create-client}	create-client	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
8db5330a-0b93-4f70-987a-b704380566df	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_view-realm}	view-realm	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
cea07935-b348-4c16-a25b-745328cf675e	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_view-users}	view-users	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
e56dc830-abef-45a7-b71a-68136ab2b1d0	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_view-clients}	view-clients	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
3835d219-a00d-449a-a51c-b103a10b0e2b	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_view-events}	view-events	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
a89bfc91-5efc-4f48-8b55-4d932809d625	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_view-identity-providers}	view-identity-providers	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
78f09002-55d0-42eb-bf47-d998f2846a0c	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_view-authorization}	view-authorization	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
eeb1fed8-a20b-48e6-b6a5-30a9237d1be2	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_manage-realm}	manage-realm	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
3a6cb500-c9ff-4c70-a1d3-12bf855ffeab	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_query-groups}	query-groups	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
c9ab0817-c5bb-4f5c-820e-0d213f9f9de7	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_view-profile}	view-profile	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
ffa23dba-fdae-4e61-9c55-07916e2cc72c	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_manage-account}	manage-account	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
615acb84-7114-45d3-9d70-b322cd1e5ac8	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_manage-account-links}	manage-account-links	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
d7793741-229d-40c9-926b-95bf0afb120f	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_view-applications}	view-applications	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
85b0886c-c59d-4452-855b-0dd2f766764a	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_view-consent}	view-consent	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
55001171-9128-453c-bff8-fafb57b980b5	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_manage-consent}	manage-consent	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
06790e6a-361a-40ea-b015-bdce9605ee22	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_view-groups}	view-groups	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
98e87857-0edd-4934-bf64-2fd10c9758e5	d16900ed-96bc-4896-af77-882c0c784bb8	t	${role_delete-account}	delete-account	f99aa1dc-f2b1-4820-a912-450227263613	d16900ed-96bc-4896-af77-882c0c784bb8	\N
73d40aa2-39eb-4463-866a-1d4bc57f2f3c	6039373d-1a1c-4041-88ad-81d13fcb3605	t	${role_read-token}	read-token	f99aa1dc-f2b1-4820-a912-450227263613	6039373d-1a1c-4041-88ad-81d13fcb3605	\N
732f9274-08c7-45e5-8eb0-716fc0f9f241	5f90ed0c-91c0-499f-8154-edd7647d7f58	t	${role_impersonation}	impersonation	f99aa1dc-f2b1-4820-a912-450227263613	5f90ed0c-91c0-499f-8154-edd7647d7f58	\N
954e4afa-9ab0-498d-b681-a7b9a0fff2bd	f99aa1dc-f2b1-4820-a912-450227263613	f	${role_offline-access}	offline_access	f99aa1dc-f2b1-4820-a912-450227263613	\N	\N
835af0fa-12eb-40fb-a7b5-05945d1dc23a	f99aa1dc-f2b1-4820-a912-450227263613	f	${role_uma_authorization}	uma_authorization	f99aa1dc-f2b1-4820-a912-450227263613	\N	\N
ecf0dc62-66e8-45e6-a8d5-ed4da69f9de3	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_manage-users}	manage-users	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
0b612efe-8f96-4cd9-930a-2ae0f16455f2	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_manage-clients}	manage-clients	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
8f39efd2-8f16-4c47-85f8-c540da37054d	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_manage-events}	manage-events	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
0b4d6a6f-fc0c-4bef-95ff-d15d891e64e2	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_manage-identity-providers}	manage-identity-providers	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
10657207-119a-4e4c-b1e7-e0daba5c9484	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_manage-authorization}	manage-authorization	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
13336944-a997-4626-a676-8260dda0bc7d	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_query-users}	query-users	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
28f8bfe3-7243-4772-b6b0-ff0e3c144146	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_query-clients}	query-clients	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
9ce5c905-fd9b-43c3-8685-6f745a03c809	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_query-realms}	query-realms	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
435361ca-1095-4201-9a9c-ddd0cd06471d	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_query-groups}	query-groups	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
c1de922c-e60f-4416-a4fd-9f5d8e4c0698	354de25a-1128-468b-a726-867bd39b4c33	t	${role_realm-admin}	realm-admin	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
2385ecd8-deec-4ce9-a2b8-c503dc2059ab	354de25a-1128-468b-a726-867bd39b4c33	t	${role_create-client}	create-client	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
9890b8fc-be7c-4eb8-aac7-92ed96a1d4cf	354de25a-1128-468b-a726-867bd39b4c33	t	${role_view-realm}	view-realm	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
38bc2569-3708-403f-b746-5771abe43b25	354de25a-1128-468b-a726-867bd39b4c33	t	${role_view-users}	view-users	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
c07bf760-9916-40c7-8d77-d91954462f19	354de25a-1128-468b-a726-867bd39b4c33	t	${role_view-clients}	view-clients	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
7c58dd93-487e-4f02-a08e-e0f9b074d6ec	354de25a-1128-468b-a726-867bd39b4c33	t	${role_view-events}	view-events	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
3f32da9e-7de5-4680-9e5b-eb45e783a4ad	354de25a-1128-468b-a726-867bd39b4c33	t	${role_view-identity-providers}	view-identity-providers	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
2eb88ac0-0754-46e8-89cf-7c40fd8e3c5c	354de25a-1128-468b-a726-867bd39b4c33	t	${role_view-authorization}	view-authorization	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
d0c1f9db-0b21-4b0b-bf60-874215b7cb50	354de25a-1128-468b-a726-867bd39b4c33	t	${role_manage-realm}	manage-realm	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
494f530b-8969-4ed9-8f28-9043cebdefaa	354de25a-1128-468b-a726-867bd39b4c33	t	${role_manage-users}	manage-users	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
2d5850a0-958d-4e0e-be4a-eef6ca89eefa	354de25a-1128-468b-a726-867bd39b4c33	t	${role_manage-clients}	manage-clients	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
4d4d52fd-c665-4fb0-8656-006ebce95675	354de25a-1128-468b-a726-867bd39b4c33	t	${role_manage-events}	manage-events	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
4452eb90-1e2f-471e-ab40-5aba8394a5e0	354de25a-1128-468b-a726-867bd39b4c33	t	${role_manage-identity-providers}	manage-identity-providers	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
bab24537-ab1d-4c1f-bc0e-d9bc41b6613d	354de25a-1128-468b-a726-867bd39b4c33	t	${role_manage-authorization}	manage-authorization	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
e2a30b2f-1bbe-4603-b2be-a169a8d9b756	354de25a-1128-468b-a726-867bd39b4c33	t	${role_query-users}	query-users	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
743164b0-6b03-4251-a007-8c5b03c78edc	354de25a-1128-468b-a726-867bd39b4c33	t	${role_query-clients}	query-clients	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
1c3a33ec-3cea-4cdc-a060-e8b7b2f3a995	354de25a-1128-468b-a726-867bd39b4c33	t	${role_query-realms}	query-realms	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
c90f8b3a-6cae-4fcb-afb7-faea46ac4157	354de25a-1128-468b-a726-867bd39b4c33	t	${role_query-groups}	query-groups	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
786f5620-92bb-487f-abd8-307305ddf3f9	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_view-profile}	view-profile	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
a2ea4cb3-7976-4354-8e30-e7e24855a388	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_manage-account}	manage-account	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
ca7e1158-a6b5-4efa-b4e0-72316832fe5f	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_manage-account-links}	manage-account-links	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
0646c825-d16a-41eb-b5cb-32347a192108	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_view-applications}	view-applications	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
3b9fa51b-8e5f-48de-b37f-ddac12a2df84	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_view-consent}	view-consent	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
7636c65a-5c78-481b-87bb-06ed87ab7001	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_manage-consent}	manage-consent	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
5785d330-d9e9-4747-8cb4-81906b86d31b	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_view-groups}	view-groups	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
3d5cc990-5463-4411-ab88-677952c0520e	c4f43793-9562-448d-a44f-412fedd8e021	t	${role_delete-account}	delete-account	lsc-sde	c4f43793-9562-448d-a44f-412fedd8e021	\N
31a111cd-7f62-4331-b7d0-343a55b53922	6c08232b-efec-4c9c-b349-26fb70b09c59	t	${role_impersonation}	impersonation	f99aa1dc-f2b1-4820-a912-450227263613	6c08232b-efec-4c9c-b349-26fb70b09c59	\N
bc2030f0-3561-4612-a43f-fab89e971827	354de25a-1128-468b-a726-867bd39b4c33	t	${role_impersonation}	impersonation	lsc-sde	354de25a-1128-468b-a726-867bd39b4c33	\N
2c518538-020d-47e4-9098-f5109188f68b	3498b894-3628-4122-8454-509b8eb80ab3	t	${role_read-token}	read-token	lsc-sde	3498b894-3628-4122-8454-509b8eb80ab3	\N
84472d55-4874-4c2a-8f9f-4f6a26fb5811	lsc-sde	f	${role_offline-access}	offline_access	lsc-sde	\N	\N
d220f193-3b4a-4444-bb8f-fd5b4cfc49f3	9db82257-cb10-4b8c-bfe5-4417ed09eab6	t	\N	uma_protection	lsc-sde	9db82257-cb10-4b8c-bfe5-4417ed09eab6	\N
14803da4-860e-406b-a75f-c04f06bd26ca	lsc-sde	f	${role_uma_authorization}	uma_authorization	lsc-sde	\N	\N
1c7cc2c2-10a6-45a8-b2d3-c63c9140336f	lsc-sde	f		jupyter-admins	lsc-sde	\N	\N
e4ea91f2-875f-4e75-b8d1-08cf4eed2226	lsc-sde	f		jupyter-users	lsc-sde	\N	\N
f67dc3f9-8582-4845-8f7b-84e27e2c2396	lsc-sde	f		guacamole-admin	lsc-sde	\N	\N
\.


--
-- TOC entry 4212 (class 0 OID 49686)
-- Dependencies: 251
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.migration_model (id, version, update_time) FROM stdin;
aixvo	23.0.4	1724742806
5xicr	25.0.4	1724932149
\.


--
-- TOC entry 4229 (class 0 OID 49958)
-- Dependencies: 268
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id, version) FROM stdin;
\.


--
-- TOC entry 4228 (class 0 OID 49953)
-- Dependencies: 267
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh, broker_session_id, version) FROM stdin;
\.


--
-- TOC entry 4268 (class 0 OID 57761)
-- Dependencies: 307
-- Data for Name: org; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org (id, enabled, realm_id, group_id, name, description) FROM stdin;
\.


--
-- TOC entry 4269 (class 0 OID 57772)
-- Dependencies: 308
-- Data for Name: org_domain; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.org_domain (id, name, verified, org_id) FROM stdin;
\.


--
-- TOC entry 4242 (class 0 OID 50172)
-- Dependencies: 281
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
\.


--
-- TOC entry 4204 (class 0 OID 49560)
-- Dependencies: 243
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
8f8de0ef-bdb3-47b2-b76f-8a120958657c	audience resolve	openid-connect	oidc-audience-resolve-mapper	9915d853-4d77-4b1f-8457-2a463162ce9c	\N
cf6883ea-3334-442a-99ee-9cf088267da9	locale	openid-connect	oidc-usermodel-attribute-mapper	f531a235-7cae-4f9f-8852-84f0d4e58628	\N
44a87dab-67bc-47a3-b27e-301de1226200	role list	saml	saml-role-list-mapper	\N	9e9fedc7-ec8e-4fdd-a222-e7616f2a18f2
e256014b-0465-40de-8ded-83d00802a9aa	full name	openid-connect	oidc-full-name-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
4acf145e-e8f6-4abd-a976-604080bdc5cc	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
1078bf97-2952-410b-acb5-4e578434e2a4	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
db33115f-4845-493d-82e1-fc11f4e9dc11	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
99c56fcb-6d20-4783-8b30-3f72fad1dbea	username	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
2b42ea29-222d-43bf-b69c-3a1219c7dd76	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
0d963cdf-f028-4052-8808-79ea661eae42	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
7349e962-1302-4d12-a4ed-e66b5b6ef318	website	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
407ee40e-a69f-4cf3-817d-f27f1dab36cd	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
9dbcdcde-1967-468a-9230-11aa5d06b689	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
f707106f-d2c3-4158-94d5-e588fc150be3	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
eac77811-7f69-4225-9803-8b9034a84159	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	a5b97960-6f5f-4132-bb67-a7051e8397e2
529d0c94-9393-4a47-ae4d-a4d3272408e7	email	openid-connect	oidc-usermodel-attribute-mapper	\N	d351ddef-76ec-47c7-8f50-c4664e031a0e
42daec36-9c27-4191-bc3d-e2169f7abbf6	email verified	openid-connect	oidc-usermodel-property-mapper	\N	d351ddef-76ec-47c7-8f50-c4664e031a0e
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	address	openid-connect	oidc-address-mapper	\N	b840bfa3-132a-4e02-b149-300b6368de98
7583ed3d-7053-4e2f-8def-abcfa72a72c6	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	57218572-7a2a-470d-93b4-a3a68a8bb5de
c311f01f-6248-4cd6-8450-82c6796f2314	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	57218572-7a2a-470d-93b4-a3a68a8bb5de
39b3e292-3f33-42a7-9f19-abde97042ab8	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	27208c72-a2db-4e0a-90f4-116e0f481262
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	27208c72-a2db-4e0a-90f4-116e0f481262
dc75a804-4e61-4912-b464-eb971594b0f1	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	27208c72-a2db-4e0a-90f4-116e0f481262
29596d02-82ff-45d4-b5e6-964de9e78361	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	452fdcff-d2fe-4ceb-92ab-f87d934f302f
60461cd2-ec40-450d-a6fa-0726860774fd	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	a05d75f3-2ae4-485d-94cf-f62bf69ba96d
157ffe7d-40bf-4120-820e-356628261f88	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	a05d75f3-2ae4-485d-94cf-f62bf69ba96d
41ea5a96-4dea-478a-bef1-b9fed127b6ee	acr loa level	openid-connect	oidc-acr-mapper	\N	3880a174-0c78-4687-8aaa-ae9d7c9f15d4
711598ea-984c-4220-8f4a-6080fbcfc932	audience resolve	openid-connect	oidc-audience-resolve-mapper	8752e5c1-5f97-433b-b2ab-658b6e5c21ef	\N
9a31919f-b020-49e7-873f-c2cabe6fe7c8	role list	saml	saml-role-list-mapper	\N	374c8259-648e-4d44-9770-0a4c398dcea6
1661a80d-3fca-4a57-9be7-226e623351ea	full name	openid-connect	oidc-full-name-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
8581e9bd-63a0-432a-8ac5-5a25e82ec582	family name	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	given name	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
0a881bc3-d598-48d9-bbe3-4054edca154f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
009e7f66-6985-4932-9508-f5e38c9811b9	username	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
2000e515-375b-45e2-8ddd-c736cabd4811	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
da752b46-5e83-4194-9544-1991e2d886d3	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
d864b578-58b9-4de7-b05d-e34ee8807dca	website	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
3848905e-1709-4ea9-9c59-dbc315f01f08	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
2055c28a-7523-4209-a5f0-6177bef9de2b	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
748e27c8-e91d-41df-9309-2270c4c78eb3	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
f22602db-9641-49fc-85d8-c91a15e289bd	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	b66f1519-195f-45cf-b0a5-9f1161e41359
54c87f8c-af0a-405c-a67b-91a6f1c56eae	email	openid-connect	oidc-usermodel-attribute-mapper	\N	27967490-8b88-4fd7-82cf-701f67157570
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	email verified	openid-connect	oidc-usermodel-property-mapper	\N	27967490-8b88-4fd7-82cf-701f67157570
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	address	openid-connect	oidc-address-mapper	\N	d2bad27e-e137-413b-880a-9f5867e1378a
b9afac36-6c57-4c8d-af8d-e44710fe40cb	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	e83c2567-4f05-4c86-962b-48b5fabd8ff1
11eae167-7c56-42d3-a258-925b312389c5	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	e83c2567-4f05-4c86-962b-48b5fabd8ff1
466695ce-63a6-4aa6-840d-5ee63c8bca53	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	fd832d02-be3c-4046-9580-4a9239cc2c3e
9a563ece-fbd7-4d63-96f4-531a56e847f3	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	fd832d02-be3c-4046-9580-4a9239cc2c3e
97ac819a-4c40-4c4a-8878-1c669e82c462	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	fd832d02-be3c-4046-9580-4a9239cc2c3e
e6984dc2-33e5-4773-b14a-46ea443e80a8	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	366ba51b-e8ca-4f9e-90af-661c4474edcc
432d2e2f-482c-4786-a748-139632b86bd6	upn	openid-connect	oidc-usermodel-attribute-mapper	\N	8e16ab6b-5fd3-4263-9d49-4cec4ba86679
140ea89c-e11e-487a-8ba6-808572e3cd15	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	8e16ab6b-5fd3-4263-9d49-4cec4ba86679
f24ae15a-a34d-4062-8101-a10ea5fb9259	acr loa level	openid-connect	oidc-acr-mapper	\N	43ecf762-4a98-4d6d-9eb0-127817f953df
71d97877-9398-406b-92a4-9078802423c3	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	9db82257-cb10-4b8c-bfe5-4417ed09eab6	\N
5f4e9e72-2ed5-4845-b936-18e7561db861	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	9db82257-cb10-4b8c-bfe5-4417ed09eab6	\N
819fbb75-c369-4b58-82a8-dfc3cf3c506a	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	9db82257-cb10-4b8c-bfe5-4417ed09eab6	\N
dd001d04-6869-4474-9c1e-e0938317dda2	locale	openid-connect	oidc-usermodel-attribute-mapper	91bddfee-ddb6-4434-a774-179625ffe54b	\N
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	9512f761-9595-47f5-8794-e5b8c97e82d2
a341afae-6bbd-4176-821b-06262b0c49b6	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	2318c3b6-b908-4ad5-aed3-de0c887dbf39
961ddb58-0151-49b4-abfe-58d9fd6a798a	sub	openid-connect	oidc-sub-mapper	\N	2318c3b6-b908-4ad5-aed3-de0c887dbf39
a16f1748-a22b-47a5-9b83-20556a6fcf8e	auth_time	openid-connect	oidc-usersessionmodel-note-mapper	\N	5e5e1fa7-d2da-4618-9163-9df389369b44
72f19987-88c9-4b6e-a9ae-59a161762b8f	sub	openid-connect	oidc-sub-mapper	\N	5e5e1fa7-d2da-4618-9163-9df389369b44
ba8b0956-a131-4bc3-804a-924009982747	workspace_id	openid-connect	oidc-usermodel-attribute-mapper	\N	b030bd61-cc94-47b5-b8a2-6685db20cfb0
b0cf59b4-c86c-4f08-8210-4505efab1bbc	workspace_name	openid-connect	oidc-usermodel-attribute-mapper	\N	4847dbf3-d340-43c1-86e9-e90e639691c0
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	workspace_id_formatted	openid-connect	oidc-usermodel-attribute-mapper	\N	5bb6dba7-9128-4fc5-92c4-38bbc93e2946
\.


--
-- TOC entry 4205 (class 0 OID 49566)
-- Dependencies: 244
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
cf6883ea-3334-442a-99ee-9cf088267da9	true	introspection.token.claim
cf6883ea-3334-442a-99ee-9cf088267da9	true	userinfo.token.claim
cf6883ea-3334-442a-99ee-9cf088267da9	locale	user.attribute
cf6883ea-3334-442a-99ee-9cf088267da9	true	id.token.claim
cf6883ea-3334-442a-99ee-9cf088267da9	true	access.token.claim
cf6883ea-3334-442a-99ee-9cf088267da9	locale	claim.name
cf6883ea-3334-442a-99ee-9cf088267da9	String	jsonType.label
44a87dab-67bc-47a3-b27e-301de1226200	false	single
44a87dab-67bc-47a3-b27e-301de1226200	Basic	attribute.nameformat
44a87dab-67bc-47a3-b27e-301de1226200	Role	attribute.name
0d963cdf-f028-4052-8808-79ea661eae42	true	introspection.token.claim
0d963cdf-f028-4052-8808-79ea661eae42	true	userinfo.token.claim
0d963cdf-f028-4052-8808-79ea661eae42	picture	user.attribute
0d963cdf-f028-4052-8808-79ea661eae42	true	id.token.claim
0d963cdf-f028-4052-8808-79ea661eae42	true	access.token.claim
0d963cdf-f028-4052-8808-79ea661eae42	picture	claim.name
0d963cdf-f028-4052-8808-79ea661eae42	String	jsonType.label
1078bf97-2952-410b-acb5-4e578434e2a4	true	introspection.token.claim
1078bf97-2952-410b-acb5-4e578434e2a4	true	userinfo.token.claim
1078bf97-2952-410b-acb5-4e578434e2a4	middleName	user.attribute
1078bf97-2952-410b-acb5-4e578434e2a4	true	id.token.claim
1078bf97-2952-410b-acb5-4e578434e2a4	true	access.token.claim
1078bf97-2952-410b-acb5-4e578434e2a4	middle_name	claim.name
1078bf97-2952-410b-acb5-4e578434e2a4	String	jsonType.label
2b42ea29-222d-43bf-b69c-3a1219c7dd76	true	introspection.token.claim
2b42ea29-222d-43bf-b69c-3a1219c7dd76	true	userinfo.token.claim
2b42ea29-222d-43bf-b69c-3a1219c7dd76	profile	user.attribute
2b42ea29-222d-43bf-b69c-3a1219c7dd76	true	id.token.claim
2b42ea29-222d-43bf-b69c-3a1219c7dd76	true	access.token.claim
2b42ea29-222d-43bf-b69c-3a1219c7dd76	profile	claim.name
2b42ea29-222d-43bf-b69c-3a1219c7dd76	String	jsonType.label
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	true	introspection.token.claim
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	true	userinfo.token.claim
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	firstName	user.attribute
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	true	id.token.claim
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	true	access.token.claim
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	given_name	claim.name
2cdc150a-6c41-4aa8-bdf4-55dd601799a3	String	jsonType.label
407ee40e-a69f-4cf3-817d-f27f1dab36cd	true	introspection.token.claim
407ee40e-a69f-4cf3-817d-f27f1dab36cd	true	userinfo.token.claim
407ee40e-a69f-4cf3-817d-f27f1dab36cd	gender	user.attribute
407ee40e-a69f-4cf3-817d-f27f1dab36cd	true	id.token.claim
407ee40e-a69f-4cf3-817d-f27f1dab36cd	true	access.token.claim
407ee40e-a69f-4cf3-817d-f27f1dab36cd	gender	claim.name
407ee40e-a69f-4cf3-817d-f27f1dab36cd	String	jsonType.label
4acf145e-e8f6-4abd-a976-604080bdc5cc	true	introspection.token.claim
4acf145e-e8f6-4abd-a976-604080bdc5cc	true	userinfo.token.claim
4acf145e-e8f6-4abd-a976-604080bdc5cc	lastName	user.attribute
4acf145e-e8f6-4abd-a976-604080bdc5cc	true	id.token.claim
4acf145e-e8f6-4abd-a976-604080bdc5cc	true	access.token.claim
4acf145e-e8f6-4abd-a976-604080bdc5cc	family_name	claim.name
4acf145e-e8f6-4abd-a976-604080bdc5cc	String	jsonType.label
7349e962-1302-4d12-a4ed-e66b5b6ef318	true	introspection.token.claim
7349e962-1302-4d12-a4ed-e66b5b6ef318	true	userinfo.token.claim
7349e962-1302-4d12-a4ed-e66b5b6ef318	website	user.attribute
7349e962-1302-4d12-a4ed-e66b5b6ef318	true	id.token.claim
7349e962-1302-4d12-a4ed-e66b5b6ef318	true	access.token.claim
7349e962-1302-4d12-a4ed-e66b5b6ef318	website	claim.name
7349e962-1302-4d12-a4ed-e66b5b6ef318	String	jsonType.label
99c56fcb-6d20-4783-8b30-3f72fad1dbea	true	introspection.token.claim
99c56fcb-6d20-4783-8b30-3f72fad1dbea	true	userinfo.token.claim
99c56fcb-6d20-4783-8b30-3f72fad1dbea	username	user.attribute
99c56fcb-6d20-4783-8b30-3f72fad1dbea	true	id.token.claim
99c56fcb-6d20-4783-8b30-3f72fad1dbea	true	access.token.claim
99c56fcb-6d20-4783-8b30-3f72fad1dbea	preferred_username	claim.name
99c56fcb-6d20-4783-8b30-3f72fad1dbea	String	jsonType.label
9dbcdcde-1967-468a-9230-11aa5d06b689	true	introspection.token.claim
9dbcdcde-1967-468a-9230-11aa5d06b689	true	userinfo.token.claim
9dbcdcde-1967-468a-9230-11aa5d06b689	birthdate	user.attribute
9dbcdcde-1967-468a-9230-11aa5d06b689	true	id.token.claim
9dbcdcde-1967-468a-9230-11aa5d06b689	true	access.token.claim
9dbcdcde-1967-468a-9230-11aa5d06b689	birthdate	claim.name
9dbcdcde-1967-468a-9230-11aa5d06b689	String	jsonType.label
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	true	introspection.token.claim
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	true	userinfo.token.claim
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	locale	user.attribute
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	true	id.token.claim
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	true	access.token.claim
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	locale	claim.name
9e299cc1-9733-4f0c-9b15-bc69b93e9bb9	String	jsonType.label
db33115f-4845-493d-82e1-fc11f4e9dc11	true	introspection.token.claim
db33115f-4845-493d-82e1-fc11f4e9dc11	true	userinfo.token.claim
db33115f-4845-493d-82e1-fc11f4e9dc11	nickname	user.attribute
db33115f-4845-493d-82e1-fc11f4e9dc11	true	id.token.claim
db33115f-4845-493d-82e1-fc11f4e9dc11	true	access.token.claim
db33115f-4845-493d-82e1-fc11f4e9dc11	nickname	claim.name
db33115f-4845-493d-82e1-fc11f4e9dc11	String	jsonType.label
e256014b-0465-40de-8ded-83d00802a9aa	true	introspection.token.claim
e256014b-0465-40de-8ded-83d00802a9aa	true	userinfo.token.claim
e256014b-0465-40de-8ded-83d00802a9aa	true	id.token.claim
e256014b-0465-40de-8ded-83d00802a9aa	true	access.token.claim
eac77811-7f69-4225-9803-8b9034a84159	true	introspection.token.claim
eac77811-7f69-4225-9803-8b9034a84159	true	userinfo.token.claim
eac77811-7f69-4225-9803-8b9034a84159	updatedAt	user.attribute
eac77811-7f69-4225-9803-8b9034a84159	true	id.token.claim
eac77811-7f69-4225-9803-8b9034a84159	true	access.token.claim
eac77811-7f69-4225-9803-8b9034a84159	updated_at	claim.name
eac77811-7f69-4225-9803-8b9034a84159	long	jsonType.label
f707106f-d2c3-4158-94d5-e588fc150be3	true	introspection.token.claim
f707106f-d2c3-4158-94d5-e588fc150be3	true	userinfo.token.claim
f707106f-d2c3-4158-94d5-e588fc150be3	zoneinfo	user.attribute
f707106f-d2c3-4158-94d5-e588fc150be3	true	id.token.claim
f707106f-d2c3-4158-94d5-e588fc150be3	true	access.token.claim
f707106f-d2c3-4158-94d5-e588fc150be3	zoneinfo	claim.name
f707106f-d2c3-4158-94d5-e588fc150be3	String	jsonType.label
42daec36-9c27-4191-bc3d-e2169f7abbf6	true	introspection.token.claim
42daec36-9c27-4191-bc3d-e2169f7abbf6	true	userinfo.token.claim
42daec36-9c27-4191-bc3d-e2169f7abbf6	emailVerified	user.attribute
42daec36-9c27-4191-bc3d-e2169f7abbf6	true	id.token.claim
42daec36-9c27-4191-bc3d-e2169f7abbf6	true	access.token.claim
42daec36-9c27-4191-bc3d-e2169f7abbf6	email_verified	claim.name
42daec36-9c27-4191-bc3d-e2169f7abbf6	boolean	jsonType.label
529d0c94-9393-4a47-ae4d-a4d3272408e7	true	introspection.token.claim
529d0c94-9393-4a47-ae4d-a4d3272408e7	true	userinfo.token.claim
529d0c94-9393-4a47-ae4d-a4d3272408e7	email	user.attribute
529d0c94-9393-4a47-ae4d-a4d3272408e7	true	id.token.claim
529d0c94-9393-4a47-ae4d-a4d3272408e7	true	access.token.claim
529d0c94-9393-4a47-ae4d-a4d3272408e7	email	claim.name
529d0c94-9393-4a47-ae4d-a4d3272408e7	String	jsonType.label
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	formatted	user.attribute.formatted
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	country	user.attribute.country
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	true	introspection.token.claim
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	postal_code	user.attribute.postal_code
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	true	userinfo.token.claim
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	street	user.attribute.street
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	true	id.token.claim
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	region	user.attribute.region
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	true	access.token.claim
32a29b75-9b8a-4e0b-a3e5-bce643e898a7	locality	user.attribute.locality
7583ed3d-7053-4e2f-8def-abcfa72a72c6	true	introspection.token.claim
7583ed3d-7053-4e2f-8def-abcfa72a72c6	true	userinfo.token.claim
7583ed3d-7053-4e2f-8def-abcfa72a72c6	phoneNumber	user.attribute
7583ed3d-7053-4e2f-8def-abcfa72a72c6	true	id.token.claim
7583ed3d-7053-4e2f-8def-abcfa72a72c6	true	access.token.claim
7583ed3d-7053-4e2f-8def-abcfa72a72c6	phone_number	claim.name
7583ed3d-7053-4e2f-8def-abcfa72a72c6	String	jsonType.label
c311f01f-6248-4cd6-8450-82c6796f2314	true	introspection.token.claim
c311f01f-6248-4cd6-8450-82c6796f2314	true	userinfo.token.claim
c311f01f-6248-4cd6-8450-82c6796f2314	phoneNumberVerified	user.attribute
c311f01f-6248-4cd6-8450-82c6796f2314	true	id.token.claim
c311f01f-6248-4cd6-8450-82c6796f2314	true	access.token.claim
c311f01f-6248-4cd6-8450-82c6796f2314	phone_number_verified	claim.name
c311f01f-6248-4cd6-8450-82c6796f2314	boolean	jsonType.label
39b3e292-3f33-42a7-9f19-abde97042ab8	true	introspection.token.claim
39b3e292-3f33-42a7-9f19-abde97042ab8	true	multivalued
39b3e292-3f33-42a7-9f19-abde97042ab8	foo	user.attribute
39b3e292-3f33-42a7-9f19-abde97042ab8	true	access.token.claim
39b3e292-3f33-42a7-9f19-abde97042ab8	realm_access.roles	claim.name
39b3e292-3f33-42a7-9f19-abde97042ab8	String	jsonType.label
dc75a804-4e61-4912-b464-eb971594b0f1	true	introspection.token.claim
dc75a804-4e61-4912-b464-eb971594b0f1	true	access.token.claim
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	true	introspection.token.claim
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	true	multivalued
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	foo	user.attribute
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	true	access.token.claim
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	resource_access.${client_id}.roles	claim.name
dc798fa8-aeb1-4d3a-9311-cfe51370fb8c	String	jsonType.label
29596d02-82ff-45d4-b5e6-964de9e78361	true	introspection.token.claim
29596d02-82ff-45d4-b5e6-964de9e78361	true	access.token.claim
157ffe7d-40bf-4120-820e-356628261f88	true	introspection.token.claim
157ffe7d-40bf-4120-820e-356628261f88	true	multivalued
157ffe7d-40bf-4120-820e-356628261f88	foo	user.attribute
157ffe7d-40bf-4120-820e-356628261f88	true	id.token.claim
157ffe7d-40bf-4120-820e-356628261f88	true	access.token.claim
157ffe7d-40bf-4120-820e-356628261f88	groups	claim.name
157ffe7d-40bf-4120-820e-356628261f88	String	jsonType.label
60461cd2-ec40-450d-a6fa-0726860774fd	true	introspection.token.claim
60461cd2-ec40-450d-a6fa-0726860774fd	true	userinfo.token.claim
60461cd2-ec40-450d-a6fa-0726860774fd	username	user.attribute
60461cd2-ec40-450d-a6fa-0726860774fd	true	id.token.claim
60461cd2-ec40-450d-a6fa-0726860774fd	true	access.token.claim
60461cd2-ec40-450d-a6fa-0726860774fd	upn	claim.name
60461cd2-ec40-450d-a6fa-0726860774fd	String	jsonType.label
41ea5a96-4dea-478a-bef1-b9fed127b6ee	true	introspection.token.claim
41ea5a96-4dea-478a-bef1-b9fed127b6ee	true	id.token.claim
41ea5a96-4dea-478a-bef1-b9fed127b6ee	true	access.token.claim
9a31919f-b020-49e7-873f-c2cabe6fe7c8	false	single
9a31919f-b020-49e7-873f-c2cabe6fe7c8	Basic	attribute.nameformat
9a31919f-b020-49e7-873f-c2cabe6fe7c8	Role	attribute.name
009e7f66-6985-4932-9508-f5e38c9811b9	true	introspection.token.claim
009e7f66-6985-4932-9508-f5e38c9811b9	true	userinfo.token.claim
009e7f66-6985-4932-9508-f5e38c9811b9	username	user.attribute
009e7f66-6985-4932-9508-f5e38c9811b9	true	id.token.claim
009e7f66-6985-4932-9508-f5e38c9811b9	true	access.token.claim
009e7f66-6985-4932-9508-f5e38c9811b9	preferred_username	claim.name
009e7f66-6985-4932-9508-f5e38c9811b9	String	jsonType.label
0a881bc3-d598-48d9-bbe3-4054edca154f	true	introspection.token.claim
0a881bc3-d598-48d9-bbe3-4054edca154f	true	userinfo.token.claim
0a881bc3-d598-48d9-bbe3-4054edca154f	nickname	user.attribute
0a881bc3-d598-48d9-bbe3-4054edca154f	true	id.token.claim
0a881bc3-d598-48d9-bbe3-4054edca154f	true	access.token.claim
0a881bc3-d598-48d9-bbe3-4054edca154f	nickname	claim.name
0a881bc3-d598-48d9-bbe3-4054edca154f	String	jsonType.label
1661a80d-3fca-4a57-9be7-226e623351ea	true	introspection.token.claim
1661a80d-3fca-4a57-9be7-226e623351ea	true	userinfo.token.claim
1661a80d-3fca-4a57-9be7-226e623351ea	true	id.token.claim
1661a80d-3fca-4a57-9be7-226e623351ea	true	access.token.claim
2000e515-375b-45e2-8ddd-c736cabd4811	true	introspection.token.claim
2000e515-375b-45e2-8ddd-c736cabd4811	true	userinfo.token.claim
2000e515-375b-45e2-8ddd-c736cabd4811	profile	user.attribute
2000e515-375b-45e2-8ddd-c736cabd4811	true	id.token.claim
2000e515-375b-45e2-8ddd-c736cabd4811	true	access.token.claim
2000e515-375b-45e2-8ddd-c736cabd4811	profile	claim.name
2000e515-375b-45e2-8ddd-c736cabd4811	String	jsonType.label
2055c28a-7523-4209-a5f0-6177bef9de2b	true	introspection.token.claim
2055c28a-7523-4209-a5f0-6177bef9de2b	true	userinfo.token.claim
2055c28a-7523-4209-a5f0-6177bef9de2b	birthdate	user.attribute
2055c28a-7523-4209-a5f0-6177bef9de2b	true	id.token.claim
2055c28a-7523-4209-a5f0-6177bef9de2b	true	access.token.claim
2055c28a-7523-4209-a5f0-6177bef9de2b	birthdate	claim.name
2055c28a-7523-4209-a5f0-6177bef9de2b	String	jsonType.label
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	true	introspection.token.claim
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	true	userinfo.token.claim
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	firstName	user.attribute
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	true	id.token.claim
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	true	access.token.claim
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	given_name	claim.name
2da0a5fe-970d-4b59-a9ce-fb7a979e2418	String	jsonType.label
3848905e-1709-4ea9-9c59-dbc315f01f08	true	introspection.token.claim
3848905e-1709-4ea9-9c59-dbc315f01f08	true	userinfo.token.claim
3848905e-1709-4ea9-9c59-dbc315f01f08	gender	user.attribute
3848905e-1709-4ea9-9c59-dbc315f01f08	true	id.token.claim
3848905e-1709-4ea9-9c59-dbc315f01f08	true	access.token.claim
3848905e-1709-4ea9-9c59-dbc315f01f08	gender	claim.name
3848905e-1709-4ea9-9c59-dbc315f01f08	String	jsonType.label
748e27c8-e91d-41df-9309-2270c4c78eb3	true	introspection.token.claim
748e27c8-e91d-41df-9309-2270c4c78eb3	true	userinfo.token.claim
748e27c8-e91d-41df-9309-2270c4c78eb3	locale	user.attribute
748e27c8-e91d-41df-9309-2270c4c78eb3	true	id.token.claim
748e27c8-e91d-41df-9309-2270c4c78eb3	true	access.token.claim
748e27c8-e91d-41df-9309-2270c4c78eb3	locale	claim.name
748e27c8-e91d-41df-9309-2270c4c78eb3	String	jsonType.label
8581e9bd-63a0-432a-8ac5-5a25e82ec582	true	introspection.token.claim
8581e9bd-63a0-432a-8ac5-5a25e82ec582	true	userinfo.token.claim
8581e9bd-63a0-432a-8ac5-5a25e82ec582	lastName	user.attribute
8581e9bd-63a0-432a-8ac5-5a25e82ec582	true	id.token.claim
8581e9bd-63a0-432a-8ac5-5a25e82ec582	true	access.token.claim
8581e9bd-63a0-432a-8ac5-5a25e82ec582	family_name	claim.name
8581e9bd-63a0-432a-8ac5-5a25e82ec582	String	jsonType.label
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	true	introspection.token.claim
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	true	userinfo.token.claim
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	zoneinfo	user.attribute
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	true	id.token.claim
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	true	access.token.claim
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	zoneinfo	claim.name
aaad6ef2-250e-4f5e-9e32-dee2fe3ed7e3	String	jsonType.label
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	true	introspection.token.claim
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	true	userinfo.token.claim
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	middleName	user.attribute
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	true	id.token.claim
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	true	access.token.claim
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	middle_name	claim.name
b3ce1b85-98b4-4813-9c98-79eaf2fcb3d4	String	jsonType.label
d864b578-58b9-4de7-b05d-e34ee8807dca	true	introspection.token.claim
d864b578-58b9-4de7-b05d-e34ee8807dca	true	userinfo.token.claim
d864b578-58b9-4de7-b05d-e34ee8807dca	website	user.attribute
d864b578-58b9-4de7-b05d-e34ee8807dca	true	id.token.claim
d864b578-58b9-4de7-b05d-e34ee8807dca	true	access.token.claim
d864b578-58b9-4de7-b05d-e34ee8807dca	website	claim.name
d864b578-58b9-4de7-b05d-e34ee8807dca	String	jsonType.label
da752b46-5e83-4194-9544-1991e2d886d3	true	introspection.token.claim
da752b46-5e83-4194-9544-1991e2d886d3	true	userinfo.token.claim
da752b46-5e83-4194-9544-1991e2d886d3	picture	user.attribute
da752b46-5e83-4194-9544-1991e2d886d3	true	id.token.claim
da752b46-5e83-4194-9544-1991e2d886d3	true	access.token.claim
da752b46-5e83-4194-9544-1991e2d886d3	picture	claim.name
da752b46-5e83-4194-9544-1991e2d886d3	String	jsonType.label
f22602db-9641-49fc-85d8-c91a15e289bd	true	introspection.token.claim
f22602db-9641-49fc-85d8-c91a15e289bd	true	userinfo.token.claim
f22602db-9641-49fc-85d8-c91a15e289bd	updatedAt	user.attribute
f22602db-9641-49fc-85d8-c91a15e289bd	true	id.token.claim
f22602db-9641-49fc-85d8-c91a15e289bd	true	access.token.claim
f22602db-9641-49fc-85d8-c91a15e289bd	updated_at	claim.name
f22602db-9641-49fc-85d8-c91a15e289bd	long	jsonType.label
54c87f8c-af0a-405c-a67b-91a6f1c56eae	true	introspection.token.claim
54c87f8c-af0a-405c-a67b-91a6f1c56eae	true	userinfo.token.claim
54c87f8c-af0a-405c-a67b-91a6f1c56eae	email	user.attribute
54c87f8c-af0a-405c-a67b-91a6f1c56eae	true	id.token.claim
54c87f8c-af0a-405c-a67b-91a6f1c56eae	true	access.token.claim
54c87f8c-af0a-405c-a67b-91a6f1c56eae	email	claim.name
54c87f8c-af0a-405c-a67b-91a6f1c56eae	String	jsonType.label
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	true	introspection.token.claim
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	true	userinfo.token.claim
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	emailVerified	user.attribute
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	true	id.token.claim
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	true	access.token.claim
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	email_verified	claim.name
88d480c0-f02a-4d93-8b7e-8cba5c1e3311	boolean	jsonType.label
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	formatted	user.attribute.formatted
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	country	user.attribute.country
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	true	introspection.token.claim
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	postal_code	user.attribute.postal_code
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	true	userinfo.token.claim
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	street	user.attribute.street
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	true	id.token.claim
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	region	user.attribute.region
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	true	access.token.claim
229c2351-cda3-47a2-9b5c-4efdae4fd2c6	locality	user.attribute.locality
11eae167-7c56-42d3-a258-925b312389c5	true	introspection.token.claim
11eae167-7c56-42d3-a258-925b312389c5	true	userinfo.token.claim
11eae167-7c56-42d3-a258-925b312389c5	phoneNumberVerified	user.attribute
11eae167-7c56-42d3-a258-925b312389c5	true	id.token.claim
11eae167-7c56-42d3-a258-925b312389c5	true	access.token.claim
11eae167-7c56-42d3-a258-925b312389c5	phone_number_verified	claim.name
11eae167-7c56-42d3-a258-925b312389c5	boolean	jsonType.label
b9afac36-6c57-4c8d-af8d-e44710fe40cb	true	introspection.token.claim
b9afac36-6c57-4c8d-af8d-e44710fe40cb	true	userinfo.token.claim
b9afac36-6c57-4c8d-af8d-e44710fe40cb	phoneNumber	user.attribute
b9afac36-6c57-4c8d-af8d-e44710fe40cb	true	id.token.claim
b9afac36-6c57-4c8d-af8d-e44710fe40cb	true	access.token.claim
b9afac36-6c57-4c8d-af8d-e44710fe40cb	phone_number	claim.name
b9afac36-6c57-4c8d-af8d-e44710fe40cb	String	jsonType.label
466695ce-63a6-4aa6-840d-5ee63c8bca53	true	introspection.token.claim
466695ce-63a6-4aa6-840d-5ee63c8bca53	true	multivalued
466695ce-63a6-4aa6-840d-5ee63c8bca53	foo	user.attribute
466695ce-63a6-4aa6-840d-5ee63c8bca53	true	access.token.claim
466695ce-63a6-4aa6-840d-5ee63c8bca53	realm_access.roles	claim.name
466695ce-63a6-4aa6-840d-5ee63c8bca53	String	jsonType.label
97ac819a-4c40-4c4a-8878-1c669e82c462	true	introspection.token.claim
97ac819a-4c40-4c4a-8878-1c669e82c462	true	access.token.claim
9a563ece-fbd7-4d63-96f4-531a56e847f3	true	introspection.token.claim
9a563ece-fbd7-4d63-96f4-531a56e847f3	true	multivalued
9a563ece-fbd7-4d63-96f4-531a56e847f3	foo	user.attribute
9a563ece-fbd7-4d63-96f4-531a56e847f3	true	access.token.claim
9a563ece-fbd7-4d63-96f4-531a56e847f3	resource_access.${client_id}.roles	claim.name
9a563ece-fbd7-4d63-96f4-531a56e847f3	String	jsonType.label
e6984dc2-33e5-4773-b14a-46ea443e80a8	true	introspection.token.claim
e6984dc2-33e5-4773-b14a-46ea443e80a8	true	access.token.claim
140ea89c-e11e-487a-8ba6-808572e3cd15	true	introspection.token.claim
140ea89c-e11e-487a-8ba6-808572e3cd15	true	multivalued
140ea89c-e11e-487a-8ba6-808572e3cd15	foo	user.attribute
140ea89c-e11e-487a-8ba6-808572e3cd15	true	id.token.claim
140ea89c-e11e-487a-8ba6-808572e3cd15	true	access.token.claim
140ea89c-e11e-487a-8ba6-808572e3cd15	groups	claim.name
140ea89c-e11e-487a-8ba6-808572e3cd15	String	jsonType.label
432d2e2f-482c-4786-a748-139632b86bd6	true	introspection.token.claim
432d2e2f-482c-4786-a748-139632b86bd6	true	userinfo.token.claim
432d2e2f-482c-4786-a748-139632b86bd6	username	user.attribute
432d2e2f-482c-4786-a748-139632b86bd6	true	id.token.claim
432d2e2f-482c-4786-a748-139632b86bd6	true	access.token.claim
432d2e2f-482c-4786-a748-139632b86bd6	upn	claim.name
432d2e2f-482c-4786-a748-139632b86bd6	String	jsonType.label
f24ae15a-a34d-4062-8101-a10ea5fb9259	true	introspection.token.claim
f24ae15a-a34d-4062-8101-a10ea5fb9259	true	id.token.claim
f24ae15a-a34d-4062-8101-a10ea5fb9259	true	access.token.claim
5f4e9e72-2ed5-4845-b936-18e7561db861	clientHost	user.session.note
5f4e9e72-2ed5-4845-b936-18e7561db861	true	introspection.token.claim
5f4e9e72-2ed5-4845-b936-18e7561db861	true	id.token.claim
5f4e9e72-2ed5-4845-b936-18e7561db861	true	access.token.claim
5f4e9e72-2ed5-4845-b936-18e7561db861	clientHost	claim.name
5f4e9e72-2ed5-4845-b936-18e7561db861	String	jsonType.label
71d97877-9398-406b-92a4-9078802423c3	client_id	user.session.note
71d97877-9398-406b-92a4-9078802423c3	true	introspection.token.claim
71d97877-9398-406b-92a4-9078802423c3	true	id.token.claim
71d97877-9398-406b-92a4-9078802423c3	true	access.token.claim
71d97877-9398-406b-92a4-9078802423c3	client_id	claim.name
71d97877-9398-406b-92a4-9078802423c3	String	jsonType.label
819fbb75-c369-4b58-82a8-dfc3cf3c506a	clientAddress	user.session.note
819fbb75-c369-4b58-82a8-dfc3cf3c506a	true	introspection.token.claim
819fbb75-c369-4b58-82a8-dfc3cf3c506a	true	id.token.claim
819fbb75-c369-4b58-82a8-dfc3cf3c506a	true	access.token.claim
819fbb75-c369-4b58-82a8-dfc3cf3c506a	clientAddress	claim.name
819fbb75-c369-4b58-82a8-dfc3cf3c506a	String	jsonType.label
dd001d04-6869-4474-9c1e-e0938317dda2	true	introspection.token.claim
dd001d04-6869-4474-9c1e-e0938317dda2	true	userinfo.token.claim
dd001d04-6869-4474-9c1e-e0938317dda2	locale	user.attribute
dd001d04-6869-4474-9c1e-e0938317dda2	true	id.token.claim
dd001d04-6869-4474-9c1e-e0938317dda2	true	access.token.claim
dd001d04-6869-4474-9c1e-e0938317dda2	locale	claim.name
dd001d04-6869-4474-9c1e-e0938317dda2	String	jsonType.label
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	true	introspection.token.claim
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	true	multivalued
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	foo	user.attribute
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	true	id.token.claim
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	true	access.token.claim
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	groups	claim.name
71d2a345-7b7a-420c-9e62-c2dcc0e108d2	String	jsonType.label
961ddb58-0151-49b4-abfe-58d9fd6a798a	true	introspection.token.claim
961ddb58-0151-49b4-abfe-58d9fd6a798a	true	access.token.claim
a341afae-6bbd-4176-821b-06262b0c49b6	AUTH_TIME	user.session.note
a341afae-6bbd-4176-821b-06262b0c49b6	true	introspection.token.claim
a341afae-6bbd-4176-821b-06262b0c49b6	true	id.token.claim
a341afae-6bbd-4176-821b-06262b0c49b6	true	access.token.claim
a341afae-6bbd-4176-821b-06262b0c49b6	auth_time	claim.name
a341afae-6bbd-4176-821b-06262b0c49b6	long	jsonType.label
72f19987-88c9-4b6e-a9ae-59a161762b8f	true	introspection.token.claim
72f19987-88c9-4b6e-a9ae-59a161762b8f	true	access.token.claim
a16f1748-a22b-47a5-9b83-20556a6fcf8e	AUTH_TIME	user.session.note
a16f1748-a22b-47a5-9b83-20556a6fcf8e	true	introspection.token.claim
a16f1748-a22b-47a5-9b83-20556a6fcf8e	true	id.token.claim
a16f1748-a22b-47a5-9b83-20556a6fcf8e	true	access.token.claim
a16f1748-a22b-47a5-9b83-20556a6fcf8e	auth_time	claim.name
a16f1748-a22b-47a5-9b83-20556a6fcf8e	long	jsonType.label
ba8b0956-a131-4bc3-804a-924009982747	true	introspection.token.claim
ba8b0956-a131-4bc3-804a-924009982747	true	userinfo.token.claim
ba8b0956-a131-4bc3-804a-924009982747	workspace_id	user.attribute
ba8b0956-a131-4bc3-804a-924009982747	true	id.token.claim
ba8b0956-a131-4bc3-804a-924009982747	false	lightweight.claim
ba8b0956-a131-4bc3-804a-924009982747	true	access.token.claim
ba8b0956-a131-4bc3-804a-924009982747	workspace_id	claim.name
ba8b0956-a131-4bc3-804a-924009982747	String	jsonType.label
b0cf59b4-c86c-4f08-8210-4505efab1bbc	true	introspection.token.claim
b0cf59b4-c86c-4f08-8210-4505efab1bbc	true	userinfo.token.claim
b0cf59b4-c86c-4f08-8210-4505efab1bbc	workspace_name	user.attribute
b0cf59b4-c86c-4f08-8210-4505efab1bbc	true	id.token.claim
b0cf59b4-c86c-4f08-8210-4505efab1bbc	false	lightweight.claim
b0cf59b4-c86c-4f08-8210-4505efab1bbc	true	access.token.claim
b0cf59b4-c86c-4f08-8210-4505efab1bbc	String	jsonType.label
b0cf59b4-c86c-4f08-8210-4505efab1bbc	false	aggregate.attrs
b0cf59b4-c86c-4f08-8210-4505efab1bbc	false	multivalued
b0cf59b4-c86c-4f08-8210-4505efab1bbc	workspace_name	claim.name
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	true	introspection.token.claim
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	true	userinfo.token.claim
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	workspace_id_formatted	user.attribute
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	true	id.token.claim
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	false	lightweight.claim
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	true	access.token.claim
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	workspace_id	claim.name
4778c5d7-f9ec-4467-b8d7-6b26c9fb474d	String	jsonType.label
\.


--
-- TOC entry 4185 (class 0 OID 49208)
-- Dependencies: 224
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
lsc-sde	60	300	300	\N	\N	\N	t	t	3600	\N	lsc-sde	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	6c08232b-efec-4c9c-b349-26fb70b09c59	1800	f	\N	f	t	f	f	0	1	30	6	HmacSHA1	totp	e719f37a-eb49-4ba9-b2de-fc993c12138b	c3294b65-dde4-4489-8c11-03949f436d36	879df8b1-98ad-42d2-91e5-6f8efa86b61f	41814deb-f4b2-4e92-befe-59a800759466	27162f58-b959-46fa-babb-70824c933152	2592000	f	900	t	f	66c4611e-7364-4dfb-a510-644034e908c8	0	f	0	0	d90521ee-a37b-4206-a8cd-4e51ad090ad1
f99aa1dc-f2b1-4820-a912-450227263613	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	5f90ed0c-91c0-499f-8154-edd7647d7f58	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	091a67f5-0812-460c-984a-49afd042ce70	5249c9f2-d37f-47b1-8438-b128144360d9	8e80301f-f287-45a0-8afd-bcb71ae2b2da	9575c53d-84b3-44f1-98a4-3d6dac58745d	4e679209-a18f-4815-9047-afee0e64eea1	2592000	f	900	t	f	3d53b51f-4db6-4cdc-b4fe-6a7f7c6c1259	0	f	0	0	8c38a6d4-d929-4f3a-a53a-395877120476
\.


--
-- TOC entry 4186 (class 0 OID 49225)
-- Dependencies: 225
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
_browser_header.contentSecurityPolicyReportOnly	f99aa1dc-f2b1-4820-a912-450227263613	
_browser_header.xContentTypeOptions	f99aa1dc-f2b1-4820-a912-450227263613	nosniff
_browser_header.referrerPolicy	f99aa1dc-f2b1-4820-a912-450227263613	no-referrer
_browser_header.xRobotsTag	f99aa1dc-f2b1-4820-a912-450227263613	none
_browser_header.xFrameOptions	f99aa1dc-f2b1-4820-a912-450227263613	SAMEORIGIN
_browser_header.contentSecurityPolicy	f99aa1dc-f2b1-4820-a912-450227263613	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	f99aa1dc-f2b1-4820-a912-450227263613	1; mode=block
_browser_header.strictTransportSecurity	f99aa1dc-f2b1-4820-a912-450227263613	max-age=31536000; includeSubDomains
bruteForceProtected	f99aa1dc-f2b1-4820-a912-450227263613	false
permanentLockout	f99aa1dc-f2b1-4820-a912-450227263613	false
maxFailureWaitSeconds	f99aa1dc-f2b1-4820-a912-450227263613	900
minimumQuickLoginWaitSeconds	f99aa1dc-f2b1-4820-a912-450227263613	60
waitIncrementSeconds	f99aa1dc-f2b1-4820-a912-450227263613	60
quickLoginCheckMilliSeconds	f99aa1dc-f2b1-4820-a912-450227263613	1000
maxDeltaTimeSeconds	f99aa1dc-f2b1-4820-a912-450227263613	43200
failureFactor	f99aa1dc-f2b1-4820-a912-450227263613	30
realmReusableOtpCode	f99aa1dc-f2b1-4820-a912-450227263613	false
displayName	f99aa1dc-f2b1-4820-a912-450227263613	Keycloak
displayNameHtml	f99aa1dc-f2b1-4820-a912-450227263613	<div class="kc-logo-text"><span>Keycloak</span></div>
defaultSignatureAlgorithm	f99aa1dc-f2b1-4820-a912-450227263613	RS256
offlineSessionMaxLifespanEnabled	f99aa1dc-f2b1-4820-a912-450227263613	false
offlineSessionMaxLifespan	f99aa1dc-f2b1-4820-a912-450227263613	5184000
firstBrokerLoginFlowId	lsc-sde	b7d541a0-e83c-4e92-9f20-c244122a648e
firstBrokerLoginFlowId	f99aa1dc-f2b1-4820-a912-450227263613	fe424eae-1577-4f27-84f6-0e4942ddacb7
realmReusableOtpCode	lsc-sde	false
oauth2DeviceCodeLifespan	lsc-sde	600
oauth2DevicePollingInterval	lsc-sde	5
cibaBackchannelTokenDeliveryMode	lsc-sde	poll
cibaExpiresIn	lsc-sde	120
cibaInterval	lsc-sde	5
cibaAuthRequestedUserHint	lsc-sde	login_hint
parRequestUriLifespan	lsc-sde	60
adminEventsExpiration	lsc-sde	3600
displayName	lsc-sde	Lancashire and South Cumbria Secure Data Environment
bruteForceProtected	lsc-sde	false
permanentLockout	lsc-sde	false
maxFailureWaitSeconds	lsc-sde	900
minimumQuickLoginWaitSeconds	lsc-sde	60
waitIncrementSeconds	lsc-sde	60
quickLoginCheckMilliSeconds	lsc-sde	1000
maxDeltaTimeSeconds	lsc-sde	43200
failureFactor	lsc-sde	30
actionTokenGeneratedByAdminLifespan	lsc-sde	43200
actionTokenGeneratedByUserLifespan	lsc-sde	300
defaultSignatureAlgorithm	lsc-sde	RS256
offlineSessionMaxLifespanEnabled	lsc-sde	false
offlineSessionMaxLifespan	lsc-sde	5184000
clientSessionIdleTimeout	lsc-sde	0
clientSessionMaxLifespan	lsc-sde	0
clientOfflineSessionIdleTimeout	lsc-sde	0
clientOfflineSessionMaxLifespan	lsc-sde	0
webAuthnPolicyRpEntityName	lsc-sde	keycloak
webAuthnPolicySignatureAlgorithms	lsc-sde	ES256
webAuthnPolicyRpId	lsc-sde	
webAuthnPolicyAttestationConveyancePreference	lsc-sde	not specified
webAuthnPolicyAuthenticatorAttachment	lsc-sde	not specified
webAuthnPolicyRequireResidentKey	lsc-sde	not specified
webAuthnPolicyUserVerificationRequirement	lsc-sde	not specified
webAuthnPolicyCreateTimeout	lsc-sde	0
webAuthnPolicyAvoidSameAuthenticatorRegister	lsc-sde	false
webAuthnPolicyRpEntityNamePasswordless	lsc-sde	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	lsc-sde	ES256
webAuthnPolicyRpIdPasswordless	lsc-sde	
webAuthnPolicyAttestationConveyancePreferencePasswordless	lsc-sde	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	lsc-sde	not specified
webAuthnPolicyRequireResidentKeyPasswordless	lsc-sde	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	lsc-sde	not specified
webAuthnPolicyCreateTimeoutPasswordless	lsc-sde	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	lsc-sde	false
client-policies.profiles	lsc-sde	{"profiles":[]}
client-policies.policies	lsc-sde	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	lsc-sde	
_browser_header.xContentTypeOptions	lsc-sde	nosniff
_browser_header.referrerPolicy	lsc-sde	no-referrer
_browser_header.xRobotsTag	lsc-sde	none
_browser_header.xFrameOptions	lsc-sde	SAMEORIGIN
_browser_header.contentSecurityPolicy	lsc-sde	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	lsc-sde	1; mode=block
_browser_header.strictTransportSecurity	lsc-sde	max-age=31536000; includeSubDomains
\.


--
-- TOC entry 4234 (class 0 OID 49982)
-- Dependencies: 273
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- TOC entry 4211 (class 0 OID 49678)
-- Dependencies: 250
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
lsc-sde	UPDATE_CONSENT_ERROR
lsc-sde	SEND_RESET_PASSWORD
lsc-sde	GRANT_CONSENT
lsc-sde	VERIFY_PROFILE_ERROR
lsc-sde	UPDATE_TOTP
lsc-sde	REMOVE_TOTP
lsc-sde	REVOKE_GRANT
lsc-sde	LOGIN_ERROR
lsc-sde	CLIENT_LOGIN
lsc-sde	RESET_PASSWORD_ERROR
lsc-sde	IMPERSONATE_ERROR
lsc-sde	CODE_TO_TOKEN_ERROR
lsc-sde	CUSTOM_REQUIRED_ACTION
lsc-sde	OAUTH2_DEVICE_CODE_TO_TOKEN_ERROR
lsc-sde	RESTART_AUTHENTICATION
lsc-sde	UPDATE_PROFILE_ERROR
lsc-sde	IMPERSONATE
lsc-sde	LOGIN
lsc-sde	UPDATE_PASSWORD_ERROR
lsc-sde	OAUTH2_DEVICE_VERIFY_USER_CODE
lsc-sde	CLIENT_INITIATED_ACCOUNT_LINKING
lsc-sde	USER_DISABLED_BY_PERMANENT_LOCKOUT
lsc-sde	TOKEN_EXCHANGE
lsc-sde	REGISTER
lsc-sde	LOGOUT
lsc-sde	AUTHREQID_TO_TOKEN
lsc-sde	DELETE_ACCOUNT_ERROR
lsc-sde	CLIENT_REGISTER
lsc-sde	IDENTITY_PROVIDER_LINK_ACCOUNT
lsc-sde	UPDATE_PASSWORD
lsc-sde	DELETE_ACCOUNT
lsc-sde	FEDERATED_IDENTITY_LINK_ERROR
lsc-sde	CLIENT_DELETE
lsc-sde	IDENTITY_PROVIDER_FIRST_LOGIN
lsc-sde	VERIFY_EMAIL
lsc-sde	CLIENT_DELETE_ERROR
lsc-sde	CLIENT_LOGIN_ERROR
lsc-sde	RESTART_AUTHENTICATION_ERROR
lsc-sde	REMOVE_FEDERATED_IDENTITY_ERROR
lsc-sde	EXECUTE_ACTIONS
lsc-sde	TOKEN_EXCHANGE_ERROR
lsc-sde	PERMISSION_TOKEN
lsc-sde	SEND_IDENTITY_PROVIDER_LINK_ERROR
lsc-sde	EXECUTE_ACTION_TOKEN_ERROR
lsc-sde	SEND_VERIFY_EMAIL
lsc-sde	OAUTH2_DEVICE_AUTH
lsc-sde	EXECUTE_ACTIONS_ERROR
lsc-sde	REMOVE_FEDERATED_IDENTITY
lsc-sde	OAUTH2_DEVICE_CODE_TO_TOKEN
lsc-sde	IDENTITY_PROVIDER_POST_LOGIN
lsc-sde	IDENTITY_PROVIDER_LINK_ACCOUNT_ERROR
lsc-sde	UPDATE_EMAIL
lsc-sde	OAUTH2_DEVICE_VERIFY_USER_CODE_ERROR
lsc-sde	REGISTER_ERROR
lsc-sde	REVOKE_GRANT_ERROR
lsc-sde	LOGOUT_ERROR
lsc-sde	UPDATE_EMAIL_ERROR
lsc-sde	EXECUTE_ACTION_TOKEN
lsc-sde	CLIENT_UPDATE_ERROR
lsc-sde	UPDATE_PROFILE
lsc-sde	AUTHREQID_TO_TOKEN_ERROR
lsc-sde	FEDERATED_IDENTITY_LINK
lsc-sde	CLIENT_REGISTER_ERROR
lsc-sde	SEND_VERIFY_EMAIL_ERROR
lsc-sde	SEND_IDENTITY_PROVIDER_LINK
lsc-sde	RESET_PASSWORD
lsc-sde	CLIENT_INITIATED_ACCOUNT_LINKING_ERROR
lsc-sde	OAUTH2_DEVICE_AUTH_ERROR
lsc-sde	UPDATE_CONSENT
lsc-sde	REMOVE_TOTP_ERROR
lsc-sde	VERIFY_EMAIL_ERROR
lsc-sde	SEND_RESET_PASSWORD_ERROR
lsc-sde	CLIENT_UPDATE
lsc-sde	IDENTITY_PROVIDER_POST_LOGIN_ERROR
lsc-sde	CUSTOM_REQUIRED_ACTION_ERROR
lsc-sde	UPDATE_TOTP_ERROR
lsc-sde	CODE_TO_TOKEN
lsc-sde	VERIFY_PROFILE
lsc-sde	GRANT_CONSENT_ERROR
lsc-sde	IDENTITY_PROVIDER_FIRST_LOGIN_ERROR
\.


--
-- TOC entry 4187 (class 0 OID 49233)
-- Dependencies: 226
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
f99aa1dc-f2b1-4820-a912-450227263613	jboss-logging
lsc-sde	jboss-logging
lsc-sde	email
\.


--
-- TOC entry 4267 (class 0 OID 50684)
-- Dependencies: 306
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- TOC entry 4188 (class 0 OID 49236)
-- Dependencies: 227
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	f99aa1dc-f2b1-4820-a912-450227263613
password	password	t	t	lsc-sde
\.


--
-- TOC entry 4189 (class 0 OID 49243)
-- Dependencies: 228
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- TOC entry 4209 (class 0 OID 49594)
-- Dependencies: 248
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- TOC entry 4190 (class 0 OID 49253)
-- Dependencies: 229
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.redirect_uris (client_id, value) FROM stdin;
d16900ed-96bc-4896-af77-882c0c784bb8	/realms/master/account/*
9915d853-4d77-4b1f-8457-2a463162ce9c	/realms/master/account/*
f531a235-7cae-4f9f-8852-84f0d4e58628	/admin/master/console/*
c4f43793-9562-448d-a44f-412fedd8e021	/realms/lsc-sde/account/*
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	/realms/lsc-sde/account/*
91bddfee-ddb6-4434-a774-179625ffe54b	/admin/lsc-sde/console/*
9db82257-cb10-4b8c-bfe5-4417ed09eab6	*
4b8efa9f-d47d-4173-8be4-295248734273	https://guacamole.xlscsde.local/*
\.


--
-- TOC entry 4227 (class 0 OID 49917)
-- Dependencies: 266
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- TOC entry 4226 (class 0 OID 49910)
-- Dependencies: 265
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
ad6c1709-9020-4ecf-ae07-c4f1082ccf93	VERIFY_EMAIL	Verify Email	f99aa1dc-f2b1-4820-a912-450227263613	t	f	VERIFY_EMAIL	50
57a1f84d-559c-4715-ac02-d5ab17a89720	UPDATE_PROFILE	Update Profile	f99aa1dc-f2b1-4820-a912-450227263613	t	f	UPDATE_PROFILE	40
83f5e720-d218-42b5-a659-b31aa7b31325	CONFIGURE_TOTP	Configure OTP	f99aa1dc-f2b1-4820-a912-450227263613	t	f	CONFIGURE_TOTP	10
aaea9ef6-3e07-41e9-b715-6538615db0ae	UPDATE_PASSWORD	Update Password	f99aa1dc-f2b1-4820-a912-450227263613	t	f	UPDATE_PASSWORD	30
62e17014-0703-4bc5-ab7d-46a3aee83bea	TERMS_AND_CONDITIONS	Terms and Conditions	f99aa1dc-f2b1-4820-a912-450227263613	f	f	TERMS_AND_CONDITIONS	20
bc63f6b7-8f1e-498a-a2bb-d77dad46e445	delete_account	Delete Account	f99aa1dc-f2b1-4820-a912-450227263613	f	f	delete_account	60
8da951c0-6414-484b-8836-2bdea3d444e3	update_user_locale	Update User Locale	f99aa1dc-f2b1-4820-a912-450227263613	t	f	update_user_locale	1000
c3e38a16-f3aa-42f5-a4e8-8acbf31c04a6	webauthn-register	Webauthn Register	f99aa1dc-f2b1-4820-a912-450227263613	t	f	webauthn-register	70
ab8f7185-3dd8-401e-9b2b-b72085749ebf	webauthn-register-passwordless	Webauthn Register Passwordless	f99aa1dc-f2b1-4820-a912-450227263613	t	f	webauthn-register-passwordless	80
c0cefeaa-4e0e-4b51-b4a4-aca780567f2e	VERIFY_EMAIL	Verify Email	lsc-sde	t	f	VERIFY_EMAIL	50
cf730909-dd01-4369-b092-593298a78995	UPDATE_PROFILE	Update Profile	lsc-sde	t	f	UPDATE_PROFILE	40
3b4136db-7b41-47fb-9e28-67e986b11f2d	CONFIGURE_TOTP	Configure OTP	lsc-sde	t	f	CONFIGURE_TOTP	10
bd6d2ef8-821c-4f2d-a69a-65b68a65eb2c	UPDATE_PASSWORD	Update Password	lsc-sde	t	f	UPDATE_PASSWORD	30
5f792c3b-78c1-4a40-97d4-645aa2c4e67c	TERMS_AND_CONDITIONS	Terms and Conditions	lsc-sde	f	f	TERMS_AND_CONDITIONS	20
a210997b-7f7c-4fb8-beef-4ed41938165f	delete_account	Delete Account	lsc-sde	f	f	delete_account	60
25d84d27-0e05-4cb3-9424-27f633b36430	update_user_locale	Update User Locale	lsc-sde	t	f	update_user_locale	1000
c88e4410-d3c5-4f87-b945-f4c6faa9c897	webauthn-register	Webauthn Register	lsc-sde	t	f	webauthn-register	70
09b52cf6-5a95-4ea2-971e-7961a151837e	webauthn-register-passwordless	Webauthn Register Passwordless	lsc-sde	t	f	webauthn-register-passwordless	80
0a56baa8-2029-44b9-a325-c3ae62b6a4c4	delete_credential	Delete Credential	lsc-sde	t	f	delete_credential	100
36b43e7b-8498-4db4-993c-93690815c205	delete_credential	Delete Credential	f99aa1dc-f2b1-4820-a912-450227263613	t	f	delete_credential	100
6d19ba5e-ea7c-49bc-a66e-f8d90e4c2d2e	workspace	Please select your workspace	lsc-sde	t	t	workspace	1001
\.


--
-- TOC entry 4264 (class 0 OID 50615)
-- Dependencies: 303
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- TOC entry 4244 (class 0 OID 50199)
-- Dependencies: 283
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4243 (class 0 OID 50184)
-- Dependencies: 282
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4238 (class 0 OID 50122)
-- Dependencies: 277
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
9db82257-cb10-4b8c-bfe5-4417ed09eab6	t	0	1
\.


--
-- TOC entry 4263 (class 0 OID 50591)
-- Dependencies: 302
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4241 (class 0 OID 50158)
-- Dependencies: 280
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
\.


--
-- TOC entry 4239 (class 0 OID 50130)
-- Dependencies: 278
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
\.


--
-- TOC entry 4240 (class 0 OID 50144)
-- Dependencies: 279
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
\.


--
-- TOC entry 4265 (class 0 OID 50633)
-- Dependencies: 304
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.resource_uris (resource_id, value) FROM stdin;
\.


--
-- TOC entry 4266 (class 0 OID 50643)
-- Dependencies: 305
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- TOC entry 4191 (class 0 OID 49256)
-- Dependencies: 230
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
9915d853-4d77-4b1f-8457-2a463162ce9c	ffa23dba-fdae-4e61-9c55-07916e2cc72c
9915d853-4d77-4b1f-8457-2a463162ce9c	06790e6a-361a-40ea-b015-bdce9605ee22
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	a2ea4cb3-7976-4354-8e30-e7e24855a388
8752e5c1-5f97-433b-b2ab-658b6e5c21ef	5785d330-d9e9-4747-8cb4-81906b86d31b
\.


--
-- TOC entry 4245 (class 0 OID 50214)
-- Dependencies: 284
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
\.


--
-- TOC entry 4193 (class 0 OID 49262)
-- Dependencies: 232
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_attribute (name, value, user_id, id, long_value_hash, long_value_hash_lower_case, long_value) FROM stdin;
workspace_binding	default-generic-workspace-jovyan	4d302489-4eb5-4280-93bc-6be629c80b2c	f92ae8b3-6427-4ab2-9bb2-64cfc76c26cd	\N	\N	\N
workspace_name	default-generic-workspace	4d302489-4eb5-4280-93bc-6be629c80b2c	5c479947-8a0f-4f5d-abce-82fa5c09b41a	\N	\N	\N
workspace_id	default-generic-workspace\\jovyan	4d302489-4eb5-4280-93bc-6be629c80b2c	a1f113a2-2eb2-474d-a28a-48c75ed79507	\N	\N	\N
workspace_id_formatted	default-generic-workspace@jovyan	4d302489-4eb5-4280-93bc-6be629c80b2c	2161d12b-a3a0-4e54-ab39-cc11c37efe7b	\N	\N	\N
workspace_assigned_session	ab2a648d-9cf8-4462-8417-153a2ccc5cfb	4d302489-4eb5-4280-93bc-6be629c80b2c	274d68e2-292e-41d9-88b2-17bfb5669e0b	\N	\N	\N
\.


--
-- TOC entry 4215 (class 0 OID 49699)
-- Dependencies: 254
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- TOC entry 4261 (class 0 OID 50566)
-- Dependencies: 300
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- TOC entry 4194 (class 0 OID 49267)
-- Dependencies: 233
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
f314d3d8-b5d8-4be0-849c-44839ab05418	\N	641e3341-bc39-4a04-8444-5599369a2824	f	t	\N	\N	\N	f99aa1dc-f2b1-4820-a912-450227263613	admin	1724742808237	\N	0
8339cba8-12f7-4fb5-b012-bb893aadd0f8	\N	a33d156c-c8c6-419b-8614-5f156b6983d6	f	t	\N	\N	\N	lsc-sde	service-account-jupyter	1724748442561	9db82257-cb10-4b8c-bfe5-4417ed09eab6	0
4d302489-4eb5-4280-93bc-6be629c80b2c	\N	4716fe18-f086-4617-877b-2213a5665bd9	t	t	\N	\N	\N	lsc-sde	jovyan	1724761584270	\N	0
485ecbfe-4983-47d4-a703-013c0efd31bb	\N	13356b48-90c1-433e-98fa-245cbfc92b2b	f	t	\N	Guacamole	Admin	lsc-sde	guacadmin	1724929827844	\N	0
\.


--
-- TOC entry 4195 (class 0 OID 49275)
-- Dependencies: 234
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- TOC entry 4222 (class 0 OID 49811)
-- Dependencies: 261
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- TOC entry 4223 (class 0 OID 49816)
-- Dependencies: 262
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- TOC entry 4196 (class 0 OID 49280)
-- Dependencies: 235
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- TOC entry 4233 (class 0 OID 49979)
-- Dependencies: 272
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- TOC entry 4197 (class 0 OID 49285)
-- Dependencies: 236
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- TOC entry 4198 (class 0 OID 49288)
-- Dependencies: 237
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
8c38a6d4-d929-4f3a-a53a-395877120476	f314d3d8-b5d8-4be0-849c-44839ab05418
f804dbdf-f4ea-4a85-8de8-8b3dc711764a	f314d3d8-b5d8-4be0-849c-44839ab05418
d90521ee-a37b-4206-a8cd-4e51ad090ad1	8339cba8-12f7-4fb5-b012-bb893aadd0f8
d220f193-3b4a-4444-bb8f-fd5b4cfc49f3	8339cba8-12f7-4fb5-b012-bb893aadd0f8
d90521ee-a37b-4206-a8cd-4e51ad090ad1	4d302489-4eb5-4280-93bc-6be629c80b2c
1c7cc2c2-10a6-45a8-b2d3-c63c9140336f	4d302489-4eb5-4280-93bc-6be629c80b2c
e4ea91f2-875f-4e75-b8d1-08cf4eed2226	4d302489-4eb5-4280-93bc-6be629c80b2c
d90521ee-a37b-4206-a8cd-4e51ad090ad1	485ecbfe-4983-47d4-a703-013c0efd31bb
f67dc3f9-8582-4845-8f7b-84e27e2c2396	485ecbfe-4983-47d4-a703-013c0efd31bb
\.


--
-- TOC entry 4199 (class 0 OID 49291)
-- Dependencies: 238
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- TOC entry 4210 (class 0 OID 49597)
-- Dependencies: 249
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- TOC entry 4192 (class 0 OID 49259)
-- Dependencies: 231
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- TOC entry 4200 (class 0 OID 49302)
-- Dependencies: 239
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: keycloak
--

COPY public.web_origins (client_id, value) FROM stdin;
f531a235-7cae-4f9f-8852-84f0d4e58628	+
91bddfee-ddb6-4434-a774-179625ffe54b	+
9db82257-cb10-4b8c-bfe5-4417ed09eab6	https://jupyter.xlscsde.local
4b8efa9f-d47d-4173-8be4-295248734273	https://guacamole.xlscsde.local
\.


--
-- TOC entry 3700 (class 2606 OID 50358)
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- TOC entry 3958 (class 2606 OID 57778)
-- Name: org_domain ORG_DOMAIN_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org_domain
    ADD CONSTRAINT "ORG_DOMAIN_pkey" PRIMARY KEY (id, name);


--
-- TOC entry 3952 (class 2606 OID 57767)
-- Name: org ORG_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT "ORG_pkey" PRIMARY KEY (id);


--
-- TOC entry 3673 (class 2606 OID 50667)
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- TOC entry 3921 (class 2606 OID 50497)
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- TOC entry 3923 (class 2606 OID 50696)
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- TOC entry 3918 (class 2606 OID 50372)
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- TOC entry 3833 (class 2606 OID 50020)
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- TOC entry 3881 (class 2606 OID 50295)
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3804 (class 2606 OID 49929)
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- TOC entry 3909 (class 2606 OID 50315)
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- TOC entry 3912 (class 2606 OID 50313)
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- TOC entry 3901 (class 2606 OID 50311)
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3883 (class 2606 OID 50297)
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3888 (class 2606 OID 50299)
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- TOC entry 3893 (class 2606 OID 50305)
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- TOC entry 3897 (class 2606 OID 50307)
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3905 (class 2606 OID 50309)
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3916 (class 2606 OID 50352)
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- TOC entry 3835 (class 2606 OID 50456)
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- TOC entry 3761 (class 2606 OID 50473)
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- TOC entry 3687 (class 2606 OID 50475)
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- TOC entry 3756 (class 2606 OID 50477)
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- TOC entry 3749 (class 2606 OID 49606)
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- TOC entry 3732 (class 2606 OID 49540)
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- TOC entry 3670 (class 2606 OID 49314)
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- TOC entry 3745 (class 2606 OID 49608)
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- TOC entry 3679 (class 2606 OID 49316)
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- TOC entry 3661 (class 2606 OID 49318)
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- TOC entry 3727 (class 2606 OID 49320)
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- TOC entry 3718 (class 2606 OID 49322)
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- TOC entry 3735 (class 2606 OID 49542)
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- TOC entry 3653 (class 2606 OID 49326)
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- TOC entry 3658 (class 2606 OID 49328)
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- TOC entry 3697 (class 2606 OID 49330)
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- TOC entry 3737 (class 2606 OID 49544)
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- TOC entry 3684 (class 2606 OID 49332)
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- TOC entry 3690 (class 2606 OID 49334)
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- TOC entry 3675 (class 2606 OID 49336)
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- TOC entry 3781 (class 2606 OID 50460)
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- TOC entry 3794 (class 2606 OID 49837)
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- TOC entry 3790 (class 2606 OID 49835)
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- TOC entry 3787 (class 2606 OID 49833)
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- TOC entry 3784 (class 2606 OID 49831)
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- TOC entry 3802 (class 2606 OID 49841)
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- TOC entry 3724 (class 2606 OID 49338)
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- TOC entry 3663 (class 2606 OID 50454)
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- TOC entry 3779 (class 2606 OID 49724)
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- TOC entry 3754 (class 2606 OID 49610)
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- TOC entry 3867 (class 2606 OID 50178)
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- TOC entry 3692 (class 2606 OID 49340)
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- TOC entry 3667 (class 2606 OID 49342)
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- TOC entry 3716 (class 2606 OID 49344)
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- TOC entry 3937 (class 2606 OID 50595)
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- TOC entry 3852 (class 2606 OID 50136)
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- TOC entry 3862 (class 2606 OID 50164)
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- TOC entry 3878 (class 2606 OID 50233)
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- TOC entry 3872 (class 2606 OID 50203)
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- TOC entry 3857 (class 2606 OID 50150)
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- TOC entry 3869 (class 2606 OID 50188)
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- TOC entry 3875 (class 2606 OID 50218)
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- TOC entry 3708 (class 2606 OID 49346)
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- TOC entry 3800 (class 2606 OID 49845)
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- TOC entry 3796 (class 2606 OID 49843)
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- TOC entry 3935 (class 2606 OID 50580)
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3931 (class 2606 OID 50570)
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- TOC entry 3772 (class 2606 OID 49718)
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- TOC entry 3819 (class 2606 OID 49987)
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- TOC entry 3826 (class 2606 OID 49994)
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3823 (class 2606 OID 50008)
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- TOC entry 3767 (class 2606 OID 49714)
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- TOC entry 3770 (class 2606 OID 49894)
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- TOC entry 3764 (class 2606 OID 49712)
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- TOC entry 3816 (class 2606 OID 50673)
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- TOC entry 3811 (class 2606 OID 49964)
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- TOC entry 3739 (class 2606 OID 49604)
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- TOC entry 3743 (class 2606 OID 49887)
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- TOC entry 3694 (class 2606 OID 50479)
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- TOC entry 3809 (class 2606 OID 49927)
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- TOC entry 3806 (class 2606 OID 49925)
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- TOC entry 3721 (class 2606 OID 49839)
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- TOC entry 3945 (class 2606 OID 50642)
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- TOC entry 3947 (class 2606 OID 50649)
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3702 (class 2606 OID 49923)
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- TOC entry 3830 (class 2606 OID 50001)
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- TOC entry 3759 (class 2606 OID 49614)
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- TOC entry 3729 (class 2606 OID 50481)
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- TOC entry 3651 (class 2606 OID 49158)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3844 (class 2606 OID 50104)
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- TOC entry 3839 (class 2606 OID 50063)
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- TOC entry 3850 (class 2606 OID 50434)
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- TOC entry 3848 (class 2606 OID 50092)
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- TOC entry 3929 (class 2606 OID 50555)
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- TOC entry 3950 (class 2606 OID 50690)
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- TOC entry 3943 (class 2606 OID 50622)
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- TOC entry 3821 (class 2606 OID 50364)
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- TOC entry 3752 (class 2606 OID 49661)
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- TOC entry 3656 (class 2606 OID 49350)
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- TOC entry 3841 (class 2606 OID 50508)
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- TOC entry 3712 (class 2606 OID 49354)
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- TOC entry 3775 (class 2606 OID 57782)
-- Name: user_consent uk_external_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_external_consent UNIQUE (client_storage_provider, external_client_id, user_id);


--
-- TOC entry 3855 (class 2606 OID 50681)
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- TOC entry 3941 (class 2606 OID 50677)
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- TOC entry 3865 (class 2606 OID 50425)
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3860 (class 2606 OID 50429)
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- TOC entry 3777 (class 2606 OID 57780)
-- Name: user_consent uk_local_consent; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_local_consent UNIQUE (client_id, user_id);


--
-- TOC entry 3954 (class 2606 OID 57771)
-- Name: org uk_org_group; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_group UNIQUE (group_id);


--
-- TOC entry 3956 (class 2606 OID 57769)
-- Name: org uk_org_name; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.org
    ADD CONSTRAINT uk_org_name UNIQUE (realm_id, name);


--
-- TOC entry 3682 (class 2606 OID 49362)
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- TOC entry 3714 (class 2606 OID 50354)
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- TOC entry 3884 (class 1259 OID 57753)
-- Name: fed_user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values ON public.fed_user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3885 (class 1259 OID 57755)
-- Name: fed_user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX fed_user_attr_long_values_lower_case ON public.fed_user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 3782 (class 1259 OID 50706)
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- TOC entry 3879 (class 1259 OID 50378)
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- TOC entry 3785 (class 1259 OID 50382)
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- TOC entry 3791 (class 1259 OID 50380)
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- TOC entry 3792 (class 1259 OID 50379)
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- TOC entry 3788 (class 1259 OID 50381)
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- TOC entry 3924 (class 1259 OID 50697)
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- TOC entry 3733 (class 1259 OID 57756)
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, substr(value, 1, 255));


--
-- TOC entry 3654 (class 1259 OID 50682)
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- TOC entry 3919 (class 1259 OID 50422)
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- TOC entry 3659 (class 1259 OID 50386)
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- TOC entry 3842 (class 1259 OID 50585)
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- TOC entry 3925 (class 1259 OID 50694)
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- TOC entry 3740 (class 1259 OID 50582)
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- TOC entry 3845 (class 1259 OID 50583)
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- TOC entry 3910 (class 1259 OID 50388)
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- TOC entry 3913 (class 1259 OID 50656)
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- TOC entry 3914 (class 1259 OID 50387)
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- TOC entry 3664 (class 1259 OID 50389)
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- TOC entry 3665 (class 1259 OID 50390)
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- TOC entry 3926 (class 1259 OID 50588)
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- TOC entry 3927 (class 1259 OID 50589)
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- TOC entry 3671 (class 1259 OID 50683)
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- TOC entry 3746 (class 1259 OID 50121)
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- TOC entry 3747 (class 1259 OID 50120)
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- TOC entry 3886 (class 1259 OID 50482)
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- TOC entry 3889 (class 1259 OID 50502)
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- TOC entry 3890 (class 1259 OID 50665)
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- TOC entry 3891 (class 1259 OID 50484)
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- TOC entry 3894 (class 1259 OID 50485)
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- TOC entry 3895 (class 1259 OID 50486)
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- TOC entry 3898 (class 1259 OID 50487)
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- TOC entry 3899 (class 1259 OID 50488)
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- TOC entry 3902 (class 1259 OID 50489)
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- TOC entry 3903 (class 1259 OID 50490)
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- TOC entry 3906 (class 1259 OID 50491)
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- TOC entry 3907 (class 1259 OID 50492)
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- TOC entry 3827 (class 1259 OID 50707)
-- Name: idx_group_att_by_name_value; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_att_by_name_value ON public.group_attribute USING btree (name, ((value)::character varying(250)));


--
-- TOC entry 3828 (class 1259 OID 50393)
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- TOC entry 3824 (class 1259 OID 50394)
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- TOC entry 3768 (class 1259 OID 50396)
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- TOC entry 3750 (class 1259 OID 50395)
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- TOC entry 3676 (class 1259 OID 50397)
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- TOC entry 3677 (class 1259 OID 50398)
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- TOC entry 3812 (class 1259 OID 57760)
-- Name: idx_offline_uss_by_broker_session_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_broker_session_id ON public.offline_user_session USING btree (broker_session_id, realm_id);


--
-- TOC entry 3813 (class 1259 OID 57759)
-- Name: idx_offline_uss_by_last_session_refresh; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_last_session_refresh ON public.offline_user_session USING btree (realm_id, offline_flag, last_session_refresh);


--
-- TOC entry 3814 (class 1259 OID 50701)
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- TOC entry 3938 (class 1259 OID 57784)
-- Name: idx_perm_ticket_owner; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_owner ON public.resource_server_perm_ticket USING btree (owner);


--
-- TOC entry 3939 (class 1259 OID 57783)
-- Name: idx_perm_ticket_requester; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_perm_ticket_requester ON public.resource_server_perm_ticket USING btree (requester);


--
-- TOC entry 3741 (class 1259 OID 50399)
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- TOC entry 3685 (class 1259 OID 50402)
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- TOC entry 3837 (class 1259 OID 50581)
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- TOC entry 3836 (class 1259 OID 50403)
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- TOC entry 3688 (class 1259 OID 50406)
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- TOC entry 3762 (class 1259 OID 50405)
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- TOC entry 3680 (class 1259 OID 50401)
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- TOC entry 3757 (class 1259 OID 50407)
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- TOC entry 3695 (class 1259 OID 50408)
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- TOC entry 3807 (class 1259 OID 50409)
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- TOC entry 3873 (class 1259 OID 50410)
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- TOC entry 3870 (class 1259 OID 50411)
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- TOC entry 3863 (class 1259 OID 50430)
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- TOC entry 3853 (class 1259 OID 50431)
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- TOC entry 3858 (class 1259 OID 50432)
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- TOC entry 3948 (class 1259 OID 50655)
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- TOC entry 3846 (class 1259 OID 50584)
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- TOC entry 3698 (class 1259 OID 50415)
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- TOC entry 3876 (class 1259 OID 50416)
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- TOC entry 3765 (class 1259 OID 50663)
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- TOC entry 3817 (class 1259 OID 50110)
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- TOC entry 3932 (class 1259 OID 50590)
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- TOC entry 3933 (class 1259 OID 57751)
-- Name: idx_usconsent_scope_id; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usconsent_scope_id ON public.user_consent_client_scope USING btree (scope_id);


--
-- TOC entry 3703 (class 1259 OID 50117)
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- TOC entry 3704 (class 1259 OID 50704)
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- TOC entry 3773 (class 1259 OID 50114)
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- TOC entry 3668 (class 1259 OID 50118)
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- TOC entry 3709 (class 1259 OID 50111)
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- TOC entry 3831 (class 1259 OID 50113)
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- TOC entry 3722 (class 1259 OID 50119)
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- TOC entry 3725 (class 1259 OID 50112)
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- TOC entry 3710 (class 1259 OID 50705)
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- TOC entry 3797 (class 1259 OID 50418)
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- TOC entry 3798 (class 1259 OID 50419)
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- TOC entry 3719 (class 1259 OID 50420)
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- TOC entry 3730 (class 1259 OID 50421)
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- TOC entry 3705 (class 1259 OID 57752)
-- Name: user_attr_long_values; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values ON public.user_attribute USING btree (long_value_hash, name);


--
-- TOC entry 3706 (class 1259 OID 57754)
-- Name: user_attr_long_values_lower_case; Type: INDEX; Schema: public; Owner: keycloak
--

CREATE INDEX user_attr_long_values_lower_case ON public.user_attribute USING btree (long_value_hash_lower_case, name);


--
-- TOC entry 4000 (class 2606 OID 49846)
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3984 (class 2606 OID 49615)
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3977 (class 2606 OID 49545)
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3983 (class 2606 OID 49625)
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3979 (class 2606 OID 49772)
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3978 (class 2606 OID 49550)
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3987 (class 2606 OID 49655)
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- TOC entry 3960 (class 2606 OID 49365)
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3969 (class 2606 OID 49370)
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3973 (class 2606 OID 49375)
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3992 (class 2606 OID 49750)
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3967 (class 2606 OID 49385)
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4030 (class 2606 OID 50623)
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 3971 (class 2606 OID 49390)
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3974 (class 2606 OID 49400)
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3964 (class 2606 OID 49405)
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- TOC entry 3968 (class 2606 OID 49410)
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3965 (class 2606 OID 49425)
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3961 (class 2606 OID 49430)
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3995 (class 2606 OID 49866)
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- TOC entry 3996 (class 2606 OID 49861)
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3994 (class 2606 OID 49856)
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3993 (class 2606 OID 49851)
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3959 (class 2606 OID 49435)
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- TOC entry 3975 (class 2606 OID 49440)
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4007 (class 2606 OID 50529)
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4008 (class 2606 OID 50519)
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4001 (class 2606 OID 49935)
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- TOC entry 3980 (class 2606 OID 50514)
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- TOC entry 4023 (class 2606 OID 50373)
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4021 (class 2606 OID 50321)
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- TOC entry 4022 (class 2606 OID 50316)
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4006 (class 2606 OID 50021)
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3999 (class 2606 OID 49881)
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- TOC entry 3997 (class 2606 OID 49876)
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 3998 (class 2606 OID 49871)
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4019 (class 2606 OID 50239)
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4017 (class 2606 OID 50224)
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4026 (class 2606 OID 50596)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4009 (class 2606 OID 50440)
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4027 (class 2606 OID 50601)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4028 (class 2606 OID 50606)
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4020 (class 2606 OID 50234)
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4018 (class 2606 OID 50219)
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4029 (class 2606 OID 50628)
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4011 (class 2606 OID 50435)
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 4013 (class 2606 OID 50189)
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4015 (class 2606 OID 50204)
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4016 (class 2606 OID 50209)
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 4014 (class 2606 OID 50194)
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- TOC entry 4010 (class 2606 OID 50445)
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- TOC entry 3962 (class 2606 OID 49455)
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- TOC entry 4025 (class 2606 OID 50571)
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- TOC entry 3991 (class 2606 OID 49735)
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4004 (class 2606 OID 49995)
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 4003 (class 2606 OID 50009)
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- TOC entry 3988 (class 2606 OID 49681)
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3966 (class 2606 OID 49465)
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3989 (class 2606 OID 49725)
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3990 (class 2606 OID 49895)
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- TOC entry 3976 (class 2606 OID 49475)
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3970 (class 2606 OID 49485)
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3981 (class 2606 OID 49620)
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 3963 (class 2606 OID 49500)
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 3982 (class 2606 OID 49888)
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- TOC entry 4024 (class 2606 OID 50556)
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4002 (class 2606 OID 49930)
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 4031 (class 2606 OID 50636)
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- TOC entry 4032 (class 2606 OID 50650)
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- TOC entry 3986 (class 2606 OID 49650)
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- TOC entry 3972 (class 2606 OID 49520)
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- TOC entry 4005 (class 2606 OID 50002)
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- TOC entry 4012 (class 2606 OID 50179)
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- TOC entry 3985 (class 2606 OID 49630)
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: keycloak
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


-- Completed on 2024-09-25 12:22:25

--
-- PostgreSQL database dump complete
--

