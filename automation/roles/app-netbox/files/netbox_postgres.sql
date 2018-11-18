--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases
--

DROP DATABASE netbox;




--
-- Drop roles
--

DROP ROLE netbox;
DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE netbox;
ALTER ROLE netbox WITH SUPERUSER INHERIT NOCREATEROLE NOCREATEDB LOGIN NOREPLICATION NOBYPASSRLS PASSWORD 'md5b59db012cd7590313bdee1d05ab3ab41';
CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;






--
-- Database creation
--

CREATE DATABASE netbox WITH TEMPLATE = template0 OWNER = postgres;
REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect netbox

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO netbox;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO netbox;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO netbox;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO netbox;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO netbox;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO netbox;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: circuits_circuit; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuit (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    cid character varying(50) NOT NULL,
    install_date date,
    commit_rate integer,
    comments text NOT NULL,
    provider_id integer NOT NULL,
    type_id integer NOT NULL,
    tenant_id integer,
    description character varying(100) NOT NULL,
    status smallint NOT NULL,
    CONSTRAINT circuits_circuit_commit_rate_check CHECK ((commit_rate >= 0)),
    CONSTRAINT circuits_circuit_status_check CHECK ((status >= 0))
);


ALTER TABLE public.circuits_circuit OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuit_id_seq OWNER TO netbox;

--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuit_id_seq OWNED BY public.circuits_circuit.id;


--
-- Name: circuits_circuittermination; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittermination (
    id integer NOT NULL,
    term_side character varying(1) NOT NULL,
    port_speed integer NOT NULL,
    upstream_speed integer,
    xconnect_id character varying(50) NOT NULL,
    pp_info character varying(100) NOT NULL,
    circuit_id integer NOT NULL,
    interface_id integer,
    site_id integer NOT NULL,
    CONSTRAINT circuits_circuittermination_port_speed_check CHECK ((port_speed >= 0)),
    CONSTRAINT circuits_circuittermination_upstream_speed_check CHECK ((upstream_speed >= 0))
);


ALTER TABLE public.circuits_circuittermination OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittermination_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittermination_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittermination_id_seq OWNED BY public.circuits_circuittermination.id;


--
-- Name: circuits_circuittype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_circuittype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.circuits_circuittype OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_circuittype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_circuittype_id_seq OWNER TO netbox;

--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_circuittype_id_seq OWNED BY public.circuits_circuittype.id;


--
-- Name: circuits_provider; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.circuits_provider (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    asn bigint,
    account character varying(30) NOT NULL,
    portal_url character varying(200) NOT NULL,
    noc_contact text NOT NULL,
    admin_contact text NOT NULL,
    comments text NOT NULL
);


ALTER TABLE public.circuits_provider OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.circuits_provider_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.circuits_provider_id_seq OWNER TO netbox;

--
-- Name: circuits_provider_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.circuits_provider_id_seq OWNED BY public.circuits_provider.id;


--
-- Name: dcim_consoleport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleport (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    connection_status boolean,
    cs_port_id integer,
    device_id integer NOT NULL
);


ALTER TABLE public.dcim_consoleport OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleport_id_seq OWNED BY public.dcim_consoleport.id;


--
-- Name: dcim_consoleporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleporttemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_consoleporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleporttemplate_id_seq OWNED BY public.dcim_consoleporttemplate.id;


--
-- Name: dcim_consoleserverport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverport (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.dcim_consoleserverport OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverport_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverport_id_seq OWNED BY public.dcim_consoleserverport.id;


--
-- Name: dcim_consoleserverporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_consoleserverporttemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_consoleserverporttemplate OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_consoleserverporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_consoleserverporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_consoleserverporttemplate_id_seq OWNED BY public.dcim_consoleserverporttemplate.id;


--
-- Name: dcim_device; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_device (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(64),
    serial character varying(50) NOT NULL,
    "position" smallint,
    face smallint,
    status smallint NOT NULL,
    comments text NOT NULL,
    device_role_id integer NOT NULL,
    device_type_id integer NOT NULL,
    platform_id integer,
    rack_id integer,
    primary_ip4_id integer,
    primary_ip6_id integer,
    tenant_id integer,
    asset_tag character varying(50),
    site_id integer NOT NULL,
    cluster_id integer,
    virtual_chassis_id integer,
    vc_position smallint,
    vc_priority smallint,
    CONSTRAINT dcim_device_face_check CHECK ((face >= 0)),
    CONSTRAINT dcim_device_position_check CHECK (("position" >= 0)),
    CONSTRAINT dcim_device_status_4f698226_check CHECK ((status >= 0)),
    CONSTRAINT dcim_device_vc_position_check CHECK ((vc_position >= 0)),
    CONSTRAINT dcim_device_vc_priority_check CHECK ((vc_priority >= 0))
);


ALTER TABLE public.dcim_device OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_device_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_device_id_seq OWNER TO netbox;

--
-- Name: dcim_device_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_device_id_seq OWNED BY public.dcim_device.id;


--
-- Name: dcim_devicebay; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebay (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_id integer NOT NULL,
    installed_device_id integer
);


ALTER TABLE public.dcim_devicebay OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebay_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebay_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebay_id_seq OWNED BY public.dcim_devicebay.id;


--
-- Name: dcim_devicebaytemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicebaytemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_devicebaytemplate OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicebaytemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicebaytemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicebaytemplate_id_seq OWNED BY public.dcim_devicebaytemplate.id;


--
-- Name: dcim_devicerole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicerole (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    color character varying(6) NOT NULL,
    vm_role boolean NOT NULL
);


ALTER TABLE public.dcim_devicerole OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicerole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicerole_id_seq OWNER TO netbox;

--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicerole_id_seq OWNED BY public.dcim_devicerole.id;


--
-- Name: dcim_devicetype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_devicetype (
    id integer NOT NULL,
    model character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    u_height smallint NOT NULL,
    is_full_depth boolean NOT NULL,
    is_console_server boolean NOT NULL,
    is_pdu boolean NOT NULL,
    is_network_device boolean NOT NULL,
    manufacturer_id integer NOT NULL,
    subdevice_role boolean,
    part_number character varying(50) NOT NULL,
    comments text NOT NULL,
    interface_ordering smallint NOT NULL,
    CONSTRAINT dcim_devicetype_interface_ordering_check CHECK ((interface_ordering >= 0)),
    CONSTRAINT dcim_devicetype_u_height_check CHECK ((u_height >= 0))
);


ALTER TABLE public.dcim_devicetype OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_devicetype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_devicetype_id_seq OWNER TO netbox;

--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_devicetype_id_seq OWNED BY public.dcim_devicetype.id;


--
-- Name: dcim_interface; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    form_factor smallint NOT NULL,
    mgmt_only boolean NOT NULL,
    description character varying(100) NOT NULL,
    device_id integer,
    mac_address macaddr,
    lag_id integer,
    enabled boolean NOT NULL,
    mtu smallint,
    virtual_machine_id integer,
    mode smallint,
    untagged_vlan_id integer,
    CONSTRAINT dcim_interface_form_factor_check CHECK ((form_factor >= 0)),
    CONSTRAINT dcim_interface_mode_check CHECK ((mode >= 0)),
    CONSTRAINT dcim_interface_mtu_check CHECK ((mtu >= 0))
);


ALTER TABLE public.dcim_interface OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_id_seq OWNED BY public.dcim_interface.id;


--
-- Name: dcim_interface_tagged_vlans; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interface_tagged_vlans (
    id integer NOT NULL,
    interface_id integer NOT NULL,
    vlan_id integer NOT NULL
);


ALTER TABLE public.dcim_interface_tagged_vlans OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interface_tagged_vlans_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interface_tagged_vlans_id_seq OWNER TO netbox;

--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interface_tagged_vlans_id_seq OWNED BY public.dcim_interface_tagged_vlans.id;


--
-- Name: dcim_interfaceconnection; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfaceconnection (
    id integer NOT NULL,
    connection_status boolean NOT NULL,
    interface_a_id integer NOT NULL,
    interface_b_id integer NOT NULL
);


ALTER TABLE public.dcim_interfaceconnection OWNER TO netbox;

--
-- Name: dcim_interfaceconnection_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfaceconnection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfaceconnection_id_seq OWNER TO netbox;

--
-- Name: dcim_interfaceconnection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfaceconnection_id_seq OWNED BY public.dcim_interfaceconnection.id;


--
-- Name: dcim_interfacetemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_interfacetemplate (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    form_factor smallint NOT NULL,
    mgmt_only boolean NOT NULL,
    device_type_id integer NOT NULL,
    CONSTRAINT dcim_interfacetemplate_form_factor_check CHECK ((form_factor >= 0))
);


ALTER TABLE public.dcim_interfacetemplate OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_interfacetemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_interfacetemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_interfacetemplate_id_seq OWNED BY public.dcim_interfacetemplate.id;


--
-- Name: dcim_inventoryitem; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_inventoryitem (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    part_id character varying(50) NOT NULL,
    serial character varying(50) NOT NULL,
    discovered boolean NOT NULL,
    device_id integer NOT NULL,
    parent_id integer,
    manufacturer_id integer,
    asset_tag character varying(50),
    description character varying(100) NOT NULL
);


ALTER TABLE public.dcim_inventoryitem OWNER TO netbox;

--
-- Name: dcim_manufacturer; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_manufacturer (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.dcim_manufacturer OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_manufacturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_manufacturer_id_seq OWNER TO netbox;

--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_manufacturer_id_seq OWNED BY public.dcim_manufacturer.id;


--
-- Name: dcim_module_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_module_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_module_id_seq OWNER TO netbox;

--
-- Name: dcim_module_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_module_id_seq OWNED BY public.dcim_inventoryitem.id;


--
-- Name: dcim_platform; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_platform (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    rpc_client character varying(30) NOT NULL,
    napalm_driver character varying(50) NOT NULL,
    manufacturer_id integer
);


ALTER TABLE public.dcim_platform OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_platform_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_platform_id_seq OWNER TO netbox;

--
-- Name: dcim_platform_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_platform_id_seq OWNED BY public.dcim_platform.id;


--
-- Name: dcim_poweroutlet; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlet (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.dcim_poweroutlet OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlet_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlet_id_seq OWNED BY public.dcim_poweroutlet.id;


--
-- Name: dcim_poweroutlettemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_poweroutlettemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_poweroutlettemplate OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_poweroutlettemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_poweroutlettemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_poweroutlettemplate_id_seq OWNED BY public.dcim_poweroutlettemplate.id;


--
-- Name: dcim_powerport; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerport (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    connection_status boolean,
    device_id integer NOT NULL,
    power_outlet_id integer
);


ALTER TABLE public.dcim_powerport OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerport_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerport_id_seq OWNER TO netbox;

--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerport_id_seq OWNED BY public.dcim_powerport.id;


--
-- Name: dcim_powerporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_powerporttemplate (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    device_type_id integer NOT NULL
);


ALTER TABLE public.dcim_powerporttemplate OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_powerporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_powerporttemplate_id_seq OWNER TO netbox;

--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_powerporttemplate_id_seq OWNED BY public.dcim_powerporttemplate.id;


--
-- Name: dcim_rack; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rack (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    facility_id character varying(50),
    u_height smallint NOT NULL,
    comments text NOT NULL,
    group_id integer,
    site_id integer NOT NULL,
    tenant_id integer,
    type smallint,
    width smallint NOT NULL,
    role_id integer,
    desc_units boolean NOT NULL,
    serial character varying(50) NOT NULL,
    CONSTRAINT dcim_rack_type_check CHECK ((type >= 0)),
    CONSTRAINT dcim_rack_u_height_check CHECK ((u_height >= 0)),
    CONSTRAINT dcim_rack_width_check CHECK ((width >= 0))
);


ALTER TABLE public.dcim_rack OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rack_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rack_id_seq OWNER TO netbox;

--
-- Name: dcim_rack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rack_id_seq OWNED BY public.dcim_rack.id;


--
-- Name: dcim_rackgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackgroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.dcim_rackgroup OWNER TO netbox;

--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackgroup_id_seq OWNER TO netbox;

--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackgroup_id_seq OWNED BY public.dcim_rackgroup.id;


--
-- Name: dcim_rackreservation; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackreservation (
    id integer NOT NULL,
    units smallint[] NOT NULL,
    created timestamp with time zone NOT NULL,
    description character varying(100) NOT NULL,
    rack_id integer NOT NULL,
    user_id integer NOT NULL,
    tenant_id integer
);


ALTER TABLE public.dcim_rackreservation OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackreservation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackreservation_id_seq OWNER TO netbox;

--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackreservation_id_seq OWNED BY public.dcim_rackreservation.id;


--
-- Name: dcim_rackrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_rackrole (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    color character varying(6) NOT NULL
);


ALTER TABLE public.dcim_rackrole OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_rackrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_rackrole_id_seq OWNER TO netbox;

--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_rackrole_id_seq OWNED BY public.dcim_rackrole.id;


--
-- Name: dcim_region; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_region (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    lft integer NOT NULL,
    rght integer NOT NULL,
    tree_id integer NOT NULL,
    level integer NOT NULL,
    parent_id integer,
    CONSTRAINT dcim_region_level_check CHECK ((level >= 0)),
    CONSTRAINT dcim_region_lft_check CHECK ((lft >= 0)),
    CONSTRAINT dcim_region_rght_check CHECK ((rght >= 0)),
    CONSTRAINT dcim_region_tree_id_check CHECK ((tree_id >= 0))
);


ALTER TABLE public.dcim_region OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_region_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_region_id_seq OWNER TO netbox;

--
-- Name: dcim_region_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_region_id_seq OWNED BY public.dcim_region.id;


--
-- Name: dcim_site; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_site (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    facility character varying(50) NOT NULL,
    asn bigint,
    physical_address character varying(200) NOT NULL,
    shipping_address character varying(200) NOT NULL,
    comments text NOT NULL,
    tenant_id integer,
    contact_email character varying(254) NOT NULL,
    contact_name character varying(50) NOT NULL,
    contact_phone character varying(20) NOT NULL,
    region_id integer,
    description character varying(100) NOT NULL,
    status smallint NOT NULL,
    time_zone character varying(63) NOT NULL,
    CONSTRAINT dcim_site_status_check CHECK ((status >= 0))
);


ALTER TABLE public.dcim_site OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_site_id_seq OWNER TO netbox;

--
-- Name: dcim_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_site_id_seq OWNED BY public.dcim_site.id;


--
-- Name: dcim_virtualchassis; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.dcim_virtualchassis (
    id integer NOT NULL,
    domain character varying(30) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.dcim_virtualchassis OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.dcim_virtualchassis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dcim_virtualchassis_id_seq OWNER TO netbox;

--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.dcim_virtualchassis_id_seq OWNED BY public.dcim_virtualchassis.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO netbox;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO netbox;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO netbox;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO netbox;

--
-- Name: extras_customfield; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield (
    id integer NOT NULL,
    type smallint NOT NULL,
    name character varying(50) NOT NULL,
    label character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    required boolean NOT NULL,
    "default" character varying(100) NOT NULL,
    weight smallint NOT NULL,
    filter_logic smallint NOT NULL,
    CONSTRAINT extras_customfield_filter_logic_check CHECK ((filter_logic >= 0)),
    CONSTRAINT extras_customfield_type_check CHECK ((type >= 0)),
    CONSTRAINT extras_customfield_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfield OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_id_seq OWNED BY public.extras_customfield.id;


--
-- Name: extras_customfield_obj_type; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfield_obj_type (
    id integer NOT NULL,
    customfield_id integer NOT NULL,
    contenttype_id integer NOT NULL
);


ALTER TABLE public.extras_customfield_obj_type OWNER TO netbox;

--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfield_obj_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfield_obj_type_id_seq OWNER TO netbox;

--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfield_obj_type_id_seq OWNED BY public.extras_customfield_obj_type.id;


--
-- Name: extras_customfieldchoice; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfieldchoice (
    id integer NOT NULL,
    value character varying(100) NOT NULL,
    weight smallint NOT NULL,
    field_id integer NOT NULL,
    CONSTRAINT extras_customfieldchoice_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_customfieldchoice OWNER TO netbox;

--
-- Name: extras_customfieldchoice_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfieldchoice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfieldchoice_id_seq OWNER TO netbox;

--
-- Name: extras_customfieldchoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfieldchoice_id_seq OWNED BY public.extras_customfieldchoice.id;


--
-- Name: extras_customfieldvalue; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_customfieldvalue (
    id integer NOT NULL,
    obj_id integer NOT NULL,
    serialized_value character varying(255) NOT NULL,
    field_id integer NOT NULL,
    obj_type_id integer NOT NULL,
    CONSTRAINT extras_customfieldvalue_obj_id_check CHECK ((obj_id >= 0))
);


ALTER TABLE public.extras_customfieldvalue OWNER TO netbox;

--
-- Name: extras_customfieldvalue_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_customfieldvalue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_customfieldvalue_id_seq OWNER TO netbox;

--
-- Name: extras_customfieldvalue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_customfieldvalue_id_seq OWNED BY public.extras_customfieldvalue.id;


--
-- Name: extras_exporttemplate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_exporttemplate (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    template_code text NOT NULL,
    mime_type character varying(15) NOT NULL,
    file_extension character varying(15) NOT NULL,
    content_type_id integer NOT NULL,
    description character varying(200) NOT NULL
);


ALTER TABLE public.extras_exporttemplate OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_exporttemplate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_exporttemplate_id_seq OWNER TO netbox;

--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_exporttemplate_id_seq OWNED BY public.extras_exporttemplate.id;


--
-- Name: extras_graph; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_graph (
    id integer NOT NULL,
    type smallint NOT NULL,
    weight smallint NOT NULL,
    name character varying(100) NOT NULL,
    source character varying(500) NOT NULL,
    link character varying(200) NOT NULL,
    CONSTRAINT extras_graph_type_check CHECK ((type >= 0)),
    CONSTRAINT extras_graph_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.extras_graph OWNER TO netbox;

--
-- Name: extras_graph_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_graph_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_graph_id_seq OWNER TO netbox;

--
-- Name: extras_graph_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_graph_id_seq OWNED BY public.extras_graph.id;


--
-- Name: extras_imageattachment; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_imageattachment (
    id integer NOT NULL,
    object_id integer NOT NULL,
    image character varying(100) NOT NULL,
    image_height smallint NOT NULL,
    image_width smallint NOT NULL,
    name character varying(50) NOT NULL,
    created timestamp with time zone NOT NULL,
    content_type_id integer NOT NULL,
    CONSTRAINT extras_imageattachment_image_height_check CHECK ((image_height >= 0)),
    CONSTRAINT extras_imageattachment_image_width_check CHECK ((image_width >= 0)),
    CONSTRAINT extras_imageattachment_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_imageattachment OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_imageattachment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_imageattachment_id_seq OWNER TO netbox;

--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_imageattachment_id_seq OWNED BY public.extras_imageattachment.id;


--
-- Name: extras_reportresult; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_reportresult (
    id integer NOT NULL,
    report character varying(255) NOT NULL,
    created timestamp with time zone NOT NULL,
    failed boolean NOT NULL,
    data jsonb NOT NULL,
    user_id integer
);


ALTER TABLE public.extras_reportresult OWNER TO netbox;

--
-- Name: extras_reportresult_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_reportresult_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_reportresult_id_seq OWNER TO netbox;

--
-- Name: extras_reportresult_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_reportresult_id_seq OWNED BY public.extras_reportresult.id;


--
-- Name: extras_topologymap; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_topologymap (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    device_patterns text NOT NULL,
    description character varying(100) NOT NULL,
    site_id integer,
    type smallint NOT NULL,
    CONSTRAINT extras_topologymap_type_check CHECK ((type >= 0))
);


ALTER TABLE public.extras_topologymap OWNER TO netbox;

--
-- Name: extras_topologymap_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_topologymap_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_topologymap_id_seq OWNER TO netbox;

--
-- Name: extras_topologymap_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_topologymap_id_seq OWNED BY public.extras_topologymap.id;


--
-- Name: extras_useraction; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.extras_useraction (
    id integer NOT NULL,
    "time" timestamp with time zone NOT NULL,
    object_id integer,
    action smallint NOT NULL,
    message text NOT NULL,
    content_type_id integer NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT extras_useraction_action_check CHECK ((action >= 0)),
    CONSTRAINT extras_useraction_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.extras_useraction OWNER TO netbox;

--
-- Name: extras_useraction_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.extras_useraction_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extras_useraction_id_seq OWNER TO netbox;

--
-- Name: extras_useraction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.extras_useraction_id_seq OWNED BY public.extras_useraction.id;


--
-- Name: ipam_aggregate; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_aggregate (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    family smallint NOT NULL,
    prefix cidr NOT NULL,
    date_added date,
    description character varying(100) NOT NULL,
    rir_id integer NOT NULL,
    CONSTRAINT ipam_aggregate_family_check CHECK ((family >= 0))
);


ALTER TABLE public.ipam_aggregate OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_aggregate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_aggregate_id_seq OWNER TO netbox;

--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_aggregate_id_seq OWNED BY public.ipam_aggregate.id;


--
-- Name: ipam_ipaddress; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_ipaddress (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    family smallint NOT NULL,
    address inet NOT NULL,
    description character varying(100) NOT NULL,
    interface_id integer,
    nat_inside_id integer,
    vrf_id integer,
    tenant_id integer,
    status smallint NOT NULL,
    role smallint,
    CONSTRAINT ipam_ipaddress_family_check CHECK ((family >= 0)),
    CONSTRAINT ipam_ipaddress_role_check CHECK ((role >= 0)),
    CONSTRAINT ipam_ipaddress_status_check CHECK ((status >= 0))
);


ALTER TABLE public.ipam_ipaddress OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_ipaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_ipaddress_id_seq OWNER TO netbox;

--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_ipaddress_id_seq OWNED BY public.ipam_ipaddress.id;


--
-- Name: ipam_prefix; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_prefix (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    family smallint NOT NULL,
    prefix cidr NOT NULL,
    status smallint NOT NULL,
    description character varying(100) NOT NULL,
    role_id integer,
    site_id integer,
    vlan_id integer,
    vrf_id integer,
    tenant_id integer,
    is_pool boolean NOT NULL,
    CONSTRAINT ipam_prefix_family_check CHECK ((family >= 0)),
    CONSTRAINT ipam_prefix_status_check CHECK ((status >= 0))
);


ALTER TABLE public.ipam_prefix OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_prefix_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_prefix_id_seq OWNER TO netbox;

--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_prefix_id_seq OWNED BY public.ipam_prefix.id;


--
-- Name: ipam_rir; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_rir (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    is_private boolean NOT NULL
);


ALTER TABLE public.ipam_rir OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_rir_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_rir_id_seq OWNER TO netbox;

--
-- Name: ipam_rir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_rir_id_seq OWNED BY public.ipam_rir.id;


--
-- Name: ipam_role; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_role (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    weight smallint NOT NULL,
    CONSTRAINT ipam_role_weight_check CHECK ((weight >= 0))
);


ALTER TABLE public.ipam_role OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_role_id_seq OWNER TO netbox;

--
-- Name: ipam_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_role_id_seq OWNED BY public.ipam_role.id;


--
-- Name: ipam_service; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(30) NOT NULL,
    protocol smallint NOT NULL,
    port integer NOT NULL,
    description character varying(100) NOT NULL,
    device_id integer,
    virtual_machine_id integer,
    CONSTRAINT ipam_service_port_check CHECK ((port >= 0)),
    CONSTRAINT ipam_service_protocol_check CHECK ((protocol >= 0))
);


ALTER TABLE public.ipam_service OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_id_seq OWNER TO netbox;

--
-- Name: ipam_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_id_seq OWNED BY public.ipam_service.id;


--
-- Name: ipam_service_ipaddresses; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_service_ipaddresses (
    id integer NOT NULL,
    service_id integer NOT NULL,
    ipaddress_id integer NOT NULL
);


ALTER TABLE public.ipam_service_ipaddresses OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_service_ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_service_ipaddresses_id_seq OWNER TO netbox;

--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_service_ipaddresses_id_seq OWNED BY public.ipam_service_ipaddresses.id;


--
-- Name: ipam_vlan; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlan (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    vid smallint NOT NULL,
    name character varying(64) NOT NULL,
    status smallint NOT NULL,
    role_id integer,
    site_id integer,
    group_id integer,
    description character varying(100) NOT NULL,
    tenant_id integer,
    CONSTRAINT ipam_vlan_status_check CHECK ((status >= 0)),
    CONSTRAINT ipam_vlan_vid_check CHECK ((vid >= 0))
);


ALTER TABLE public.ipam_vlan OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlan_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlan_id_seq OWNER TO netbox;

--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlan_id_seq OWNED BY public.ipam_vlan.id;


--
-- Name: ipam_vlangroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vlangroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL,
    site_id integer
);


ALTER TABLE public.ipam_vlangroup OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vlangroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vlangroup_id_seq OWNER TO netbox;

--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vlangroup_id_seq OWNED BY public.ipam_vlangroup.id;


--
-- Name: ipam_vrf; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.ipam_vrf (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(50) NOT NULL,
    rd character varying(21) NOT NULL,
    description character varying(100) NOT NULL,
    enforce_unique boolean NOT NULL,
    tenant_id integer
);


ALTER TABLE public.ipam_vrf OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.ipam_vrf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ipam_vrf_id_seq OWNER TO netbox;

--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.ipam_vrf_id_seq OWNED BY public.ipam_vrf.id;


--
-- Name: secrets_secret; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secret (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    ciphertext bytea NOT NULL,
    hash character varying(128) NOT NULL,
    device_id integer NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.secrets_secret OWNER TO netbox;

--
-- Name: secrets_secret_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secret_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secret_id_seq OWNER TO netbox;

--
-- Name: secrets_secret_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secret_id_seq OWNED BY public.secrets_secret.id;


--
-- Name: secrets_secretrole; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.secrets_secretrole OWNER TO netbox;

--
-- Name: secrets_secretrole_groups; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole_groups (
    id integer NOT NULL,
    secretrole_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.secrets_secretrole_groups OWNER TO netbox;

--
-- Name: secrets_secretrole_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_groups_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_groups_id_seq OWNED BY public.secrets_secretrole_groups.id;


--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_id_seq OWNED BY public.secrets_secretrole.id;


--
-- Name: secrets_secretrole_users; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_secretrole_users (
    id integer NOT NULL,
    secretrole_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.secrets_secretrole_users OWNER TO netbox;

--
-- Name: secrets_secretrole_users_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_secretrole_users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_secretrole_users_id_seq OWNER TO netbox;

--
-- Name: secrets_secretrole_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_secretrole_users_id_seq OWNED BY public.secrets_secretrole_users.id;


--
-- Name: secrets_sessionkey; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_sessionkey (
    id integer NOT NULL,
    cipher bytea NOT NULL,
    hash character varying(128) NOT NULL,
    created timestamp with time zone NOT NULL,
    userkey_id integer NOT NULL
);


ALTER TABLE public.secrets_sessionkey OWNER TO netbox;

--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_sessionkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_sessionkey_id_seq OWNER TO netbox;

--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_sessionkey_id_seq OWNED BY public.secrets_sessionkey.id;


--
-- Name: secrets_userkey; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.secrets_userkey (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    public_key text NOT NULL,
    master_key_cipher bytea,
    user_id integer NOT NULL
);


ALTER TABLE public.secrets_userkey OWNER TO netbox;

--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.secrets_userkey_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.secrets_userkey_id_seq OWNER TO netbox;

--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.secrets_userkey_id_seq OWNED BY public.secrets_userkey.id;


--
-- Name: tenancy_tenant; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenant (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(30) NOT NULL,
    slug character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id integer
);


ALTER TABLE public.tenancy_tenant OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenant_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenant_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenant_id_seq OWNED BY public.tenancy_tenant.id;


--
-- Name: tenancy_tenantgroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.tenancy_tenantgroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.tenancy_tenantgroup OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.tenancy_tenantgroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tenancy_tenantgroup_id_seq OWNER TO netbox;

--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.tenancy_tenantgroup_id_seq OWNED BY public.tenancy_tenantgroup.id;


--
-- Name: users_token; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.users_token (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    expires timestamp with time zone,
    key character varying(40) NOT NULL,
    write_enabled boolean NOT NULL,
    description character varying(100) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.users_token OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.users_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_token_id_seq OWNER TO netbox;

--
-- Name: users_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.users_token_id_seq OWNED BY public.users_token.id;


--
-- Name: virtualization_cluster; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_cluster (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(100) NOT NULL,
    comments text NOT NULL,
    group_id integer,
    type_id integer NOT NULL,
    site_id integer
);


ALTER TABLE public.virtualization_cluster OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_cluster_id_seq OWNER TO netbox;

--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_cluster_id_seq OWNED BY public.virtualization_cluster.id;


--
-- Name: virtualization_clustergroup; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustergroup (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.virtualization_clustergroup OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustergroup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustergroup_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustergroup_id_seq OWNED BY public.virtualization_clustergroup.id;


--
-- Name: virtualization_clustertype; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_clustertype (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    slug character varying(50) NOT NULL
);


ALTER TABLE public.virtualization_clustertype OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_clustertype_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_clustertype_id_seq OWNER TO netbox;

--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_clustertype_id_seq OWNED BY public.virtualization_clustertype.id;


--
-- Name: virtualization_virtualmachine; Type: TABLE; Schema: public; Owner: netbox
--

CREATE TABLE public.virtualization_virtualmachine (
    id integer NOT NULL,
    created date NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(64) NOT NULL,
    vcpus smallint,
    memory integer,
    disk integer,
    comments text NOT NULL,
    cluster_id integer NOT NULL,
    platform_id integer,
    primary_ip4_id integer,
    primary_ip6_id integer,
    tenant_id integer,
    status smallint NOT NULL,
    role_id integer,
    CONSTRAINT virtualization_virtualmachine_disk_check CHECK ((disk >= 0)),
    CONSTRAINT virtualization_virtualmachine_memory_check CHECK ((memory >= 0)),
    CONSTRAINT virtualization_virtualmachine_status_check CHECK ((status >= 0)),
    CONSTRAINT virtualization_virtualmachine_vcpus_check CHECK ((vcpus >= 0))
);


ALTER TABLE public.virtualization_virtualmachine OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE; Schema: public; Owner: netbox
--

CREATE SEQUENCE public.virtualization_virtualmachine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.virtualization_virtualmachine_id_seq OWNER TO netbox;

--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: netbox
--

ALTER SEQUENCE public.virtualization_virtualmachine_id_seq OWNED BY public.virtualization_virtualmachine.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: circuits_circuit id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuit_id_seq'::regclass);


--
-- Name: circuits_circuittermination id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittermination_id_seq'::regclass);


--
-- Name: circuits_circuittype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype ALTER COLUMN id SET DEFAULT nextval('public.circuits_circuittype_id_seq'::regclass);


--
-- Name: circuits_provider id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider ALTER COLUMN id SET DEFAULT nextval('public.circuits_provider_id_seq'::regclass);


--
-- Name: dcim_consoleport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleport_id_seq'::regclass);


--
-- Name: dcim_consoleporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleporttemplate_id_seq'::regclass);


--
-- Name: dcim_consoleserverport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverport_id_seq'::regclass);


--
-- Name: dcim_consoleserverporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_consoleserverporttemplate_id_seq'::regclass);


--
-- Name: dcim_device id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device ALTER COLUMN id SET DEFAULT nextval('public.dcim_device_id_seq'::regclass);


--
-- Name: dcim_devicebay id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebay_id_seq'::regclass);


--
-- Name: dcim_devicebaytemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicebaytemplate_id_seq'::regclass);


--
-- Name: dcim_devicerole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicerole_id_seq'::regclass);


--
-- Name: dcim_devicetype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype ALTER COLUMN id SET DEFAULT nextval('public.dcim_devicetype_id_seq'::regclass);


--
-- Name: dcim_interface id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_id_seq'::regclass);


--
-- Name: dcim_interface_tagged_vlans id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans ALTER COLUMN id SET DEFAULT nextval('public.dcim_interface_tagged_vlans_id_seq'::regclass);


--
-- Name: dcim_interfaceconnection id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfaceconnection ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfaceconnection_id_seq'::regclass);


--
-- Name: dcim_interfacetemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_interfacetemplate_id_seq'::regclass);


--
-- Name: dcim_inventoryitem id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem ALTER COLUMN id SET DEFAULT nextval('public.dcim_module_id_seq'::regclass);


--
-- Name: dcim_manufacturer id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer ALTER COLUMN id SET DEFAULT nextval('public.dcim_manufacturer_id_seq'::regclass);


--
-- Name: dcim_platform id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform ALTER COLUMN id SET DEFAULT nextval('public.dcim_platform_id_seq'::regclass);


--
-- Name: dcim_poweroutlet id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlet_id_seq'::regclass);


--
-- Name: dcim_poweroutlettemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_poweroutlettemplate_id_seq'::regclass);


--
-- Name: dcim_powerport id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerport_id_seq'::regclass);


--
-- Name: dcim_powerporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate ALTER COLUMN id SET DEFAULT nextval('public.dcim_powerporttemplate_id_seq'::regclass);


--
-- Name: dcim_rack id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack ALTER COLUMN id SET DEFAULT nextval('public.dcim_rack_id_seq'::regclass);


--
-- Name: dcim_rackgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackgroup_id_seq'::regclass);


--
-- Name: dcim_rackreservation id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackreservation_id_seq'::regclass);


--
-- Name: dcim_rackrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole ALTER COLUMN id SET DEFAULT nextval('public.dcim_rackrole_id_seq'::regclass);


--
-- Name: dcim_region id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region ALTER COLUMN id SET DEFAULT nextval('public.dcim_region_id_seq'::regclass);


--
-- Name: dcim_site id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site ALTER COLUMN id SET DEFAULT nextval('public.dcim_site_id_seq'::regclass);


--
-- Name: dcim_virtualchassis id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis ALTER COLUMN id SET DEFAULT nextval('public.dcim_virtualchassis_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: extras_customfield id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_id_seq'::regclass);


--
-- Name: extras_customfield_obj_type id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type ALTER COLUMN id SET DEFAULT nextval('public.extras_customfield_obj_type_id_seq'::regclass);


--
-- Name: extras_customfieldchoice id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice ALTER COLUMN id SET DEFAULT nextval('public.extras_customfieldchoice_id_seq'::regclass);


--
-- Name: extras_customfieldvalue id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue ALTER COLUMN id SET DEFAULT nextval('public.extras_customfieldvalue_id_seq'::regclass);


--
-- Name: extras_exporttemplate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate ALTER COLUMN id SET DEFAULT nextval('public.extras_exporttemplate_id_seq'::regclass);


--
-- Name: extras_graph id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_graph ALTER COLUMN id SET DEFAULT nextval('public.extras_graph_id_seq'::regclass);


--
-- Name: extras_imageattachment id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment ALTER COLUMN id SET DEFAULT nextval('public.extras_imageattachment_id_seq'::regclass);


--
-- Name: extras_reportresult id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult ALTER COLUMN id SET DEFAULT nextval('public.extras_reportresult_id_seq'::regclass);


--
-- Name: extras_topologymap id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap ALTER COLUMN id SET DEFAULT nextval('public.extras_topologymap_id_seq'::regclass);


--
-- Name: extras_useraction id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_useraction ALTER COLUMN id SET DEFAULT nextval('public.extras_useraction_id_seq'::regclass);


--
-- Name: ipam_aggregate id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate ALTER COLUMN id SET DEFAULT nextval('public.ipam_aggregate_id_seq'::regclass);


--
-- Name: ipam_ipaddress id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress ALTER COLUMN id SET DEFAULT nextval('public.ipam_ipaddress_id_seq'::regclass);


--
-- Name: ipam_prefix id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix ALTER COLUMN id SET DEFAULT nextval('public.ipam_prefix_id_seq'::regclass);


--
-- Name: ipam_rir id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir ALTER COLUMN id SET DEFAULT nextval('public.ipam_rir_id_seq'::regclass);


--
-- Name: ipam_role id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role ALTER COLUMN id SET DEFAULT nextval('public.ipam_role_id_seq'::regclass);


--
-- Name: ipam_service id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_id_seq'::regclass);


--
-- Name: ipam_service_ipaddresses id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipam_service_ipaddresses_id_seq'::regclass);


--
-- Name: ipam_vlan id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlan_id_seq'::regclass);


--
-- Name: ipam_vlangroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup ALTER COLUMN id SET DEFAULT nextval('public.ipam_vlangroup_id_seq'::regclass);


--
-- Name: ipam_vrf id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf ALTER COLUMN id SET DEFAULT nextval('public.ipam_vrf_id_seq'::regclass);


--
-- Name: secrets_secret id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret ALTER COLUMN id SET DEFAULT nextval('public.secrets_secret_id_seq'::regclass);


--
-- Name: secrets_secretrole id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_id_seq'::regclass);


--
-- Name: secrets_secretrole_groups id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_groups_id_seq'::regclass);


--
-- Name: secrets_secretrole_users id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users ALTER COLUMN id SET DEFAULT nextval('public.secrets_secretrole_users_id_seq'::regclass);


--
-- Name: secrets_sessionkey id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey ALTER COLUMN id SET DEFAULT nextval('public.secrets_sessionkey_id_seq'::regclass);


--
-- Name: secrets_userkey id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey ALTER COLUMN id SET DEFAULT nextval('public.secrets_userkey_id_seq'::regclass);


--
-- Name: tenancy_tenant id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenant_id_seq'::regclass);


--
-- Name: tenancy_tenantgroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup ALTER COLUMN id SET DEFAULT nextval('public.tenancy_tenantgroup_id_seq'::regclass);


--
-- Name: users_token id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token ALTER COLUMN id SET DEFAULT nextval('public.users_token_id_seq'::regclass);


--
-- Name: virtualization_cluster id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster ALTER COLUMN id SET DEFAULT nextval('public.virtualization_cluster_id_seq'::regclass);


--
-- Name: virtualization_clustergroup id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustergroup_id_seq'::regclass);


--
-- Name: virtualization_clustertype id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype ALTER COLUMN id SET DEFAULT nextval('public.virtualization_clustertype_id_seq'::regclass);


--
-- Name: virtualization_virtualmachine id; Type: DEFAULT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine ALTER COLUMN id SET DEFAULT nextval('public.virtualization_virtualmachine_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add circuit	7	add_circuit
20	Can change circuit	7	change_circuit
21	Can delete circuit	7	delete_circuit
22	Can add circuit type	8	add_circuittype
23	Can change circuit type	8	change_circuittype
24	Can delete circuit type	8	delete_circuittype
25	Can add provider	9	add_provider
26	Can change provider	9	change_provider
27	Can delete provider	9	delete_provider
28	Can add circuit termination	10	add_circuittermination
29	Can change circuit termination	10	change_circuittermination
30	Can delete circuit termination	10	delete_circuittermination
31	Can add console port	11	add_consoleport
32	Can change console port	11	change_consoleport
33	Can delete console port	11	delete_consoleport
34	Can add console port template	12	add_consoleporttemplate
35	Can change console port template	12	change_consoleporttemplate
36	Can delete console port template	12	delete_consoleporttemplate
37	Can add console server port	13	add_consoleserverport
38	Can change console server port	13	change_consoleserverport
39	Can delete console server port	13	delete_consoleserverport
40	Can add console server port template	14	add_consoleserverporttemplate
41	Can change console server port template	14	change_consoleserverporttemplate
42	Can delete console server port template	14	delete_consoleserverporttemplate
43	Can add device	15	add_device
44	Can change device	15	change_device
45	Can delete device	15	delete_device
46	Read-only access to devices via NAPALM	15	napalm_read
47	Read/write access to devices via NAPALM	15	napalm_write
48	Can add device role	16	add_devicerole
49	Can change device role	16	change_devicerole
50	Can delete device role	16	delete_devicerole
51	Can add device type	17	add_devicetype
52	Can change device type	17	change_devicetype
53	Can delete device type	17	delete_devicetype
54	Can add interface	18	add_interface
55	Can change interface	18	change_interface
56	Can delete interface	18	delete_interface
57	Can add interface connection	19	add_interfaceconnection
58	Can change interface connection	19	change_interfaceconnection
59	Can delete interface connection	19	delete_interfaceconnection
60	Can add interface template	20	add_interfacetemplate
61	Can change interface template	20	change_interfacetemplate
62	Can delete interface template	20	delete_interfacetemplate
63	Can add manufacturer	21	add_manufacturer
64	Can change manufacturer	21	change_manufacturer
65	Can delete manufacturer	21	delete_manufacturer
66	Can add platform	22	add_platform
67	Can change platform	22	change_platform
68	Can delete platform	22	delete_platform
69	Can add power outlet	23	add_poweroutlet
70	Can change power outlet	23	change_poweroutlet
71	Can delete power outlet	23	delete_poweroutlet
72	Can add power outlet template	24	add_poweroutlettemplate
73	Can change power outlet template	24	change_poweroutlettemplate
74	Can delete power outlet template	24	delete_poweroutlettemplate
75	Can add power port	25	add_powerport
76	Can change power port	25	change_powerport
77	Can delete power port	25	delete_powerport
78	Can add power port template	26	add_powerporttemplate
79	Can change power port template	26	change_powerporttemplate
80	Can delete power port template	26	delete_powerporttemplate
81	Can add rack	27	add_rack
82	Can change rack	27	change_rack
83	Can delete rack	27	delete_rack
84	Can add rack group	28	add_rackgroup
85	Can change rack group	28	change_rackgroup
86	Can delete rack group	28	delete_rackgroup
87	Can add site	29	add_site
88	Can change site	29	change_site
89	Can delete site	29	delete_site
90	Can add device bay	30	add_devicebay
91	Can change device bay	30	change_devicebay
92	Can delete device bay	30	delete_devicebay
93	Can add device bay template	31	add_devicebaytemplate
94	Can change device bay template	31	change_devicebaytemplate
95	Can delete device bay template	31	delete_devicebaytemplate
96	Can add rack role	32	add_rackrole
97	Can change rack role	32	change_rackrole
98	Can delete rack role	32	delete_rackrole
99	Can add rack reservation	33	add_rackreservation
100	Can change rack reservation	33	change_rackreservation
101	Can delete rack reservation	33	delete_rackreservation
102	Can add region	34	add_region
103	Can change region	34	change_region
104	Can delete region	34	delete_region
105	Can add inventory item	35	add_inventoryitem
106	Can change inventory item	35	change_inventoryitem
107	Can delete inventory item	35	delete_inventoryitem
108	Can add virtual chassis	36	add_virtualchassis
109	Can change virtual chassis	36	change_virtualchassis
110	Can delete virtual chassis	36	delete_virtualchassis
111	Can add aggregate	37	add_aggregate
112	Can change aggregate	37	change_aggregate
113	Can delete aggregate	37	delete_aggregate
114	Can add IP address	38	add_ipaddress
115	Can change IP address	38	change_ipaddress
116	Can delete IP address	38	delete_ipaddress
117	Can add prefix	39	add_prefix
118	Can change prefix	39	change_prefix
119	Can delete prefix	39	delete_prefix
120	Can add RIR	40	add_rir
121	Can change RIR	40	change_rir
122	Can delete RIR	40	delete_rir
123	Can add role	41	add_role
124	Can change role	41	change_role
125	Can delete role	41	delete_role
126	Can add VLAN	42	add_vlan
127	Can change VLAN	42	change_vlan
128	Can delete VLAN	42	delete_vlan
129	Can add VRF	43	add_vrf
130	Can change VRF	43	change_vrf
131	Can delete VRF	43	delete_vrf
132	Can add VLAN group	44	add_vlangroup
133	Can change VLAN group	44	change_vlangroup
134	Can delete VLAN group	44	delete_vlangroup
135	Can add service	45	add_service
136	Can change service	45	change_service
137	Can delete service	45	delete_service
138	Can add export template	46	add_exporttemplate
139	Can change export template	46	change_exporttemplate
140	Can delete export template	46	delete_exporttemplate
141	Can add graph	47	add_graph
142	Can change graph	47	change_graph
143	Can delete graph	47	delete_graph
144	Can add topology map	48	add_topologymap
145	Can change topology map	48	change_topologymap
146	Can delete topology map	48	delete_topologymap
147	Can add user action	49	add_useraction
148	Can change user action	49	change_useraction
149	Can delete user action	49	delete_useraction
150	Can add custom field	50	add_customfield
151	Can change custom field	50	change_customfield
152	Can delete custom field	50	delete_customfield
153	Can add custom field choice	51	add_customfieldchoice
154	Can change custom field choice	51	change_customfieldchoice
155	Can delete custom field choice	51	delete_customfieldchoice
156	Can add custom field value	52	add_customfieldvalue
157	Can change custom field value	52	change_customfieldvalue
158	Can delete custom field value	52	delete_customfieldvalue
159	Can add image attachment	53	add_imageattachment
160	Can change image attachment	53	change_imageattachment
161	Can delete image attachment	53	delete_imageattachment
162	Can add report result	54	add_reportresult
163	Can change report result	54	change_reportresult
164	Can delete report result	54	delete_reportresult
165	Can add secret	55	add_secret
166	Can change secret	55	change_secret
167	Can delete secret	55	delete_secret
168	Can add secret role	56	add_secretrole
169	Can change secret role	56	change_secretrole
170	Can delete secret role	56	delete_secretrole
171	Can add user key	57	add_userkey
172	Can change user key	57	change_userkey
173	Can delete user key	57	delete_userkey
174	Can activate user keys for decryption	57	activate_userkey
175	Can add session key	58	add_sessionkey
176	Can change session key	58	change_sessionkey
177	Can delete session key	58	delete_sessionkey
178	Can add tenant	59	add_tenant
179	Can change tenant	59	change_tenant
180	Can delete tenant	59	delete_tenant
181	Can add tenant group	60	add_tenantgroup
182	Can change tenant group	60	change_tenantgroup
183	Can delete tenant group	60	delete_tenantgroup
184	Can add cluster	62	add_cluster
185	Can change cluster	62	change_cluster
186	Can delete cluster	62	delete_cluster
187	Can add cluster group	63	add_clustergroup
188	Can change cluster group	63	change_clustergroup
189	Can delete cluster group	63	delete_clustergroup
190	Can add cluster type	64	add_clustertype
191	Can change cluster type	64	change_clustertype
192	Can delete cluster type	64	delete_clustertype
193	Can add virtual machine	65	add_virtualmachine
194	Can change virtual machine	65	change_virtualmachine
195	Can delete virtual machine	65	delete_virtualmachine
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$36000$W5RibUfmeFJa$6HgqQ7rDj/0CL9MOYMk4TqVl3iQTF7OXq8oN8S5Ml/M=	2018-11-07 16:46:12.848292+00	t	admin			admin@example.com	t	t	2018-06-03 16:17:44.788445+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuit; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuit (id, created, last_updated, cid, install_date, commit_rate, comments, provider_id, type_id, tenant_id, description, status) FROM stdin;
\.


--
-- Data for Name: circuits_circuittermination; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittermination (id, term_side, port_speed, upstream_speed, xconnect_id, pp_info, circuit_id, interface_id, site_id) FROM stdin;
\.


--
-- Data for Name: circuits_circuittype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_circuittype (id, name, slug) FROM stdin;
\.


--
-- Data for Name: circuits_provider; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.circuits_provider (id, created, last_updated, name, slug, asn, account, portal_url, noc_contact, admin_contact, comments) FROM stdin;
\.


--
-- Data for Name: dcim_consoleport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleport (id, name, connection_status, cs_port_id, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleporttemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverport (id, name, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_consoleserverporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_consoleserverporttemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_device; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_device (id, created, last_updated, name, serial, "position", face, status, comments, device_role_id, device_type_id, platform_id, rack_id, primary_ip4_id, primary_ip6_id, tenant_id, asset_tag, site_id, cluster_id, virtual_chassis_id, vc_position, vc_priority) FROM stdin;
5	2018-06-08	2018-06-08 21:58:28.048198+00	spine01		\N	\N	1		2	1	\N	2	\N	\N	\N	\N	1	\N	\N	\N	\N
6	2018-06-08	2018-06-08 22:35:21.708373+00	spine02		\N	\N	1		2	1	\N	2	\N	\N	\N	\N	1	\N	\N	\N	\N
7	2018-06-08	2018-06-09 07:42:23.365687+00	leaf03		\N	\N	1		1	1	\N	3	\N	\N	\N	\N	1	\N	\N	\N	\N
9	2018-06-09	2018-06-09 08:14:35.463472+00	exit01		\N	\N	1		1	1	\N	4	\N	\N	\N	\N	1	\N	\N	\N	\N
10	2018-06-09	2018-06-09 08:14:44.548963+00	exit02		\N	\N	1		1	1	\N	4	\N	\N	\N	\N	1	\N	\N	\N	\N
11	2018-06-09	2018-06-09 08:15:21.61264+00	super01		\N	\N	1		2	1	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N
12	2018-06-09	2018-06-09 08:15:35.44707+00	super02		\N	\N	1		2	1	\N	5	\N	\N	\N	\N	1	\N	\N	\N	\N
13	2018-06-09	2018-06-09 10:56:18.07976+00	edge01		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N
14	2018-06-09	2018-06-09 10:56:18.10712+00	edge02		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N
15	2018-06-09	2018-06-09 10:56:18.130143+00	rtr01		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N
16	2018-06-09	2018-06-09 10:56:18.153524+00	rtr02		\N	\N	0		1	1	\N	6	\N	\N	\N	\N	1	\N	\N	\N	\N
1	2018-06-03	2018-11-07 16:57:09.294214+00	leaf01		\N	\N	1		1	1	1	1	\N	\N	\N	\N	1	\N	\N	\N	\N
4	2018-06-08	2018-11-07 16:57:09.324612+00	leaf02		\N	\N	1		1	1	1	1	\N	\N	\N	\N	1	\N	\N	\N	\N
8	2018-06-09	2018-11-08 18:52:42.84008+00	leaf04		\N	\N	1		1	1	\N	3	\N	\N	\N	\N	1	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_devicebay; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebay (id, name, device_id, installed_device_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicebaytemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicebaytemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_devicerole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicerole (id, name, slug, color, vm_role) FROM stdin;
1	Leaf	leaf	aa1409	f
2	Spine	spine	aa1409	f
\.


--
-- Data for Name: dcim_devicetype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_devicetype (id, model, slug, u_height, is_full_depth, is_console_server, is_pdu, is_network_device, manufacturer_id, subdevice_role, part_number, comments, interface_ordering) FROM stdin;
1	Cumulus VX	cumulus-vx	0	f	f	f	t	1	\N			1
\.


--
-- Data for Name: dcim_interface; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface (id, name, form_factor, mgmt_only, description, device_id, mac_address, lag_id, enabled, mtu, virtual_machine_id, mode, untagged_vlan_id) FROM stdin;
2	swp1	1000	f		1	\N	1	t	\N	\N	\N	\N
108	irb2501	0	f	bgp_external	13	\N	\N	t	\N	\N	100	7
4	lo	0	f		1	\N	\N	t	\N	\N	\N	\N
7	swp21	1000	f		1	\N	5	t	\N	\N	\N	\N
6	swp20	1000	f		1	\N	5	t	\N	\N	\N	\N
9	clagd-vxlan-anycast-ip	0	f		1	\N	\N	t	\N	\N	\N	\N
109	irb2502	0	f	bgp_external	13	\N	\N	t	\N	\N	100	8
87	peerlink.4094	0	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N
94	lo	0	f		11	\N	\N	t	\N	\N	\N	\N
68	bond01	200	f		9	\N	\N	t	\N	\N	200	\N
110	irb2503	0	f	bgp_external	13	\N	\N	t	\N	\N	100	9
13	swp2	1000	f		1	\N	12	t	\N	\N	\N	\N
111	irb2504	0	f	bgp_external	13	\N	\N	t	\N	\N	100	19
3	irb1000	0	f		1	\N	\N	t	\N	\N	100	1
137	irb1002	0	f		1	\N	\N	t	\N	\N	100	3
5	peerlink	200	f		1	44:38:39:ff:01:02	\N	t	\N	\N	\N	\N
8	peerlink.4094	0	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N
10	swp49	1000	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N
11	swp50	1000	f	bgp_underlay	1	\N	\N	t	\N	\N	\N	\N
16	bond02	200	f		4	\N	\N	t	\N	\N	200	\N
69	bond02	200	f		9	\N	\N	t	\N	\N	200	\N
17	clagd-vxlan-anycast-ip	0	f		4	\N	\N	t	\N	\N	\N	\N
71	irb1000	0	f		9	\N	\N	t	\N	\N	100	1
19	lo	0	f		4	\N	\N	t	\N	\N	\N	\N
21	peerlink.4094	0	f	bgp_underlay	4	\N	\N	t	\N	\N	\N	\N
20	peerlink	200	f		4	44:38:39:ff:01:02	\N	t	\N	\N	\N	\N
22	swp1	1000	f		4	\N	15	t	\N	\N	\N	\N
23	swp2	1000	f		4	\N	16	t	\N	\N	\N	\N
24	swp20	1000	f		4	\N	20	t	\N	\N	\N	\N
25	swp21	1000	f		4	\N	20	t	\N	\N	\N	\N
26	swp49	1000	f	bgp_underlay	4	\N	\N	t	\N	\N	\N	\N
27	swp50	1000	f	bgp_underlay	4	\N	\N	t	\N	\N	\N	\N
18	irb1000	0	f		4	\N	\N	t	\N	\N	100	1
28	lo	0	f		5	\N	\N	t	\N	\N	\N	\N
29	swp1	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N
30	swp2	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N
31	swp3	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N
32	swp4	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N
33	swp5	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N
34	swp6	1000	f	bgp_underlay	5	\N	\N	t	\N	\N	\N	\N
35	lo	0	f		6	\N	\N	t	\N	\N	\N	\N
36	swp1	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N
37	swp2	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N
38	swp3	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N
39	swp4	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N
40	swp5	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N
41	swp6	1000	f	bgp_underlay	6	\N	\N	t	\N	\N	\N	\N
46	lo	0	f		7	\N	\N	t	\N	\N	\N	\N
48	peerlink.4094	0	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N
51	swp20	1000	f		7	\N	47	t	\N	\N	\N	\N
52	swp21	1000	f		7	\N	47	t	\N	\N	\N	\N
53	swp49	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N
54	swp50	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N
81	bond01	200	f		10	\N	\N	t	\N	\N	200	\N
70	clagd-vxlan-anycast-ip	0	f		9	\N	\N	t	\N	\N	\N	\N
1	bond01	200	f		1	\N	\N	t	\N	\N	200	\N
59	lo	0	f		8	\N	\N	t	\N	\N	\N	\N
60	peerlink	200	f		8	44:38:39:ff:01:34	\N	t	\N	\N	\N	\N
47	peerlink	200	f		7	44:38:39:ff:01:34	\N	t	\N	\N	\N	\N
61	peerlink.4094	0	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N
64	swp20	1000	f		8	\N	60	t	\N	\N	\N	\N
65	swp21	1000	f		8	\N	60	t	\N	\N	\N	\N
66	swp49	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N
67	swp50	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N
72	lo	0	f		9	\N	\N	t	\N	\N	\N	\N
74	peerlink.4094	0	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N
75	swp1	1000	f		9	\N	68	t	\N	\N	\N	\N
76	swp2	1000	f		9	\N	69	t	\N	\N	\N	\N
77	swp20	1000	f		9	\N	73	t	\N	\N	\N	\N
78	swp21	1000	f		9	\N	73	t	\N	\N	\N	\N
79	swp49	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N
80	swp50	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N
73	peerlink	200	f		9	44:38:39:ff:01:56	\N	t	\N	\N	\N	\N
83	clagd-vxlan-anycast-ip	0	f		10	\N	\N	t	\N	\N	\N	\N
85	lo	0	f		10	\N	\N	t	\N	\N	\N	\N
88	swp1	1000	f		10	\N	81	t	\N	\N	\N	\N
89	swp2	1000	f		10	\N	82	t	\N	\N	\N	\N
86	peerlink	200	f		10	44:38:39:ff:01:56	\N	t	\N	\N	\N	\N
90	swp20	1000	f		10	\N	86	t	\N	\N	\N	\N
91	swp21	1000	f		10	\N	86	t	\N	\N	\N	\N
92	swp49	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N
93	swp50	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N
99	lo	0	f		12	\N	\N	t	\N	\N	\N	\N
100	swp1	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N
101	swp2	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N
102	swp49	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N
103	swp50	1000	f	bgp_underlay	12	\N	\N	t	\N	\N	\N	\N
95	swp1	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N
96	swp2	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N
97	swp49	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N
98	swp50	1000	f	bgp_underlay	11	\N	\N	t	\N	\N	\N	\N
104	swp1	1000	f	bgp_underlay	13	\N	\N	t	\N	\N	\N	\N
105	swp2	1000	f	bgp_underlay	13	\N	\N	t	\N	\N	\N	\N
12	bond02	200	f		1	\N	\N	t	\N	\N	200	1
15	bond01	200	f		4	\N	\N	t	\N	\N	200	\N
82	bond02	200	f		10	\N	\N	t	\N	\N	200	\N
106	swp49	1000	f		13	\N	\N	t	\N	\N	200	\N
107	swp50	1000	f		13	\N	\N	t	\N	\N	200	\N
115	irb2508	0	f	bgp_external	14	\N	\N	t	\N	\N	100	14
116	swp1	1000	f	bgp_underlay	14	\N	\N	t	\N	\N	\N	\N
117	swp2	1000	f	bgp_underlay	14	\N	\N	t	\N	\N	\N	\N
129	swp2	1000	f		16	\N	\N	t	\N	\N	200	\N
120	swp1	1000	f		15	\N	\N	t	\N	\N	200	\N
121	swp2	1000	f		15	\N	\N	t	\N	\N	200	\N
62	swp1	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N
63	swp2	1000	f	bgp_underlay	8	\N	\N	t	\N	\N	\N	\N
122	irb2501	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	7
123	irb2502	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	8
124	irb2505	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	11
125	irb2506	0	f	bgp_underlay	15	\N	\N	t	\N	\N	100	12
126	irb2701	0	f	bgp_external	15	\N	\N	t	\N	\N	100	16
127	irb2702	0	f	bgp_external	15	\N	\N	t	\N	\N	100	17
141	irb1001	0	f		4	\N	\N	t	\N	\N	100	2
128	swp1	1000	f		16	\N	\N	t	\N	\N	200	\N
142	irb1002	0	f		4	\N	\N	t	\N	\N	100	3
130	irb2503	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	9
131	irb2504	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	10
132	irb2507	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	13
133	irb2508	0	f	bgp_underlay	16	\N	\N	t	\N	\N	100	14
134	irb2703	0	f	bgp_external	16	\N	\N	t	\N	\N	100	18
135	irb2704	0	f	bgp_external	16	\N	\N	t	\N	\N	100	19
143	irb1003	0	f		4	\N	\N	t	\N	\N	100	4
118	swp49	1000	f		14	\N	\N	t	\N	\N	200	\N
144	irb1004	0	f		4	\N	\N	t	\N	\N	100	5
119	swp50	1000	f		14	\N	\N	t	\N	\N	200	\N
112	irb2505	0	f	bgp_external	14	\N	\N	t	\N	\N	100	11
145	irb1005	0	f		4	\N	\N	t	\N	\N	100	6
113	irb2506	0	f	bgp_external	14	\N	\N	t	\N	\N	100	12
114	irb2507	0	f	bgp_external	14	\N	\N	t	\N	\N	100	13
156	irb1001	0	f		9	\N	\N	t	\N	\N	100	2
157	irb1002	0	f		9	\N	\N	t	\N	\N	100	3
158	irb1003	0	f		9	\N	\N	t	\N	\N	100	4
159	irb1004	0	f		9	\N	\N	t	\N	\N	100	5
160	irb1005	0	f		9	\N	\N	t	\N	\N	100	6
136	irb1001	0	f		1	\N	\N	t	\N	\N	100	2
138	irb1003	0	f		1	\N	\N	t	\N	\N	100	4
139	irb1004	0	f		1	\N	\N	t	\N	\N	100	5
140	irb1005	0	f		1	\N	\N	t	\N	\N	100	6
161	irb1001	0	f		10	\N	\N	t	\N	\N	100	2
162	irb1002	0	f		10	\N	\N	t	\N	\N	100	3
163	irb1003	0	f		10	\N	\N	t	\N	\N	100	4
164	irb1004	0	f		10	\N	\N	t	\N	\N	100	5
165	irb1005	0	f		10	\N	\N	t	\N	\N	100	6
84	irb1000	0	f		10	\N	\N	t	\N	\N	100	1
166	swp51	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N
167	swp52	1000	f	bgp_underlay	9	\N	\N	t	\N	\N	\N	\N
168	swp51	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N
169	swp52	1000	f	bgp_underlay	10	\N	\N	t	\N	\N	\N	\N
49	swp1	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N
50	swp2	1000	f	bgp_underlay	7	\N	\N	t	\N	\N	\N	\N
\.


--
-- Data for Name: dcim_interface_tagged_vlans; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interface_tagged_vlans (id, interface_id, vlan_id) FROM stdin;
3	1	2
4	1	1
5	12	1
6	12	2
7	15	1
8	15	2
9	16	1
10	16	2
19	68	1
20	68	2
21	69	1
22	69	2
23	106	7
24	106	8
25	107	9
26	107	10
27	120	7
28	120	8
29	121	11
30	121	12
39	128	9
40	128	10
43	118	11
44	118	12
45	119	13
46	119	14
47	129	13
48	129	14
49	1	3
50	1	4
51	1	5
52	1	6
53	12	3
54	12	4
55	12	5
56	12	6
57	15	3
58	15	4
59	15	5
60	15	6
61	16	3
62	16	4
63	16	5
64	16	6
81	68	3
82	68	4
83	68	5
84	68	6
85	69	3
86	69	4
87	69	5
88	69	6
89	81	1
90	81	2
91	81	3
92	81	4
93	81	5
94	81	6
95	82	1
96	82	2
97	82	3
98	82	4
99	82	5
100	82	6
\.


--
-- Data for Name: dcim_interfaceconnection; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfaceconnection (id, connection_status, interface_a_id, interface_b_id) FROM stdin;
\.


--
-- Data for Name: dcim_interfacetemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_interfacetemplate (id, name, form_factor, mgmt_only, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_inventoryitem; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_inventoryitem (id, name, part_id, serial, discovered, device_id, parent_id, manufacturer_id, asset_tag, description) FROM stdin;
\.


--
-- Data for Name: dcim_manufacturer; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_manufacturer (id, name, slug) FROM stdin;
1	Cumulus Networks	cumulus-networks
\.


--
-- Data for Name: dcim_platform; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_platform (id, name, slug, rpc_client, napalm_driver, manufacturer_id) FROM stdin;
1	Cumulus VX	cumulus-vx			1
\.


--
-- Data for Name: dcim_poweroutlet; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlet (id, name, device_id) FROM stdin;
\.


--
-- Data for Name: dcim_poweroutlettemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_poweroutlettemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerport; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerport (id, name, connection_status, device_id, power_outlet_id) FROM stdin;
\.


--
-- Data for Name: dcim_powerporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_powerporttemplate (id, name, device_type_id) FROM stdin;
\.


--
-- Data for Name: dcim_rack; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rack (id, created, last_updated, name, facility_id, u_height, comments, group_id, site_id, tenant_id, type, width, role_id, desc_units, serial) FROM stdin;
1	2018-06-03	2018-06-09 00:29:07.362749+00	Rack1-pod1	\N	42		1	1	\N	\N	19	\N	f	
2	2018-06-08	2018-06-09 00:29:24.68451+00	Spine-pod1	\N	42		1	1	\N	\N	19	\N	f	
3	2018-06-09	2018-06-09 07:40:04.44653+00	Rack2-pod1	\N	42		1	1	\N	\N	19	\N	f	
4	2018-06-09	2018-06-09 07:40:04.458497+00	Rack3-pod1	\N	42		1	1	\N	\N	19	\N	f	
5	2018-06-09	2018-06-09 07:41:25.050604+00	Superspine	\N	42		3	1	\N	\N	19	\N	f	
6	2018-06-09	2018-06-09 07:41:44.847313+00	Edge	\N	42		2	1	\N	\N	19	\N	f	
7	2018-06-09	2018-06-09 07:44:02.190232+00	exit02	\N	42		1	1	\N	\N	19	\N	f	
\.


--
-- Data for Name: dcim_rackgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackgroup (id, name, slug, site_id) FROM stdin;
1	Pod1	pod1	1
2	Edge	edge	1
3	Superspine	superspine	1
\.


--
-- Data for Name: dcim_rackreservation; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackreservation (id, units, created, description, rack_id, user_id, tenant_id) FROM stdin;
\.


--
-- Data for Name: dcim_rackrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_rackrole (id, name, slug, color) FROM stdin;
\.


--
-- Data for Name: dcim_region; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_region (id, name, slug, lft, rght, tree_id, level, parent_id) FROM stdin;
\.


--
-- Data for Name: dcim_site; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_site (id, created, last_updated, name, slug, facility, asn, physical_address, shipping_address, comments, tenant_id, contact_email, contact_name, contact_phone, region_id, description, status, time_zone) FROM stdin;
1	2018-06-03	2018-06-03 16:38:35.013009+00	Virtual Topology	virtual-topology		\N				\N				\N		1	
\.


--
-- Data for Name: dcim_virtualchassis; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.dcim_virtualchassis (id, domain, master_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-06-03 16:25:40.914279+00	1	Asn	1	[{"added": {}}]	50	1
2	2018-06-03 16:27:46.686262+00	1	Asn	3		50	1
3	2018-06-03 16:29:13.64178+00	2	Asn	1	[{"added": {}}]	50	1
4	2018-06-07 05:43:14.135238+00	3	Clag-peer-ip	1	[{"added": {}}]	50	1
5	2018-06-07 05:43:34.180853+00	4	Clag-backup-ip	1	[{"added": {}}]	50	1
6	2018-06-07 17:15:46.458673+00	4	Clag backup ip	2	[{"changed": {"fields": ["name"]}}]	50	1
7	2018-06-07 17:16:01.316937+00	3	Clag peer ip	2	[{"changed": {"fields": ["name"]}}]	50	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	circuits	circuit
8	circuits	circuittype
9	circuits	provider
10	circuits	circuittermination
11	dcim	consoleport
12	dcim	consoleporttemplate
13	dcim	consoleserverport
14	dcim	consoleserverporttemplate
15	dcim	device
16	dcim	devicerole
17	dcim	devicetype
18	dcim	interface
19	dcim	interfaceconnection
20	dcim	interfacetemplate
21	dcim	manufacturer
22	dcim	platform
23	dcim	poweroutlet
24	dcim	poweroutlettemplate
25	dcim	powerport
26	dcim	powerporttemplate
27	dcim	rack
28	dcim	rackgroup
29	dcim	site
30	dcim	devicebay
31	dcim	devicebaytemplate
32	dcim	rackrole
33	dcim	rackreservation
34	dcim	region
35	dcim	inventoryitem
36	dcim	virtualchassis
37	ipam	aggregate
38	ipam	ipaddress
39	ipam	prefix
40	ipam	rir
41	ipam	role
42	ipam	vlan
43	ipam	vrf
44	ipam	vlangroup
45	ipam	service
46	extras	exporttemplate
47	extras	graph
48	extras	topologymap
49	extras	useraction
50	extras	customfield
51	extras	customfieldchoice
52	extras	customfieldvalue
53	extras	imageattachment
54	extras	reportresult
55	secrets	secret
56	secrets	secretrole
57	secrets	userkey
58	secrets	sessionkey
59	tenancy	tenant
60	tenancy	tenantgroup
61	users	token
62	virtualization	cluster
63	virtualization	clustergroup
64	virtualization	clustertype
65	virtualization	virtualmachine
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-06-03 16:17:20.578801+00
2	auth	0001_initial	2018-06-03 16:17:20.689919+00
3	admin	0001_initial	2018-06-03 16:17:20.842157+00
4	admin	0002_logentry_remove_auto_add	2018-06-03 16:17:20.877575+00
5	contenttypes	0002_remove_content_type_name	2018-06-03 16:17:20.998743+00
6	auth	0002_alter_permission_name_max_length	2018-06-03 16:17:21.061729+00
7	auth	0003_alter_user_email_max_length	2018-06-03 16:17:21.133473+00
8	auth	0004_alter_user_username_opts	2018-06-03 16:17:21.200301+00
9	auth	0005_alter_user_last_login_null	2018-06-03 16:17:21.27122+00
10	auth	0006_require_contenttypes_0002	2018-06-03 16:17:21.280404+00
11	auth	0007_alter_validators_add_error_messages	2018-06-03 16:17:21.309452+00
12	auth	0008_alter_user_username_max_length	2018-06-03 16:17:21.345091+00
13	tenancy	0001_initial	2018-06-03 16:17:21.470322+00
14	dcim	0001_initial	2018-06-03 16:17:22.069796+00
15	ipam	0001_initial	2018-06-03 16:17:22.395409+00
16	dcim	0002_auto_20160622_1821	2018-06-03 16:17:23.13812+00
17	dcim	0003_auto_20160628_1721	2018-06-03 16:17:23.298502+00
18	dcim	0004_auto_20160701_2049	2018-06-03 16:17:23.423694+00
19	dcim	0005_auto_20160706_1722	2018-06-03 16:17:23.465615+00
20	dcim	0006_add_device_primary_ip4_ip6	2018-06-03 16:17:23.536778+00
21	dcim	0007_device_copy_primary_ip	2018-06-03 16:17:23.61124+00
22	dcim	0008_device_remove_primary_ip	2018-06-03 16:17:23.660392+00
23	dcim	0009_site_32bit_asn_support	2018-06-03 16:17:23.708887+00
24	dcim	0010_devicebay_installed_device_set_null	2018-06-03 16:17:23.746221+00
25	dcim	0011_devicetype_part_number	2018-06-03 16:17:23.892476+00
26	dcim	0012_site_rack_device_add_tenant	2018-06-03 16:17:24.13287+00
27	dcim	0013_add_interface_form_factors	2018-06-03 16:17:24.232075+00
28	dcim	0014_rack_add_type_width	2018-06-03 16:17:24.594961+00
29	dcim	0015_rack_add_u_height_validator	2018-06-03 16:17:24.634592+00
30	dcim	0016_module_add_manufacturer	2018-06-03 16:17:24.778807+00
31	dcim	0017_rack_add_role	2018-06-03 16:17:24.934397+00
32	dcim	0018_device_add_asset_tag	2018-06-03 16:17:25.090352+00
33	dcim	0019_new_iface_form_factors	2018-06-03 16:17:25.146524+00
34	dcim	0020_rack_desc_units	2018-06-03 16:17:25.272485+00
35	dcim	0021_add_ff_flexstack	2018-06-03 16:17:25.399281+00
36	dcim	0022_color_names_to_rgb	2018-06-03 16:17:25.568485+00
37	circuits	0001_initial	2018-06-03 16:17:25.645228+00
38	circuits	0002_auto_20160622_1821	2018-06-03 16:17:25.833157+00
39	circuits	0003_provider_32bit_asn_support	2018-06-03 16:17:25.876523+00
40	circuits	0004_circuit_add_tenant	2018-06-03 16:17:25.946359+00
41	circuits	0005_circuit_add_upstream_speed	2018-06-03 16:17:25.986178+00
42	circuits	0006_terminations	2018-06-03 16:17:26.541588+00
43	circuits	0007_circuit_add_description	2018-06-03 16:17:26.597899+00
44	circuits	0008_circuittermination_interface_protect_on_delete	2018-06-03 16:17:26.657712+00
45	circuits	0009_unicode_literals	2018-06-03 16:17:26.897243+00
46	circuits	0010_circuit_status	2018-06-03 16:17:26.97874+00
47	tenancy	0002_tenant_group_optional	2018-06-03 16:17:27.035265+00
48	tenancy	0003_unicode_literals	2018-06-03 16:17:27.059498+00
49	ipam	0002_vrf_add_enforce_unique	2018-06-03 16:17:27.084474+00
50	ipam	0003_ipam_add_vlangroups	2018-06-03 16:17:27.225546+00
51	ipam	0004_ipam_vlangroup_uniqueness	2018-06-03 16:17:27.296774+00
52	ipam	0005_auto_20160725_1842	2018-06-03 16:17:27.391261+00
53	ipam	0006_vrf_vlan_add_tenant	2018-06-03 16:17:27.530865+00
54	ipam	0007_prefix_ipaddress_add_tenant	2018-06-03 16:17:27.644991+00
55	ipam	0008_prefix_change_order	2018-06-03 16:17:27.680189+00
56	ipam	0009_ipaddress_add_status	2018-06-03 16:17:27.738797+00
57	ipam	0010_ipaddress_help_texts	2018-06-03 16:17:27.975217+00
58	ipam	0011_rir_add_is_private	2018-06-03 16:17:28.016664+00
59	ipam	0012_services	2018-06-03 16:17:28.250729+00
60	ipam	0013_prefix_add_is_pool	2018-06-03 16:17:28.62504+00
61	ipam	0014_ipaddress_status_add_deprecated	2018-06-03 16:17:28.662862+00
62	ipam	0015_global_vlans	2018-06-03 16:17:28.778031+00
63	ipam	0016_unicode_literals	2018-06-03 16:17:29.759058+00
64	ipam	0017_ipaddress_roles	2018-06-03 16:17:29.842275+00
65	ipam	0018_remove_service_uniqueness_constraint	2018-06-03 16:17:29.891022+00
66	dcim	0023_devicetype_comments	2018-06-03 16:17:30.013881+00
67	dcim	0024_site_add_contact_fields	2018-06-03 16:17:30.256645+00
68	dcim	0025_devicetype_add_interface_ordering	2018-06-03 16:17:30.339808+00
69	dcim	0026_add_rack_reservations	2018-06-03 16:17:30.509397+00
70	dcim	0027_device_add_site	2018-06-03 16:17:30.579058+00
71	dcim	0028_device_copy_rack_to_site	2018-06-03 16:17:30.658211+00
72	dcim	0029_allow_rackless_devices	2018-06-03 16:17:30.801876+00
73	dcim	0030_interface_add_lag	2018-06-03 16:17:30.9374+00
74	dcim	0031_regions	2018-06-03 16:17:31.104145+00
75	dcim	0032_device_increase_name_length	2018-06-03 16:17:31.170766+00
76	dcim	0033_rackreservation_rack_editable	2018-06-03 16:17:31.265201+00
77	dcim	0034_rename_module_to_inventoryitem	2018-06-03 16:17:31.68422+00
78	dcim	0035_device_expand_status_choices	2018-06-03 16:17:32.124607+00
79	dcim	0036_add_ff_juniper_vcp	2018-06-03 16:17:32.181053+00
80	dcim	0037_unicode_literals	2018-06-03 16:17:33.315532+00
81	dcim	0038_wireless_interfaces	2018-06-03 16:17:33.36169+00
82	dcim	0039_interface_add_enabled_mtu	2018-06-03 16:17:33.450872+00
83	dcim	0040_inventoryitem_add_asset_tag_description	2018-06-03 16:17:33.563687+00
84	dcim	0041_napalm_integration	2018-06-03 16:17:33.806955+00
85	dcim	0042_interface_ff_10ge_cx4	2018-06-03 16:17:33.871898+00
86	dcim	0043_device_component_name_lengths	2018-06-03 16:17:34.130402+00
87	virtualization	0001_virtualization	2018-06-03 16:17:34.650822+00
88	ipam	0019_virtualization	2018-06-03 16:17:34.846199+00
89	ipam	0020_ipaddress_add_role_carp	2018-06-03 16:17:34.893961+00
90	dcim	0044_virtualization	2018-06-03 16:17:35.064684+00
91	dcim	0045_devicerole_vm_role	2018-06-03 16:17:35.266744+00
92	dcim	0046_rack_lengthen_facility_id	2018-06-03 16:17:35.302049+00
93	dcim	0047_more_100ge_form_factors	2018-06-03 16:17:35.35008+00
94	dcim	0048_rack_serial	2018-06-03 16:17:35.532927+00
95	dcim	0049_rackreservation_change_user	2018-06-03 16:17:35.734012+00
96	dcim	0050_interface_vlan_tagging	2018-06-03 16:17:35.982638+00
97	dcim	0051_rackreservation_tenant	2018-06-03 16:17:36.083179+00
98	dcim	0052_virtual_chassis	2018-06-03 16:17:36.460654+00
99	dcim	0053_platform_manufacturer	2018-06-03 16:17:36.63668+00
100	dcim	0054_site_status_timezone_description	2018-06-03 16:17:37.125463+00
101	dcim	0055_virtualchassis_ordering	2018-06-03 16:17:37.372256+00
102	extras	0001_initial	2018-06-03 16:17:37.720037+00
103	extras	0002_custom_fields	2018-06-03 16:17:38.137722+00
104	extras	0003_exporttemplate_add_description	2018-06-03 16:17:38.212434+00
105	extras	0004_topologymap_change_comma_to_semicolon	2018-06-03 16:17:38.257194+00
106	extras	0005_useraction_add_bulk_create	2018-06-03 16:17:38.292181+00
107	extras	0006_add_imageattachments	2018-06-03 16:17:38.386276+00
108	extras	0007_unicode_literals	2018-06-03 16:17:38.92683+00
109	extras	0008_reports	2018-06-03 16:17:39.151332+00
110	extras	0009_topologymap_type	2018-06-03 16:17:39.256282+00
111	extras	0010_customfield_filter_logic	2018-06-03 16:17:39.479313+00
112	ipam	0021_vrf_ordering	2018-06-03 16:17:39.527466+00
113	secrets	0001_initial	2018-06-03 16:17:40.066616+00
114	secrets	0002_userkey_add_session_key	2018-06-03 16:17:40.462775+00
115	secrets	0003_unicode_literals	2018-06-03 16:17:40.529241+00
116	sessions	0001_initial	2018-06-03 16:17:40.574016+00
117	users	0001_api_tokens	2018-06-03 16:17:40.825916+00
118	users	0002_unicode_literals	2018-06-03 16:17:40.952544+00
119	virtualization	0002_virtualmachine_add_status	2018-06-03 16:17:41.159908+00
120	virtualization	0003_cluster_add_site	2018-06-03 16:17:41.29214+00
121	virtualization	0004_virtualmachine_add_role	2018-06-03 16:17:41.404554+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
czyfvr6s07tikkqorkj3cpuefj8ggdh5	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2018-06-17 16:20:42.39863+00
w0iodv1mnxosfpa14r1ci8g3q6r0smwc	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2018-06-23 08:06:39.472226+00
4cq56ympmhiax6s49ruxg8k4uzlpdske	OWRmMzZkNzJiNGNjYzNkNjJmYTkyMmU0MGQ3MTZmNmZhNjdjMmQwNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5M2RiMmMyMzFiY2M3NmQzZjkyMmRmNDA0MmM5OGQ0NzU0NzJkOTVmIn0=	2018-11-21 16:46:12.853948+00
\.


--
-- Data for Name: extras_customfield; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield (id, type, name, label, description, required, "default", weight, filter_logic) FROM stdin;
2	200	ASN			f		100	1
4	100	clag_backup_ip			f		100	1
3	100	clag_peer_ip			f		100	1
\.


--
-- Data for Name: extras_customfield_obj_type; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfield_obj_type (id, customfield_id, contenttype_id) FROM stdin;
2	2	15
3	3	38
4	4	38
\.


--
-- Data for Name: extras_customfieldchoice; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfieldchoice (id, value, weight, field_id) FROM stdin;
\.


--
-- Data for Name: extras_customfieldvalue; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_customfieldvalue (id, obj_id, serialized_value, field_id, obj_type_id) FROM stdin;
1	1	65111	2	15
4	7	192.168.200.19	4	38
5	7	169.254.1.2	3	38
7	8	192.168.200.21	4	38
8	8	169.254.1.1	3	38
6	4	65112	2	15
9	5	65101	2	15
10	6	65102	2	15
12	22	192.168.200.17	4	38
13	22	169.254.1.2	3	38
15	27	192.168.200.20	4	38
16	27	169.254.1.1	3	38
11	7	65121	2	15
17	9	65131	2	15
18	10	65132	2	15
19	11	65901	2	15
20	12	65902	2	15
21	13	65801	2	15
22	14	65802	2	15
23	15	65701	2	15
24	16	65702	2	15
25	36	192.168.200.29	4	38
26	36	169.254.1.2	3	38
27	43	192.168.200.32	4	38
28	43	169.254.1.1	3	38
14	8	65122	2	15
\.


--
-- Data for Name: extras_exporttemplate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_exporttemplate (id, name, template_code, mime_type, file_extension, content_type_id, description) FROM stdin;
\.


--
-- Data for Name: extras_graph; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_graph (id, type, weight, name, source, link) FROM stdin;
\.


--
-- Data for Name: extras_imageattachment; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_imageattachment (id, object_id, image, image_height, image_width, name, created, content_type_id) FROM stdin;
\.


--
-- Data for Name: extras_reportresult; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_reportresult (id, report, created, failed, data, user_id) FROM stdin;
\.


--
-- Data for Name: extras_topologymap; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_topologymap (id, name, slug, device_patterns, description, site_id, type) FROM stdin;
\.


--
-- Data for Name: extras_useraction; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.extras_useraction (id, "time", object_id, action, message, content_type_id, user_id) FROM stdin;
1	2018-06-03 16:31:55.138526+00	1	1	Created device role <a href="/dcim/devices/?role=leaf">Leaf</a>	16	1
2	2018-06-03 16:32:09.473146+00	2	1	Created device role <a href="/dcim/devices/?role=spine">Spine</a>	16	1
3	2018-06-03 16:33:42.610914+00	1	1	Created manufacturer <a href="/dcim/device-types/?manufacturer=cumulus-networks">Cumulus Networks</a>	21	1
4	2018-06-03 16:34:10.636936+00	1	1	Created device type <a href="/dcim/device-types/1/">Cumulus VX</a>	17	1
5	2018-06-03 16:38:35.026179+00	1	1	Created site <a href="/dcim/sites/virtual-topology/">Virtual Topology</a>	29	1
6	2018-06-03 16:39:28.242071+00	1	1	Created rack group <a href="/dcim/racks/?group_id=1">Pod1</a>	28	1
7	2018-06-03 16:39:55.44697+00	1	1	Created rack <a href="/dcim/racks/1/">Rack1</a>	27	1
8	2018-06-03 16:44:47.119375+00	1	1	Created device <a href="/dcim/devices/1/">leaf01</a>	15	1
9	2018-06-03 16:50:11.660993+00	2	1	Created device <a href="/dcim/devices/2/">leaf02</a>	15	1
10	2018-06-03 16:54:55.129308+00	2	3	Modified device <a href="/dcim/devices/2/">leaf02</a>	15	1
11	2018-06-03 17:03:23.159367+00	1	1	Created VLAN <a href="/ipam/vlans/1/">1000 (Vlan1000)</a>	42	1
12	2018-06-03 17:04:33.143681+00	2	1	Created VLAN <a href="/ipam/vlans/2/">1001 (Vlan1001)</a>	42	1
13	2018-06-03 17:05:45.691626+00	1	1	Created VRF <a href="/ipam/vrfs/1/">Tenant1 (0)</a>	43	1
14	2018-06-03 17:06:14.601261+00	2	1	Created VRF <a href="/ipam/vrfs/2/">Tenant2 (1)</a>	43	1
15	2018-06-03 17:08:17.527169+00	1	1	Created prefix <a href="/ipam/prefixes/1/">192.168.10.0/24</a>	39	1
16	2018-06-03 17:09:07.27685+00	2	1	Created prefix <a href="/ipam/prefixes/2/">fc00:10::/64</a>	39	1
17	2018-06-03 17:13:34.389943+00	1	1	Created IP address <a href="/ipam/ip-addresses/1/">192.168.10.1/24</a>	38	1
18	2018-06-03 17:15:46.25316+00	\N	7	Added 2 IP addresses	38	1
19	2018-06-03 17:16:22.385445+00	\N	7	Added 3 IP addresses	38	1
20	2018-06-03 17:17:18.752381+00	\N	7	Added 2 IP addresses	38	1
21	2018-06-03 17:19:24.395455+00	1	1	Created platform <a href="/dcim/devices/?platform=cumulus-vx">Cumulus VX</a>	22	1
22	2018-06-03 17:20:29.73407+00	9	1	Created IP address <a href="/ipam/ip-addresses/9/">10.10.10.1/32</a>	38	1
23	2018-06-03 17:21:40.780104+00	1	3	Modified device <a href="/dcim/devices/1/">leaf01</a>	15	1
24	2018-06-03 17:28:03.01913+00	1	3	Modified IP address <a href="/ipam/ip-addresses/1/">192.168.10.1/24</a>	38	1
25	2018-06-03 17:28:59.428211+00	9	3	Modified IP address <a href="/ipam/ip-addresses/9/">10.10.10.1/32</a>	38	1
26	2018-06-03 17:29:29.208185+00	1	3	Modified IP address <a href="/ipam/ip-addresses/1/">192.168.10.1/24</a>	38	1
27	2018-06-03 17:30:59.19307+00	5	3	Modified interface <a href="/dcim/devices/1/">peerlink</a>	18	1
28	2018-06-03 17:31:41.435448+00	5	3	Modified interface <a href="/dcim/devices/1/">peerlink</a>	18	1
29	2018-06-03 17:32:02.748807+00	\N	5	Deleted virtual chassis leaf01	36	1
30	2018-06-03 17:37:40.993936+00	6	3	Modified interface <a href="/dcim/devices/1/">swp20</a>	18	1
31	2018-06-03 17:39:40.735549+00	2	3	Modified IP address <a href="/ipam/ip-addresses/2/">192.168.10.2/24</a>	38	1
32	2018-06-03 17:40:28.071036+00	4	3	Modified IP address <a href="/ipam/ip-addresses/4/">fc00:11::1/64</a>	38	1
33	2018-06-03 17:40:50.086624+00	5	3	Modified IP address <a href="/ipam/ip-addresses/5/">fc00:11::2/64</a>	38	1
34	2018-06-03 17:41:40.355565+00	7	3	Modified IP address <a href="/ipam/ip-addresses/7/">169.254.1.1/30</a>	38	1
35	2018-06-03 17:42:29.473397+00	1	1	Created tenant <a href="/tenancy/tenants/tenant1/">Tenant1</a>	59	1
36	2018-06-03 17:42:41.389206+00	2	1	Created tenant <a href="/tenancy/tenants/tenant2/">Tenant2</a>	59	1
37	2018-06-03 17:43:13.669464+00	1	3	Modified VRF <a href="/ipam/vrfs/1/">4001 (0)</a>	43	1
38	2018-06-03 17:43:31.011166+00	2	3	Modified VRF <a href="/ipam/vrfs/2/">4002 (1)</a>	43	1
39	2018-06-03 17:44:29.476811+00	\N	6	Deleted 1 devices	15	1
40	2018-06-03 17:47:38.856331+00	10	1	Created IP address <a href="/ipam/ip-addresses/10/">10.100.100.12/32</a>	38	1
41	2018-06-03 17:48:55.751492+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
42	2018-06-03 17:49:16.56407+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
43	2018-06-03 17:49:22.496871+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
44	2018-06-04 10:14:41.195219+00	3	1	Created device <a href="/dcim/devices/3/">leaf02</a>	15	1
45	2018-06-04 14:39:25.63067+00	3	3	Modified device <a href="/dcim/devices/3/">leaf02</a>	15	1
46	2018-06-05 22:28:23.591103+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
47	2018-06-05 22:28:53.008667+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
48	2018-06-05 22:29:12.289029+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
49	2018-06-05 22:29:29.303616+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
50	2018-06-05 22:29:55.02017+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
51	2018-06-06 06:37:01.790672+00	12	3	Modified interface <a href="/dcim/devices/1/">bond02</a>	18	1
52	2018-06-06 06:37:09.059697+00	12	3	Modified interface <a href="/dcim/devices/1/">bond02</a>	18	1
53	2018-06-06 07:04:35.389523+00	12	3	Modified interface <a href="/dcim/devices/1/">bond02</a>	18	1
54	2018-06-06 07:13:49.415373+00	14	3	Modified interface <a href="/dcim/devices/1/">test</a>	18	1
55	2018-06-06 07:13:56.870485+00	14	3	Modified interface <a href="/dcim/devices/1/">test</a>	18	1
56	2018-06-06 07:15:07.250389+00	1	1	Created circuit type <a href="/circuits/circuits/?type=mlag">mlag</a>	8	1
57	2018-06-06 07:16:20.383414+00	1	1	Created provider <a href="/circuits/providers/leaf01-leaf02/">leaf01-leaf02</a>	9	1
58	2018-06-06 07:16:38.965335+00	1	1	Created circuit <a href="/circuits/circuits/1/">leaf01-leaf02 1</a>	7	1
59	2018-06-06 07:18:06.431782+00	1	1	Created circuit termination leaf01-leaf02 1 (Side A)	10	1
60	2018-06-06 07:21:56.315268+00	\N	5	Deleted circuit leaf01-leaf02 1	7	1
61	2018-06-06 07:22:03.508138+00	\N	6	Deleted 1 circuit types	8	1
62	2018-06-06 07:22:23.161504+00	\N	6	Deleted 1 providers	9	1
63	2018-06-06 17:26:20.643069+00	12	3	Modified interface <a href="/dcim/devices/1/">bond02</a>	18	1
64	2018-06-06 17:33:31.295612+00	\N	5	Deleted interface test	18	1
65	2018-06-07 05:47:40.18255+00	7	3	Modified IP address <a href="/ipam/ip-addresses/7/">169.254.1.1/30</a>	38	1
66	2018-06-07 20:56:12.700387+00	3	3	Modified interface <a href="/dcim/devices/1/">1000</a>	18	1
67	2018-06-07 21:11:31.911544+00	3	3	Modified interface <a href="/dcim/devices/1/">irb1000</a>	18	1
68	2018-06-07 21:14:18.963089+00	3	3	Modified interface <a href="/dcim/devices/1/">irb1000</a>	18	1
69	2018-06-07 21:14:52.062294+00	3	3	Modified interface <a href="/dcim/devices/1/">irb1000</a>	18	1
70	2018-06-07 21:15:02.654507+00	3	3	Modified interface <a href="/dcim/devices/1/">irb1000</a>	18	1
71	2018-06-07 22:10:08.165418+00	1	3	Modified VRF <a href="/ipam/vrfs/1/">4001 (0)</a>	43	1
72	2018-06-07 22:10:28.98515+00	2	3	Modified VRF <a href="/ipam/vrfs/2/">4002 (1)</a>	43	1
73	2018-06-07 22:10:35.443534+00	2	3	Modified VRF <a href="/ipam/vrfs/2/">4002 (1)</a>	43	1
74	2018-06-07 22:11:04.034275+00	1	3	Modified IP address <a href="/ipam/ip-addresses/1/">192.168.10.1/24</a>	38	1
75	2018-06-07 22:12:34.280079+00	1	3	Modified IP address <a href="/ipam/ip-addresses/1/">192.168.10.1/24</a>	38	1
76	2018-06-07 22:18:10.951486+00	\N	4	Updated 6 IP addresses	38	1
77	2018-06-08 08:41:11.823131+00	5	3	Modified interface <a href="/dcim/devices/1/">peerlink</a>	18	1
78	2018-06-08 08:41:40.979104+00	5	3	Modified interface <a href="/dcim/devices/1/">peerlink</a>	18	1
79	2018-06-08 08:42:13.717507+00	8	3	Modified interface <a href="/dcim/devices/1/">peerlink.4094</a>	18	1
80	2018-06-08 08:42:23.578625+00	10	3	Modified interface <a href="/dcim/devices/1/">swp49</a>	18	1
81	2018-06-08 08:42:35.725231+00	11	3	Modified interface <a href="/dcim/devices/1/">swp50</a>	18	1
82	2018-06-08 16:53:47.070419+00	7	3	Modified IP address <a href="/ipam/ip-addresses/7/">169.254.1.1/30</a>	38	1
83	2018-06-08 18:59:58.696115+00	\N	6	Deleted 1 devices	15	1
84	2018-06-08 19:35:40.334173+00	4	1	Created device <a href="/dcim/devices/4/">leaf02</a>	15	1
85	2018-06-08 19:54:22.190901+00	15	3	Modified interface <a href="/dcim/devices/4/">bond01</a>	18	1
86	2018-06-08 19:54:27.39268+00	15	3	Modified interface <a href="/dcim/devices/4/">bond01</a>	18	1
87	2018-06-08 19:56:16.45349+00	15	3	Modified interface <a href="/dcim/devices/4/">bond01</a>	18	1
88	2018-06-08 20:01:50.389111+00	11	1	Created IP address <a href="/ipam/ip-addresses/11/">10.10.10.2/32</a>	38	1
89	2018-06-08 20:04:53.18926+00	1	3	Modified IP address <a href="/ipam/ip-addresses/1/">192.168.11.1/24</a>	38	1
90	2018-06-08 20:05:20.054109+00	2	3	Modified IP address <a href="/ipam/ip-addresses/2/">192.168.11.2/24</a>	38	1
91	2018-06-08 20:05:35.055363+00	3	3	Modified IP address <a href="/ipam/ip-addresses/3/">192.168.11.3/24</a>	38	1
92	2018-06-08 20:10:44.960216+00	16	3	Modified interface <a href="/dcim/devices/4/">bond02</a>	18	1
93	2018-06-08 20:10:48.631134+00	16	3	Modified interface <a href="/dcim/devices/4/">bond02</a>	18	1
94	2018-06-08 20:14:26.279927+00	10	3	Modified IP address <a href="/ipam/ip-addresses/10/">10.100.100.12/32</a>	38	1
95	2018-06-08 20:15:32.912064+00	1	3	Modified IP address <a href="/ipam/ip-addresses/1/">192.168.11.1/24</a>	38	1
96	2018-06-08 20:16:09.832172+00	3	3	Modified IP address <a href="/ipam/ip-addresses/3/">192.168.11.3/24</a>	38	1
97	2018-06-08 20:16:39.08884+00	4	3	Modified IP address <a href="/ipam/ip-addresses/4/">fc00:11::1/64</a>	38	1
98	2018-06-08 20:17:10.460291+00	6	3	Modified IP address <a href="/ipam/ip-addresses/6/">fc00:11::3/64</a>	38	1
99	2018-06-08 20:17:26.812989+00	6	3	Modified IP address <a href="/ipam/ip-addresses/6/">fc00:11::3/64</a>	38	1
100	2018-06-08 20:17:39.10255+00	4	3	Modified IP address <a href="/ipam/ip-addresses/4/">fc00:11::1/64</a>	38	1
101	2018-06-08 20:17:59.825806+00	11	3	Modified IP address <a href="/ipam/ip-addresses/11/">10.10.10.2/32</a>	38	1
102	2018-06-08 20:18:24.633274+00	20	3	Modified interface <a href="/dcim/devices/4/">peerlink</a>	18	1
103	2018-06-08 20:20:21.189224+00	8	3	Modified IP address <a href="/ipam/ip-addresses/8/">169.254.1.2/30</a>	38	1
104	2018-06-08 20:23:44.166212+00	26	3	Modified interface <a href="/dcim/devices/4/">swp49</a>	18	1
105	2018-06-08 20:24:03.858706+00	27	3	Modified interface <a href="/dcim/devices/4/">swp50</a>	18	1
106	2018-06-08 20:49:12.515406+00	4	3	Modified device <a href="/dcim/devices/4/">leaf02</a>	15	1
107	2018-06-08 20:59:29.157198+00	4	3	Modified device <a href="/dcim/devices/4/">leaf02</a>	15	1
108	2018-06-08 21:01:40.215388+00	\N	6	Deleted 2 prefixes	39	1
109	2018-06-08 21:02:15.093465+00	\N	6	Deleted 3 IP addresses	38	1
110	2018-06-08 21:03:22.064262+00	12	1	Created IP address <a href="/ipam/ip-addresses/12/">192.168.11.1/24</a>	38	1
111	2018-06-08 21:03:49.107193+00	13	1	Created IP address <a href="/ipam/ip-addresses/13/">192.168.11.2/24</a>	38	1
112	2018-06-08 21:04:21.663188+00	14	1	Created IP address <a href="/ipam/ip-addresses/14/">192.168.11.3/24</a>	38	1
113	2018-06-08 21:05:05.782102+00	13	3	Modified IP address <a href="/ipam/ip-addresses/13/">192.168.11.2/24</a>	38	1
114	2018-06-08 21:19:04.869687+00	18	3	Modified interface <a href="/dcim/devices/4/">irb1000</a>	18	1
115	2018-06-08 21:19:18.034945+00	18	3	Modified interface <a href="/dcim/devices/4/">irb1000</a>	18	1
116	2018-06-08 21:19:20.901495+00	18	3	Modified interface <a href="/dcim/devices/4/">irb1000</a>	18	1
117	2018-06-08 21:24:46.140625+00	10	3	Modified IP address <a href="/ipam/ip-addresses/10/">10.100.100.12/32</a>	38	1
118	2018-06-08 21:30:04.448794+00	15	1	Created IP address <a href="/ipam/ip-addresses/15/">10.100.100.12/32</a>	38	1
119	2018-06-08 21:32:35.976259+00	4	3	Modified IP address <a href="/ipam/ip-addresses/4/">fc00:11::1/64</a>	38	1
120	2018-06-08 21:33:01.751671+00	12	3	Modified IP address <a href="/ipam/ip-addresses/12/">192.168.11.1/24</a>	38	1
121	2018-06-08 21:37:25.659281+00	13	3	Modified IP address <a href="/ipam/ip-addresses/13/">192.168.11.2/24</a>	38	1
122	2018-06-08 21:38:00.961+00	12	3	Modified IP address <a href="/ipam/ip-addresses/12/">192.168.11.1/24</a>	38	1
123	2018-06-08 21:38:35.964363+00	4	3	Modified IP address <a href="/ipam/ip-addresses/4/">fc00:11::1/64</a>	38	1
124	2018-06-08 21:39:29.081714+00	14	3	Modified IP address <a href="/ipam/ip-addresses/14/">192.168.11.3/24</a>	38	1
125	2018-06-08 21:42:26.166034+00	1	3	Modified VRF <a href="/ipam/vrfs/1/">4001 (0)</a>	43	1
126	2018-06-08 21:42:43.362418+00	2	3	Modified VRF <a href="/ipam/vrfs/2/">4002 (1)</a>	43	1
127	2018-06-08 21:42:48.094271+00	16	1	Created IP address <a href="/ipam/ip-addresses/16/">192.168.11.1/24</a>	38	1
128	2018-06-08 21:43:16.211748+00	17	1	Created IP address <a href="/ipam/ip-addresses/17/">fc00:11::2/64</a>	38	1
129	2018-06-08 21:45:55.461363+00	14	3	Modified IP address <a href="/ipam/ip-addresses/14/">192.168.11.3/24</a>	38	1
130	2018-06-08 21:52:03.912777+00	2	1	Created rack <a href="/dcim/racks/2/">Spine</a>	27	1
131	2018-06-08 21:53:14.123774+00	5	1	Created device <a href="/dcim/devices/5/">spine01</a>	15	1
132	2018-06-08 21:53:42.310114+00	6	1	Created device <a href="/dcim/devices/6/">spine02</a>	15	1
133	2018-06-08 21:58:28.069003+00	5	3	Modified device <a href="/dcim/devices/5/">spine01</a>	15	1
134	2018-06-08 22:35:21.724986+00	6	3	Modified device <a href="/dcim/devices/6/">spine02</a>	15	1
135	2018-06-08 22:36:50.559265+00	18	1	Created IP address <a href="/ipam/ip-addresses/18/">10.10.20.1/32</a>	38	1
136	2018-06-08 22:38:33.440388+00	19	1	Created IP address <a href="/ipam/ip-addresses/19/">10.10.20.2/32</a>	38	1
137	2018-06-08 23:21:39.676554+00	16	3	Modified IP address <a href="/ipam/ip-addresses/16/">192.168.10.1/24</a>	38	1
138	2018-06-08 23:21:48.803156+00	12	3	Modified IP address <a href="/ipam/ip-addresses/12/">192.168.10.1/24</a>	38	1
139	2018-06-08 23:21:56.251727+00	13	3	Modified IP address <a href="/ipam/ip-addresses/13/">192.168.10.2/24</a>	38	1
140	2018-06-08 23:22:04.371305+00	14	3	Modified IP address <a href="/ipam/ip-addresses/14/">192.168.10.3/24</a>	38	1
141	2018-06-08 23:22:15.291981+00	4	3	Modified IP address <a href="/ipam/ip-addresses/4/">fc00:10::1/64</a>	38	1
142	2018-06-08 23:22:27.553417+00	5	3	Modified IP address <a href="/ipam/ip-addresses/5/">fc00:10::2/64</a>	38	1
143	2018-06-08 23:22:35.809272+00	17	3	Modified IP address <a href="/ipam/ip-addresses/17/">fc00:10::2/64</a>	38	1
144	2018-06-08 23:22:46.377113+00	6	3	Modified IP address <a href="/ipam/ip-addresses/6/">fc00:10::3/64</a>	38	1
145	2018-06-08 23:53:29.453698+00	7	1	Created device <a href="/dcim/devices/7/">leaf03</a>	15	1
146	2018-06-08 23:55:15.333027+00	45	3	Modified interface <a href="/dcim/devices/7/">irb1000</a>	18	1
147	2018-06-08 23:55:20.282385+00	45	3	Modified interface <a href="/dcim/devices/7/">irb1000</a>	18	1
148	2018-06-08 23:58:32.392345+00	20	1	Created IP address <a href="/ipam/ip-addresses/20/">10.100.100.34/12</a>	38	1
149	2018-06-08 23:59:01.696057+00	21	1	Created IP address <a href="/ipam/ip-addresses/21/">10.10.10.3/32</a>	38	1
150	2018-06-09 00:00:28.052431+00	22	1	Created IP address <a href="/ipam/ip-addresses/22/">169.254.1.1/30</a>	38	1
151	2018-06-09 00:01:47.741305+00	23	1	Created IP address <a href="/ipam/ip-addresses/23/">192.168.10.1/24</a>	38	1
152	2018-06-09 00:02:40.557514+00	24	1	Created IP address <a href="/ipam/ip-addresses/24/">192.168.10.4/24</a>	38	1
153	2018-06-09 00:03:02.121543+00	25	1	Created IP address <a href="/ipam/ip-addresses/25/">fc00:10::1/64</a>	38	1
154	2018-06-09 00:03:53.362731+00	26	1	Created IP address <a href="/ipam/ip-addresses/26/">fc00:10::4/64</a>	38	1
155	2018-06-09 00:04:25.870261+00	17	3	Modified IP address <a href="/ipam/ip-addresses/17/">fc00:10::1/64</a>	38	1
156	2018-06-09 00:08:34.443127+00	8	1	Created device <a href="/dcim/devices/8/">leaf04</a>	15	1
157	2018-06-09 00:09:38.49871+00	42	3	Modified interface <a href="/dcim/devices/7/">bond01</a>	18	1
158	2018-06-09 00:09:44.744333+00	42	3	Modified interface <a href="/dcim/devices/7/">bond01</a>	18	1
159	2018-06-09 00:09:49.064118+00	42	3	Modified interface <a href="/dcim/devices/7/">bond01</a>	18	1
160	2018-06-09 00:09:56.15263+00	43	3	Modified interface <a href="/dcim/devices/7/">bond02</a>	18	1
161	2018-06-09 00:10:02.271723+00	43	3	Modified interface <a href="/dcim/devices/7/">bond02</a>	18	1
162	2018-06-09 00:10:06.600159+00	43	3	Modified interface <a href="/dcim/devices/7/">bond02</a>	18	1
163	2018-06-09 00:12:15.476821+00	58	3	Modified interface <a href="/dcim/devices/8/">irb1000</a>	18	1
164	2018-06-09 00:12:25.398504+00	58	3	Modified interface <a href="/dcim/devices/8/">irb1000</a>	18	1
165	2018-06-09 00:13:20.852758+00	47	3	Modified interface <a href="/dcim/devices/7/">peerlink</a>	18	1
166	2018-06-09 00:15:54.734324+00	27	1	Created IP address <a href="/ipam/ip-addresses/27/">169.254.1.2/30</a>	38	1
167	2018-06-09 00:16:12.384981+00	28	1	Created IP address <a href="/ipam/ip-addresses/28/">10.10.10.4/32</a>	38	1
168	2018-06-09 00:16:37.909248+00	29	1	Created IP address <a href="/ipam/ip-addresses/29/">10.100.100.34/12</a>	38	1
169	2018-06-09 00:16:58.390993+00	30	1	Created IP address <a href="/ipam/ip-addresses/30/">192.168.10.1/24</a>	38	1
170	2018-06-09 00:17:27.581029+00	31	1	Created IP address <a href="/ipam/ip-addresses/31/">192.168.10.5/24</a>	38	1
171	2018-06-09 00:17:56.100788+00	32	1	Created IP address <a href="/ipam/ip-addresses/32/">fc00:10::1/64</a>	38	1
172	2018-06-09 00:18:16.899277+00	33	1	Created IP address <a href="/ipam/ip-addresses/33/">fc00:10::5/64</a>	38	1
173	2018-06-09 00:29:07.369728+00	1	3	Modified rack <a href="/dcim/racks/1/">Rack1-pod1</a>	27	1
174	2018-06-09 00:29:24.690501+00	2	3	Modified rack <a href="/dcim/racks/2/">Spine-pod1</a>	27	1
175	2018-06-09 00:59:53.519605+00	20	3	Modified IP address <a href="/ipam/ip-addresses/20/">10.100.100.34/32</a>	38	1
176	2018-06-09 01:00:36.433045+00	29	3	Modified IP address <a href="/ipam/ip-addresses/29/">10.100.100.34/32</a>	38	1
177	2018-06-09 01:04:29.889097+00	55	3	Modified interface <a href="/dcim/devices/8/">bond01</a>	18	1
178	2018-06-09 01:04:35.052318+00	55	3	Modified interface <a href="/dcim/devices/8/">bond01</a>	18	1
179	2018-06-09 01:04:38.65542+00	55	3	Modified interface <a href="/dcim/devices/8/">bond01</a>	18	1
180	2018-06-09 01:04:47.812342+00	56	3	Modified interface <a href="/dcim/devices/8/">bond02</a>	18	1
181	2018-06-09 01:04:52.902208+00	56	3	Modified interface <a href="/dcim/devices/8/">bond02</a>	18	1
182	2018-06-09 01:04:59.897141+00	56	3	Modified interface <a href="/dcim/devices/8/">bond02</a>	18	1
183	2018-06-09 07:39:15.060773+00	3	1	Created rack <a href="/dcim/racks/3/">Rack2-pod1</a>	27	1
184	2018-06-09 07:39:40.622238+00	4	1	Created rack <a href="/dcim/racks/4/">Rack3-pod1</a>	27	1
185	2018-06-09 07:40:04.464675+00	\N	4	Updated 2 racks	27	1
186	2018-06-09 07:40:40.894454+00	2	1	Created rack group <a href="/dcim/racks/?group_id=2">Edge</a>	28	1
187	2018-06-09 07:40:59.451624+00	3	1	Created rack group <a href="/dcim/racks/?group_id=3">Superspine</a>	28	1
188	2018-06-09 07:41:25.056993+00	5	1	Created rack <a href="/dcim/racks/5/">Superspine</a>	27	1
189	2018-06-09 07:41:44.854215+00	6	1	Created rack <a href="/dcim/racks/6/">Edge</a>	27	1
190	2018-06-09 07:42:23.394411+00	7	3	Modified device <a href="/dcim/devices/7/">leaf03</a>	15	1
191	2018-06-09 07:42:45.698432+00	8	3	Modified device <a href="/dcim/devices/8/">leaf04</a>	15	1
192	2018-06-09 07:43:21.458959+00	9	1	Created device <a href="/dcim/devices/9/">exit01</a>	15	1
193	2018-06-09 07:44:02.199851+00	7	1	Created rack <a href="/dcim/racks/7/">exit02</a>	27	1
194	2018-06-09 07:44:41.899893+00	10	1	Created device <a href="/dcim/devices/10/">exit02</a>	15	1
195	2018-06-09 07:45:24.442044+00	11	1	Created device <a href="/dcim/devices/11/">super01</a>	15	1
196	2018-06-09 07:48:10.768709+00	12	1	Created device <a href="/dcim/devices/12/">super02</a>	15	1
197	2018-06-09 07:48:44.178339+00	13	1	Created device <a href="/dcim/devices/13/">edge01</a>	15	1
198	2018-06-09 07:49:50.484647+00	14	1	Created device <a href="/dcim/devices/14/">edge02</a>	15	1
199	2018-06-09 07:50:26.274806+00	15	1	Created device <a href="/dcim/devices/15/">rtr01</a>	15	1
200	2018-06-09 07:50:53.053663+00	16	1	Created device <a href="/dcim/devices/16/">rtr02</a>	15	1
201	2018-06-09 08:14:35.484024+00	9	3	Modified device <a href="/dcim/devices/9/">exit01</a>	15	1
202	2018-06-09 08:14:44.566106+00	10	3	Modified device <a href="/dcim/devices/10/">exit02</a>	15	1
203	2018-06-09 08:15:21.631162+00	11	3	Modified device <a href="/dcim/devices/11/">super01</a>	15	1
204	2018-06-09 08:15:35.463711+00	12	3	Modified device <a href="/dcim/devices/12/">super02</a>	15	1
205	2018-06-09 08:15:55.237308+00	13	3	Modified device <a href="/dcim/devices/13/">edge01</a>	15	1
206	2018-06-09 08:16:09.040636+00	14	3	Modified device <a href="/dcim/devices/14/">edge02</a>	15	1
207	2018-06-09 08:16:46.352322+00	15	3	Modified device <a href="/dcim/devices/15/">rtr01</a>	15	1
208	2018-06-09 08:16:59.467993+00	16	3	Modified device <a href="/dcim/devices/16/">rtr02</a>	15	1
209	2018-06-09 08:31:48.191911+00	68	3	Modified interface <a href="/dcim/devices/9/">bond01</a>	18	1
210	2018-06-09 08:31:53.258097+00	68	3	Modified interface <a href="/dcim/devices/9/">bond01</a>	18	1
211	2018-06-09 08:31:56.639479+00	68	3	Modified interface <a href="/dcim/devices/9/">bond01</a>	18	1
212	2018-06-09 08:32:11.553934+00	69	3	Modified interface <a href="/dcim/devices/9/">bond02</a>	18	1
213	2018-06-09 08:32:17.676458+00	69	3	Modified interface <a href="/dcim/devices/9/">bond02</a>	18	1
214	2018-06-09 08:32:22.698965+00	69	3	Modified interface <a href="/dcim/devices/9/">bond02</a>	18	1
215	2018-06-09 08:37:02.324437+00	34	1	Created IP address <a href="/ipam/ip-addresses/34/">10.100.100.56/32</a>	38	1
216	2018-06-09 08:37:33.410716+00	35	1	Created IP address <a href="/ipam/ip-addresses/35/">10.10.10.5/32</a>	38	1
217	2018-06-09 08:39:11.713381+00	36	1	Created IP address <a href="/ipam/ip-addresses/36/">169.254.1.1/30</a>	38	1
218	2018-06-09 08:39:44.738285+00	73	3	Modified interface <a href="/dcim/devices/9/">peerlink</a>	18	1
219	2018-06-09 08:41:07.057975+00	37	1	Created IP address <a href="/ipam/ip-addresses/37/">192.168.10.1/24</a>	38	1
220	2018-06-09 08:41:31.488876+00	38	1	Created IP address <a href="/ipam/ip-addresses/38/">192.168.10.6/24</a>	38	1
221	2018-06-09 08:42:07.383485+00	39	1	Created IP address <a href="/ipam/ip-addresses/39/">fc00:10::6/64</a>	38	1
222	2018-06-09 08:42:27.205111+00	40	1	Created IP address <a href="/ipam/ip-addresses/40/">fc00:10::1/64</a>	38	1
223	2018-06-09 08:47:56.205901+00	86	3	Modified interface <a href="/dcim/devices/10/">peerlink</a>	18	1
224	2018-06-09 08:48:30.967477+00	87	3	Modified interface <a href="/dcim/devices/10/">peerlink.4094</a>	18	1
225	2018-06-09 08:48:52.785748+00	41	1	Created IP address <a href="/ipam/ip-addresses/41/">10.100.100.56/32</a>	38	1
226	2018-06-09 08:49:57.212022+00	42	1	Created IP address <a href="/ipam/ip-addresses/42/">10.10.10.6/32</a>	38	1
227	2018-06-09 08:51:12.175265+00	43	1	Created IP address <a href="/ipam/ip-addresses/43/">169.254.1.2/30</a>	38	1
228	2018-06-09 08:51:38.588301+00	44	1	Created IP address <a href="/ipam/ip-addresses/44/">192.168.10.1/24</a>	38	1
229	2018-06-09 08:51:56.979677+00	45	1	Created IP address <a href="/ipam/ip-addresses/45/">192.168.10.7/24</a>	38	1
230	2018-06-09 08:52:08.785281+00	46	1	Created IP address <a href="/ipam/ip-addresses/46/">fc00:10::1/64</a>	38	1
231	2018-06-09 08:52:26.464764+00	47	1	Created IP address <a href="/ipam/ip-addresses/47/">fc00:10::7/64</a>	38	1
232	2018-06-09 08:54:31.291222+00	48	1	Created IP address <a href="/ipam/ip-addresses/48/">10.10.30.1/32</a>	38	1
233	2018-06-09 08:56:27.103121+00	95	3	Modified interface <a href="/dcim/devices/11/">swp1</a>	18	1
234	2018-06-09 08:56:35.525887+00	96	3	Modified interface <a href="/dcim/devices/11/">swp2</a>	18	1
235	2018-06-09 08:56:52.229653+00	97	3	Modified interface <a href="/dcim/devices/11/">swp49</a>	18	1
236	2018-06-09 08:56:59.720328+00	98	3	Modified interface <a href="/dcim/devices/11/">swp50</a>	18	1
237	2018-06-09 08:58:45.496812+00	49	1	Created IP address <a href="/ipam/ip-addresses/49/">10.10.30.2/32</a>	38	1
238	2018-06-09 09:04:40.709971+00	108	3	Modified interface <a href="/dcim/devices/13/">irb2506</a>	18	1
239	2018-06-09 09:04:48.031397+00	109	3	Modified interface <a href="/dcim/devices/13/">irb2507</a>	18	1
240	2018-06-09 09:04:56.117995+00	110	3	Modified interface <a href="/dcim/devices/13/">irb2509</a>	18	1
241	2018-06-09 09:07:12.497629+00	3	1	Created VLAN <a href="/ipam/vlans/3/">1002 (1002)</a>	42	1
242	2018-06-09 09:07:44.580056+00	3	3	Modified VLAN <a href="/ipam/vlans/3/">1002 (1002)</a>	42	1
243	2018-06-09 09:08:27.257517+00	3	3	Modified VLAN <a href="/ipam/vlans/3/">1002 (Vlan1002)</a>	42	1
244	2018-06-09 09:08:49.655884+00	4	1	Created VLAN <a href="/ipam/vlans/4/">1003 (Vlan1003)</a>	42	1
245	2018-06-09 09:09:13.625003+00	5	1	Created VLAN <a href="/ipam/vlans/5/">1004 (Vlan1004)</a>	42	1
246	2018-06-09 09:09:26.877686+00	6	1	Created VLAN <a href="/ipam/vlans/6/">1005 (Vlan1005)</a>	42	1
247	2018-06-09 09:10:04.465428+00	7	1	Created VLAN <a href="/ipam/vlans/7/">2501 (Vlan2501)</a>	42	1
248	2018-06-09 09:10:19.899407+00	8	1	Created VLAN <a href="/ipam/vlans/8/">2502 (Vlan2502)</a>	42	1
249	2018-06-09 09:10:36.264047+00	9	1	Created VLAN <a href="/ipam/vlans/9/">2503 (Vlan2503)</a>	42	1
250	2018-06-09 09:10:49.002345+00	10	1	Created VLAN <a href="/ipam/vlans/10/">2504 (Vlan2504)</a>	42	1
251	2018-06-09 09:11:02.487386+00	11	1	Created VLAN <a href="/ipam/vlans/11/">2505 (Vlan2505)</a>	42	1
252	2018-06-09 09:11:15.211332+00	12	1	Created VLAN <a href="/ipam/vlans/12/">2506 (Vlan2506)</a>	42	1
253	2018-06-09 09:11:39.573465+00	13	1	Created VLAN <a href="/ipam/vlans/13/">2507 (Vlan2507)</a>	42	1
254	2018-06-09 09:11:50.394339+00	14	1	Created VLAN <a href="/ipam/vlans/14/">2508 (Vlan2508)</a>	42	1
255	2018-06-09 09:12:02.401268+00	15	1	Created VLAN <a href="/ipam/vlans/15/">2509 (Vlan2509)</a>	42	1
256	2018-06-09 09:12:17.095678+00	8	3	Modified VLAN <a href="/ipam/vlans/8/">2502 (Vlan2502)</a>	42	1
257	2018-06-09 09:12:33.992099+00	15	3	Modified VLAN <a href="/ipam/vlans/15/">2509 (Vlan2509)</a>	42	1
258	2018-06-09 09:13:14.377675+00	16	1	Created VLAN <a href="/ipam/vlans/16/">2701 (Vlan2701)</a>	42	1
259	2018-06-09 09:13:34.417287+00	17	1	Created VLAN <a href="/ipam/vlans/17/">2702 (Vlan2702)</a>	42	1
260	2018-06-09 09:13:48.139146+00	18	1	Created VLAN <a href="/ipam/vlans/18/">2703 (Vlan2703)</a>	42	1
261	2018-06-09 09:14:08.272081+00	19	1	Created VLAN <a href="/ipam/vlans/19/">2704 (Vlan2704)</a>	42	1
262	2018-06-09 09:16:08.471233+00	108	3	Modified interface <a href="/dcim/devices/13/">irb2501</a>	18	1
263	2018-06-09 09:16:12.735882+00	109	3	Modified interface <a href="/dcim/devices/13/">irb2502</a>	18	1
264	2018-06-09 09:16:18.805373+00	110	3	Modified interface <a href="/dcim/devices/13/">irb2503</a>	18	1
265	2018-06-09 09:16:25.261003+00	111	3	Modified interface <a href="/dcim/devices/13/">irb2504</a>	18	1
266	2018-06-09 09:18:25.950806+00	106	3	Modified interface <a href="/dcim/devices/13/">swp49</a>	18	1
267	2018-06-09 09:18:28.428177+00	106	3	Modified interface <a href="/dcim/devices/13/">swp49</a>	18	1
268	2018-06-09 09:18:40.495278+00	107	3	Modified interface <a href="/dcim/devices/13/">swp50</a>	18	1
269	2018-06-09 09:18:43.621826+00	107	3	Modified interface <a href="/dcim/devices/13/">swp50</a>	18	1
270	2018-06-09 09:29:49.587818+00	116	3	Modified interface <a href="/dcim/devices/14/">swp1</a>	18	1
271	2018-06-09 09:30:05.811733+00	117	3	Modified interface <a href="/dcim/devices/14/">swp2</a>	18	1
272	2018-06-09 09:30:18.295071+00	112	3	Modified interface <a href="/dcim/devices/14/">irb2505</a>	18	1
273	2018-06-09 09:30:23.774129+00	113	3	Modified interface <a href="/dcim/devices/14/">irb2506</a>	18	1
274	2018-06-09 09:30:31.043883+00	114	3	Modified interface <a href="/dcim/devices/14/">irb2507</a>	18	1
275	2018-06-09 09:30:39.343829+00	115	3	Modified interface <a href="/dcim/devices/14/">irb2508</a>	18	1
276	2018-06-09 09:34:00.396481+00	120	3	Modified interface <a href="/dcim/devices/15/">swp1</a>	18	1
277	2018-06-09 09:34:17.606103+00	120	3	Modified interface <a href="/dcim/devices/15/">swp1</a>	18	1
278	2018-06-09 09:34:38.1089+00	121	3	Modified interface <a href="/dcim/devices/15/">swp2</a>	18	1
279	2018-06-09 09:34:41.870466+00	121	3	Modified interface <a href="/dcim/devices/15/">swp2</a>	18	1
280	2018-06-09 09:36:40.92568+00	122	3	Modified interface <a href="/dcim/devices/15/">irb2501</a>	18	1
281	2018-06-09 09:36:46.624875+00	122	3	Modified interface <a href="/dcim/devices/15/">irb2501</a>	18	1
282	2018-06-09 09:36:48.94631+00	122	3	Modified interface <a href="/dcim/devices/15/">irb2501</a>	18	1
283	2018-06-09 09:37:00.49648+00	123	3	Modified interface <a href="/dcim/devices/15/">irb2502</a>	18	1
284	2018-06-09 09:37:05.481217+00	123	3	Modified interface <a href="/dcim/devices/15/">irb2502</a>	18	1
285	2018-06-09 09:37:09.591706+00	123	3	Modified interface <a href="/dcim/devices/15/">irb2502</a>	18	1
286	2018-06-09 09:37:14.48962+00	124	3	Modified interface <a href="/dcim/devices/15/">irb2505</a>	18	1
287	2018-06-09 09:37:19.281309+00	124	3	Modified interface <a href="/dcim/devices/15/">irb2505</a>	18	1
288	2018-06-09 09:37:21.324367+00	124	3	Modified interface <a href="/dcim/devices/15/">irb2505</a>	18	1
289	2018-06-09 09:37:35.996681+00	125	3	Modified interface <a href="/dcim/devices/15/">irb2506</a>	18	1
290	2018-06-09 09:37:41.383321+00	125	3	Modified interface <a href="/dcim/devices/15/">irb2506</a>	18	1
291	2018-06-09 09:37:46.473979+00	125	3	Modified interface <a href="/dcim/devices/15/">irb2506</a>	18	1
292	2018-06-09 09:37:54.930919+00	126	3	Modified interface <a href="/dcim/devices/15/">irb2701</a>	18	1
293	2018-06-09 09:38:12.157259+00	126	3	Modified interface <a href="/dcim/devices/15/">irb2701</a>	18	1
294	2018-06-09 09:38:18.985637+00	127	3	Modified interface <a href="/dcim/devices/15/">irb2702</a>	18	1
295	2018-06-09 09:38:21.620635+00	127	3	Modified interface <a href="/dcim/devices/15/">irb2702</a>	18	1
296	2018-06-09 09:39:52.288311+00	122	3	Modified interface <a href="/dcim/devices/15/">irb2501</a>	18	1
297	2018-06-09 09:40:01.355529+00	123	3	Modified interface <a href="/dcim/devices/15/">irb2502</a>	18	1
298	2018-06-09 09:40:08.403132+00	124	3	Modified interface <a href="/dcim/devices/15/">irb2505</a>	18	1
299	2018-06-09 09:40:16.760971+00	125	3	Modified interface <a href="/dcim/devices/15/">irb2506</a>	18	1
300	2018-06-09 09:40:31.296685+00	126	3	Modified interface <a href="/dcim/devices/15/">irb2701</a>	18	1
301	2018-06-09 09:40:38.751438+00	127	3	Modified interface <a href="/dcim/devices/15/">irb2702</a>	18	1
302	2018-06-09 09:45:02.620724+00	128	3	Modified interface <a href="/dcim/devices/16/">swp1</a>	18	1
303	2018-06-09 09:45:45.776442+00	128	3	Modified interface <a href="/dcim/devices/16/">swp1</a>	18	1
304	2018-06-09 09:46:15.514174+00	128	3	Modified interface <a href="/dcim/devices/16/">swp1</a>	18	1
305	2018-06-09 09:46:20.346027+00	128	3	Modified interface <a href="/dcim/devices/16/">swp1</a>	18	1
306	2018-06-09 09:47:02.257078+00	128	3	Modified interface <a href="/dcim/devices/16/">swp1</a>	18	1
307	2018-06-09 09:47:08.118283+00	128	3	Modified interface <a href="/dcim/devices/16/">swp1</a>	18	1
308	2018-06-09 09:47:21.026657+00	129	3	Modified interface <a href="/dcim/devices/16/">swp2</a>	18	1
309	2018-06-09 09:47:25.098652+00	129	3	Modified interface <a href="/dcim/devices/16/">swp2</a>	18	1
310	2018-06-09 09:48:18.28742+00	130	3	Modified interface <a href="/dcim/devices/16/">irb2503</a>	18	1
311	2018-06-09 09:48:24.799405+00	131	3	Modified interface <a href="/dcim/devices/16/">irb2504</a>	18	1
312	2018-06-09 09:48:37.767635+00	132	3	Modified interface <a href="/dcim/devices/16/">irb2507</a>	18	1
313	2018-06-09 09:48:40.478506+00	132	3	Modified interface <a href="/dcim/devices/16/">irb2507</a>	18	1
314	2018-06-09 09:48:53.286176+00	133	3	Modified interface <a href="/dcim/devices/16/">irb2508</a>	18	1
315	2018-06-09 09:48:56.216173+00	133	3	Modified interface <a href="/dcim/devices/16/">irb2508</a>	18	1
316	2018-06-09 09:49:17.707524+00	134	3	Modified interface <a href="/dcim/devices/16/">irb2703</a>	18	1
317	2018-06-09 09:49:19.672221+00	134	3	Modified interface <a href="/dcim/devices/16/">irb2703</a>	18	1
318	2018-06-09 09:49:27.53926+00	135	3	Modified interface <a href="/dcim/devices/16/">irb2704</a>	18	1
319	2018-06-09 09:49:34.42237+00	129	3	Modified interface <a href="/dcim/devices/16/">swp2</a>	18	1
320	2018-06-09 09:50:32.898384+00	118	3	Modified interface <a href="/dcim/devices/14/">swp49</a>	18	1
321	2018-06-09 09:50:38.613383+00	118	3	Modified interface <a href="/dcim/devices/14/">swp49</a>	18	1
322	2018-06-09 09:50:40.370677+00	118	3	Modified interface <a href="/dcim/devices/14/">swp49</a>	18	1
323	2018-06-09 09:50:53.48548+00	119	3	Modified interface <a href="/dcim/devices/14/">swp50</a>	18	1
324	2018-06-09 09:51:00.431737+00	119	3	Modified interface <a href="/dcim/devices/14/">swp50</a>	18	1
325	2018-06-09 09:51:03.152644+00	119	3	Modified interface <a href="/dcim/devices/14/">swp50</a>	18	1
326	2018-06-09 09:52:01.137969+00	112	3	Modified interface <a href="/dcim/devices/14/">irb2505</a>	18	1
327	2018-06-09 09:52:06.701272+00	112	3	Modified interface <a href="/dcim/devices/14/">irb2505</a>	18	1
328	2018-06-09 09:52:09.770702+00	112	3	Modified interface <a href="/dcim/devices/14/">irb2505</a>	18	1
329	2018-06-09 09:52:14.247614+00	113	3	Modified interface <a href="/dcim/devices/14/">irb2506</a>	18	1
330	2018-06-09 09:52:19.373273+00	113	3	Modified interface <a href="/dcim/devices/14/">irb2506</a>	18	1
331	2018-06-09 09:52:23.193764+00	113	3	Modified interface <a href="/dcim/devices/14/">irb2506</a>	18	1
332	2018-06-09 09:52:29.136064+00	114	3	Modified interface <a href="/dcim/devices/14/">irb2507</a>	18	1
333	2018-06-09 09:52:34.850885+00	114	3	Modified interface <a href="/dcim/devices/14/">irb2507</a>	18	1
334	2018-06-09 09:52:37.412442+00	114	3	Modified interface <a href="/dcim/devices/14/">irb2507</a>	18	1
335	2018-06-09 09:52:42.375518+00	114	3	Modified interface <a href="/dcim/devices/14/">irb2507</a>	18	1
336	2018-06-09 09:52:48.227208+00	115	3	Modified interface <a href="/dcim/devices/14/">irb2508</a>	18	1
337	2018-06-09 09:52:53.369529+00	115	3	Modified interface <a href="/dcim/devices/14/">irb2508</a>	18	1
338	2018-06-09 09:52:56.964672+00	115	3	Modified interface <a href="/dcim/devices/14/">irb2508</a>	18	1
339	2018-06-09 09:53:23.246791+00	\N	6	Deleted 1 VLANs	42	1
340	2018-06-09 09:55:24.347202+00	129	3	Modified interface <a href="/dcim/devices/16/">swp2</a>	18	1
341	2018-06-09 09:55:27.059822+00	129	3	Modified interface <a href="/dcim/devices/16/">swp2</a>	18	1
342	2018-06-09 09:55:41.268218+00	108	3	Modified interface <a href="/dcim/devices/13/">irb2501</a>	18	1
343	2018-06-09 09:55:45.857991+00	108	3	Modified interface <a href="/dcim/devices/13/">irb2501</a>	18	1
344	2018-06-09 09:55:47.829152+00	108	3	Modified interface <a href="/dcim/devices/13/">irb2501</a>	18	1
345	2018-06-09 09:55:53.342836+00	109	3	Modified interface <a href="/dcim/devices/13/">irb2502</a>	18	1
346	2018-06-09 09:55:58.761125+00	109	3	Modified interface <a href="/dcim/devices/13/">irb2502</a>	18	1
347	2018-06-09 09:56:02.799497+00	109	3	Modified interface <a href="/dcim/devices/13/">irb2502</a>	18	1
348	2018-06-09 09:56:07.422994+00	110	3	Modified interface <a href="/dcim/devices/13/">irb2503</a>	18	1
349	2018-06-09 09:56:12.229403+00	110	3	Modified interface <a href="/dcim/devices/13/">irb2503</a>	18	1
350	2018-06-09 09:56:15.817022+00	110	3	Modified interface <a href="/dcim/devices/13/">irb2503</a>	18	1
351	2018-06-09 09:56:25.465828+00	111	3	Modified interface <a href="/dcim/devices/13/">irb2504</a>	18	1
352	2018-06-09 09:56:31.557912+00	111	3	Modified interface <a href="/dcim/devices/13/">irb2504</a>	18	1
353	2018-06-09 09:56:33.564537+00	111	3	Modified interface <a href="/dcim/devices/13/">irb2504</a>	18	1
354	2018-06-09 09:58:35.026494+00	3	1	Created tenant <a href="/tenancy/tenants/tenant3/">Tenant3</a>	59	1
355	2018-06-09 09:59:12.824743+00	3	1	Created VRF <a href="/ipam/vrfs/3/">4003 (2)</a>	43	1
356	2018-06-09 10:02:13.693271+00	\N	7	Added 6 IP addresses	38	1
357	2018-06-09 10:02:34.465691+00	\N	7	Added 12 IP addresses	38	1
358	2018-06-09 10:03:01.41228+00	\N	7	Added 12 IP addresses	38	1
359	2018-06-09 10:03:36.988867+00	\N	7	Added 6 IP addresses	38	1
360	2018-06-09 10:03:53.765676+00	\N	7	Added 12 IP addresses	38	1
361	2018-06-09 10:04:16.846136+00	\N	7	Added 12 IP addresses	38	1
362	2018-06-09 10:04:52.160738+00	38	3	Modified IP address <a href="/ipam/ip-addresses/38/">192.168.10.6/24</a>	38	1
363	2018-06-09 10:05:30.563317+00	45	3	Modified IP address <a href="/ipam/ip-addresses/45/">192.168.10.7/24</a>	38	1
364	2018-06-09 10:05:52.635308+00	\N	4	Updated 2 IP addresses	38	1
365	2018-06-09 10:06:15.168642+00	28	3	Modified IP address <a href="/ipam/ip-addresses/28/">10.10.10.4/32</a>	38	1
366	2018-06-09 10:07:26.571674+00	\N	7	Added 5 IP addresses	38	1
367	2018-06-09 10:07:55.145426+00	\N	7	Added 5 IP addresses	38	1
368	2018-06-09 10:09:14.791075+00	112	3	Modified IP address <a href="/ipam/ip-addresses/112/">192.168.13.1/24</a>	38	1
369	2018-06-09 10:09:26.548035+00	110	3	Modified IP address <a href="/ipam/ip-addresses/110/">192.168.11.1/24</a>	38	1
370	2018-06-09 10:10:02.897083+00	111	3	Modified IP address <a href="/ipam/ip-addresses/111/">192.168.12.1/24</a>	38	1
371	2018-06-09 10:10:54.349492+00	\N	4	Updated 2 IP addresses	38	1
372	2018-06-09 10:12:10.016908+00	\N	4	Updated 10 IP addresses	38	1
373	2018-06-09 10:13:35.579087+00	\N	4	Updated 8 IP addresses	38	1
374	2018-06-09 10:14:08.899378+00	\N	4	Updated 2 IP addresses	38	1
375	2018-06-09 10:15:23.344468+00	\N	4	Updated 14 IP addresses	38	1
376	2018-06-09 10:15:53.379414+00	\N	4	Updated 14 IP addresses	38	1
377	2018-06-09 10:31:00.207204+00	141	3	Modified interface <a href="/dcim/devices/4/">irb1001</a>	18	1
378	2018-06-09 10:31:52.529166+00	142	3	Modified interface <a href="/dcim/devices/4/">irb1002</a>	18	1
379	2018-06-09 10:31:54.376799+00	142	3	Modified interface <a href="/dcim/devices/4/">irb1002</a>	18	1
380	2018-06-09 10:32:03.294144+00	143	3	Modified interface <a href="/dcim/devices/4/">irb1003</a>	18	1
381	2018-06-09 10:32:09.409783+00	143	3	Modified interface <a href="/dcim/devices/4/">irb1003</a>	18	1
382	2018-06-09 10:32:23.355105+00	144	3	Modified interface <a href="/dcim/devices/4/">irb1004</a>	18	1
383	2018-06-09 10:32:33.019405+00	144	3	Modified interface <a href="/dcim/devices/4/">irb1004</a>	18	1
384	2018-06-09 10:32:40.999784+00	145	3	Modified interface <a href="/dcim/devices/4/">irb1005</a>	18	1
385	2018-06-09 10:32:43.98518+00	145	3	Modified interface <a href="/dcim/devices/4/">irb1005</a>	18	1
386	2018-06-09 10:33:01.119673+00	146	3	Modified interface <a href="/dcim/devices/7/">irb1001</a>	18	1
387	2018-06-09 10:33:42.036642+00	147	3	Modified interface <a href="/dcim/devices/7/">irb1002</a>	18	1
388	2018-06-09 10:33:47.386994+00	148	3	Modified interface <a href="/dcim/devices/7/">irb1003</a>	18	1
389	2018-06-09 10:33:53.152926+00	149	3	Modified interface <a href="/dcim/devices/7/">irb1004</a>	18	1
390	2018-06-09 10:34:04.305016+00	150	3	Modified interface <a href="/dcim/devices/7/">irb1005</a>	18	1
391	2018-06-09 10:34:11.453383+00	151	3	Modified interface <a href="/dcim/devices/8/">irb1001</a>	18	1
392	2018-06-09 10:34:17.270032+00	152	3	Modified interface <a href="/dcim/devices/8/">irb1002</a>	18	1
393	2018-06-09 10:34:22.373186+00	153	3	Modified interface <a href="/dcim/devices/8/">irb1003</a>	18	1
394	2018-06-09 10:34:27.386884+00	154	3	Modified interface <a href="/dcim/devices/8/">irb1004</a>	18	1
395	2018-06-09 10:34:36.622829+00	155	3	Modified interface <a href="/dcim/devices/8/">irb1005</a>	18	1
396	2018-06-09 10:34:40.081169+00	155	3	Modified interface <a href="/dcim/devices/8/">irb1005</a>	18	1
397	2018-06-09 10:34:56.126464+00	156	3	Modified interface <a href="/dcim/devices/9/">irb1001</a>	18	1
398	2018-06-09 10:35:02.201799+00	157	3	Modified interface <a href="/dcim/devices/9/">irb1002</a>	18	1
399	2018-06-09 10:35:08.582814+00	158	3	Modified interface <a href="/dcim/devices/9/">irb1003</a>	18	1
400	2018-06-09 10:35:15.385868+00	159	3	Modified interface <a href="/dcim/devices/9/">irb1004</a>	18	1
401	2018-06-09 10:35:22.442905+00	160	3	Modified interface <a href="/dcim/devices/9/">irb1005</a>	18	1
402	2018-06-09 10:35:27.386164+00	136	3	Modified interface <a href="/dcim/devices/1/">irb1001</a>	18	1
403	2018-06-09 10:35:32.095082+00	137	3	Modified interface <a href="/dcim/devices/1/">irb1002</a>	18	1
404	2018-06-09 10:35:38.895613+00	138	3	Modified interface <a href="/dcim/devices/1/">irb1003</a>	18	1
405	2018-06-09 10:35:45.854969+00	139	3	Modified interface <a href="/dcim/devices/1/">irb1004</a>	18	1
406	2018-06-09 10:35:54.628282+00	140	3	Modified interface <a href="/dcim/devices/1/">irb1005</a>	18	1
407	2018-06-09 10:36:14.758786+00	161	3	Modified interface <a href="/dcim/devices/10/">irb1001</a>	18	1
408	2018-06-09 10:36:19.858269+00	162	3	Modified interface <a href="/dcim/devices/10/">irb1002</a>	18	1
409	2018-06-09 10:36:25.986877+00	163	3	Modified interface <a href="/dcim/devices/10/">irb1003</a>	18	1
410	2018-06-09 10:36:32.965921+00	164	3	Modified interface <a href="/dcim/devices/10/">irb1004</a>	18	1
411	2018-06-09 10:36:39.955254+00	165	3	Modified interface <a href="/dcim/devices/10/">irb1005</a>	18	1
412	2018-06-09 10:36:42.465531+00	165	3	Modified interface <a href="/dcim/devices/10/">irb1005</a>	18	1
413	2018-06-09 10:45:00.646653+00	50	3	Modified IP address <a href="/ipam/ip-addresses/50/">192.168.11.2/24</a>	38	1
414	2018-06-09 10:45:52.615457+00	110	3	Modified IP address <a href="/ipam/ip-addresses/110/">192.168.11.1/24</a>	38	1
415	2018-06-09 10:46:35.087662+00	111	3	Modified IP address <a href="/ipam/ip-addresses/111/">192.168.12.1/24</a>	38	1
416	2018-06-09 10:46:52.350611+00	112	3	Modified IP address <a href="/ipam/ip-addresses/112/">192.168.13.1/24</a>	38	1
417	2018-06-09 10:47:12.454277+00	113	3	Modified IP address <a href="/ipam/ip-addresses/113/">192.168.14.1/24</a>	38	1
418	2018-06-09 10:47:34.396149+00	114	3	Modified IP address <a href="/ipam/ip-addresses/114/">192.168.15.1/24</a>	38	1
419	2018-06-09 10:48:20.757868+00	56	3	Modified IP address <a href="/ipam/ip-addresses/56/">192.168.12.2/24</a>	38	1
420	2018-06-09 10:48:39.058089+00	62	3	Modified IP address <a href="/ipam/ip-addresses/62/">192.168.13.2/24</a>	38	1
421	2018-06-09 10:49:40.265396+00	68	3	Modified IP address <a href="/ipam/ip-addresses/68/">192.168.14.2/24</a>	38	1
422	2018-06-09 10:49:53.908109+00	74	3	Modified IP address <a href="/ipam/ip-addresses/74/">192.168.15.2/24</a>	38	1
423	2018-06-09 10:51:21.945458+00	115	3	Modified IP address <a href="/ipam/ip-addresses/115/">fc00:11::1/64</a>	38	1
424	2018-06-09 10:51:53.170825+00	116	3	Modified IP address <a href="/ipam/ip-addresses/116/">fc00:12::1/64</a>	38	1
425	2018-06-09 10:52:08.901782+00	117	3	Modified IP address <a href="/ipam/ip-addresses/117/">fc00:13::1/64</a>	38	1
426	2018-06-09 10:52:31.383866+00	118	3	Modified IP address <a href="/ipam/ip-addresses/118/">fc00:14::1/64</a>	38	1
427	2018-06-09 10:52:56.166702+00	119	3	Modified IP address <a href="/ipam/ip-addresses/119/">fc00:15::1/64</a>	38	1
428	2018-06-09 10:53:26.872485+00	80	3	Modified IP address <a href="/ipam/ip-addresses/80/">fc00:11::2/64</a>	38	1
429	2018-06-09 10:53:42.701187+00	86	3	Modified IP address <a href="/ipam/ip-addresses/86/">fc00:12::2/64</a>	38	1
430	2018-06-09 10:54:23.932675+00	92	3	Modified IP address <a href="/ipam/ip-addresses/92/">fc00:13::2/64</a>	38	1
431	2018-06-09 10:54:42.03552+00	98	3	Modified IP address <a href="/ipam/ip-addresses/98/">fc00:14::2/64</a>	38	1
432	2018-06-09 10:54:58.973332+00	104	3	Modified IP address <a href="/ipam/ip-addresses/104/">fc00:15::2/64</a>	38	1
433	2018-06-09 10:56:18.16227+00	\N	4	Updated 4 devices	15	1
434	2018-06-09 10:58:17.192188+00	71	3	Modified interface <a href="/dcim/devices/9/">irb1000</a>	18	1
435	2018-06-09 10:58:21.683202+00	71	3	Modified interface <a href="/dcim/devices/9/">irb1000</a>	18	1
436	2018-06-09 10:58:25.799297+00	71	3	Modified interface <a href="/dcim/devices/9/">irb1000</a>	18	1
437	2018-06-09 10:58:43.588225+00	84	3	Modified interface <a href="/dcim/devices/10/">irb1000</a>	18	1
438	2018-06-09 10:58:51.351907+00	84	3	Modified interface <a href="/dcim/devices/10/">irb1000</a>	18	1
439	2018-06-09 10:58:53.002119+00	84	3	Modified interface <a href="/dcim/devices/10/">irb1000</a>	18	1
440	2018-06-09 19:51:37.044998+00	120	1	Created IP address <a href="/ipam/ip-addresses/120/">192.168.11.1/24</a>	38	1
441	2018-06-09 19:52:09.138626+00	121	1	Created IP address <a href="/ipam/ip-addresses/121/">192.168.12.1/24</a>	38	1
442	2018-06-09 19:52:44.317731+00	122	1	Created IP address <a href="/ipam/ip-addresses/122/">192.168.13.1/24</a>	38	1
443	2018-06-09 19:53:08.757197+00	123	1	Created IP address <a href="/ipam/ip-addresses/123/">192.168.14.1/24</a>	38	1
444	2018-06-09 19:53:48.896357+00	124	1	Created IP address <a href="/ipam/ip-addresses/124/">192.168.15.1/24</a>	38	1
445	2018-06-09 19:54:35.413552+00	125	1	Created IP address <a href="/ipam/ip-addresses/125/">192.168.11.1/24</a>	38	1
446	2018-06-09 19:54:50.350476+00	126	1	Created IP address <a href="/ipam/ip-addresses/126/">192.168.12.1/24</a>	38	1
447	2018-06-09 19:55:08.272845+00	127	1	Created IP address <a href="/ipam/ip-addresses/127/">192.168.13.1/24</a>	38	1
448	2018-06-09 19:55:30.060428+00	128	1	Created IP address <a href="/ipam/ip-addresses/128/">192.168.14.1/24</a>	38	1
449	2018-06-09 19:55:45.53608+00	129	1	Created IP address <a href="/ipam/ip-addresses/129/">192.168.15.1/24</a>	38	1
450	2018-06-09 19:56:22.60404+00	130	1	Created IP address <a href="/ipam/ip-addresses/130/">fc00:11::1/64</a>	38	1
451	2018-06-09 19:56:40.698351+00	131	1	Created IP address <a href="/ipam/ip-addresses/131/">fc00:12::1/64</a>	38	1
452	2018-06-09 19:56:55.152981+00	132	1	Created IP address <a href="/ipam/ip-addresses/132/">fc00:13::1/64</a>	38	1
453	2018-06-09 19:57:10.405836+00	133	1	Created IP address <a href="/ipam/ip-addresses/133/">fc00:14::1/64</a>	38	1
454	2018-06-09 19:57:25.662977+00	134	1	Created IP address <a href="/ipam/ip-addresses/134/">fc00:15::1/64</a>	38	1
455	2018-06-09 19:58:19.024166+00	81	3	Modified IP address <a href="/ipam/ip-addresses/81/">fc00:11::3/64</a>	38	1
456	2018-06-09 19:58:35.071295+00	87	3	Modified IP address <a href="/ipam/ip-addresses/87/">fc00:12::3/64</a>	38	1
457	2018-06-09 19:59:00.644158+00	93	3	Modified IP address <a href="/ipam/ip-addresses/93/">fc00:13::3/64</a>	38	1
458	2018-06-09 19:59:16.319323+00	99	3	Modified IP address <a href="/ipam/ip-addresses/99/">fc00:14::3/64</a>	38	1
459	2018-06-09 19:59:30.933169+00	105	3	Modified IP address <a href="/ipam/ip-addresses/105/">fc00:15::3/64</a>	38	1
460	2018-06-09 20:00:12.410966+00	51	3	Modified IP address <a href="/ipam/ip-addresses/51/">192.168.11.3/24</a>	38	1
461	2018-06-09 20:00:24.886613+00	57	3	Modified IP address <a href="/ipam/ip-addresses/57/">192.168.12.3/24</a>	38	1
462	2018-06-09 20:00:37.967019+00	63	3	Modified IP address <a href="/ipam/ip-addresses/63/">192.168.13.3/24</a>	38	1
463	2018-06-09 20:00:58.26791+00	69	3	Modified IP address <a href="/ipam/ip-addresses/69/">192.168.14.3/24</a>	38	1
464	2018-06-09 20:01:13.661424+00	75	3	Modified IP address <a href="/ipam/ip-addresses/75/">192.168.15.3/24</a>	38	1
465	2018-06-09 20:02:26.027156+00	135	1	Created IP address <a href="/ipam/ip-addresses/135/">192.168.11.1/24</a>	38	1
466	2018-06-09 20:02:39.013081+00	136	1	Created IP address <a href="/ipam/ip-addresses/136/">fc00:11::1/64</a>	38	1
467	2018-06-09 20:02:53.514627+00	137	1	Created IP address <a href="/ipam/ip-addresses/137/">192.168.12.1/24</a>	38	1
468	2018-06-09 20:03:08.88354+00	138	1	Created IP address <a href="/ipam/ip-addresses/138/">fc00:12::1/64</a>	38	1
469	2018-06-09 20:03:25.77827+00	139	1	Created IP address <a href="/ipam/ip-addresses/139/">192.168.13.1/24</a>	38	1
470	2018-06-09 20:03:47.074474+00	140	1	Created IP address <a href="/ipam/ip-addresses/140/">fc00:13::1/64</a>	38	1
471	2018-06-09 20:04:11.440381+00	141	1	Created IP address <a href="/ipam/ip-addresses/141/">192.168.14.1/24</a>	38	1
472	2018-06-09 20:04:25.76839+00	142	1	Created IP address <a href="/ipam/ip-addresses/142/">fc00:14::1/64</a>	38	1
473	2018-06-09 20:04:41.417727+00	143	1	Created IP address <a href="/ipam/ip-addresses/143/">192.168.15.1/24</a>	38	1
474	2018-06-09 20:04:55.072752+00	144	1	Created IP address <a href="/ipam/ip-addresses/144/">fc00:15::1/64</a>	38	1
475	2018-06-09 20:14:51.586168+00	52	3	Modified IP address <a href="/ipam/ip-addresses/52/">192.168.11.4/24</a>	38	1
476	2018-06-09 20:15:05.656282+00	58	3	Modified IP address <a href="/ipam/ip-addresses/58/">192.168.12.4/24</a>	38	1
477	2018-06-09 20:15:21.563023+00	64	3	Modified IP address <a href="/ipam/ip-addresses/64/">192.168.13.4/24</a>	38	1
478	2018-06-09 20:15:38.900708+00	70	3	Modified IP address <a href="/ipam/ip-addresses/70/">192.168.14.4/24</a>	38	1
479	2018-06-09 20:16:03.947412+00	76	3	Modified IP address <a href="/ipam/ip-addresses/76/">192.168.15.4/24</a>	38	1
480	2018-06-09 20:16:38.943894+00	82	3	Modified IP address <a href="/ipam/ip-addresses/82/">fc00:11::4/64</a>	38	1
481	2018-06-09 20:16:55.398235+00	88	3	Modified IP address <a href="/ipam/ip-addresses/88/">fc00:12::4/64</a>	38	1
482	2018-06-09 20:17:09.742993+00	94	3	Modified IP address <a href="/ipam/ip-addresses/94/">fc00:13::4/64</a>	38	1
483	2018-06-09 20:17:21.414535+00	100	3	Modified IP address <a href="/ipam/ip-addresses/100/">fc00:14::4/64</a>	38	1
484	2018-06-09 20:17:43.142713+00	106	3	Modified IP address <a href="/ipam/ip-addresses/106/">fc00:15::4/64</a>	38	1
485	2018-06-09 20:25:37.579152+00	145	1	Created IP address <a href="/ipam/ip-addresses/145/">192.168.11.1/24</a>	38	1
486	2018-06-09 20:25:50.815295+00	146	1	Created IP address <a href="/ipam/ip-addresses/146/">fc00:11::1/64</a>	38	1
487	2018-06-09 20:26:04.875509+00	147	1	Created IP address <a href="/ipam/ip-addresses/147/">192.168.12.1/24</a>	38	1
488	2018-06-09 20:26:31.863027+00	148	1	Created IP address <a href="/ipam/ip-addresses/148/">fc00:12::1/64</a>	38	1
489	2018-06-09 20:26:45.150723+00	149	1	Created IP address <a href="/ipam/ip-addresses/149/">192.168.13.1/24</a>	38	1
490	2018-06-09 20:26:55.71352+00	150	1	Created IP address <a href="/ipam/ip-addresses/150/">fc00:13::1/64</a>	38	1
491	2018-06-09 20:27:20.750498+00	151	1	Created IP address <a href="/ipam/ip-addresses/151/">192.168.14.1/24</a>	38	1
492	2018-06-09 20:27:40.628826+00	152	1	Created IP address <a href="/ipam/ip-addresses/152/">fc00:14::1/64</a>	38	1
493	2018-06-09 20:27:57.035403+00	153	1	Created IP address <a href="/ipam/ip-addresses/153/">192.168.15.1/24</a>	38	1
494	2018-06-09 20:28:11.810481+00	154	1	Created IP address <a href="/ipam/ip-addresses/154/">fc00:15::1/64</a>	38	1
495	2018-06-09 20:28:55.525756+00	53	3	Modified IP address <a href="/ipam/ip-addresses/53/">192.168.11.5/24</a>	38	1
496	2018-06-09 20:29:07.410424+00	59	3	Modified IP address <a href="/ipam/ip-addresses/59/">192.168.12.5/24</a>	38	1
497	2018-06-09 20:29:19.180486+00	65	3	Modified IP address <a href="/ipam/ip-addresses/65/">192.168.13.5/24</a>	38	1
498	2018-06-09 20:29:32.524901+00	71	3	Modified IP address <a href="/ipam/ip-addresses/71/">192.168.14.5/24</a>	38	1
499	2018-06-09 20:29:44.041164+00	77	3	Modified IP address <a href="/ipam/ip-addresses/77/">192.168.15.5/24</a>	38	1
500	2018-06-09 20:30:19.812034+00	83	3	Modified IP address <a href="/ipam/ip-addresses/83/">fc00:11::5/64</a>	38	1
501	2018-06-09 20:30:30.423274+00	89	3	Modified IP address <a href="/ipam/ip-addresses/89/">fc00:12::5/64</a>	38	1
502	2018-06-09 20:30:50.187897+00	95	3	Modified IP address <a href="/ipam/ip-addresses/95/">fc00:13::5/64</a>	38	1
503	2018-06-09 20:31:01.364368+00	101	3	Modified IP address <a href="/ipam/ip-addresses/101/">fc00:14::5/64</a>	38	1
504	2018-06-09 20:31:14.60952+00	107	3	Modified IP address <a href="/ipam/ip-addresses/107/">fc00:15::5/64</a>	38	1
505	2018-06-09 20:32:16.61029+00	155	1	Created IP address <a href="/ipam/ip-addresses/155/">192.168.11.1/24</a>	38	1
506	2018-06-09 20:32:29.930972+00	156	1	Created IP address <a href="/ipam/ip-addresses/156/">fc00:11::1/64</a>	38	1
507	2018-06-09 20:32:44.776721+00	157	1	Created IP address <a href="/ipam/ip-addresses/157/">192.168.12.1/24</a>	38	1
508	2018-06-09 20:32:59.446151+00	158	1	Created IP address <a href="/ipam/ip-addresses/158/">fc00:12::1/64</a>	38	1
509	2018-06-09 20:33:10.635114+00	159	1	Created IP address <a href="/ipam/ip-addresses/159/">192.168.13.1/24</a>	38	1
510	2018-06-09 20:33:24.179454+00	160	1	Created IP address <a href="/ipam/ip-addresses/160/">fc00:13::1/64</a>	38	1
511	2018-06-09 20:33:39.476445+00	161	1	Created IP address <a href="/ipam/ip-addresses/161/">192.168.14.1/24</a>	38	1
512	2018-06-09 20:33:54.65865+00	162	1	Created IP address <a href="/ipam/ip-addresses/162/">fc00:14::1/64</a>	38	1
513	2018-06-09 20:34:07.416743+00	163	1	Created IP address <a href="/ipam/ip-addresses/163/">192.168.15.1/24</a>	38	1
514	2018-06-09 20:34:28.239964+00	164	1	Created IP address <a href="/ipam/ip-addresses/164/">fc00:15::1/64</a>	38	1
515	2018-06-09 20:35:00.541615+00	54	3	Modified IP address <a href="/ipam/ip-addresses/54/">192.168.11.6/24</a>	38	1
516	2018-06-09 20:35:13.02922+00	60	3	Modified IP address <a href="/ipam/ip-addresses/60/">192.168.12.6/24</a>	38	1
517	2018-06-09 20:35:26.375363+00	66	3	Modified IP address <a href="/ipam/ip-addresses/66/">192.168.13.6/24</a>	38	1
518	2018-06-09 20:35:37.283808+00	72	3	Modified IP address <a href="/ipam/ip-addresses/72/">192.168.14.6/24</a>	38	1
519	2018-06-09 20:35:51.213652+00	78	3	Modified IP address <a href="/ipam/ip-addresses/78/">192.168.15.6/24</a>	38	1
520	2018-06-09 20:36:17.540786+00	84	3	Modified IP address <a href="/ipam/ip-addresses/84/">fc00:11::6/64</a>	38	1
521	2018-06-09 20:36:38.653797+00	90	3	Modified IP address <a href="/ipam/ip-addresses/90/">fc00:12::6/64</a>	38	1
522	2018-06-09 20:36:53.236439+00	96	3	Modified IP address <a href="/ipam/ip-addresses/96/">fc00:13::6/64</a>	38	1
523	2018-06-09 20:37:08.257958+00	102	3	Modified IP address <a href="/ipam/ip-addresses/102/">fc00:14::6/64</a>	38	1
524	2018-06-09 20:37:28.639789+00	108	3	Modified IP address <a href="/ipam/ip-addresses/108/">fc00:15::6/64</a>	38	1
525	2018-06-09 20:38:10.200704+00	165	1	Created IP address <a href="/ipam/ip-addresses/165/">fc00:11::1/64</a>	38	1
526	2018-06-09 20:38:21.863545+00	166	1	Created IP address <a href="/ipam/ip-addresses/166/">fc00:12::1/64</a>	38	1
527	2018-06-09 20:38:38.703049+00	167	1	Created IP address <a href="/ipam/ip-addresses/167/">fc00:13::1/64</a>	38	1
528	2018-06-09 20:38:51.205696+00	168	1	Created IP address <a href="/ipam/ip-addresses/168/">fc00:14::1/64</a>	38	1
529	2018-06-09 20:39:07.880079+00	169	1	Created IP address <a href="/ipam/ip-addresses/169/">fc00:15::1/64</a>	38	1
530	2018-06-09 20:39:38.429364+00	85	3	Modified IP address <a href="/ipam/ip-addresses/85/">fc00:11::7/64</a>	38	1
531	2018-06-09 20:39:51.454492+00	91	3	Modified IP address <a href="/ipam/ip-addresses/91/">fc00:12::7/64</a>	38	1
532	2018-06-09 20:40:06.854426+00	97	3	Modified IP address <a href="/ipam/ip-addresses/97/">fc00:13::7/64</a>	38	1
533	2018-06-09 20:40:20.333428+00	103	3	Modified IP address <a href="/ipam/ip-addresses/103/">fc00:14::7/64</a>	38	1
534	2018-06-09 20:40:31.767754+00	109	3	Modified IP address <a href="/ipam/ip-addresses/109/">fc00:15::7/64</a>	38	1
535	2018-06-09 20:40:56.600722+00	55	3	Modified IP address <a href="/ipam/ip-addresses/55/">192.168.11.7/24</a>	38	1
536	2018-06-09 20:41:11.023644+00	61	3	Modified IP address <a href="/ipam/ip-addresses/61/">192.168.12.7/24</a>	38	1
537	2018-06-09 20:41:21.438853+00	67	3	Modified IP address <a href="/ipam/ip-addresses/67/">192.168.13.7/24</a>	38	1
538	2018-06-09 20:41:32.931732+00	73	3	Modified IP address <a href="/ipam/ip-addresses/73/">192.168.14.7/24</a>	38	1
539	2018-06-09 20:41:45.068342+00	79	3	Modified IP address <a href="/ipam/ip-addresses/79/">192.168.15.7/24</a>	38	1
540	2018-06-09 20:43:40.293068+00	121	3	Modified IP address <a href="/ipam/ip-addresses/121/">192.168.12.1/24</a>	38	1
541	2018-06-09 20:45:51.968232+00	3	3	Modified VRF <a href="/ipam/vrfs/3/">4003 (2)</a>	43	1
542	2018-06-09 20:48:05.68907+00	127	3	Modified IP address <a href="/ipam/ip-addresses/127/">192.168.13.1/24</a>	38	1
543	2018-06-09 21:25:48.670797+00	1	3	Modified interface <a href="/dcim/devices/1/">bond01</a>	18	1
544	2018-06-09 21:25:56.562158+00	12	3	Modified interface <a href="/dcim/devices/1/">bond02</a>	18	1
545	2018-06-09 21:26:33.745362+00	15	3	Modified interface <a href="/dcim/devices/4/">bond01</a>	18	1
546	2018-06-09 21:26:40.764397+00	16	3	Modified interface <a href="/dcim/devices/4/">bond02</a>	18	1
547	2018-06-09 21:26:54.38325+00	42	3	Modified interface <a href="/dcim/devices/7/">bond01</a>	18	1
548	2018-06-09 21:27:03.544174+00	43	3	Modified interface <a href="/dcim/devices/7/">bond02</a>	18	1
549	2018-06-09 21:27:16.230691+00	55	3	Modified interface <a href="/dcim/devices/8/">bond01</a>	18	1
550	2018-06-09 21:27:23.423455+00	56	3	Modified interface <a href="/dcim/devices/8/">bond02</a>	18	1
551	2018-06-09 21:27:26.427826+00	56	3	Modified interface <a href="/dcim/devices/8/">bond02</a>	18	1
552	2018-06-09 21:27:43.730277+00	68	3	Modified interface <a href="/dcim/devices/9/">bond01</a>	18	1
553	2018-06-09 21:27:50.112725+00	69	3	Modified interface <a href="/dcim/devices/9/">bond02</a>	18	1
554	2018-06-09 21:28:12.184184+00	81	3	Modified interface <a href="/dcim/devices/10/">bond01</a>	18	1
555	2018-06-09 21:28:18.080757+00	81	3	Modified interface <a href="/dcim/devices/10/">bond01</a>	18	1
556	2018-06-09 21:28:23.689099+00	81	3	Modified interface <a href="/dcim/devices/10/">bond01</a>	18	1
557	2018-06-09 21:28:29.637133+00	82	3	Modified interface <a href="/dcim/devices/10/">bond02</a>	18	1
558	2018-06-09 21:28:34.781746+00	82	3	Modified interface <a href="/dcim/devices/10/">bond02</a>	18	1
559	2018-06-09 21:28:37.608935+00	82	3	Modified interface <a href="/dcim/devices/10/">bond02</a>	18	1
560	2018-11-07 16:49:56.651752+00	\N	4	Updated 2 devices	15	1
561	2018-11-07 16:57:09.332252+00	\N	4	Updated 2 devices	15	1
562	2018-11-07 18:40:11.942846+00	8	3	Modified device <a href="/dcim/devices/8/">leaf04</a>	15	1
563	2018-11-08 18:52:42.84896+00	\N	4	Updated 1 devices	15	1
564	2018-11-08 18:56:19.417461+00	\N	6	Deleted 9 interfaces	18	1
565	2018-11-08 18:56:39.379376+00	49	3	Modified interface <a href="/dcim/devices/7/">swp1</a>	18	1
566	2018-11-08 18:56:50.186742+00	50	3	Modified interface <a href="/dcim/devices/7/">swp2</a>	18	1
567	2018-11-08 18:57:37.569131+00	\N	6	Deleted 9 interfaces	18	1
568	2018-11-08 18:57:48.794184+00	62	3	Modified interface <a href="/dcim/devices/8/">swp1</a>	18	1
569	2018-11-08 18:57:56.647329+00	63	3	Modified interface <a href="/dcim/devices/8/">swp2</a>	18	1
\.


--
-- Data for Name: ipam_aggregate; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_aggregate (id, created, last_updated, family, prefix, date_added, description, rir_id) FROM stdin;
\.


--
-- Data for Name: ipam_ipaddress; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_ipaddress (id, created, last_updated, family, address, description, interface_id, nat_inside_id, vrf_id, tenant_id, status, role) FROM stdin;
56	2018-06-09	2018-06-09 10:48:20.743316+00	4	192.168.12.2/24		137	\N	2	2	1	\N
62	2018-06-09	2018-06-09 10:48:39.040862+00	4	192.168.13.2/24		138	\N	2	2	1	\N
68	2018-06-09	2018-06-09 10:49:40.251921+00	4	192.168.14.2/24		139	\N	3	3	1	\N
9	2018-06-03	2018-06-03 17:28:59.410321+00	4	10.10.10.1		4	\N	\N	\N	1	10
74	2018-06-09	2018-06-09 10:49:53.894667+00	4	192.168.15.2/24		140	\N	3	3	1	\N
86	2018-06-09	2018-06-09 10:53:42.687133+00	6	fc00:12::2/64		137	\N	2	2	1	\N
92	2018-06-09	2018-06-09 10:54:23.916168+00	6	fc00:13::2/64		138	\N	2	2	1	\N
98	2018-06-09	2018-06-09 10:54:42.020742+00	6	fc00:14::2/64		139	\N	3	3	1	\N
120	2018-06-09	2018-06-09 19:51:37.028337+00	4	192.168.11.1/24		161	\N	1	1	1	41
49	2018-06-09	2018-06-09 08:58:45.482406+00	4	10.10.30.2		99	\N	\N	\N	1	10
122	2018-06-09	2018-06-09 19:52:44.302551+00	4	192.168.13.1/24		163	\N	2	2	1	41
124	2018-06-09	2018-06-09 19:53:48.876302+00	4	192.168.15.1/24		165	\N	3	3	1	41
126	2018-06-09	2018-06-09 19:54:50.332847+00	4	192.168.12.1/24		142	\N	2	2	1	41
128	2018-06-09	2018-06-09 19:55:30.045081+00	4	192.168.14.1/24		144	\N	3	3	1	41
130	2018-06-09	2018-06-09 19:56:22.588307+00	6	fc00:11::1/64		141	\N	1	1	1	41
132	2018-06-09	2018-06-09 19:56:55.134519+00	6	fc00:13::1/64		143	\N	2	2	1	41
7	2018-06-03	2018-06-08 16:53:47.050852+00	4	169.254.1.1/30		8	\N	\N	\N	1	\N
134	2018-06-09	2018-06-09 19:57:25.643063+00	6	fc00:15::1/64		145	\N	3	3	1	41
87	2018-06-09	2018-06-09 19:58:35.058177+00	6	fc00:12::3/64		142	\N	2	2	1	\N
93	2018-06-09	2018-06-09 19:59:00.601134+00	6	fc00:13::3/64		143	\N	2	2	1	\N
99	2018-06-09	2018-06-09 19:59:16.304608+00	6	fc00:14::3/64		144	\N	3	3	1	\N
51	2018-06-09	2018-06-09 20:00:12.396717+00	4	192.168.11.3/24		141	\N	1	1	1	\N
11	2018-06-08	2018-06-08 20:17:59.798689+00	4	10.10.10.2		19	\N	\N	\N	1	10
8	2018-06-03	2018-06-08 20:20:21.168161+00	4	169.254.1.2/30		21	\N	\N	\N	1	\N
57	2018-06-09	2018-06-09 20:00:24.869895+00	4	192.168.12.3/24		142	\N	2	2	1	\N
63	2018-06-09	2018-06-09 20:00:37.953922+00	4	192.168.13.3/24		143	\N	2	2	1	\N
69	2018-06-09	2018-06-09 20:00:58.253397+00	4	192.168.14.3/24		144	\N	3	3	1	\N
75	2018-06-09	2018-06-09 20:01:13.646992+00	4	192.168.15.3/24		145	\N	3	3	1	\N
10	2018-06-03	2018-06-08 21:24:46.126106+00	4	10.100.100.12		9	\N	\N	\N	1	30
15	2018-06-08	2018-06-08 21:30:04.433543+00	4	10.100.100.12		17	\N	\N	\N	1	30
18	2018-06-08	2018-06-08 22:36:50.542167+00	4	10.10.20.1		28	\N	\N	\N	1	10
19	2018-06-08	2018-06-08 22:38:33.425144+00	4	10.10.20.2		35	\N	\N	\N	1	10
16	2018-06-08	2018-06-08 23:21:39.662181+00	4	192.168.10.1/24		3	\N	1	1	1	41
12	2018-06-08	2018-06-08 23:21:48.785744+00	4	192.168.10.1/24		18	\N	1	1	1	41
13	2018-06-08	2018-06-08 23:21:56.237071+00	4	192.168.10.2/24		3	\N	1	1	1	\N
14	2018-06-08	2018-06-08 23:22:04.35702+00	4	192.168.10.3/24		18	\N	1	1	1	\N
4	2018-06-03	2018-06-08 23:22:15.27877+00	6	fc00:10::1/64		18	\N	1	1	1	41
5	2018-06-03	2018-06-08 23:22:27.540686+00	6	fc00:10::2/64		3	\N	1	1	1	\N
6	2018-06-03	2018-06-08 23:22:46.362188+00	6	fc00:10::3/64		18	\N	1	1	1	\N
21	2018-06-08	2018-06-08 23:59:01.661535+00	4	10.10.10.3		46	\N	\N	\N	1	10
22	2018-06-09	2018-06-09 00:00:28.026116+00	4	169.254.1.1/30		48	\N	\N	\N	1	\N
17	2018-06-08	2018-06-09 00:04:25.854341+00	6	fc00:10::1/64		3	\N	1	1	1	41
27	2018-06-09	2018-06-09 00:15:54.709314+00	4	169.254.1.2/30		61	\N	\N	\N	1	\N
34	2018-06-09	2018-06-09 08:37:02.310354+00	4	10.100.100.56		70	\N	\N	\N	1	30
35	2018-06-09	2018-06-09 08:37:33.395269+00	4	10.10.10.5		72	\N	\N	\N	1	10
36	2018-06-09	2018-06-09 08:39:11.687954+00	4	169.254.1.1/30		74	\N	\N	\N	1	\N
41	2018-06-09	2018-06-09 08:48:52.770896+00	4	10.100.100.56		83	\N	\N	\N	1	30
42	2018-06-09	2018-06-09 08:49:57.197178+00	4	10.10.10.6		85	\N	\N	\N	1	10
43	2018-06-09	2018-06-09 08:51:12.140443+00	4	169.254.1.2/30		87	\N	\N	\N	1	\N
48	2018-06-09	2018-06-09 08:54:31.276043+00	4	10.10.30.1		94	\N	\N	\N	1	10
54	2018-06-09	2018-06-09 20:35:00.51934+00	4	192.168.11.6/24		156	\N	1	1	1	\N
60	2018-06-09	2018-06-09 20:35:13.015298+00	4	192.168.12.6/24		157	\N	2	2	1	\N
66	2018-06-09	2018-06-09 20:35:26.35718+00	4	192.168.13.6/24		158	\N	2	2	1	\N
72	2018-06-09	2018-06-09 20:35:37.269083+00	4	192.168.14.6/24		159	\N	3	3	1	\N
45	2018-06-09	2018-06-09 10:05:30.547499+00	4	192.168.10.7/24		84	\N	1	1	1	\N
28	2018-06-09	2018-06-09 10:06:15.15478+00	4	10.10.10.4		59	\N	\N	\N	1	10
78	2018-06-09	2018-06-09 20:35:51.193111+00	4	192.168.15.6/24		160	\N	3	3	1	\N
90	2018-06-09	2018-06-09 20:36:38.637933+00	6	fc00:12::6/64		157	\N	2	2	1	\N
40	2018-06-09	2018-06-09 10:14:08.887747+00	6	fc00:10::1/64		71	\N	1	1	1	41
46	2018-06-09	2018-06-09 10:14:08.893935+00	6	fc00:10::1/64		84	\N	1	1	1	41
91	2018-06-09	2018-06-09 20:39:51.423013+00	6	fc00:12::7/64		162	\N	2	2	1	\N
55	2018-06-09	2018-06-09 20:40:56.586391+00	4	192.168.11.7/24		161	\N	1	1	1	\N
61	2018-06-09	2018-06-09 20:41:10.993366+00	4	192.168.12.7/24		162	\N	2	2	1	\N
73	2018-06-09	2018-06-09 20:41:32.918289+00	4	192.168.14.7/24		164	\N	3	3	1	\N
79	2018-06-09	2018-06-09 20:41:45.053978+00	4	192.168.15.7/24		165	\N	3	3	1	\N
50	2018-06-09	2018-06-09 10:45:00.558226+00	4	192.168.11.2/24		136	\N	1	1	1	\N
38	2018-06-09	2018-06-09 10:04:52.146074+00	4	192.168.10.6/24		71	\N	1	1	1	\N
37	2018-06-09	2018-06-09 10:05:52.622032+00	4	192.168.10.1/24		71	\N	1	1	1	41
44	2018-06-09	2018-06-09 10:05:52.630131+00	4	192.168.10.1/24		84	\N	1	1	1	41
115	2018-06-09	2018-06-09 10:51:21.927845+00	6	fc00:11::1/64		136	\N	1	1	1	41
116	2018-06-09	2018-06-09 10:51:53.153056+00	6	fc00:12::1/64		137	\N	2	2	1	41
117	2018-06-09	2018-06-09 10:52:08.888119+00	6	fc00:13::1/64		138	\N	2	2	1	41
118	2018-06-09	2018-06-09 10:52:31.369316+00	6	fc00:14::1/64		139	\N	3	3	1	41
119	2018-06-09	2018-06-09 10:52:56.1531+00	6	fc00:15::1/64		140	\N	3	3	1	41
80	2018-06-09	2018-06-09 10:53:26.858314+00	6	fc00:11::2/64		136	\N	1	1	1	\N
104	2018-06-09	2018-06-09 10:54:58.958957+00	6	fc00:15::2/64		140	\N	3	3	1	\N
123	2018-06-09	2018-06-09 19:53:08.740336+00	4	192.168.14.1/24		164	\N	3	3	1	41
125	2018-06-09	2018-06-09 19:54:35.398377+00	4	192.168.11.1/24		141	\N	1	1	1	41
129	2018-06-09	2018-06-09 19:55:45.52175+00	4	192.168.15.1/24		145	\N	3	3	1	41
131	2018-06-09	2018-06-09 19:56:40.680239+00	6	fc00:12::1/64		142	\N	2	2	1	41
133	2018-06-09	2018-06-09 19:57:10.388924+00	6	fc00:14::1/64		144	\N	3	3	1	41
81	2018-06-09	2018-06-09 19:58:19.005782+00	6	fc00:11::3/64		141	\N	1	1	1	\N
105	2018-06-09	2018-06-09 19:59:30.920288+00	6	fc00:15::3/64		145	\N	3	3	1	\N
39	2018-06-09	2018-06-09 10:13:35.532328+00	6	fc00:10::6/64		71	\N	1	1	1	\N
47	2018-06-09	2018-06-09 10:13:35.540608+00	6	fc00:10::7/64		84	\N	1	1	1	\N
127	2018-06-09	2018-06-09 20:48:05.676037+00	4	192.168.13.1/24		143	\N	1	2	1	41
96	2018-06-09	2018-06-09 20:36:53.220312+00	6	fc00:13::6/64		158	\N	2	2	1	\N
102	2018-06-09	2018-06-09 20:37:08.244069+00	6	fc00:14::6/64		159	\N	3	3	1	\N
108	2018-06-09	2018-06-09 20:37:28.611635+00	6	fc00:15::6/64		160	\N	3	3	1	\N
165	2018-06-09	2018-06-09 20:38:10.179972+00	6	fc00:11::1/64		161	\N	1	1	1	41
110	2018-06-09	2018-06-09 10:45:52.595965+00	4	192.168.11.1/24		136	\N	1	1	1	41
111	2018-06-09	2018-06-09 10:46:35.0743+00	4	192.168.12.1/24		137	\N	2	2	1	41
112	2018-06-09	2018-06-09 10:46:52.321546+00	4	192.168.13.1/24		138	\N	2	2	1	41
113	2018-06-09	2018-06-09 10:47:12.440114+00	4	192.168.14.1/24		139	\N	3	3	1	41
114	2018-06-09	2018-06-09 10:47:34.379552+00	4	192.168.15.1/24		140	\N	3	3	1	41
155	2018-06-09	2018-06-09 20:32:16.585849+00	4	192.168.11.1/24		156	\N	1	1	1	41
156	2018-06-09	2018-06-09 20:32:29.915115+00	6	fc00:11::1/64		156	\N	1	1	1	41
157	2018-06-09	2018-06-09 20:32:44.76192+00	4	192.168.12.1/24		157	\N	2	2	1	41
158	2018-06-09	2018-06-09 20:32:59.432429+00	6	fc00:12::1/64		157	\N	2	2	1	41
159	2018-06-09	2018-06-09 20:33:10.620229+00	4	192.168.13.1/24		158	\N	2	2	1	41
160	2018-06-09	2018-06-09 20:33:24.164546+00	6	fc00:13::1/64		158	\N	2	2	1	41
161	2018-06-09	2018-06-09 20:33:39.459045+00	4	192.168.14.1/24		159	\N	3	3	1	41
162	2018-06-09	2018-06-09 20:33:54.627912+00	6	fc00:14::1/64		159	\N	3	3	1	41
163	2018-06-09	2018-06-09 20:34:07.400939+00	4	192.168.15.1/24		160	\N	3	3	1	41
164	2018-06-09	2018-06-09 20:34:28.218622+00	6	fc00:15::1/64		160	\N	3	3	1	41
84	2018-06-09	2018-06-09 20:36:17.526537+00	6	fc00:11::6/64		156	\N	1	1	1	\N
166	2018-06-09	2018-06-09 20:38:21.848697+00	6	fc00:12::1/64		162	\N	2	2	1	41
167	2018-06-09	2018-06-09 20:38:38.68772+00	6	fc00:13::1/64		163	\N	2	2	1	41
168	2018-06-09	2018-06-09 20:38:51.17949+00	6	fc00:14::1/64		164	\N	3	3	1	41
169	2018-06-09	2018-06-09 20:39:07.863229+00	6	fc00:15::1/64		165	\N	3	3	1	41
85	2018-06-09	2018-06-09 20:39:38.399468+00	6	fc00:11::7/64		161	\N	1	1	1	\N
97	2018-06-09	2018-06-09 20:40:06.835903+00	6	fc00:13::7/64		163	\N	2	2	1	\N
103	2018-06-09	2018-06-09 20:40:20.317366+00	6	fc00:14::7/64		164	\N	3	3	1	\N
109	2018-06-09	2018-06-09 20:40:31.752772+00	6	fc00:15::7/64		165	\N	3	3	1	\N
67	2018-06-09	2018-06-09 20:41:21.421193+00	4	192.168.13.7/24		163	\N	2	2	1	\N
121	2018-06-09	2018-06-09 20:43:40.279345+00	4	192.168.12.1/24		162	\N	2	2	1	41
\.


--
-- Data for Name: ipam_prefix; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_prefix (id, created, last_updated, family, prefix, status, description, role_id, site_id, vlan_id, vrf_id, tenant_id, is_pool) FROM stdin;
\.


--
-- Data for Name: ipam_rir; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_rir (id, name, slug, is_private) FROM stdin;
\.


--
-- Data for Name: ipam_role; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_role (id, name, slug, weight) FROM stdin;
\.


--
-- Data for Name: ipam_service; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service (id, created, last_updated, name, protocol, port, description, device_id, virtual_machine_id) FROM stdin;
\.


--
-- Data for Name: ipam_service_ipaddresses; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_service_ipaddresses (id, service_id, ipaddress_id) FROM stdin;
\.


--
-- Data for Name: ipam_vlan; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlan (id, created, last_updated, vid, name, status, role_id, site_id, group_id, description, tenant_id) FROM stdin;
1	2018-06-03	2018-06-03 17:03:23.145948+00	1000	Vlan1000	1	\N	1	\N		\N
2	2018-06-03	2018-06-03 17:04:33.134388+00	1001	Vlan1001	1	\N	1	\N		\N
3	2018-06-09	2018-06-09 09:08:27.251969+00	1002	Vlan1002	1	\N	1	\N		\N
4	2018-06-09	2018-06-09 09:08:49.648987+00	1003	Vlan1003	1	\N	1	\N		\N
5	2018-06-09	2018-06-09 09:09:13.613934+00	1004	Vlan1004	1	\N	1	\N		\N
6	2018-06-09	2018-06-09 09:09:26.857202+00	1005	Vlan1005	1	\N	1	\N		\N
7	2018-06-09	2018-06-09 09:10:04.457964+00	2501	Vlan2501	1	\N	1	\N		\N
9	2018-06-09	2018-06-09 09:10:36.250134+00	2503	Vlan2503	1	\N	1	\N		\N
10	2018-06-09	2018-06-09 09:10:48.996452+00	2504	Vlan2504	1	\N	1	\N		\N
11	2018-06-09	2018-06-09 09:11:02.479483+00	2505	Vlan2505	1	\N	1	\N		\N
12	2018-06-09	2018-06-09 09:11:15.205472+00	2506	Vlan2506	1	\N	1	\N		\N
13	2018-06-09	2018-06-09 09:11:39.566879+00	2507	Vlan2507	1	\N	1	\N		\N
14	2018-06-09	2018-06-09 09:11:50.387545+00	2508	Vlan2508	1	\N	1	\N		\N
8	2018-06-09	2018-06-09 09:12:17.090306+00	2502	Vlan2502	1	\N	1	\N		\N
16	2018-06-09	2018-06-09 09:13:14.371242+00	2701	Vlan2701	1	\N	1	\N		\N
17	2018-06-09	2018-06-09 09:13:34.406514+00	2702	Vlan2702	1	\N	1	\N		\N
18	2018-06-09	2018-06-09 09:13:48.129519+00	2703	Vlan2703	1	\N	1	\N		\N
19	2018-06-09	2018-06-09 09:14:08.255639+00	2704	Vlan2704	1	\N	1	\N		\N
\.


--
-- Data for Name: ipam_vlangroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vlangroup (id, name, slug, site_id) FROM stdin;
\.


--
-- Data for Name: ipam_vrf; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.ipam_vrf (id, created, last_updated, name, rd, description, enforce_unique, tenant_id) FROM stdin;
1	2018-06-03	2018-06-08 21:42:26.159854+00	4001	0		f	\N
2	2018-06-03	2018-06-08 21:42:43.357052+00	4002	1		f	\N
3	2018-06-09	2018-06-09 20:45:51.961098+00	4003	2		f	\N
\.


--
-- Data for Name: secrets_secret; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secret (id, created, last_updated, name, ciphertext, hash, device_id, role_id) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole (id, name, slug) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole_groups; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole_groups (id, secretrole_id, group_id) FROM stdin;
\.


--
-- Data for Name: secrets_secretrole_users; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_secretrole_users (id, secretrole_id, user_id) FROM stdin;
\.


--
-- Data for Name: secrets_sessionkey; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_sessionkey (id, cipher, hash, created, userkey_id) FROM stdin;
\.


--
-- Data for Name: secrets_userkey; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.secrets_userkey (id, created, last_updated, public_key, master_key_cipher, user_id) FROM stdin;
\.


--
-- Data for Name: tenancy_tenant; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenant (id, created, last_updated, name, slug, description, comments, group_id) FROM stdin;
1	2018-06-03	2018-06-03 17:42:29.468252+00	Tenant1	tenant1			\N
2	2018-06-03	2018-06-03 17:42:41.348098+00	Tenant2	tenant2			\N
3	2018-06-09	2018-06-09 09:58:35.020239+00	Tenant3	tenant3			\N
\.


--
-- Data for Name: tenancy_tenantgroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.tenancy_tenantgroup (id, name, slug) FROM stdin;
\.


--
-- Data for Name: users_token; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.users_token (id, created, expires, key, write_enabled, description, user_id) FROM stdin;
1	2018-06-03 16:17:44.850794+00	\N	0123456789abcdef0123456789abcdefcumulus	t		1
\.


--
-- Data for Name: virtualization_cluster; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_cluster (id, created, last_updated, name, comments, group_id, type_id, site_id) FROM stdin;
\.


--
-- Data for Name: virtualization_clustergroup; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustergroup (id, name, slug) FROM stdin;
\.


--
-- Data for Name: virtualization_clustertype; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_clustertype (id, name, slug) FROM stdin;
\.


--
-- Data for Name: virtualization_virtualmachine; Type: TABLE DATA; Schema: public; Owner: netbox
--

COPY public.virtualization_virtualmachine (id, created, last_updated, name, vcpus, memory, disk, comments, cluster_id, platform_id, primary_ip4_id, primary_ip6_id, tenant_id, status, role_id) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 195, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: circuits_circuit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuit_id_seq', 1, true);


--
-- Name: circuits_circuittermination_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittermination_id_seq', 1, true);


--
-- Name: circuits_circuittype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_circuittype_id_seq', 1, true);


--
-- Name: circuits_provider_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.circuits_provider_id_seq', 1, true);


--
-- Name: dcim_consoleport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleport_id_seq', 1, false);


--
-- Name: dcim_consoleporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleporttemplate_id_seq', 1, false);


--
-- Name: dcim_consoleserverport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverport_id_seq', 1, false);


--
-- Name: dcim_consoleserverporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_consoleserverporttemplate_id_seq', 1, false);


--
-- Name: dcim_device_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_device_id_seq', 16, true);


--
-- Name: dcim_devicebay_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebay_id_seq', 1, false);


--
-- Name: dcim_devicebaytemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicebaytemplate_id_seq', 1, false);


--
-- Name: dcim_devicerole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicerole_id_seq', 2, true);


--
-- Name: dcim_devicetype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_devicetype_id_seq', 1, true);


--
-- Name: dcim_interface_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_id_seq', 169, true);


--
-- Name: dcim_interface_tagged_vlans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interface_tagged_vlans_id_seq', 100, true);


--
-- Name: dcim_interfaceconnection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfaceconnection_id_seq', 1, false);


--
-- Name: dcim_interfacetemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_interfacetemplate_id_seq', 1, false);


--
-- Name: dcim_manufacturer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_manufacturer_id_seq', 1, true);


--
-- Name: dcim_module_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_module_id_seq', 1, false);


--
-- Name: dcim_platform_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_platform_id_seq', 1, true);


--
-- Name: dcim_poweroutlet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlet_id_seq', 1, false);


--
-- Name: dcim_poweroutlettemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_poweroutlettemplate_id_seq', 1, false);


--
-- Name: dcim_powerport_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerport_id_seq', 1, false);


--
-- Name: dcim_powerporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_powerporttemplate_id_seq', 1, false);


--
-- Name: dcim_rack_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rack_id_seq', 7, true);


--
-- Name: dcim_rackgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackgroup_id_seq', 3, true);


--
-- Name: dcim_rackreservation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackreservation_id_seq', 1, false);


--
-- Name: dcim_rackrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_rackrole_id_seq', 1, false);


--
-- Name: dcim_region_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_region_id_seq', 1, false);


--
-- Name: dcim_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_site_id_seq', 1, true);


--
-- Name: dcim_virtualchassis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.dcim_virtualchassis_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 7, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 65, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 121, true);


--
-- Name: extras_customfield_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_id_seq', 4, true);


--
-- Name: extras_customfield_obj_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfield_obj_type_id_seq', 4, true);


--
-- Name: extras_customfieldchoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfieldchoice_id_seq', 1, false);


--
-- Name: extras_customfieldvalue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_customfieldvalue_id_seq', 28, true);


--
-- Name: extras_exporttemplate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_exporttemplate_id_seq', 1, false);


--
-- Name: extras_graph_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_graph_id_seq', 1, false);


--
-- Name: extras_imageattachment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_imageattachment_id_seq', 1, false);


--
-- Name: extras_reportresult_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_reportresult_id_seq', 1, false);


--
-- Name: extras_topologymap_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_topologymap_id_seq', 1, false);


--
-- Name: extras_useraction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.extras_useraction_id_seq', 569, true);


--
-- Name: ipam_aggregate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_aggregate_id_seq', 1, false);


--
-- Name: ipam_ipaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_ipaddress_id_seq', 169, true);


--
-- Name: ipam_prefix_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_prefix_id_seq', 2, true);


--
-- Name: ipam_rir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_rir_id_seq', 1, false);


--
-- Name: ipam_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_role_id_seq', 1, false);


--
-- Name: ipam_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_id_seq', 1, false);


--
-- Name: ipam_service_ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_service_ipaddresses_id_seq', 1, false);


--
-- Name: ipam_vlan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlan_id_seq', 19, true);


--
-- Name: ipam_vlangroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vlangroup_id_seq', 1, false);


--
-- Name: ipam_vrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.ipam_vrf_id_seq', 3, true);


--
-- Name: secrets_secret_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secret_id_seq', 1, false);


--
-- Name: secrets_secretrole_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_groups_id_seq', 1, false);


--
-- Name: secrets_secretrole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_id_seq', 1, false);


--
-- Name: secrets_secretrole_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_secretrole_users_id_seq', 1, false);


--
-- Name: secrets_sessionkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_sessionkey_id_seq', 1, false);


--
-- Name: secrets_userkey_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.secrets_userkey_id_seq', 1, false);


--
-- Name: tenancy_tenant_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenant_id_seq', 3, true);


--
-- Name: tenancy_tenantgroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.tenancy_tenantgroup_id_seq', 1, false);


--
-- Name: users_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.users_token_id_seq', 1, true);


--
-- Name: virtualization_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_cluster_id_seq', 1, false);


--
-- Name: virtualization_clustergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustergroup_id_seq', 1, false);


--
-- Name: virtualization_clustertype_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_clustertype_id_seq', 1, false);


--
-- Name: virtualization_virtualmachine_id_seq; Type: SEQUENCE SET; Schema: public; Owner: netbox
--

SELECT pg_catalog.setval('public.virtualization_virtualmachine_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: circuits_circuit circuits_circuit_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuit circuits_circuit_provider_id_cid_b6f29862_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_cid_b6f29862_uniq UNIQUE (provider_id, cid);


--
-- Name: circuits_circuittermination circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_circuit_id_term_side_b13efd0e_uniq UNIQUE (circuit_id, term_side);


--
-- Name: circuits_circuittermination circuits_circuittermination_interface_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_interface_id_key UNIQUE (interface_id);


--
-- Name: circuits_circuittermination circuits_circuittermination_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_name_key UNIQUE (name);


--
-- Name: circuits_circuittype circuits_circuittype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_pkey PRIMARY KEY (id);


--
-- Name: circuits_circuittype circuits_circuittype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittype
    ADD CONSTRAINT circuits_circuittype_slug_key UNIQUE (slug);


--
-- Name: circuits_provider circuits_provider_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_name_key UNIQUE (name);


--
-- Name: circuits_provider circuits_provider_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_pkey PRIMARY KEY (id);


--
-- Name: circuits_provider circuits_provider_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_provider
    ADD CONSTRAINT circuits_provider_slug_key UNIQUE (slug);


--
-- Name: dcim_consoleport dcim_consoleport_cs_port_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cs_port_id_key UNIQUE (cs_port_id);


--
-- Name: dcim_consoleport dcim_consoleport_device_id_name_293786b6_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_name_293786b6_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleport dcim_consoleport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_device_type_id_name_8208f9ca_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_name_fb1c5999_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_name_fb1c5999_uniq UNIQUE (device_id, name);


--
-- Name: dcim_consoleserverport dcim_consoleserverport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_pkey PRIMARY KEY (id);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverportte_device_type_id_name_a05c974d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverportte_device_type_id_name_a05c974d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_device dcim_device_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_name_key UNIQUE (name);


--
-- Name: dcim_device dcim_device_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_pkey PRIMARY KEY (id);


--
-- Name: dcim_device dcim_device_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: dcim_device dcim_device_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: dcim_device dcim_device_rack_id_position_face_43208a79_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_position_face_43208a79_uniq UNIQUE (rack_id, "position", face);


--
-- Name: dcim_device dcim_device_virtual_chassis_id_vc_position_efea7133_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_vc_position_efea7133_uniq UNIQUE (virtual_chassis_id, vc_position);


--
-- Name: dcim_devicebay dcim_devicebay_device_id_name_2475a67b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_name_2475a67b_uniq UNIQUE (device_id, name);


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_key UNIQUE (installed_device_id);


--
-- Name: dcim_devicebay dcim_devicebay_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_device_type_id_name_8f4899fe_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_devicebaytemplate dcim_devicebaytemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_name_key UNIQUE (name);


--
-- Name: dcim_devicerole dcim_devicerole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_pkey PRIMARY KEY (id);


--
-- Name: dcim_devicerole dcim_devicerole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicerole
    ADD CONSTRAINT dcim_devicerole_slug_key UNIQUE (slug);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_model_17948c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_model_17948c0c_uniq UNIQUE (manufacturer_id, model);


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_slug_a0b931cb_uniq UNIQUE (manufacturer_id, slug);


--
-- Name: dcim_devicetype dcim_devicetype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface dcim_interface_device_id_name_bffc4ec4_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_name_bffc4ec4_uniq UNIQUE (device_id, name);


--
-- Name: dcim_interface dcim_interface_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_pkey PRIMARY KEY (id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_interface_id_vlan_id_0d55c576_uniq UNIQUE (interface_id, vlan_id);


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfaceconnection dcim_interfaceconnection_interface_a_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfaceconnection
    ADD CONSTRAINT dcim_interfaceconnection_interface_a_id_key UNIQUE (interface_a_id);


--
-- Name: dcim_interfaceconnection dcim_interfaceconnection_interface_b_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfaceconnection
    ADD CONSTRAINT dcim_interfaceconnection_interface_b_id_key UNIQUE (interface_b_id);


--
-- Name: dcim_interfaceconnection dcim_interfaceconnection_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfaceconnection
    ADD CONSTRAINT dcim_interfaceconnection_pkey PRIMARY KEY (id);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_device_type_id_name_3a847237_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_device_type_id_name_3a847237_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_interfacetemplate dcim_interfacetemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_inventoryitem dcim_inventoryitem_asset_tag_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_asset_tag_key UNIQUE (asset_tag);


--
-- Name: dcim_manufacturer dcim_manufacturer_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_name_key UNIQUE (name);


--
-- Name: dcim_manufacturer dcim_manufacturer_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_pkey PRIMARY KEY (id);


--
-- Name: dcim_manufacturer dcim_manufacturer_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_manufacturer
    ADD CONSTRAINT dcim_manufacturer_slug_key UNIQUE (slug);


--
-- Name: dcim_inventoryitem dcim_module_device_id_parent_id_name_4d8292af_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_module_device_id_parent_id_name_4d8292af_uniq UNIQUE (device_id, parent_id, name);


--
-- Name: dcim_inventoryitem dcim_module_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_module_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_name_key UNIQUE (name);


--
-- Name: dcim_platform dcim_platform_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_pkey PRIMARY KEY (id);


--
-- Name: dcim_platform dcim_platform_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_slug_key UNIQUE (slug);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_name_981b00c1_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_name_981b00c1_uniq UNIQUE (device_id, name);


--
-- Name: dcim_poweroutlet dcim_poweroutlet_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_pkey PRIMARY KEY (id);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_device_type_id_name_eafbb07d_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerport dcim_powerport_device_id_name_948af82c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_name_948af82c_uniq UNIQUE (device_id, name);


--
-- Name: dcim_powerport dcim_powerport_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_pkey PRIMARY KEY (id);


--
-- Name: dcim_powerport dcim_powerport_power_outlet_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_power_outlet_id_key UNIQUE (power_outlet_id);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_device_type_id_name_b4e9689f_uniq UNIQUE (device_type_id, name);


--
-- Name: dcim_powerporttemplate dcim_powerporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttemplate_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_pkey PRIMARY KEY (id);


--
-- Name: dcim_rack dcim_rack_site_id_facility_id_2a1d0860_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_facility_id_2a1d0860_uniq UNIQUE (site_id, facility_id);


--
-- Name: dcim_rack dcim_rack_site_id_name_5fde0119_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_name_5fde0119_uniq UNIQUE (site_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_name_c9bd921f_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_name_c9bd921f_uniq UNIQUE (site_id, name);


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_slug_7fbfd118_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_slug_7fbfd118_uniq UNIQUE (site_id, slug);


--
-- Name: dcim_rackreservation dcim_rackreservation_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_name_key UNIQUE (name);


--
-- Name: dcim_rackrole dcim_rackrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_pkey PRIMARY KEY (id);


--
-- Name: dcim_rackrole dcim_rackrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackrole
    ADD CONSTRAINT dcim_rackrole_slug_key UNIQUE (slug);


--
-- Name: dcim_region dcim_region_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_name_key UNIQUE (name);


--
-- Name: dcim_region dcim_region_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_pkey PRIMARY KEY (id);


--
-- Name: dcim_region dcim_region_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_slug_key UNIQUE (slug);


--
-- Name: dcim_site dcim_site_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_name_key UNIQUE (name);


--
-- Name: dcim_site dcim_site_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_pkey PRIMARY KEY (id);


--
-- Name: dcim_site dcim_site_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_slug_key UNIQUE (slug);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_key UNIQUE (master_id);


--
-- Name: dcim_virtualchassis dcim_virtualchassis_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: extras_customfield extras_customfield_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_name_key UNIQUE (name);


--
-- Name: extras_customfield_obj_type extras_customfield_obj_t_customfield_id_contentty_77878958_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_obj_t_customfield_id_contentty_77878958_uniq UNIQUE (customfield_id, contenttype_id);


--
-- Name: extras_customfield_obj_type extras_customfield_obj_type_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_obj_type_pkey PRIMARY KEY (id);


--
-- Name: extras_customfield extras_customfield_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield
    ADD CONSTRAINT extras_customfield_pkey PRIMARY KEY (id);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_field_id_value_f959a108_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_field_id_value_f959a108_uniq UNIQUE (field_id, value);


--
-- Name: extras_customfieldchoice extras_customfieldchoice_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldchoice_pkey PRIMARY KEY (id);


--
-- Name: extras_customfieldvalue extras_customfieldvalue_field_id_obj_type_id_obj_876f6d9c_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldvalue_field_id_obj_type_id_obj_876f6d9c_uniq UNIQUE (field_id, obj_type_id, obj_id);


--
-- Name: extras_customfieldvalue extras_customfieldvalue_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldvalue_pkey PRIMARY KEY (id);


--
-- Name: extras_exporttemplate extras_exporttemplate_content_type_id_name_edca9b9b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_content_type_id_name_edca9b9b_uniq UNIQUE (content_type_id, name);


--
-- Name: extras_exporttemplate extras_exporttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplate_pkey PRIMARY KEY (id);


--
-- Name: extras_graph extras_graph_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_graph
    ADD CONSTRAINT extras_graph_pkey PRIMARY KEY (id);


--
-- Name: extras_imageattachment extras_imageattachment_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachment_pkey PRIMARY KEY (id);


--
-- Name: extras_reportresult extras_reportresult_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult
    ADD CONSTRAINT extras_reportresult_pkey PRIMARY KEY (id);


--
-- Name: extras_reportresult extras_reportresult_report_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult
    ADD CONSTRAINT extras_reportresult_report_key UNIQUE (report);


--
-- Name: extras_topologymap extras_topologymap_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_name_key UNIQUE (name);


--
-- Name: extras_topologymap extras_topologymap_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_pkey PRIMARY KEY (id);


--
-- Name: extras_topologymap extras_topologymap_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_slug_key UNIQUE (slug);


--
-- Name: extras_useraction extras_useraction_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_useraction
    ADD CONSTRAINT extras_useraction_pkey PRIMARY KEY (id);


--
-- Name: ipam_aggregate ipam_aggregate_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_pkey PRIMARY KEY (id);


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_key UNIQUE (nat_inside_id);


--
-- Name: ipam_ipaddress ipam_ipaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_pkey PRIMARY KEY (id);


--
-- Name: ipam_prefix ipam_prefix_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_name_key UNIQUE (name);


--
-- Name: ipam_rir ipam_rir_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_pkey PRIMARY KEY (id);


--
-- Name: ipam_rir ipam_rir_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_rir
    ADD CONSTRAINT ipam_rir_slug_key UNIQUE (slug);


--
-- Name: ipam_role ipam_role_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_name_key UNIQUE (name);


--
-- Name: ipam_role ipam_role_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_pkey PRIMARY KEY (id);


--
-- Name: ipam_role ipam_role_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_role
    ADD CONSTRAINT ipam_role_slug_key UNIQUE (slug);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ipaddress_id_d019a805_uniq UNIQUE (service_id, ipaddress_id);


--
-- Name: ipam_service ipam_service_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlan ipam_vlan_group_id_name_e53919df_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_name_e53919df_uniq UNIQUE (group_id, name);


--
-- Name: ipam_vlan ipam_vlan_group_id_vid_5ca4cc47_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_vid_5ca4cc47_uniq UNIQUE (group_id, vid);


--
-- Name: ipam_vlan ipam_vlan_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_pkey PRIMARY KEY (id);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_name_a38e981b_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_name_a38e981b_uniq UNIQUE (site_id, name);


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_slug_6372a304_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_slug_6372a304_uniq UNIQUE (site_id, slug);


--
-- Name: ipam_vrf ipam_vrf_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_pkey PRIMARY KEY (id);


--
-- Name: ipam_vrf ipam_vrf_rd_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_rd_key UNIQUE (rd);


--
-- Name: secrets_secret secrets_secret_device_id_role_id_name_f8acc218_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_device_id_role_id_name_f8acc218_uniq UNIQUE (device_id, role_id, name);


--
-- Name: secrets_secret secrets_secret_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole_groups secrets_secretrole_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_groups_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole_groups secrets_secretrole_groups_secretrole_id_group_id_1c7f7ee5_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_groups_secretrole_id_group_id_1c7f7ee5_uniq UNIQUE (secretrole_id, group_id);


--
-- Name: secrets_secretrole secrets_secretrole_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_name_key UNIQUE (name);


--
-- Name: secrets_secretrole secrets_secretrole_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole secrets_secretrole_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole
    ADD CONSTRAINT secrets_secretrole_slug_key UNIQUE (slug);


--
-- Name: secrets_secretrole_users secrets_secretrole_users_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_users_pkey PRIMARY KEY (id);


--
-- Name: secrets_secretrole_users secrets_secretrole_users_secretrole_id_user_id_41832d38_uniq; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_users_secretrole_id_user_id_41832d38_uniq UNIQUE (secretrole_id, user_id);


--
-- Name: secrets_sessionkey secrets_sessionkey_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_pkey PRIMARY KEY (id);


--
-- Name: secrets_sessionkey secrets_sessionkey_userkey_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_userkey_id_key UNIQUE (userkey_id);


--
-- Name: secrets_userkey secrets_userkey_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_pkey PRIMARY KEY (id);


--
-- Name: secrets_userkey secrets_userkey_user_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_user_id_key UNIQUE (user_id);


--
-- Name: tenancy_tenant tenancy_tenant_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_name_key UNIQUE (name);


--
-- Name: tenancy_tenant tenancy_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenant tenancy_tenant_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_slug_key UNIQUE (slug);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_name_key UNIQUE (name);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_pkey PRIMARY KEY (id);


--
-- Name: tenancy_tenantgroup tenancy_tenantgroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenantgroup
    ADD CONSTRAINT tenancy_tenantgroup_slug_key UNIQUE (slug);


--
-- Name: users_token users_token_key_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_key_key UNIQUE (key);


--
-- Name: users_token users_token_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_pkey PRIMARY KEY (id);


--
-- Name: virtualization_cluster virtualization_cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_name_key UNIQUE (name);


--
-- Name: virtualization_cluster virtualization_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_name_key UNIQUE (name);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustergroup virtualization_clustergroup_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustergroup
    ADD CONSTRAINT virtualization_clustergroup_slug_key UNIQUE (slug);


--
-- Name: virtualization_clustertype virtualization_clustertype_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_name_key UNIQUE (name);


--
-- Name: virtualization_clustertype virtualization_clustertype_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_pkey PRIMARY KEY (id);


--
-- Name: virtualization_clustertype virtualization_clustertype_slug_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_clustertype
    ADD CONSTRAINT virtualization_clustertype_slug_key UNIQUE (slug);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_name_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_name_key UNIQUE (name);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_pkey; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_pkey PRIMARY KEY (id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip4_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip4_id_key UNIQUE (primary_ip4_id);


--
-- Name: virtualization_virtualmachine virtualization_virtualmachine_primary_ip6_id_key; Type: CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtualmachine_primary_ip6_id_key UNIQUE (primary_ip6_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: circuits_circuit_provider_id_d9195418; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_provider_id_d9195418 ON public.circuits_circuit USING btree (provider_id);


--
-- Name: circuits_circuit_tenant_id_812508a5; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_tenant_id_812508a5 ON public.circuits_circuit USING btree (tenant_id);


--
-- Name: circuits_circuit_type_id_1b9f485a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuit_type_id_1b9f485a ON public.circuits_circuit USING btree (type_id);


--
-- Name: circuits_circuittermination_circuit_id_257e87e7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_circuit_id_257e87e7 ON public.circuits_circuittermination USING btree (circuit_id);


--
-- Name: circuits_circuittermination_site_id_e6fe5652; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittermination_site_id_e6fe5652 ON public.circuits_circuittermination USING btree (site_id);


--
-- Name: circuits_circuittype_name_8256ea9a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_name_8256ea9a_like ON public.circuits_circuittype USING btree (name varchar_pattern_ops);


--
-- Name: circuits_circuittype_slug_9b4b3cf9_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_circuittype_slug_9b4b3cf9_like ON public.circuits_circuittype USING btree (slug varchar_pattern_ops);


--
-- Name: circuits_provider_name_8f2514f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_name_8f2514f5_like ON public.circuits_provider USING btree (name varchar_pattern_ops);


--
-- Name: circuits_provider_slug_c3c0aa10_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX circuits_provider_slug_c3c0aa10_like ON public.circuits_provider USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_consoleport_device_id_f2d90d3c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleport_device_id_f2d90d3c ON public.dcim_consoleport USING btree (device_id);


--
-- Name: dcim_consoleporttemplate_device_type_id_075d4015; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleporttemplate_device_type_id_075d4015 ON public.dcim_consoleporttemplate USING btree (device_type_id);


--
-- Name: dcim_consoleserverport_device_id_d9866581; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverport_device_id_d9866581 ON public.dcim_consoleserverport USING btree (device_id);


--
-- Name: dcim_consoleserverporttemplate_device_type_id_579bdc86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_consoleserverporttemplate_device_type_id_579bdc86 ON public.dcim_consoleserverporttemplate USING btree (device_type_id);


--
-- Name: dcim_device_asset_tag_8dac1079_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_asset_tag_8dac1079_like ON public.dcim_device USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_device_cluster_id_cf852f78; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_cluster_id_cf852f78 ON public.dcim_device USING btree (cluster_id);


--
-- Name: dcim_device_device_role_id_682e8188; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_role_id_682e8188 ON public.dcim_device USING btree (device_role_id);


--
-- Name: dcim_device_device_type_id_d61b4086; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_device_type_id_d61b4086 ON public.dcim_device USING btree (device_type_id);


--
-- Name: dcim_device_name_cfa61dd8_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_name_cfa61dd8_like ON public.dcim_device USING btree (name varchar_pattern_ops);


--
-- Name: dcim_device_platform_id_468138f1; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_platform_id_468138f1 ON public.dcim_device USING btree (platform_id);


--
-- Name: dcim_device_rack_id_23bde71f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_rack_id_23bde71f ON public.dcim_device USING btree (rack_id);


--
-- Name: dcim_device_site_id_ff897cf6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_site_id_ff897cf6 ON public.dcim_device USING btree (site_id);


--
-- Name: dcim_device_tenant_id_dcea7969; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_tenant_id_dcea7969 ON public.dcim_device USING btree (tenant_id);


--
-- Name: dcim_device_virtual_chassis_id_aed51693; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_device_virtual_chassis_id_aed51693 ON public.dcim_device USING btree (virtual_chassis_id);


--
-- Name: dcim_devicebay_device_id_0c8a1218; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebay_device_id_0c8a1218 ON public.dcim_devicebay USING btree (device_id);


--
-- Name: dcim_devicebaytemplate_device_type_id_f4b24a29; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicebaytemplate_device_type_id_f4b24a29 ON public.dcim_devicebaytemplate USING btree (device_type_id);


--
-- Name: dcim_devicerole_name_1c813306_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_name_1c813306_like ON public.dcim_devicerole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_devicerole_slug_7952643b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicerole_slug_7952643b_like ON public.dcim_devicerole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_devicetype_manufacturer_id_a3e8029e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_manufacturer_id_a3e8029e ON public.dcim_devicetype USING btree (manufacturer_id);


--
-- Name: dcim_devicetype_slug_448745bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd ON public.dcim_devicetype USING btree (slug);


--
-- Name: dcim_devicetype_slug_448745bd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_devicetype_slug_448745bd_like ON public.dcim_devicetype USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_interface_device_id_359c6115; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_device_id_359c6115 ON public.dcim_interface USING btree (device_id);


--
-- Name: dcim_interface_lag_id_ea1a1d12; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_lag_id_ea1a1d12 ON public.dcim_interface USING btree (lag_id);


--
-- Name: dcim_interface_tagged_vlans_interface_id_5870c9e9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_interface_id_5870c9e9 ON public.dcim_interface_tagged_vlans USING btree (interface_id);


--
-- Name: dcim_interface_tagged_vlans_vlan_id_e027005c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_tagged_vlans_vlan_id_e027005c ON public.dcim_interface_tagged_vlans USING btree (vlan_id);


--
-- Name: dcim_interface_untagged_vlan_id_838dc7be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_untagged_vlan_id_838dc7be ON public.dcim_interface USING btree (untagged_vlan_id);


--
-- Name: dcim_interface_virtual_machine_id_2afd2d50; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interface_virtual_machine_id_2afd2d50 ON public.dcim_interface USING btree (virtual_machine_id);


--
-- Name: dcim_interfacetemplate_device_type_id_4bfcbfab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_interfacetemplate_device_type_id_4bfcbfab ON public.dcim_interfacetemplate USING btree (device_type_id);


--
-- Name: dcim_inventoryitem_asset_tag_d3289273_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_inventoryitem_asset_tag_d3289273_like ON public.dcim_inventoryitem USING btree (asset_tag varchar_pattern_ops);


--
-- Name: dcim_manufacturer_name_841fcd92_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_name_841fcd92_like ON public.dcim_manufacturer USING btree (name varchar_pattern_ops);


--
-- Name: dcim_manufacturer_slug_00430749_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_manufacturer_slug_00430749_like ON public.dcim_manufacturer USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_module_device_id_53cfd5be; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_device_id_53cfd5be ON public.dcim_inventoryitem USING btree (device_id);


--
-- Name: dcim_module_manufacturer_id_95322cbb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_manufacturer_id_95322cbb ON public.dcim_inventoryitem USING btree (manufacturer_id);


--
-- Name: dcim_module_parent_id_bb5d0341; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_module_parent_id_bb5d0341 ON public.dcim_inventoryitem USING btree (parent_id);


--
-- Name: dcim_platform_manufacturer_id_83f72d3d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_manufacturer_id_83f72d3d ON public.dcim_platform USING btree (manufacturer_id);


--
-- Name: dcim_platform_name_c2f04255_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_name_c2f04255_like ON public.dcim_platform USING btree (name varchar_pattern_ops);


--
-- Name: dcim_platform_slug_b0908ae4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_platform_slug_b0908ae4_like ON public.dcim_platform USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_poweroutlet_device_id_286351d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlet_device_id_286351d7 ON public.dcim_poweroutlet USING btree (device_id);


--
-- Name: dcim_poweroutlettemplate_device_type_id_26b2316c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_poweroutlettemplate_device_type_id_26b2316c ON public.dcim_poweroutlettemplate USING btree (device_type_id);


--
-- Name: dcim_powerport_device_id_ef7185ae; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerport_device_id_ef7185ae ON public.dcim_powerport USING btree (device_id);


--
-- Name: dcim_powerporttemplate_device_type_id_1ddfbfcc; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_powerporttemplate_device_type_id_1ddfbfcc ON public.dcim_powerporttemplate USING btree (device_type_id);


--
-- Name: dcim_rack_group_id_44e90ea9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_group_id_44e90ea9 ON public.dcim_rack USING btree (group_id);


--
-- Name: dcim_rack_role_id_62d6919e; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_role_id_62d6919e ON public.dcim_rack USING btree (role_id);


--
-- Name: dcim_rack_site_id_403c7b3a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_site_id_403c7b3a ON public.dcim_rack USING btree (site_id);


--
-- Name: dcim_rack_tenant_id_7cdf3725; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rack_tenant_id_7cdf3725 ON public.dcim_rack USING btree (tenant_id);


--
-- Name: dcim_rackgroup_site_id_13520e89; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_site_id_13520e89 ON public.dcim_rackgroup USING btree (site_id);


--
-- Name: dcim_rackgroup_slug_3f4582a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7 ON public.dcim_rackgroup USING btree (slug);


--
-- Name: dcim_rackgroup_slug_3f4582a7_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackgroup_slug_3f4582a7_like ON public.dcim_rackgroup USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_rackreservation_rack_id_1ebbaa9b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_rack_id_1ebbaa9b ON public.dcim_rackreservation USING btree (rack_id);


--
-- Name: dcim_rackreservation_tenant_id_eb5e045f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_tenant_id_eb5e045f ON public.dcim_rackreservation USING btree (tenant_id);


--
-- Name: dcim_rackreservation_user_id_0785a527; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackreservation_user_id_0785a527 ON public.dcim_rackreservation USING btree (user_id);


--
-- Name: dcim_rackrole_name_9077cfcc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_name_9077cfcc_like ON public.dcim_rackrole USING btree (name varchar_pattern_ops);


--
-- Name: dcim_rackrole_slug_40bbcd3a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_rackrole_slug_40bbcd3a_like ON public.dcim_rackrole USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_level_2cee781b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_level_2cee781b ON public.dcim_region USING btree (level);


--
-- Name: dcim_region_lft_923d059c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_lft_923d059c ON public.dcim_region USING btree (lft);


--
-- Name: dcim_region_name_ba5a7082_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_name_ba5a7082_like ON public.dcim_region USING btree (name varchar_pattern_ops);


--
-- Name: dcim_region_parent_id_2486f5d4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_parent_id_2486f5d4 ON public.dcim_region USING btree (parent_id);


--
-- Name: dcim_region_rght_20f888e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_rght_20f888e3 ON public.dcim_region USING btree (rght);


--
-- Name: dcim_region_slug_ff078a66_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_slug_ff078a66_like ON public.dcim_region USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_region_tree_id_a09ea9a7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_region_tree_id_a09ea9a7 ON public.dcim_region USING btree (tree_id);


--
-- Name: dcim_site_name_8fe66c76_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_name_8fe66c76_like ON public.dcim_site USING btree (name varchar_pattern_ops);


--
-- Name: dcim_site_region_id_45210932; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_region_id_45210932 ON public.dcim_site USING btree (region_id);


--
-- Name: dcim_site_slug_4412c762_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_slug_4412c762_like ON public.dcim_site USING btree (slug varchar_pattern_ops);


--
-- Name: dcim_site_tenant_id_15e7df63; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX dcim_site_tenant_id_15e7df63 ON public.dcim_site USING btree (tenant_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: extras_customfield_name_2fe72707_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_name_2fe72707_like ON public.extras_customfield USING btree (name varchar_pattern_ops);


--
-- Name: extras_customfield_obj_type_contenttype_id_6890b714; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_obj_type_contenttype_id_6890b714 ON public.extras_customfield_obj_type USING btree (contenttype_id);


--
-- Name: extras_customfield_obj_type_customfield_id_82480f86; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfield_obj_type_customfield_id_82480f86 ON public.extras_customfield_obj_type USING btree (customfield_id);


--
-- Name: extras_customfieldchoice_field_id_35006739; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfieldchoice_field_id_35006739 ON public.extras_customfieldchoice USING btree (field_id);


--
-- Name: extras_customfieldvalue_field_id_1a461f0d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfieldvalue_field_id_1a461f0d ON public.extras_customfieldvalue USING btree (field_id);


--
-- Name: extras_customfieldvalue_obj_type_id_b750b07b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_customfieldvalue_obj_type_id_b750b07b ON public.extras_customfieldvalue USING btree (obj_type_id);


--
-- Name: extras_exporttemplate_content_type_id_59737e21; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_exporttemplate_content_type_id_59737e21 ON public.extras_exporttemplate USING btree (content_type_id);


--
-- Name: extras_imageattachment_content_type_id_90e0643d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_imageattachment_content_type_id_90e0643d ON public.extras_imageattachment USING btree (content_type_id);


--
-- Name: extras_reportresult_report_3575dd21_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_reportresult_report_3575dd21_like ON public.extras_reportresult USING btree (report varchar_pattern_ops);


--
-- Name: extras_reportresult_user_id_0df55b95; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_reportresult_user_id_0df55b95 ON public.extras_reportresult USING btree (user_id);


--
-- Name: extras_topologymap_name_f377ebf1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_topologymap_name_f377ebf1_like ON public.extras_topologymap USING btree (name varchar_pattern_ops);


--
-- Name: extras_topologymap_site_id_b56b3ceb; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_topologymap_site_id_b56b3ceb ON public.extras_topologymap USING btree (site_id);


--
-- Name: extras_topologymap_slug_9ba3d31e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_topologymap_slug_9ba3d31e_like ON public.extras_topologymap USING btree (slug varchar_pattern_ops);


--
-- Name: extras_useraction_content_type_id_99f782d7; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_useraction_content_type_id_99f782d7 ON public.extras_useraction USING btree (content_type_id);


--
-- Name: extras_useraction_user_id_8aacec56; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX extras_useraction_user_id_8aacec56 ON public.extras_useraction USING btree (user_id);


--
-- Name: ipam_aggregate_rir_id_ef7a27bd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_aggregate_rir_id_ef7a27bd ON public.ipam_aggregate USING btree (rir_id);


--
-- Name: ipam_ipaddress_interface_id_91e71d9d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_interface_id_91e71d9d ON public.ipam_ipaddress USING btree (interface_id);


--
-- Name: ipam_ipaddress_tenant_id_ac55acfd; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_tenant_id_ac55acfd ON public.ipam_ipaddress USING btree (tenant_id);


--
-- Name: ipam_ipaddress_vrf_id_51fcc59b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_ipaddress_vrf_id_51fcc59b ON public.ipam_ipaddress USING btree (vrf_id);


--
-- Name: ipam_prefix_role_id_0a98d415; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_role_id_0a98d415 ON public.ipam_prefix USING btree (role_id);


--
-- Name: ipam_prefix_site_id_0b20df05; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_site_id_0b20df05 ON public.ipam_prefix USING btree (site_id);


--
-- Name: ipam_prefix_tenant_id_7ba1fcc4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_tenant_id_7ba1fcc4 ON public.ipam_prefix USING btree (tenant_id);


--
-- Name: ipam_prefix_vlan_id_1db91bff; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vlan_id_1db91bff ON public.ipam_prefix USING btree (vlan_id);


--
-- Name: ipam_prefix_vrf_id_34f78ed0; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_prefix_vrf_id_34f78ed0 ON public.ipam_prefix USING btree (vrf_id);


--
-- Name: ipam_rir_name_64a71982_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_name_64a71982_like ON public.ipam_rir USING btree (name varchar_pattern_ops);


--
-- Name: ipam_rir_slug_ff1a369a_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_rir_slug_ff1a369a_like ON public.ipam_rir USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_role_name_13784849_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_name_13784849_like ON public.ipam_role USING btree (name varchar_pattern_ops);


--
-- Name: ipam_role_slug_309ca14c_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_role_slug_309ca14c_like ON public.ipam_role USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_service_device_id_b4d2bb9c; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_device_id_b4d2bb9c ON public.ipam_service USING btree (device_id);


--
-- Name: ipam_service_ipaddresses_ipaddress_id_b4138c6d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_ipaddress_id_b4138c6d ON public.ipam_service_ipaddresses USING btree (ipaddress_id);


--
-- Name: ipam_service_ipaddresses_service_id_ae26b9ab; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_ipaddresses_service_id_ae26b9ab ON public.ipam_service_ipaddresses USING btree (service_id);


--
-- Name: ipam_service_virtual_machine_id_e8b53562; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_service_virtual_machine_id_e8b53562 ON public.ipam_service USING btree (virtual_machine_id);


--
-- Name: ipam_vlan_group_id_88cbfa62; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_group_id_88cbfa62 ON public.ipam_vlan USING btree (group_id);


--
-- Name: ipam_vlan_role_id_f5015962; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_role_id_f5015962 ON public.ipam_vlan USING btree (role_id);


--
-- Name: ipam_vlan_site_id_a59334e3; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_site_id_a59334e3 ON public.ipam_vlan USING btree (site_id);


--
-- Name: ipam_vlan_tenant_id_71a8290d; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlan_tenant_id_71a8290d ON public.ipam_vlan USING btree (tenant_id);


--
-- Name: ipam_vlangroup_site_id_264f36f6; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_site_id_264f36f6 ON public.ipam_vlangroup USING btree (site_id);


--
-- Name: ipam_vlangroup_slug_40abcf6b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b ON public.ipam_vlangroup USING btree (slug);


--
-- Name: ipam_vlangroup_slug_40abcf6b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vlangroup_slug_40abcf6b_like ON public.ipam_vlangroup USING btree (slug varchar_pattern_ops);


--
-- Name: ipam_vrf_rd_0ac1bde1_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_rd_0ac1bde1_like ON public.ipam_vrf USING btree (rd varchar_pattern_ops);


--
-- Name: ipam_vrf_tenant_id_498b0051; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX ipam_vrf_tenant_id_498b0051 ON public.ipam_vrf USING btree (tenant_id);


--
-- Name: secrets_secret_device_id_c7c13124; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secret_device_id_c7c13124 ON public.secrets_secret USING btree (device_id);


--
-- Name: secrets_secret_role_id_39d9347f; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secret_role_id_39d9347f ON public.secrets_secret USING btree (role_id);


--
-- Name: secrets_secretrole_groups_group_id_a687dd10; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_groups_group_id_a687dd10 ON public.secrets_secretrole_groups USING btree (group_id);


--
-- Name: secrets_secretrole_groups_secretrole_id_3cf0338b; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_groups_secretrole_id_3cf0338b ON public.secrets_secretrole_groups USING btree (secretrole_id);


--
-- Name: secrets_secretrole_name_7b6ee7a4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_name_7b6ee7a4_like ON public.secrets_secretrole USING btree (name varchar_pattern_ops);


--
-- Name: secrets_secretrole_slug_a06c885e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_slug_a06c885e_like ON public.secrets_secretrole USING btree (slug varchar_pattern_ops);


--
-- Name: secrets_secretrole_users_secretrole_id_d2eac298; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_users_secretrole_id_d2eac298 ON public.secrets_secretrole_users USING btree (secretrole_id);


--
-- Name: secrets_secretrole_users_user_id_25be95ad; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX secrets_secretrole_users_user_id_25be95ad ON public.secrets_secretrole_users USING btree (user_id);


--
-- Name: tenancy_tenant_group_id_7daef6f4; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_group_id_7daef6f4 ON public.tenancy_tenant USING btree (group_id);


--
-- Name: tenancy_tenant_name_f6e5b2f5_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_name_f6e5b2f5_like ON public.tenancy_tenant USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenant_slug_0716575e_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenant_slug_0716575e_like ON public.tenancy_tenant USING btree (slug varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_name_53363199_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_name_53363199_like ON public.tenancy_tenantgroup USING btree (name varchar_pattern_ops);


--
-- Name: tenancy_tenantgroup_slug_e2af1cb6_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX tenancy_tenantgroup_slug_e2af1cb6_like ON public.tenancy_tenantgroup USING btree (slug varchar_pattern_ops);


--
-- Name: users_token_key_820deccd_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_key_820deccd_like ON public.users_token USING btree (key varchar_pattern_ops);


--
-- Name: users_token_user_id_af964690; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX users_token_user_id_af964690 ON public.users_token USING btree (user_id);


--
-- Name: virtualization_cluster_group_id_de379828; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_group_id_de379828 ON public.virtualization_cluster USING btree (group_id);


--
-- Name: virtualization_cluster_name_1b59a61b_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_name_1b59a61b_like ON public.virtualization_cluster USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_cluster_site_id_4d5af282; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_site_id_4d5af282 ON public.virtualization_cluster USING btree (site_id);


--
-- Name: virtualization_cluster_type_id_4efafb0a; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_cluster_type_id_4efafb0a ON public.virtualization_cluster USING btree (type_id);


--
-- Name: virtualization_clustergroup_name_4fcd26b4_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_name_4fcd26b4_like ON public.virtualization_clustergroup USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustergroup_slug_57ca1d23_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustergroup_slug_57ca1d23_like ON public.virtualization_clustergroup USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_clustertype_name_ea854d3d_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_name_ea854d3d_like ON public.virtualization_clustertype USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_clustertype_slug_8ee4d0e0_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_clustertype_slug_8ee4d0e0_like ON public.virtualization_clustertype USING btree (slug varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_cluster_id_6c9f9047; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_cluster_id_6c9f9047 ON public.virtualization_virtualmachine USING btree (cluster_id);


--
-- Name: virtualization_virtualmachine_name_266f6cdc_like; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_name_266f6cdc_like ON public.virtualization_virtualmachine USING btree (name varchar_pattern_ops);


--
-- Name: virtualization_virtualmachine_platform_id_a6c5ccb2; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_platform_id_a6c5ccb2 ON public.virtualization_virtualmachine USING btree (platform_id);


--
-- Name: virtualization_virtualmachine_role_id_0cc898f9; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_role_id_0cc898f9 ON public.virtualization_virtualmachine USING btree (role_id);


--
-- Name: virtualization_virtualmachine_tenant_id_d00d1d77; Type: INDEX; Schema: public; Owner: netbox
--

CREATE INDEX virtualization_virtualmachine_tenant_id_d00d1d77 ON public.virtualization_virtualmachine USING btree (tenant_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_provider_id_d9195418_fk_circuits_provider_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_provider_id_d9195418_fk_circuits_provider_id FOREIGN KEY (provider_id) REFERENCES public.circuits_provider(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_tenant_id_812508a5_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuit circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuit
    ADD CONSTRAINT circuits_circuit_type_id_1b9f485a_fk_circuits_circuittype_id FOREIGN KEY (type_id) REFERENCES public.circuits_circuittype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_circuit_id_257e87e7_fk_circuits_; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_circuit_id_257e87e7_fk_circuits_ FOREIGN KEY (circuit_id) REFERENCES public.circuits_circuit(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuitterm_interface_id_a147755f_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuitterm_interface_id_a147755f_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: circuits_circuittermination circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.circuits_circuittermination
    ADD CONSTRAINT circuits_circuittermination_site_id_e6fe5652_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_cs_port_id_41f056d5_fk_dcim_cons; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_cs_port_id_41f056d5_fk_dcim_cons FOREIGN KEY (cs_port_id) REFERENCES public.dcim_consoleserverport(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleport dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleport
    ADD CONSTRAINT dcim_consoleport_device_id_f2d90d3c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleporttemplate dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleporttemplate
    ADD CONSTRAINT dcim_consoleporttemp_device_type_id_075d4015_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverporttemplate dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverporttemplate
    ADD CONSTRAINT dcim_consoleserverpo_device_type_id_579bdc86_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_consoleserverport dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_consoleserverport
    ADD CONSTRAINT dcim_consoleserverport_device_id_d9866581_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_cluster_id_cf852f78_fk_virtualization_cluster_id FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_role_id_682e8188_fk_dcim_devicerole_id FOREIGN KEY (device_role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_device_type_id_d61b4086_fk_dcim_devicetype_id FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_platform_id_468138f1_fk_dcim_platform_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_platform_id_468138f1_fk_dcim_platform_id FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip4_id_2ccd943a_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_primary_ip6_id_d180fe91_fk_ipam_ipaddress_id FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_rack_id_23bde71f_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_rack_id_23bde71f_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_site_id_ff897cf6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_site_id_ff897cf6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_tenant_id_dcea7969_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_device dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_device
    ADD CONSTRAINT dcim_device_virtual_chassis_id_aed51693_fk_dcim_virt FOREIGN KEY (virtual_chassis_id) REFERENCES public.dcim_virtualchassis(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_device_id_0c8a1218_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebay dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebay
    ADD CONSTRAINT dcim_devicebay_installed_device_id_04618112_fk_dcim_device_id FOREIGN KEY (installed_device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicebaytemplate dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicebaytemplate
    ADD CONSTRAINT dcim_devicebaytempla_device_type_id_f4b24a29_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_devicetype dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_devicetype
    ADD CONSTRAINT dcim_devicetype_manufacturer_id_a3e8029e_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_device_id_359c6115_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_device_id_359c6115_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_lag_id_ea1a1d12_fk_dcim_interface_id FOREIGN KEY (lag_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagge_interface_id_5870c9e9_fk_dcim_inte FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface_tagged_vlans dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface_tagged_vlans
    ADD CONSTRAINT dcim_interface_tagged_vlans_vlan_id_e027005c_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_untagged_vlan_id_838dc7be_fk_ipam_vlan_id FOREIGN KEY (untagged_vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interface dcim_interface_virtual_machine_id_2afd2d50_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interface
    ADD CONSTRAINT dcim_interface_virtual_machine_id_2afd2d50_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceconnection dcim_interfaceconnec_interface_a_id_503f46c2_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfaceconnection
    ADD CONSTRAINT dcim_interfaceconnec_interface_a_id_503f46c2_fk_dcim_inte FOREIGN KEY (interface_a_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfaceconnection dcim_interfaceconnec_interface_b_id_85faa104_fk_dcim_inte; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfaceconnection
    ADD CONSTRAINT dcim_interfaceconnec_interface_b_id_85faa104_fk_dcim_inte FOREIGN KEY (interface_b_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_interfacetemplate dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_interfacetemplate
    ADD CONSTRAINT dcim_interfacetempla_device_type_id_4bfcbfab_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_device_id_033d83f8_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_manufacturer_id_dcd1b78a_fk_dcim_manu FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_inventoryitem dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_inventoryitem
    ADD CONSTRAINT dcim_inventoryitem_parent_id_7ebcd457_fk_dcim_inventoryitem_id FOREIGN KEY (parent_id) REFERENCES public.dcim_inventoryitem(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_platform dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_platform
    ADD CONSTRAINT dcim_platform_manufacturer_id_83f72d3d_fk_dcim_manufacturer_id FOREIGN KEY (manufacturer_id) REFERENCES public.dcim_manufacturer(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlet dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlet
    ADD CONSTRAINT dcim_poweroutlet_device_id_286351d7_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_poweroutlettemplate dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_poweroutlettemplate
    ADD CONSTRAINT dcim_poweroutlettemp_device_type_id_26b2316c_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_device_id_ef7185ae_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_device_id_ef7185ae_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerport dcim_powerport_power_outlet_id_741276ef_fk_dcim_poweroutlet_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerport
    ADD CONSTRAINT dcim_powerport_power_outlet_id_741276ef_fk_dcim_poweroutlet_id FOREIGN KEY (power_outlet_id) REFERENCES public.dcim_poweroutlet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_powerporttemplate dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_powerporttemplate
    ADD CONSTRAINT dcim_powerporttempla_device_type_id_1ddfbfcc_fk_dcim_devi FOREIGN KEY (device_type_id) REFERENCES public.dcim_devicetype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_group_id_44e90ea9_fk_dcim_rackgroup_id FOREIGN KEY (group_id) REFERENCES public.dcim_rackgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_role_id_62d6919e_fk_dcim_rackrole_id FOREIGN KEY (role_id) REFERENCES public.dcim_rackrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_site_id_403c7b3a_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_site_id_403c7b3a_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rack dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rack
    ADD CONSTRAINT dcim_rack_tenant_id_7cdf3725_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackgroup dcim_rackgroup_site_id_13520e89_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackgroup
    ADD CONSTRAINT dcim_rackgroup_site_id_13520e89_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_rack_id_1ebbaa9b_fk_dcim_rack_id FOREIGN KEY (rack_id) REFERENCES public.dcim_rack(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_tenant_id_eb5e045f_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_rackreservation dcim_rackreservation_user_id_0785a527_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_rackreservation
    ADD CONSTRAINT dcim_rackreservation_user_id_0785a527_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_region dcim_region_parent_id_2486f5d4_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_region
    ADD CONSTRAINT dcim_region_parent_id_2486f5d4_fk_dcim_region_id FOREIGN KEY (parent_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_region_id_45210932_fk_dcim_region_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_region_id_45210932_fk_dcim_region_id FOREIGN KEY (region_id) REFERENCES public.dcim_region(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_site dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_site
    ADD CONSTRAINT dcim_site_tenant_id_15e7df63_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: dcim_virtualchassis dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.dcim_virtualchassis
    ADD CONSTRAINT dcim_virtualchassis_master_id_ab54cfc6_fk_dcim_device_id FOREIGN KEY (master_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_obj_type extras_customfield_o_contenttype_id_6890b714_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_o_contenttype_id_6890b714_fk_django_co FOREIGN KEY (contenttype_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfield_obj_type extras_customfield_o_customfield_id_82480f86_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfield_obj_type
    ADD CONSTRAINT extras_customfield_o_customfield_id_82480f86_fk_extras_cu FOREIGN KEY (customfield_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldchoice extras_customfieldch_field_id_35006739_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldchoice
    ADD CONSTRAINT extras_customfieldch_field_id_35006739_fk_extras_cu FOREIGN KEY (field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldvalue extras_customfieldva_field_id_1a461f0d_fk_extras_cu; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldva_field_id_1a461f0d_fk_extras_cu FOREIGN KEY (field_id) REFERENCES public.extras_customfield(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_customfieldvalue extras_customfieldva_obj_type_id_b750b07b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_customfieldvalue
    ADD CONSTRAINT extras_customfieldva_obj_type_id_b750b07b_fk_django_co FOREIGN KEY (obj_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_exporttemplate extras_exporttemplat_content_type_id_59737e21_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_exporttemplate
    ADD CONSTRAINT extras_exporttemplat_content_type_id_59737e21_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_imageattachment extras_imageattachme_content_type_id_90e0643d_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_imageattachment
    ADD CONSTRAINT extras_imageattachme_content_type_id_90e0643d_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_reportresult extras_reportresult_user_id_0df55b95_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_reportresult
    ADD CONSTRAINT extras_reportresult_user_id_0df55b95_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_topologymap extras_topologymap_site_id_b56b3ceb_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_topologymap
    ADD CONSTRAINT extras_topologymap_site_id_b56b3ceb_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_useraction extras_useraction_content_type_id_99f782d7_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_useraction
    ADD CONSTRAINT extras_useraction_content_type_id_99f782d7_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: extras_useraction extras_useraction_user_id_8aacec56_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.extras_useraction
    ADD CONSTRAINT extras_useraction_user_id_8aacec56_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_aggregate ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_aggregate
    ADD CONSTRAINT ipam_aggregate_rir_id_ef7a27bd_fk_ipam_rir_id FOREIGN KEY (rir_id) REFERENCES public.ipam_rir(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_interface_id_91e71d9d_fk_dcim_interface_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_interface_id_91e71d9d_fk_dcim_interface_id FOREIGN KEY (interface_id) REFERENCES public.dcim_interface(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_nat_inside_id_a45fb7c5_fk_ipam_ipaddress_id FOREIGN KEY (nat_inside_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_tenant_id_ac55acfd_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_ipaddress ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_ipaddress
    ADD CONSTRAINT ipam_ipaddress_vrf_id_51fcc59b_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_role_id_0a98d415_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_role_id_0a98d415_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_site_id_0b20df05_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_site_id_0b20df05_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_tenant_id_7ba1fcc4_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vlan_id_1db91bff_fk_ipam_vlan_id FOREIGN KEY (vlan_id) REFERENCES public.ipam_vlan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_prefix ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_prefix
    ADD CONSTRAINT ipam_prefix_vrf_id_34f78ed0_fk_ipam_vrf_id FOREIGN KEY (vrf_id) REFERENCES public.ipam_vrf(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_device_id_b4d2bb9c_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_device_id_b4d2bb9c_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddre_ipaddress_id_b4138c6d_fk_ipam_ipad FOREIGN KEY (ipaddress_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service_ipaddresses ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service_ipaddresses
    ADD CONSTRAINT ipam_service_ipaddresses_service_id_ae26b9ab_fk_ipam_service_id FOREIGN KEY (service_id) REFERENCES public.ipam_service(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_service ipam_service_virtual_machine_id_e8b53562_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_service
    ADD CONSTRAINT ipam_service_virtual_machine_id_e8b53562_fk_virtualiz FOREIGN KEY (virtual_machine_id) REFERENCES public.virtualization_virtualmachine(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_group_id_88cbfa62_fk_ipam_vlangroup_id FOREIGN KEY (group_id) REFERENCES public.ipam_vlangroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_role_id_f5015962_fk_ipam_role_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_role_id_f5015962_fk_ipam_role_id FOREIGN KEY (role_id) REFERENCES public.ipam_role(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_site_id_a59334e3_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_site_id_a59334e3_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlan ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlan
    ADD CONSTRAINT ipam_vlan_tenant_id_71a8290d_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vlangroup ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vlangroup
    ADD CONSTRAINT ipam_vlangroup_site_id_264f36f6_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ipam_vrf ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.ipam_vrf
    ADD CONSTRAINT ipam_vrf_tenant_id_498b0051_fk_tenancy_tenant_id FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secret secrets_secret_device_id_c7c13124_fk_dcim_device_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_device_id_c7c13124_fk_dcim_device_id FOREIGN KEY (device_id) REFERENCES public.dcim_device(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secret secrets_secret_role_id_39d9347f_fk_secrets_secretrole_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secret
    ADD CONSTRAINT secrets_secret_role_id_39d9347f_fk_secrets_secretrole_id FOREIGN KEY (role_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_groups secrets_secretrole_g_secretrole_id_3cf0338b_fk_secrets_s; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_g_secretrole_id_3cf0338b_fk_secrets_s FOREIGN KEY (secretrole_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_groups secrets_secretrole_groups_group_id_a687dd10_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_groups
    ADD CONSTRAINT secrets_secretrole_groups_group_id_a687dd10_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_users secrets_secretrole_u_secretrole_id_d2eac298_fk_secrets_s; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_u_secretrole_id_d2eac298_fk_secrets_s FOREIGN KEY (secretrole_id) REFERENCES public.secrets_secretrole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_secretrole_users secrets_secretrole_users_user_id_25be95ad_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_secretrole_users
    ADD CONSTRAINT secrets_secretrole_users_user_id_25be95ad_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_sessionkey secrets_sessionkey_userkey_id_3ca6176b_fk_secrets_userkey_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_sessionkey
    ADD CONSTRAINT secrets_sessionkey_userkey_id_3ca6176b_fk_secrets_userkey_id FOREIGN KEY (userkey_id) REFERENCES public.secrets_userkey(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: secrets_userkey secrets_userkey_user_id_13ada46b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.secrets_userkey
    ADD CONSTRAINT secrets_userkey_user_id_13ada46b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tenancy_tenant tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.tenancy_tenant
    ADD CONSTRAINT tenancy_tenant_group_id_7daef6f4_fk_tenancy_tenantgroup_id FOREIGN KEY (group_id) REFERENCES public.tenancy_tenantgroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_token users_token_user_id_af964690_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.users_token
    ADD CONSTRAINT users_token_user_id_af964690_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_group_id_de379828_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_group_id_de379828_fk_virtualiz FOREIGN KEY (group_id) REFERENCES public.virtualization_clustergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_clust_type_id_4efafb0a_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_clust_type_id_4efafb0a_fk_virtualiz FOREIGN KEY (type_id) REFERENCES public.virtualization_clustertype(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_cluster virtualization_cluster_site_id_4d5af282_fk_dcim_site_id; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_cluster
    ADD CONSTRAINT virtualization_cluster_site_id_4d5af282_fk_dcim_site_id FOREIGN KEY (site_id) REFERENCES public.dcim_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_cluster_id_6c9f9047_fk_virtualiz FOREIGN KEY (cluster_id) REFERENCES public.virtualization_cluster(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_platform_id_a6c5ccb2_fk_dcim_plat FOREIGN KEY (platform_id) REFERENCES public.dcim_platform(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip4_id_942e42ae_fk_ipam_ipad FOREIGN KEY (primary_ip4_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_primary_ip6_id_b7904e73_fk_ipam_ipad FOREIGN KEY (primary_ip6_id) REFERENCES public.ipam_ipaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_role_id_0cc898f9_fk_dcim_devi; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_role_id_0cc898f9_fk_dcim_devi FOREIGN KEY (role_id) REFERENCES public.dcim_devicerole(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: virtualization_virtualmachine virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t; Type: FK CONSTRAINT; Schema: public; Owner: netbox
--

ALTER TABLE ONLY public.virtualization_virtualmachine
    ADD CONSTRAINT virtualization_virtu_tenant_id_d00d1d77_fk_tenancy_t FOREIGN KEY (tenant_id) REFERENCES public.tenancy_tenant(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

\connect postgres

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

\connect template1

SET default_transaction_read_only = off;

--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

