--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.3
-- Dumped by pg_dump version 9.5.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invites; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE invites (
    id integer NOT NULL,
    email character varying,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: invites_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE invites_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: invites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE invites_id_seq OWNED BY invites.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE projects (
    id integer NOT NULL,
    title character varying,
    summary text,
    estimated_time numeric,
    actual_time numeric,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    owner_id integer,
    client_id integer,
    client_name character varying,
    client_email character varying,
    image_id character varying
);


--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE projects_id_seq OWNED BY projects.id;


--
-- Name: refile_attachments; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE refile_attachments (
    id integer NOT NULL,
    oid oid NOT NULL,
    namespace character varying NOT NULL,
    created_at timestamp without time zone DEFAULT ('now'::text)::timestamp without time zone
);


--
-- Name: refile_attachments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE refile_attachments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: refile_attachments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE refile_attachments_id_seq OWNED BY refile_attachments.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: timers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE timers (
    id integer NOT NULL,
    value integer DEFAULT 0,
    user_id integer,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: timers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE timers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: timers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE timers_id_seq OWNED BY timers.id;


--
-- Name: userprojects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE userprojects (
    id integer NOT NULL,
    user_id integer,
    project_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: userprojects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE userprojects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: userprojects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE userprojects_id_seq OWNED BY userprojects.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    role character varying DEFAULT 'developer'::character varying,
    email character varying,
    username character varying,
    password_digest character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites ALTER COLUMN id SET DEFAULT nextval('invites_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects ALTER COLUMN id SET DEFAULT nextval('projects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY refile_attachments ALTER COLUMN id SET DEFAULT nextval('refile_attachments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY timers ALTER COLUMN id SET DEFAULT nextval('timers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY userprojects ALTER COLUMN id SET DEFAULT nextval('userprojects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: invites_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY invites
    ADD CONSTRAINT invites_pkey PRIMARY KEY (id);


--
-- Name: projects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: refile_attachments_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY refile_attachments
    ADD CONSTRAINT refile_attachments_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: timers_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY timers
    ADD CONSTRAINT timers_pkey PRIMARY KEY (id);


--
-- Name: userprojects_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userprojects
    ADD CONSTRAINT userprojects_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_refile_attachments_on_namespace; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refile_attachments_on_namespace ON refile_attachments USING btree (namespace);


--
-- Name: index_refile_attachments_on_oid; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_refile_attachments_on_oid ON refile_attachments USING btree (oid);


--
-- Name: index_userprojects_on_project_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_userprojects_on_project_id ON userprojects USING btree (project_id);


--
-- Name: index_userprojects_on_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX index_userprojects_on_user_id ON userprojects USING btree (user_id);


--
-- Name: fk_rails_4729443468; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userprojects
    ADD CONSTRAINT fk_rails_4729443468 FOREIGN KEY (project_id) REFERENCES projects(id);


--
-- Name: fk_rails_c445826926; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY userprojects
    ADD CONSTRAINT fk_rails_c445826926 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", public;

INSERT INTO schema_migrations (version) VALUES ('20160805002821'), ('20160805004029'), ('20160805004149'), ('20160805004220'), ('20160805164505'), ('20160805172233'), ('20160805191248'), ('20160806170506'), ('20160806172311'), ('20160807031446'), ('20160807051633'), ('20160807131856'), ('20160807203318'), ('20160807210141'), ('20160810153002'), ('20160810153100');


