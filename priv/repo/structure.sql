--
-- PostgreSQL database dump
--

-- Dumped from database version 12.15
-- Dumped by pg_dump version 12.15

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
-- Name: activate_voting_sessions(); Type: FUNCTION; Schema: public; Owner: -
--

CREATE FUNCTION public.activate_voting_sessions() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
begin
	
	update public.voting_sessions set act_status = false where plan_id = new.plan_id;
 
   RETURN NEW;
END;
$$;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: active_storage_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_attachments (
    id bigint NOT NULL,
    name character varying NOT NULL,
    record_type character varying NOT NULL,
    record_id bigint NOT NULL,
    blob_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_attachments_id_seq OWNED BY public.active_storage_attachments.id;


--
-- Name: active_storage_blobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.active_storage_blobs (
    id bigint NOT NULL,
    key character varying NOT NULL,
    filename character varying NOT NULL,
    content_type character varying,
    metadata text,
    byte_size bigint NOT NULL,
    checksum character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.active_storage_blobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.active_storage_blobs_id_seq OWNED BY public.active_storage_blobs.id;


--
-- Name: activity_trails; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.activity_trails (
    id integer NOT NULL,
    event character varying(255),
    activity_action character varying(225) NOT NULL,
    activity_src character varying(225) NOT NULL,
    status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: activity_trails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.activity_trails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activity_trails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.activity_trails_id_seq OWNED BY public.activity_trails.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: auth_req_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.auth_req_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: auth_req; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.auth_req (
    id integer DEFAULT nextval('public.auth_req_id_seq'::regclass) NOT NULL,
    mobile_number character varying(20),
    imei character varying(50),
    secret_code text,
    device_type character varying(10),
    expired boolean DEFAULT false,
    status character varying(5),
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    updated_at timestamp without time zone,
    ref_code character varying(10),
    src character varying(10),
    email character varying
);


--
-- Name: back_trackers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.back_trackers (
    id bigint NOT NULL,
    back_index integer DEFAULT 1,
    session_id character varying,
    mobile_number character varying,
    status boolean DEFAULT true,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: back_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.back_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: back_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.back_trackers_id_seq OWNED BY public.back_trackers.id;


--
-- Name: callback_statuses; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.callback_statuses (
    id integer NOT NULL,
    trans_ref character varying(225) NOT NULL,
    resp_code character varying(225) NOT NULL,
    resp_desc character varying(225),
    nw_trans_id character varying(225),
    trans_status character varying(100),
    created_at timestamp without time zone DEFAULT now()
);


--
-- Name: callback_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.callback_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: callback_statuses_id_seq1; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.callback_statuses_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: callback_statuses_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.callback_statuses_id_seq1 OWNED BY public.callback_statuses.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    cat_id character varying(255),
    cat_name character varying(225) NOT NULL,
    cat_desc character varying(225),
    plan_id character varying(225) NOT NULL,
    pic_path character varying(500),
    pic_name character varying(500),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: category_codes; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.category_codes
    START WITH 78
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: entity_contacts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entity_contacts (
    id integer NOT NULL,
    entity_id character varying(225),
    phone_number character varying(225),
    email character varying(225),
    other_details character varying(1000),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


--
-- Name: entity_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entity_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entity_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entity_contacts_id_seq OWNED BY public.entity_contacts.id;


--
-- Name: entity_master_codes; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entity_master_codes
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: entity_masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.entity_masters (
    id integer NOT NULL,
    entity_id character varying(225),
    entity_name character varying(225),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


--
-- Name: entity_master_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entity_master_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entity_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entity_master_id_seq OWNED BY public.entity_masters.id;


--
-- Name: entity_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.entity_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: entity_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.entity_masters_id_seq OWNED BY public.entity_masters.id;


--
-- Name: err_log; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.err_log (
    id integer NOT NULL,
    entity_id character varying(10),
    processing_id character varying(20),
    trans_type character varying(5),
    nw character varying(5),
    err_msg text,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: err_log_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.err_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: err_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.err_log_id_seq OWNED BY public.err_log.id;


--
-- Name: eviction_dates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.eviction_dates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: eviction_dates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.eviction_dates (
    id integer DEFAULT nextval('public.eviction_dates_id_seq'::regclass) NOT NULL,
    plan_id character varying(225),
    start_datetime timestamp without time zone,
    end_datetime timestamp without time zone,
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


--
-- Name: global_params; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.global_params (
    id integer NOT NULL,
    assigned_code character varying,
    param_name character varying,
    param_val character varying,
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: global_params_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.global_params_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: global_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.global_params_id_seq OWNED BY public.global_params.id;


--
-- Name: incoming_request_api_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.incoming_request_api_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: incoming_request_api; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incoming_request_api (
    id integer DEFAULT nextval('public.incoming_request_api_id_seq'::regclass) NOT NULL,
    customer_id bytea,
    customer_number bytea,
    customer_id_hash bytea,
    remote_ip bytea,
    req_url bytea,
    req_path bytea,
    req_body bytea,
    user_agent bytea,
    user_agent_hash bytea,
    latitude bytea,
    longitude bytea,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: incoming_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.incoming_requests (
    id integer NOT NULL,
    remote_ip character varying,
    request_url character varying,
    path_info character varying,
    request_body character varying,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


--
-- Name: incoming_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.incoming_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: incoming_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.incoming_requests_id_seq OWNED BY public.incoming_requests.id;


--
-- Name: lov_class; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lov_class (
    id integer NOT NULL,
    plan_id character varying NOT NULL,
    lov_desc character varying NOT NULL,
    lov_comments character varying,
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: lov_class_detail; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.lov_class_detail (
    id integer NOT NULL,
    lov_class_id integer NOT NULL,
    amount numeric(11,2) NOT NULL,
    vote_count integer,
    detail_comment character varying,
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: lov_class_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lov_class_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lov_class_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lov_class_detail_id_seq OWNED BY public.lov_class_detail.id;


--
-- Name: lov_class_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lov_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lov_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.lov_class_id_seq OWNED BY public.lov_class.id;


--
-- Name: lov_temps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.lov_temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.message_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: message_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.message_logs (
    id bigint DEFAULT nextval('public.message_logs_id_seq'::regclass) NOT NULL,
    sender_id character varying,
    message character varying,
    message_id character varying,
    phone_number character varying,
    resp_code character varying,
    resp_desc character varying,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone,
    msg_type character varying
);


--
-- Name: more_algos; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.more_algos (
    id bigint NOT NULL,
    session_id character varying,
    function character varying,
    page character varying,
    mobile_number character varying,
    ussd_body character varying,
    the_up integer,
    the_down integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: more_algos_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.more_algos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: more_algos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.more_algos_id_seq OWNED BY public.more_algos.id;


--
-- Name: names; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.names (
    id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: names_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.names_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: names_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.names_id_seq OWNED BY public.names.id;


--
-- Name: nominees_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nominees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: nominees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.nominees (
    id integer DEFAULT nextval('public.nominees_id_seq'::regclass) NOT NULL,
    nom_id character varying(225),
    nom_name character varying(225) NOT NULL,
    nom_desc character varying(225),
    sub_cat_id character varying(225),
    pic_path character varying(500),
    pic_name character varying(500),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    nom_code character varying
);


--
-- Name: session_nominees; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session_nominees (
    id integer NOT NULL,
    vote_sess_id character varying(225) NOT NULL,
    nom_id character varying(225) NOT NULL,
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    seq_id integer
);


--
-- Name: sub_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sub_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sub_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sub_categories (
    id integer DEFAULT nextval('public.sub_categories_id_seq'::regclass) NOT NULL,
    sub_cat_id character varying(255) DEFAULT ('SCAT_'::text || to_char(currval('public.sub_categories_id_seq'::regclass), 'FM000000000'::text)),
    sub_cat_name character varying(225) NOT NULL,
    sub_cat_desc character varying(225),
    cat_id character varying(225),
    pic_path character varying(500),
    pic_name character varying(500),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    cat_exist boolean DEFAULT false,
    sub_cat_exist boolean
);


--
-- Name: voting_plans; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_plans (
    id integer NOT NULL,
    entity_id character varying(225) NOT NULL,
    plan_id character varying(225),
    plan_name character varying(225) NOT NULL,
    plan_desc character varying(225),
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    end_status boolean,
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    pic_name character varying(500),
    pic_path character varying(500),
    vote_scheme character varying(10),
    web_url character varying,
    web_url_shortlink character varying,
    bitly_id character varying,
    ussd_status boolean DEFAULT true,
    web_status boolean DEFAULT true
);


--
-- Name: nominee_code_view; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.nominee_code_view AS
 SELECT n.id,
    n.nom_code,
    n.nom_name,
    n.nom_id,
    sn.vote_sess_id AS session_id,
    sn.act_status,
    sn.del_status,
    sc.sub_cat_name,
    c.cat_name,
    vp.plan_name,
    vp.plan_id,
    sc.sub_cat_id
   FROM ((((public.nominees n
     LEFT JOIN public.sub_categories sc ON (((n.sub_cat_id)::text = (sc.sub_cat_id)::text)))
     LEFT JOIN public.categories c ON (((sc.cat_id)::text = (c.cat_id)::text)))
     LEFT JOIN public.voting_plans vp ON (((c.plan_id)::text = (vp.plan_id)::text)))
     LEFT JOIN public.session_nominees sn ON (((n.nom_id)::text = (sn.nom_id)::text)))
  WHERE ((sn.act_status = true) AND (sn.del_status = false) AND (n.act_status = true) AND (n.del_status = false))
  ORDER BY (n.nom_code)::integer;


--
-- Name: nominee_code_view_no_session; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.nominee_code_view_no_session AS
 SELECT n.id,
    n.nom_code,
    n.nom_name,
    n.nom_id,
    sc.sub_cat_name,
    c.cat_name,
    vp.plan_name,
    vp.plan_id,
    sc.sub_cat_id
   FROM (((public.nominees n
     LEFT JOIN public.sub_categories sc ON (((n.sub_cat_id)::text = (sc.sub_cat_id)::text)))
     LEFT JOIN public.categories c ON (((sc.cat_id)::text = (c.cat_id)::text)))
     LEFT JOIN public.voting_plans vp ON (((c.plan_id)::text = (vp.plan_id)::text)))
  WHERE ((n.act_status = true) AND (n.del_status = false))
  ORDER BY (n.nom_code)::integer;


--
-- Name: nominee_code_view_no_session_desc; Type: VIEW; Schema: public; Owner: -
--

CREATE VIEW public.nominee_code_view_no_session_desc AS
 SELECT n.id,
    n.nom_code,
    n.nom_name,
    n.nom_id,
    sc.sub_cat_name,
    c.cat_name,
    vp.plan_name,
    vp.plan_id,
    sc.sub_cat_id
   FROM (((public.nominees n
     LEFT JOIN public.sub_categories sc ON (((n.sub_cat_id)::text = (sc.sub_cat_id)::text)))
     LEFT JOIN public.categories c ON (((sc.cat_id)::text = (c.cat_id)::text)))
     LEFT JOIN public.voting_plans vp ON (((c.plan_id)::text = (vp.plan_id)::text)))
  WHERE ((n.act_status = true) AND (n.del_status = false))
  ORDER BY (n.nom_code)::integer DESC;


--
-- Name: nominee_codes; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.nominee_codes
    START WITH 852
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: old_passwords; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.old_passwords (
    id bigint NOT NULL,
    encrypted_password character varying NOT NULL,
    password_archivable_type character varying NOT NULL,
    password_archivable_id integer NOT NULL,
    password_salt character varying,
    created_at timestamp without time zone
);


--
-- Name: old_passwords_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.old_passwords_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: old_passwords_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.old_passwords_id_seq OWNED BY public.old_passwords.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions (
    id bigint NOT NULL,
    subject_class character varying,
    action character varying,
    name character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- Name: permissions_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.permissions_roles (
    id bigint NOT NULL,
    permission_id integer,
    role_id character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role_code character varying
);


--
-- Name: permissions_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.permissions_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.permissions_roles_id_seq OWNED BY public.permissions_roles.id;


--
-- Name: point_restart_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.point_restart_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ratings (
    id integer NOT NULL,
    rating_id character varying(225),
    plan_id character varying(225),
    points integer,
    unit_cost numeric(10,2),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    usd_unit_cost numeric(10,2),
    usd_rate numeric(10,2)
);


--
-- Name: ratings_codes; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ratings_codes
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ratings_id_seq OWNED BY public.ratings.id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying,
    unique_code character varying,
    active_status boolean,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


--
-- Name: service_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.service_keys (
    id integer NOT NULL,
    service_id character varying(225),
    plan_id character varying(225),
    secret_token character varying(1000) NOT NULL,
    client_token character varying(1000) NOT NULL,
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    trans_type character varying(100),
    client_id character varying NOT NULL,
    payment_ref character varying,
    sender_id character varying
);


--
-- Name: service_keys_codes; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_keys_codes
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: service_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.service_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: service_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.service_keys_id_seq OWNED BY public.service_keys.id;


--
-- Name: session_nominess_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_nominess_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_nominess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_nominess_id_seq OWNED BY public.session_nominees.id;


--
-- Name: session_trackers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.session_trackers (
    id bigint NOT NULL,
    session_id character varying,
    function integer,
    previous_tracker boolean,
    page character varying,
    mobile_number integer,
    ussd_body character varying,
    msg_type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: session_trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.session_trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: session_trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.session_trackers_id_seq OWNED BY public.session_trackers.id;


--
-- Name: short_code_divisions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.short_code_divisions (
    id integer NOT NULL,
    div_desc character varying(225),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    assigned_code character varying
);


--
-- Name: short_code_divisions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.short_code_divisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: short_code_divisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.short_code_divisions_id_seq OWNED BY public.short_code_divisions.id;


--
-- Name: short_code_masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.short_code_masters (
    id integer NOT NULL,
    plan_id integer NOT NULL,
    short_code_ext character varying(255),
    approved_status boolean DEFAULT false,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    user_id integer,
    ussd_div_id integer,
    plan_code character varying
);


--
-- Name: short_code_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.short_code_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: short_code_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.short_code_masters_id_seq OWNED BY public.short_code_masters.id;


--
-- Name: sms_service_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sms_service_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sms_service_keys; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sms_service_keys (
    id integer DEFAULT nextval('public.sms_service_keys_id_seq'::regclass) NOT NULL,
    service_id character varying DEFAULT ('SMSSK_'::text || to_char(currval('public.sms_service_keys_id_seq'::regclass), 'FM000000000'::text)),
    secret_token character varying NOT NULL,
    client_token character varying NOT NULL,
    trans_type character varying,
    client_id character varying NOT NULL,
    payment_ref character varying,
    sender_id character varying,
    user_id integer,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone
);


--
-- Name: tracker_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tracker_logs (
    id bigint NOT NULL,
    session_id character varying,
    function character varying,
    page character varying,
    mobile_number character varying,
    ussd_body character varying,
    msg_type character varying,
    previous_tracker boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: tracker_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tracker_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tracker_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tracker_logs_id_seq OWNED BY public.tracker_logs.id;


--
-- Name: trackers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trackers (
    id bigint NOT NULL,
    session_id character varying,
    function character varying,
    page character varying,
    mobile_number character varying,
    ussd_body character varying,
    msg_type character varying,
    previous_tracker boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    plan_id character varying
);


--
-- Name: trackers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trackers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trackers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trackers_id_seq OWNED BY public.trackers.id;


--
-- Name: trans_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.trans_requests (
    id integer NOT NULL,
    nom_id character varying(255),
    amount numeric(10,2),
    customer_number character varying(225) NOT NULL,
    trans_ref character varying(225) NOT NULL,
    nw character varying(225) NOT NULL,
    reference character varying(225),
    service_name character varying(225),
    voucher_code character varying(50),
    trans_type character varying(10),
    src character varying(50),
    status boolean,
    user_id integer,
    act_status boolean DEFAULT true,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    vote_sess_id character varying(255),
    email character varying,
    payment_med character varying,
    vote_count numeric DEFAULT '0'::numeric,
    lov_class_detail_id integer,
    vote_scheme character varying
);


--
-- Name: trans_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.trans_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: trans_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.trans_requests_id_seq OWNED BY public.trans_requests.id;


--
-- Name: voting_masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_masters (
    id integer NOT NULL,
    nom_id character varying(255),
    vote_count numeric DEFAULT 0,
    trans_ref character varying(225) NOT NULL,
    vote_before numeric DEFAULT 0,
    vote_after numeric DEFAULT 0,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    vote_sess_id character varying(255)
);


--
-- Name: voting_sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_sessions (
    id integer NOT NULL,
    session_id character varying(225),
    session_desc character varying(225) NOT NULL,
    plan_id character varying(225),
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    point_restart boolean DEFAULT false
);


--
-- Name: transactions; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.transactions AS
 SELECT tr.id,
    tr.amount,
    tr.customer_number,
    tr.trans_ref,
    tr.nw,
    tr.reference,
    tr.voucher_code,
    tr.trans_type,
    tr.src,
    tr.status,
    tr.created_at,
    tr.vote_sess_id AS trans_request_vote_sess_id,
    tr.email,
    tr.payment_med,
    tr.vote_count AS trans_request_vote_count,
    vm.vote_count,
    vs.session_id,
    vs.session_desc,
    vs.plan_id AS voting_session_plan_id,
    vp.plan_id,
    vp.plan_name,
    vp.entity_id,
    n.nom_id,
    n.nom_name,
    c.cat_id,
    c.cat_name,
    sc.sub_cat_id,
    sc.sub_cat_name,
    cs.trans_ref AS callback_trans_ref,
    cs.resp_code,
    cs.resp_desc,
    cs.nw_trans_id,
    cs.trans_status
   FROM (((((((public.trans_requests tr
     LEFT JOIN public.nominees n ON (((tr.nom_id)::text = (n.nom_id)::text)))
     LEFT JOIN public.voting_sessions vs ON (((tr.vote_sess_id)::text = (vs.session_id)::text)))
     LEFT JOIN public.voting_plans vp ON (((vs.plan_id)::text = (vp.plan_id)::text)))
     LEFT JOIN public.sub_categories sc ON (((n.sub_cat_id)::text = (sc.sub_cat_id)::text)))
     LEFT JOIN public.categories c ON (((sc.cat_id)::text = (c.cat_id)::text)))
     LEFT JOIN public.callback_statuses cs ON (((tr.trans_ref)::text = (cs.trans_ref)::text)))
     LEFT JOIN public.voting_masters vm ON (((tr.trans_ref)::text = (vm.trans_ref)::text)))
  WHERE (vp.act_status AND (vp.del_status = false) AND (vs.act_status AND (vs.del_status = false)) AND (sc.act_status AND (sc.del_status = false)) AND (c.act_status AND (c.del_status = false)))
  ORDER BY tr.created_at
  WITH NO DATA;


--
-- Name: transactions_report; Type: MATERIALIZED VIEW; Schema: public; Owner: -
--

CREATE MATERIALIZED VIEW public.transactions_report AS
 SELECT trans_requests.id,
    trans_requests.nom_id,
    trans_requests.amount,
    trans_requests.customer_number,
    trans_requests.trans_ref,
    trans_requests.nw,
    trans_requests.reference,
    trans_requests.service_name,
    trans_requests.voucher_code,
    trans_requests.trans_type,
    trans_requests.src,
    trans_requests.status,
    trans_requests.user_id,
    trans_requests.act_status,
    trans_requests.created_at,
    trans_requests.updated_at,
    trans_requests.vote_sess_id
   FROM public.trans_requests
  WITH NO DATA;


--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_roles (
    id bigint NOT NULL,
    user_id integer,
    role_code character varying,
    entity_master_id character varying,
    voting_plan_id character varying,
    comment text,
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    creator_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.user_roles_id_seq OWNED BY public.user_roles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    surname character varying,
    other_names character varying,
    username character varying,
    entity_master_id character varying,
    voting_plan_id character varying,
    role_id integer,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    failed_attempts integer DEFAULT 0 NOT NULL,
    unlock_token character varying,
    locked_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    password_changed_at timestamp without time zone,
    unique_session_id character varying,
    last_activity_at timestamp without time zone,
    expired_at timestamp without time zone,
    unconfirmed_email character varying
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: ussd_lov_temps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ussd_lov_temps (
    id integer DEFAULT nextval('public.lov_temps_id_seq'::regclass) NOT NULL,
    mobile_number character varying,
    plan_id character varying,
    lov_index character varying,
    lov_class_id character varying,
    lov_desc character varying,
    lov_class_detail_id character varying,
    amount numeric(11,2) DEFAULT 0.000,
    vote_count character varying,
    detail_comment character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: ussd_paginations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ussd_paginations (
    id bigint NOT NULL,
    session_id character varying,
    category integer,
    sub_category integer,
    nominee integer,
    status boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ussd_paginations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ussd_paginations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ussd_paginations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ussd_paginations_id_seq OWNED BY public.ussd_paginations.id;


--
-- Name: ussd_requests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.ussd_requests (
    id bigint NOT NULL,
    session_id character varying,
    mobile_number character varying,
    ussd_body character varying,
    body character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: ussd_requests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.ussd_requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: ussd_requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.ussd_requests_id_seq OWNED BY public.ussd_requests.id;


--
-- Name: voting_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_masters_id_seq OWNED BY public.voting_masters.id;


--
-- Name: voting_plan_codes; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_plan_codes
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: voting_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_plans_id_seq OWNED BY public.voting_plans.id;


--
-- Name: voting_plans_media; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_plans_media (
    id integer NOT NULL,
    plan_id character varying,
    media_path character varying(400),
    media_data character varying(400),
    media_type character varying(10),
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone,
    media_value character varying
);


--
-- Name: voting_plans_media_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_plans_media_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_plans_media_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_plans_media_id_seq OWNED BY public.voting_plans_media.id;


--
-- Name: voting_schemes; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_schemes (
    id integer NOT NULL,
    assigned_code character varying(10) NOT NULL,
    scheme_desc character varying(400),
    scheme_comments character varying,
    active_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp without time zone
);


--
-- Name: voting_schemes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_schemes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_schemes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_schemes_id_seq OWNED BY public.voting_schemes.id;


--
-- Name: voting_sessions_code; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_sessions_code
    START WITH 18
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999999999
    CACHE 1;


--
-- Name: voting_sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_sessions_id_seq OWNED BY public.voting_sessions.id;


--
-- Name: voting_summaries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_summaries (
    id integer NOT NULL,
    nom_id character varying(255),
    vote_count numeric DEFAULT 0,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    vote_sess_id character varying(255)
);


--
-- Name: voting_summaries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_summaries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_summaries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_summaries_id_seq OWNED BY public.voting_summaries.id;


--
-- Name: voting_temps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.voting_temps (
    id bigint NOT NULL,
    mobile_number character varying,
    plan_name character varying,
    unit_cost character varying,
    has_cat boolean,
    has_sub_cat boolean,
    plan_id character varying,
    session_id character varying,
    cat_page integer,
    sub_cat_page integer,
    nom_page integer,
    session character varying,
    cat_id character varying,
    sub_cat_id character varying,
    nom_id character varying,
    no_of_votes integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    ussd_div character varying,
    vote_scheme character varying(10),
    lov_index character varying,
    lov_class_detail_id character varying,
    amount character varying,
    nom_code character varying,
    hybrid_scheme_option_val character varying
);


--
-- Name: voting_temps_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.voting_temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: voting_temps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.voting_temps_id_seq OWNED BY public.voting_temps.id;


--
-- Name: whitelist_masters_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.whitelist_masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: whitelist_masters; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.whitelist_masters (
    id integer DEFAULT nextval('public.whitelist_masters_id_seq'::regclass) NOT NULL,
    plan_id character varying,
    phone character varying,
    "desc" character varying,
    user_id integer NOT NULL,
    act_status boolean DEFAULT true,
    del_status boolean DEFAULT false,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone,
    remote_ip character varying
);


--
-- Name: xxx; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.xxx
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: active_storage_attachments id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments ALTER COLUMN id SET DEFAULT nextval('public.active_storage_attachments_id_seq'::regclass);


--
-- Name: active_storage_blobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs ALTER COLUMN id SET DEFAULT nextval('public.active_storage_blobs_id_seq'::regclass);


--
-- Name: activity_trails id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.activity_trails ALTER COLUMN id SET DEFAULT nextval('public.activity_trails_id_seq'::regclass);


--
-- Name: back_trackers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.back_trackers ALTER COLUMN id SET DEFAULT nextval('public.back_trackers_id_seq'::regclass);


--
-- Name: callback_statuses id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_statuses ALTER COLUMN id SET DEFAULT nextval('public.callback_statuses_id_seq1'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: entity_contacts id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_contacts ALTER COLUMN id SET DEFAULT nextval('public.entity_contacts_id_seq'::regclass);


--
-- Name: entity_masters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.entity_masters ALTER COLUMN id SET DEFAULT nextval('public.entity_masters_id_seq'::regclass);


--
-- Name: err_log id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.err_log ALTER COLUMN id SET DEFAULT nextval('public.err_log_id_seq'::regclass);


--
-- Name: global_params id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.global_params ALTER COLUMN id SET DEFAULT nextval('public.global_params_id_seq'::regclass);


--
-- Name: incoming_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.incoming_requests ALTER COLUMN id SET DEFAULT nextval('public.incoming_requests_id_seq'::regclass);


--
-- Name: lov_class id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lov_class ALTER COLUMN id SET DEFAULT nextval('public.lov_class_id_seq'::regclass);


--
-- Name: lov_class_detail id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lov_class_detail ALTER COLUMN id SET DEFAULT nextval('public.lov_class_detail_id_seq'::regclass);


--
-- Name: more_algos id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.more_algos ALTER COLUMN id SET DEFAULT nextval('public.more_algos_id_seq'::regclass);


--
-- Name: names id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.names ALTER COLUMN id SET DEFAULT nextval('public.names_id_seq'::regclass);


--
-- Name: old_passwords id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.old_passwords ALTER COLUMN id SET DEFAULT nextval('public.old_passwords_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- Name: permissions_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions_roles ALTER COLUMN id SET DEFAULT nextval('public.permissions_roles_id_seq'::regclass);


--
-- Name: ratings id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ratings ALTER COLUMN id SET DEFAULT nextval('public.ratings_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: service_keys id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.service_keys ALTER COLUMN id SET DEFAULT nextval('public.service_keys_id_seq'::regclass);


--
-- Name: session_nominees id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_nominees ALTER COLUMN id SET DEFAULT nextval('public.session_nominess_id_seq'::regclass);


--
-- Name: session_trackers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_trackers ALTER COLUMN id SET DEFAULT nextval('public.session_trackers_id_seq'::regclass);


--
-- Name: short_code_divisions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_code_divisions ALTER COLUMN id SET DEFAULT nextval('public.short_code_divisions_id_seq'::regclass);


--
-- Name: short_code_masters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_code_masters ALTER COLUMN id SET DEFAULT nextval('public.short_code_masters_id_seq'::regclass);


--
-- Name: tracker_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracker_logs ALTER COLUMN id SET DEFAULT nextval('public.tracker_logs_id_seq'::regclass);


--
-- Name: trackers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trackers ALTER COLUMN id SET DEFAULT nextval('public.trackers_id_seq'::regclass);


--
-- Name: trans_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trans_requests ALTER COLUMN id SET DEFAULT nextval('public.trans_requests_id_seq'::regclass);


--
-- Name: user_roles id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles ALTER COLUMN id SET DEFAULT nextval('public.user_roles_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: ussd_paginations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ussd_paginations ALTER COLUMN id SET DEFAULT nextval('public.ussd_paginations_id_seq'::regclass);


--
-- Name: ussd_requests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ussd_requests ALTER COLUMN id SET DEFAULT nextval('public.ussd_requests_id_seq'::regclass);


--
-- Name: voting_masters id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_masters ALTER COLUMN id SET DEFAULT nextval('public.voting_masters_id_seq'::regclass);


--
-- Name: voting_plans id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_plans ALTER COLUMN id SET DEFAULT nextval('public.voting_plans_id_seq'::regclass);


--
-- Name: voting_plans_media id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_plans_media ALTER COLUMN id SET DEFAULT nextval('public.voting_plans_media_id_seq'::regclass);


--
-- Name: voting_schemes id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_schemes ALTER COLUMN id SET DEFAULT nextval('public.voting_schemes_id_seq'::regclass);


--
-- Name: voting_sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_sessions ALTER COLUMN id SET DEFAULT nextval('public.voting_sessions_id_seq'::regclass);


--
-- Name: voting_summaries id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_summaries ALTER COLUMN id SET DEFAULT nextval('public.voting_summaries_id_seq'::regclass);


--
-- Name: voting_temps id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_temps ALTER COLUMN id SET DEFAULT nextval('public.voting_temps_id_seq'::regclass);


--
-- Name: active_storage_attachments active_storage_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT active_storage_attachments_pkey PRIMARY KEY (id);


--
-- Name: active_storage_blobs active_storage_blobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_blobs
    ADD CONSTRAINT active_storage_blobs_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: back_trackers back_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.back_trackers
    ADD CONSTRAINT back_trackers_pkey PRIMARY KEY (id);


--
-- Name: callback_statuses callback_statuses_trans_ref_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_statuses
    ADD CONSTRAINT callback_statuses_trans_ref_key UNIQUE (trans_ref);


--
-- Name: callback_statuses callback_statuses_trans_ref_nw_trans_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.callback_statuses
    ADD CONSTRAINT callback_statuses_trans_ref_nw_trans_id_key UNIQUE (trans_ref, nw_trans_id);


--
-- Name: global_params global_params_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.global_params
    ADD CONSTRAINT global_params_pkey PRIMARY KEY (id);


--
-- Name: lov_class_detail lov_class_detail_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lov_class_detail
    ADD CONSTRAINT lov_class_detail_pkey PRIMARY KEY (id);


--
-- Name: lov_class lov_class_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.lov_class
    ADD CONSTRAINT lov_class_pkey PRIMARY KEY (id);


--
-- Name: ussd_lov_temps lov_temps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ussd_lov_temps
    ADD CONSTRAINT lov_temps_pkey PRIMARY KEY (id);


--
-- Name: message_logs message_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_logs
    ADD CONSTRAINT message_logs_pkey PRIMARY KEY (id);


--
-- Name: more_algos more_algos_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.more_algos
    ADD CONSTRAINT more_algos_pkey PRIMARY KEY (id);


--
-- Name: names names_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.names
    ADD CONSTRAINT names_pkey PRIMARY KEY (id);


--
-- Name: old_passwords old_passwords_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.old_passwords
    ADD CONSTRAINT old_passwords_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: permissions_roles permissions_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.permissions_roles
    ADD CONSTRAINT permissions_roles_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: session_trackers session_trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.session_trackers
    ADD CONSTRAINT session_trackers_pkey PRIMARY KEY (id);


--
-- Name: short_code_masters short_code_masters_plan_id_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.short_code_masters
    ADD CONSTRAINT short_code_masters_plan_id_key UNIQUE (plan_id);


--
-- Name: tracker_logs tracker_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tracker_logs
    ADD CONSTRAINT tracker_logs_pkey PRIMARY KEY (id);


--
-- Name: trackers trackers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trackers
    ADD CONSTRAINT trackers_pkey PRIMARY KEY (id);


--
-- Name: trans_requests unique_transrequest_trans_ref; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.trans_requests
    ADD CONSTRAINT unique_transrequest_trans_ref UNIQUE (trans_ref);


--
-- Name: user_roles user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ussd_paginations ussd_paginations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ussd_paginations
    ADD CONSTRAINT ussd_paginations_pkey PRIMARY KEY (id);


--
-- Name: ussd_requests ussd_requests_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.ussd_requests
    ADD CONSTRAINT ussd_requests_pkey PRIMARY KEY (id);


--
-- Name: voting_plans_media voting_plans_media_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_plans_media
    ADD CONSTRAINT voting_plans_media_pkey PRIMARY KEY (id);


--
-- Name: voting_schemes voting_schemes_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_schemes
    ADD CONSTRAINT voting_schemes_pkey PRIMARY KEY (id);


--
-- Name: voting_temps voting_temps_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.voting_temps
    ADD CONSTRAINT voting_temps_pkey PRIMARY KEY (id);


--
-- Name: bitly_id_index_bitly_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bitly_id_index_bitly_id ON public.voting_plans USING btree (bitly_id);


--
-- Name: bitly_id_index_web_url; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bitly_id_index_web_url ON public.voting_plans USING btree (web_url);


--
-- Name: bitly_id_index_web_url_shortlink; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX bitly_id_index_web_url_shortlink ON public.voting_plans USING btree (web_url_shortlink);


--
-- Name: entity_masters_entity_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX entity_masters_entity_id_idx ON public.entity_masters USING btree (entity_id);


--
-- Name: index_active_storage_attachments_on_blob_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_active_storage_attachments_on_blob_id ON public.active_storage_attachments USING btree (blob_id);


--
-- Name: index_active_storage_attachments_uniqueness; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_attachments_uniqueness ON public.active_storage_attachments USING btree (record_type, record_id, name, blob_id);


--
-- Name: index_active_storage_blobs_on_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_active_storage_blobs_on_key ON public.active_storage_blobs USING btree (key);


--
-- Name: index_password_archivable; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_password_archivable ON public.old_passwords USING btree (password_archivable_type, password_archivable_id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_expired_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_expired_at ON public.users USING btree (expired_at);


--
-- Name: index_users_on_last_activity_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_last_activity_at ON public.users USING btree (last_activity_at);


--
-- Name: index_users_on_password_changed_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_users_on_password_changed_at ON public.users USING btree (password_changed_at);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_unlock_token; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX index_users_on_unlock_token ON public.users USING btree (unlock_token);


--
-- Name: lov_class_detail_index_amount; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_amount ON public.lov_class_detail USING btree (amount);


--
-- Name: lov_class_detail_index_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_created_at ON public.lov_class_detail USING btree (created_at);


--
-- Name: lov_class_detail_index_detail_comment; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_detail_comment ON public.lov_class_detail USING btree (detail_comment);


--
-- Name: lov_class_detail_index_lov_class_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_lov_class_id ON public.lov_class_detail USING btree (lov_class_id);


--
-- Name: lov_class_detail_index_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_updated_at ON public.lov_class_detail USING btree (updated_at);


--
-- Name: lov_class_detail_index_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_user_id ON public.lov_class_detail USING btree (user_id);


--
-- Name: lov_class_detail_index_vote_count; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_detail_index_vote_count ON public.lov_class_detail USING btree (vote_count);


--
-- Name: lov_class_index_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_index_created_at ON public.lov_class USING btree (created_at);


--
-- Name: lov_class_index_lov_comments; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_index_lov_comments ON public.lov_class USING btree (lov_comments);


--
-- Name: lov_class_index_lov_desc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_index_lov_desc ON public.lov_class USING btree (lov_desc);


--
-- Name: lov_class_index_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_index_plan_id ON public.lov_class USING btree (plan_id);


--
-- Name: lov_class_index_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_index_updated_at ON public.lov_class USING btree (updated_at);


--
-- Name: lov_class_index_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX lov_class_index_user_id ON public.lov_class USING btree (user_id);


--
-- Name: ratings_service_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX ratings_service_id_idx ON public.ratings USING btree (rating_id);


--
-- Name: service_keys_service_id_idx; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX service_keys_service_id_idx ON public.service_keys USING btree (service_id);


--
-- Name: trans_requests_index_lov_class_detail_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX trans_requests_index_lov_class_detail_id ON public.trans_requests USING btree (lov_class_detail_id);


--
-- Name: trans_requests_index_vote_scheme; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX trans_requests_index_vote_scheme ON public.trans_requests USING btree (vote_scheme);


--
-- Name: transaction_id; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX transaction_id ON public.transactions_report USING btree (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX unique_schema_migrations ON public.schema_migrations USING btree (version);


--
-- Name: voting_plans_index_vote_scheme; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_index_vote_scheme ON public.voting_plans USING btree (vote_scheme);


--
-- Name: voting_plans_media_index_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_created_at ON public.voting_plans_media USING btree (created_at);


--
-- Name: voting_plans_media_index_media_data; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_media_data ON public.voting_plans_media USING btree (media_data);


--
-- Name: voting_plans_media_index_media_path; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_media_path ON public.voting_plans_media USING btree (media_path);


--
-- Name: voting_plans_media_index_media_type; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_media_type ON public.voting_plans_media USING btree (media_type);


--
-- Name: voting_plans_media_index_media_value; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_media_value ON public.voting_plans_media USING btree (media_value);


--
-- Name: voting_plans_media_index_plan_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_plan_id ON public.voting_plans_media USING btree (plan_id);


--
-- Name: voting_plans_media_index_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_updated_at ON public.voting_plans_media USING btree (updated_at);


--
-- Name: voting_plans_media_index_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_plans_media_index_user_id ON public.voting_plans_media USING btree (user_id);


--
-- Name: voting_schemes_index_assigned_code; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_schemes_index_assigned_code ON public.voting_schemes USING btree (assigned_code);


--
-- Name: voting_schemes_index_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_schemes_index_created_at ON public.voting_schemes USING btree (created_at);


--
-- Name: voting_schemes_index_scheme_comments; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_schemes_index_scheme_comments ON public.voting_schemes USING btree (scheme_comments);


--
-- Name: voting_schemes_index_scheme_desc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_schemes_index_scheme_desc ON public.voting_schemes USING btree (scheme_desc);


--
-- Name: voting_schemes_index_updated_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_schemes_index_updated_at ON public.voting_schemes USING btree (updated_at);


--
-- Name: voting_schemes_index_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_schemes_index_user_id ON public.voting_schemes USING btree (user_id);


--
-- Name: voting_temps_index_vote_scheme; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX voting_temps_index_vote_scheme ON public.voting_temps USING btree (vote_scheme);


--
-- Name: voting_sessions trigg_activate_voting_sessions; Type: TRIGGER; Schema: public; Owner: -
--

CREATE TRIGGER trigg_activate_voting_sessions BEFORE INSERT ON public.voting_sessions FOR EACH ROW EXECUTE FUNCTION public.activate_voting_sessions();


--
-- Name: active_storage_attachments fk_rails_c3b3935057; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.active_storage_attachments
    ADD CONSTRAINT fk_rails_c3b3935057 FOREIGN KEY (blob_id) REFERENCES public.active_storage_blobs(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO public."schema_migrations" (version) VALUES (20190802121454);
INSERT INTO public."schema_migrations" (version) VALUES (20190803202059);
INSERT INTO public."schema_migrations" (version) VALUES (20190803210501);
INSERT INTO public."schema_migrations" (version) VALUES (20190803211028);
INSERT INTO public."schema_migrations" (version) VALUES (20190803213426);
INSERT INTO public."schema_migrations" (version) VALUES (20190803213435);
INSERT INTO public."schema_migrations" (version) VALUES (20190803222400);
INSERT INTO public."schema_migrations" (version) VALUES (20190803224630);
INSERT INTO public."schema_migrations" (version) VALUES (20190804024853);
INSERT INTO public."schema_migrations" (version) VALUES (20190804102922);
INSERT INTO public."schema_migrations" (version) VALUES (20190804103839);
INSERT INTO public."schema_migrations" (version) VALUES (20190804115030);
INSERT INTO public."schema_migrations" (version) VALUES (20190805234509);
INSERT INTO public."schema_migrations" (version) VALUES (20190815110537);
INSERT INTO public."schema_migrations" (version) VALUES (20190820121328);
INSERT INTO public."schema_migrations" (version) VALUES (20210826164715);
