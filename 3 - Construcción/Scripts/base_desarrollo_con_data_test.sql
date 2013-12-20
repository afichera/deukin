--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: deukin_dev; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE deukin_dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';


ALTER DATABASE deukin_dev OWNER TO postgres;

--\connect deukin_dev

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: alumno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE alumno (
    id bigint NOT NULL
);


ALTER TABLE public.alumno OWNER TO postgres;

--
-- Name: aptitud; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE aptitud (
    id bigint NOT NULL,
    version bigint NOT NULL,
    descripcion character varying(255),
    nivel_adquirido_id bigint NOT NULL,
    titulo character varying(100) NOT NULL
);


ALTER TABLE public.aptitud OWNER TO postgres;

--
-- Name: area_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE area_carrera (
    id bigint NOT NULL,
    version bigint NOT NULL,
    area_madre_id bigint
);


ALTER TABLE public.area_carrera OWNER TO postgres;

--
-- Name: asignacion_docente_curso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE asignacion_docente_curso (
    id bigint NOT NULL,
    version bigint NOT NULL,
    configuracion_curso_dia_id bigint NOT NULL,
    docente_id bigint NOT NULL,
    tipo_porcentaje_asignacion character varying(255) NOT NULL
);


ALTER TABLE public.asignacion_docente_curso OWNER TO postgres;

--
-- Name: async_mail_attachment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE async_mail_attachment (
    id bigint NOT NULL,
    attachment_name character varying(255) NOT NULL,
    content bytea NOT NULL,
    inline boolean NOT NULL,
    message_id bigint NOT NULL,
    mime_type character varying(255) NOT NULL,
    attachments_idx integer
);


ALTER TABLE public.async_mail_attachment OWNER TO postgres;

--
-- Name: async_mail_bcc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE async_mail_bcc (
    message_id bigint NOT NULL,
    bcc_string character varying(256),
    bcc_idx integer
);


ALTER TABLE public.async_mail_bcc OWNER TO postgres;

--
-- Name: async_mail_cc; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE async_mail_cc (
    message_id bigint NOT NULL,
    cc_string character varying(256),
    cc_idx integer
);


ALTER TABLE public.async_mail_cc OWNER TO postgres;

--
-- Name: async_mail_header; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE async_mail_header (
    message_id bigint NOT NULL,
    header_name character varying(255),
    header_value character varying(255) NOT NULL
);


ALTER TABLE public.async_mail_header OWNER TO postgres;

--
-- Name: async_mail_mess; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE async_mail_mess (
    id bigint NOT NULL,
    version bigint NOT NULL,
    attempt_interval bigint NOT NULL,
    attempts_count integer NOT NULL,
    begin_date timestamp without time zone NOT NULL,
    create_date timestamp without time zone NOT NULL,
    end_date timestamp without time zone NOT NULL,
    from_column character varying(256),
    html boolean NOT NULL,
    last_attempt_date timestamp without time zone,
    mark_delete boolean NOT NULL,
    max_attempts_count integer NOT NULL,
    priority integer NOT NULL,
    reply_to character varying(256),
    sent_date timestamp without time zone,
    status character varying(255) NOT NULL,
    subject character varying(988) NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.async_mail_mess OWNER TO postgres;

--
-- Name: async_mail_to; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE async_mail_to (
    message_id bigint NOT NULL,
    to_string character varying(256),
    to_idx integer
);


ALTER TABLE public.async_mail_to OWNER TO postgres;

--
-- Name: autoridad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE autoridad (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cargo character varying(100) NOT NULL,
    persona_id bigint NOT NULL
);


ALTER TABLE public.autoridad OWNER TO postgres;

--
-- Name: business_exception; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE business_exception (
    id bigint NOT NULL,
    version bigint NOT NULL,
    stack_trace bytea NOT NULL
);


ALTER TABLE public.business_exception OWNER TO postgres;

--
-- Name: calificacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE calificacion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    nota_final integer,
    primer_parcial integer,
    segundo_parcial integer
);


ALTER TABLE public.calificacion OWNER TO postgres;

--
-- Name: carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE carrera (
    id bigint NOT NULL,
    version bigint NOT NULL,
    condicion_ingreso character varying(500),
    descripcion character varying(50000),
    estado character varying(255) NOT NULL,
    fundamentacion character varying(50000),
    modalidad_asistencia character varying(255) NOT NULL,
    perfil_del_graduado character varying(50000),
    titulo character varying(200) NOT NULL
);


ALTER TABLE public.carrera OWNER TO postgres;

--
-- Name: ciclo_lectivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE ciclo_lectivo (
    id bigint NOT NULL,
    version bigint NOT NULL,
    codigo character varying(50) NOT NULL,
    fecha_fin timestamp without time zone NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL
);


ALTER TABLE public.ciclo_lectivo OWNER TO postgres;

--
-- Name: configuracion_curso_dia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuracion_curso_dia (
    id bigint NOT NULL,
    version bigint NOT NULL,
    curso_id bigint NOT NULL,
    dia_semana character varying(255) NOT NULL,
    espacio_fisico_id bigint NOT NULL,
    hora_fin integer NOT NULL,
    hora_inicio integer NOT NULL,
    minutos_fin integer NOT NULL,
    minutos_inicio integer NOT NULL
);


ALTER TABLE public.configuracion_curso_dia OWNER TO postgres;

--
-- Name: contacto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contacto (
    id bigint NOT NULL,
    version bigint NOT NULL,
    domicilio_id bigint NOT NULL
);


ALTER TABLE public.contacto OWNER TO postgres;

--
-- Name: coordinador; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE coordinador (
    id bigint NOT NULL,
    carrera_id bigint,
    coordinador_general boolean NOT NULL
);


ALTER TABLE public.coordinador OWNER TO postgres;

--
-- Name: correlatividad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE correlatividad (
    id bigint NOT NULL,
    version bigint NOT NULL,
    materia_predecesora_id bigint NOT NULL,
    materia_principal_id bigint NOT NULL
);


ALTER TABLE public.correlatividad OWNER TO postgres;

--
-- Name: cronograma_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cronograma_carrera (
    id bigint NOT NULL,
    version bigint NOT NULL,
    ciclo_lectivo_id bigint NOT NULL,
    plan_estudio_id bigint NOT NULL
);


ALTER TABLE public.cronograma_carrera OWNER TO postgres;

--
-- Name: curriculum; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curriculum (
    id bigint NOT NULL,
    version bigint NOT NULL,
    titulo character varying(200) NOT NULL
);


ALTER TABLE public.curriculum OWNER TO postgres;

--
-- Name: curriculum_adjunto; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curriculum_adjunto (
    id bigint NOT NULL,
    version bigint NOT NULL,
    archivo bytea NOT NULL,
    nombre_archivo character varying(255) NOT NULL,
    persona_id bigint NOT NULL,
    tipo_archivo character varying(255) NOT NULL
);


ALTER TABLE public.curriculum_adjunto OWNER TO postgres;

--
-- Name: curriculum_aptitud; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curriculum_aptitud (
    curriculum_aptitudes_id bigint,
    aptitud_id bigint
);


ALTER TABLE public.curriculum_aptitud OWNER TO postgres;

--
-- Name: curriculum_educacion_adquirida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curriculum_educacion_adquirida (
    curriculum_educaciones_id bigint,
    educacion_adquirida_id bigint
);


ALTER TABLE public.curriculum_educacion_adquirida OWNER TO postgres;

--
-- Name: curriculum_experiencia_laboral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curriculum_experiencia_laboral (
    curriculum_experiencias_id bigint,
    experiencia_laboral_id bigint
);


ALTER TABLE public.curriculum_experiencia_laboral OWNER TO postgres;

--
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE curso (
    id bigint NOT NULL,
    version bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    cronograma_carrera_id bigint NOT NULL,
    estado_curso character varying(255) NOT NULL,
    materia_id bigint NOT NULL,
    periodo_academico_id bigint NOT NULL,
    turno_id bigint NOT NULL
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- Name: departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento (
    id bigint NOT NULL,
    version bigint NOT NULL,
    contacto_id bigint,
    mision character varying(5000),
    nombre character varying(200) NOT NULL,
    vision character varying(5000)
);


ALTER TABLE public.departamento OWNER TO postgres;

--
-- Name: departamento_autoridad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento_autoridad (
    departamento_autoridades_id bigint,
    autoridad_id bigint
);


ALTER TABLE public.departamento_autoridad OWNER TO postgres;

--
-- Name: departamento_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamento_carrera (
    departamento_carreras_id bigint,
    carrera_id bigint
);


ALTER TABLE public.departamento_carrera OWNER TO postgres;

--
-- Name: docente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE docente (
    id bigint NOT NULL,
    curriculum_docente_id bigint,
    departamento_id bigint
);


ALTER TABLE public.docente OWNER TO postgres;

--
-- Name: documento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE documento (
    id bigint NOT NULL,
    version bigint NOT NULL,
    numero bigint NOT NULL,
    tipo_documento character varying(255) NOT NULL
);


ALTER TABLE public.documento OWNER TO postgres;

--
-- Name: domicilio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE domicilio (
    id bigint NOT NULL,
    version bigint NOT NULL,
    calle character varying(100) NOT NULL,
    codigo_postal integer NOT NULL,
    localidad character varying(100) NOT NULL,
    numero integer NOT NULL,
    observaciones character varying(255)
);


ALTER TABLE public.domicilio OWNER TO postgres;

--
-- Name: educacion_adquirida; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE educacion_adquirida (
    id bigint NOT NULL,
    version bigint NOT NULL,
    descripcion character varying(255),
    fecha_finalizacion timestamp without time zone NOT NULL,
    titulo character varying(200) NOT NULL
);


ALTER TABLE public.educacion_adquirida OWNER TO postgres;

--
-- Name: equivalencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equivalencia (
    id bigint NOT NULL,
    version bigint NOT NULL,
    materia_equivalente_id bigint NOT NULL,
    materia_principal_id bigint NOT NULL
);


ALTER TABLE public.equivalencia OWNER TO postgres;

--
-- Name: espacio_fisico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE espacio_fisico (
    id bigint NOT NULL,
    version bigint NOT NULL,
    numero integer NOT NULL,
    observaciones character varying(255),
    ubicacion character varying(200) NOT NULL
);


ALTER TABLE public.espacio_fisico OWNER TO postgres;

--
-- Name: evento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evento (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cupo_maximo integer NOT NULL,
    descripcion character varying(255),
    espacio_fisico_id bigint NOT NULL,
    fecha_fin timestamp without time zone NOT NULL,
    fecha_inicio timestamp without time zone NOT NULL,
    hora_fin integer NOT NULL,
    hora_inicio integer NOT NULL,
    minutos_fin integer NOT NULL,
    minutos_inicio integer NOT NULL,
    titulo character varying(200) NOT NULL
);


ALTER TABLE public.evento OWNER TO postgres;

--
-- Name: evento_alumno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evento_alumno (
    evento_alumnos_id bigint,
    alumno_id bigint
);


ALTER TABLE public.evento_alumno OWNER TO postgres;

--
-- Name: evento_docente; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE evento_docente (
    evento_docentes_id bigint,
    docente_id bigint
);


ALTER TABLE public.evento_docente OWNER TO postgres;

--
-- Name: experiencia_laboral; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE experiencia_laboral (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cargo character varying(200) NOT NULL,
    detalle character varying(5000),
    empresa character varying(200) NOT NULL,
    fecha_egreso timestamp without time zone NOT NULL,
    fecha_ingreso timestamp without time zone NOT NULL
);


ALTER TABLE public.experiencia_laboral OWNER TO postgres;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO postgres;

--
-- Name: inscripcion_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inscripcion_carrera (
    id bigint NOT NULL,
    version bigint NOT NULL,
    carrera_id bigint NOT NULL,
    estado_inscripcion_carrera character varying(255) NOT NULL,
    fecha_inscripcion timestamp without time zone NOT NULL,
    persona_id bigint NOT NULL
);


ALTER TABLE public.inscripcion_carrera OWNER TO postgres;

--
-- Name: inscripcion_curso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inscripcion_curso (
    id bigint NOT NULL,
    version bigint NOT NULL,
    alumno_id bigint NOT NULL,
    calificacion_id bigint NOT NULL,
    curso_id bigint NOT NULL,
    estado_cursada character varying(255) NOT NULL,
    fecha_inscripcion timestamp without time zone NOT NULL
);


ALTER TABLE public.inscripcion_curso OWNER TO postgres;

--
-- Name: inscripcion_institucion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE inscripcion_institucion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    apellido character varying(50) NOT NULL,
    calle character varying(100) NOT NULL,
    calle_numero integer NOT NULL,
    codigo_postal integer NOT NULL,
    documento_numero bigint NOT NULL,
    estado_inscripcion_institucion character varying(255) NOT NULL,
    fecha_baja timestamp without time zone,
    fecha_inscripcion timestamp without time zone NOT NULL,
    fecha_nacimiento timestamp without time zone NOT NULL,
    localidad character varying(100) NOT NULL,
    nombre character varying(100) NOT NULL,
    observaciones character varying(255),
    sexo character varying(255) NOT NULL,
    telefono_numero character varying(20) NOT NULL,
    tipo_documento character varying(255) NOT NULL,
    tipo_inscripcion_institucion character varying(255),
    tipo_telefono character varying(255) NOT NULL,
    usuario_registro_id bigint NOT NULL
);


ALTER TABLE public.inscripcion_institucion OWNER TO postgres;

--
-- Name: institucion_educativa; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institucion_educativa (
    id bigint NOT NULL,
    version bigint NOT NULL,
    contacto_id bigint NOT NULL,
    nombre character varying(200) NOT NULL
);


ALTER TABLE public.institucion_educativa OWNER TO postgres;

--
-- Name: institucion_educativa_autoridad; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institucion_educativa_autoridad (
    institucion_educativa_autoridades_id bigint,
    autoridad_id bigint
);


ALTER TABLE public.institucion_educativa_autoridad OWNER TO postgres;

--
-- Name: institucion_educativa_departamento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE institucion_educativa_departamento (
    institucion_educativa_departamentos_id bigint,
    departamento_id bigint
);


ALTER TABLE public.institucion_educativa_departamento OWNER TO postgres;

--
-- Name: materia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE materia (
    id bigint NOT NULL,
    version bigint NOT NULL,
    bibliografia character varying(255),
    cantidad_docentes_requeridos integer NOT NULL,
    cantidad_unidades_horarias integer NOT NULL,
    codigo integer NOT NULL,
    contenido_minimo character varying(255) NOT NULL,
    cupo_maximo_alumnos integer NOT NULL,
    cupo_minimo_alumnos integer NOT NULL,
    nombre character varying(200) NOT NULL,
    periodo_id bigint NOT NULL,
    plan_estudio_id bigint NOT NULL
);


ALTER TABLE public.materia OWNER TO postgres;

--
-- Name: materia_tipo_recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE materia_tipo_recurso (
    materia_tipos_recurso_id bigint,
    tipo_recurso_id bigint
);


ALTER TABLE public.materia_tipo_recurso OWNER TO postgres;

--
-- Name: nivel_adquirido; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nivel_adquirido (
    id bigint NOT NULL,
    version bigint NOT NULL,
    codigo character varying(100) NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.nivel_adquirido OWNER TO postgres;

--
-- Name: nombramiento; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE nombramiento (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cargo character varying(100) NOT NULL,
    docente_id bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    observaciones character varying(255) NOT NULL
);


ALTER TABLE public.nombramiento OWNER TO postgres;

--
-- Name: objetivo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objetivo (
    id bigint NOT NULL,
    version bigint NOT NULL,
    descripcion character varying(200) NOT NULL,
    materia_id bigint NOT NULL
);


ALTER TABLE public.objetivo OWNER TO postgres;

--
-- Name: objetivo_carrera; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objetivo_carrera (
    id bigint NOT NULL,
    version bigint NOT NULL,
    carrera_id bigint NOT NULL,
    descripcion character varying(2048) NOT NULL
);


ALTER TABLE public.objetivo_carrera OWNER TO postgres;

--
-- Name: objetivo_especifico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE objetivo_especifico (
    id bigint NOT NULL,
    version bigint NOT NULL,
    descripcion character varying(200) NOT NULL,
    materia_id bigint NOT NULL
);


ALTER TABLE public.objetivo_especifico OWNER TO postgres;

--
-- Name: parametro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE parametro (
    id bigint NOT NULL,
    version bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    tipo_parametro character varying(255) NOT NULL,
    valor character varying(200) NOT NULL
);


ALTER TABLE public.parametro OWNER TO postgres;

--
-- Name: periodo_academico; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE periodo_academico (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cantidad_semanas integer NOT NULL,
    ciclo_lectivo_id bigint NOT NULL,
    fecha_fin_periodo timestamp without time zone NOT NULL,
    fecha_inicio_periodo timestamp without time zone NOT NULL,
    tipo_periodo_academico character varying(255) NOT NULL
);


ALTER TABLE public.periodo_academico OWNER TO postgres;

--
-- Name: periodo_dedicacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE periodo_dedicacion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    anio integer NOT NULL,
    cuatrimestre integer NOT NULL
);


ALTER TABLE public.periodo_dedicacion OWNER TO postgres;

--
-- Name: persona; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona (
    id bigint NOT NULL,
    version bigint NOT NULL,
    apellido character varying(50) NOT NULL,
    contacto_id bigint NOT NULL,
    documento_id bigint NOT NULL,
    foto_perfil bytea,
    nombre character varying(100) NOT NULL,
    usuario_id bigint
);


ALTER TABLE public.persona OWNER TO postgres;

--
-- Name: persona_curriculum; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE persona_curriculum (
    persona_curriculums_id bigint,
    curriculum_id bigint
);


ALTER TABLE public.persona_curriculum OWNER TO postgres;

--
-- Name: plan_estudio; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plan_estudio (
    id bigint NOT NULL,
    version bigint NOT NULL,
    cantidad_periodos_academicos integer,
    carrera_id bigint NOT NULL,
    estado character varying(255) NOT NULL,
    identificacion character varying(50) NOT NULL
);


ALTER TABLE public.plan_estudio OWNER TO postgres;

--
-- Name: postulacion; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE postulacion (
    id bigint NOT NULL,
    version bigint NOT NULL,
    estado_postulacion character varying(255) NOT NULL,
    materia_id bigint NOT NULL,
    observaciones character varying(255),
    persona_id bigint NOT NULL
);


ALTER TABLE public.postulacion OWNER TO postgres;

--
-- Name: recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE recurso (
    id bigint NOT NULL,
    version bigint NOT NULL,
    codigo character varying(50) NOT NULL,
    estado_recurso character varying(255) NOT NULL,
    tipo_recurso_id bigint NOT NULL
);


ALTER TABLE public.recurso OWNER TO postgres;

--
-- Name: registration_code; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE registration_code (
    id bigint NOT NULL,
    date_created timestamp without time zone NOT NULL,
    token character varying(255) NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.registration_code OWNER TO postgres;

--
-- Name: rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE rol (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.rol OWNER TO postgres;

--
-- Name: solicitud_equivalencia; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE solicitud_equivalencia (
    id bigint NOT NULL,
    version bigint NOT NULL,
    alumno_id bigint NOT NULL,
    comentario character varying(255),
    estado_solicitud_equivalencia character varying(255) NOT NULL,
    materia_cursada character varying(255) NOT NULL,
    materia_solicitada_id bigint NOT NULL,
    universidad_cursada character varying(255) NOT NULL
);


ALTER TABLE public.solicitud_equivalencia OWNER TO postgres;

--
-- Name: telefono; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE telefono (
    id bigint NOT NULL,
    version bigint NOT NULL,
    contacto_id bigint NOT NULL,
    numero character varying(20) NOT NULL,
    tipo_telefono character varying(255) NOT NULL
);


ALTER TABLE public.telefono OWNER TO postgres;

--
-- Name: tipo_recurso; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipo_recurso (
    id bigint NOT NULL,
    version bigint NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.tipo_recurso OWNER TO postgres;

--
-- Name: turno; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE turno (
    id bigint NOT NULL,
    version bigint NOT NULL,
    codigo character varying(20) NOT NULL,
    hora_sabado_desde integer NOT NULL,
    hora_sabado_hasta integer NOT NULL,
    hora_semana_desde integer NOT NULL,
    hora_semana_hasta integer NOT NULL
);


ALTER TABLE public.turno OWNER TO postgres;

--
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario (
    id bigint NOT NULL,
    version bigint NOT NULL,
    account_expired boolean NOT NULL,
    account_locked boolean NOT NULL,
    enabled boolean NOT NULL,
    password character varying(255) NOT NULL,
    password_expired boolean NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- Name: usuario_registro; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario_registro (
    id bigint NOT NULL,
    version bigint NOT NULL,
    password character varying(64) NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.usuario_registro OWNER TO postgres;

--
-- Name: usuario_rol; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuario_rol (
    rol_id bigint NOT NULL,
    usuario_id bigint NOT NULL
);


ALTER TABLE public.usuario_rol OWNER TO postgres;

--
-- Data for Name: alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO alumno VALUES (47);
INSERT INTO alumno VALUES (52);


--
-- Data for Name: aptitud; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: area_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: asignacion_docente_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO asignacion_docente_curso VALUES (410, 0, 409, 236, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (411, 0, 409, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (415, 0, 414, 248, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (416, 0, 414, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (418, 0, 417, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (421, 0, 420, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (422, 0, 420, 252, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (425, 0, 424, 260, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (426, 0, 424, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (427, 0, 424, 240, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (430, 0, 429, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (431, 0, 429, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (434, 0, 433, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (435, 0, 433, 236, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (439, 0, 438, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (440, 0, 438, 260, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (442, 0, 441, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (446, 0, 445, 272, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (447, 0, 445, 268, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (449, 0, 448, 276, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (452, 0, 451, 236, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (453, 0, 451, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (457, 0, 456, 248, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (458, 0, 456, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (460, 0, 459, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (463, 0, 462, 252, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (464, 0, 462, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (467, 0, 466, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (468, 0, 466, 260, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (469, 0, 466, 240, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (472, 0, 471, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (473, 0, 471, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (476, 0, 475, 280, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (477, 0, 475, 276, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (481, 0, 480, 260, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (482, 0, 480, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (484, 0, 483, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (488, 0, 487, 272, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (489, 0, 487, 268, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (491, 0, 490, 276, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (494, 0, 493, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (495, 0, 493, 236, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (499, 0, 498, 248, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (500, 0, 498, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (502, 0, 501, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (505, 0, 504, 252, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (506, 0, 504, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (509, 0, 508, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (510, 0, 508, 260, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (511, 0, 508, 240, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (514, 0, 513, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (515, 0, 513, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (518, 0, 517, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (519, 0, 517, 236, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (523, 0, 522, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (524, 0, 522, 260, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (526, 0, 525, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (530, 0, 529, 268, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (531, 0, 529, 272, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (533, 0, 532, 276, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (536, 0, 535, 236, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (537, 0, 535, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (541, 0, 540, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (542, 0, 540, 248, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (544, 0, 543, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (547, 0, 546, 252, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (548, 0, 546, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (551, 0, 550, 240, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (552, 0, 550, 256, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (553, 0, 550, 260, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (556, 0, 555, 248, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (557, 0, 555, 244, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (560, 0, 559, 276, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (561, 0, 559, 280, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (565, 0, 564, 260, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (566, 0, 564, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (568, 0, 567, 240, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (572, 0, 571, 268, 'ASIGNADO_AL_100');
INSERT INTO asignacion_docente_curso VALUES (573, 0, 571, 272, 'ASIGNADO_AL_50');
INSERT INTO asignacion_docente_curso VALUES (575, 0, 574, 276, 'ASIGNADO_AL_100');


--
-- Data for Name: async_mail_attachment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: async_mail_bcc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: async_mail_cc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: async_mail_header; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: async_mail_mess; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: async_mail_to; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: autoridad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO autoridad VALUES (91, 0, 'DECANO', 83);
INSERT INTO autoridad VALUES (92, 0, 'VICE DECANO', 87);


--
-- Data for Name: business_exception; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: calificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO carrera VALUES (93, 0, 'SECUNDARIO COMPLETO', 'La carrera se organiza en áreas: área de programación; área de arquitectura; área de comunicaciones y un área denominada de apoyo la cual contiene asignaturas de lingüística, de matemáticas y de normas de calidad. Por tanto se cuenta con asignaturas básicas y complementarias para la adecuada formación del alumno así como también una materia optativa para cubrir tópicos que reflejen el constante avance en este campo.
 El área de Programación brinda una perspectiva completa de lenguajes y técnicas de programación actuales. Se enfoca la especificidad en tres ejes: a) Manejo de estructuras y algoritmos de programación, b) Manejo de bases de datos y estructuras de archivos de datos y c) Técnicas y metodologías de programación web.
 El área de Arquitecturas tiene como propósito acercar al alumno a las tecnologías de hardware y software actuales, presentando sus características principales, componentes, tecnologías actuales y manejo.
 El área de Comunicaciones debe capacitar al alumno para desempeñarse satisfactoriamente y con independencia dentro de las actividades mencionadas en el perfil, y para actualizarse de acuerdo a las nuevas tecnologías de comunicaciones que surgirán durante su actividad laboral.', 'BORRADOR', 'Esta carrera se sustenta en contenidos que promuevan la adquisición de conocimientos básicos en las áreas lingüística y matemática para luego incursionar en las áreas de programación y arquitectura de aplicaciones web que permitan desarrollar y administrar las mismas, programar servicios remotos, diseñar interfaces de usuario, tecnología multimedia y aspectos sociales de las nuevas tecnologías. La articulación de las áreas mencionadas, posibilitará aplicaciones de software con los fundamentos teóricos indispensables y una importante carga horaria destinada a la práctica y al uso de herramientas de desarrollo.
 Resumiendo, se pretende satisfacer las crecientes necesidades del mercado en cuanto a la formación de profesionales expertos en administración y programación de aplicaciones web, con la incorporación de nuevos conocimientos, habilidades, aptitudes y valores, dentro de un sistema curricular flexible que brinde las opciones para encauzar adecuadamente al egresado de acuerdo a las tendencias propias de las diferentes áreas de su profesión.', 'PRESENCIAL', 'El Técnico Desarrollador de Aplicaciones web es un profesional que posee conocimientos teóricos y con un destacado manejo de actividades prácticas para desempeñarse en gestiones específicas del diseño, configuración y mantenimiento de aplicaciones web así como también estar en condiciones de interactuar en actividades multidisciplinarias relacionadas con proyectos sobre las mismas. Asimismo, estará capacitado para desarrollar aplicaciones web que contemplen aspectos tales como la seguridad, calidad y accesibilidad, entre otros. ', 'TECNICO UNIVERSITARIO EN DESARROLLO WEB');
INSERT INTO carrera VALUES (97, 0, 'SECUNDARIO COMPLETO', 'INGENIERIA EN INFORMATICA', 'BORRADOR', NULL, 'PRESENCIAL', NULL, 'INGENIERIO EN INFORMATICA');


--
-- Data for Name: ciclo_lectivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO ciclo_lectivo VALUES (365, 0, 'CICLO LECTIVO 2013', '2013-12-21 00:00:00', '2013-04-01 00:00:00');
INSERT INTO ciclo_lectivo VALUES (366, 0, 'CICLO LECTIVO 2012', '2012-12-21 00:00:00', '2012-04-01 00:00:00');


--
-- Data for Name: configuracion_curso_dia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO configuracion_curso_dia VALUES (409, 0, 376, 'LUNES', 408, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (414, 0, 377, 'MARTES', 412, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (417, 0, 377, 'JUEVES', 413, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (420, 0, 378, 'MIERCOLES', 419, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (424, 0, 379, 'VIERNES', 423, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (429, 0, 380, 'LUNES', 428, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (433, 0, 381, 'SABADO', 432, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (438, 0, 382, 'LUNES', 436, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (441, 0, 382, 'MIERCOLES', 437, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (445, 0, 382, 'LUNES', 443, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (448, 0, 382, 'MIERCOLES', 444, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (451, 0, 392, 'LUNES', 450, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (456, 0, 393, 'MARTES', 454, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (459, 0, 393, 'JUEVES', 455, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (462, 0, 394, 'MIERCOLES', 461, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (466, 0, 395, 'VIERNES', 465, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (471, 0, 396, 'LUNES', 470, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (475, 0, 397, 'SABADO', 474, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (480, 0, 398, 'LUNES', 478, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (483, 0, 398, 'MIERCOLES', 479, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (487, 0, 399, 'LUNES', 485, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (490, 0, 399, 'MIERCOLES', 486, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (493, 0, 384, 'LUNES', 492, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (498, 0, 385, 'MARTES', 496, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (501, 0, 385, 'JUEVES', 497, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (504, 0, 386, 'MIERCOLES', 503, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (508, 0, 387, 'VIERNES', 507, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (513, 0, 388, 'LUNES', 512, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (517, 0, 389, 'SABADO', 516, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (522, 0, 390, 'LUNES', 520, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (525, 0, 390, 'MIERCOLES', 521, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (529, 0, 391, 'LUNES', 527, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (532, 0, 391, 'MIERCOLES', 528, 23, 19, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (535, 0, 400, 'LUNES', 534, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (540, 0, 401, 'MARTES', 538, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (543, 0, 401, 'JUEVES', 539, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (546, 0, 402, 'MIERCOLES', 545, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (550, 0, 403, 'VIERNES', 549, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (555, 0, 404, 'LUNES', 554, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (559, 0, 405, 'SABADO', 558, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (564, 0, 406, 'LUNES', 562, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (567, 0, 406, 'MIERCOLES', 563, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (571, 0, 407, 'LUNES', 569, 12, 8, 0, 0);
INSERT INTO configuracion_curso_dia VALUES (574, 0, 407, 'MIERCOLES', 570, 12, 8, 0, 0);


--
-- Data for Name: contacto; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO contacto VALUES (48, 0, 49);
INSERT INTO contacto VALUES (53, 0, 54);
INSERT INTO contacto VALUES (58, 0, 59);
INSERT INTO contacto VALUES (62, 0, 63);
INSERT INTO contacto VALUES (66, 0, 67);
INSERT INTO contacto VALUES (84, 0, 85);
INSERT INTO contacto VALUES (88, 0, 89);
INSERT INTO contacto VALUES (229, 0, 230);
INSERT INTO contacto VALUES (233, 0, 234);
INSERT INTO contacto VALUES (237, 0, 238);
INSERT INTO contacto VALUES (241, 0, 242);
INSERT INTO contacto VALUES (245, 0, 246);
INSERT INTO contacto VALUES (249, 0, 250);
INSERT INTO contacto VALUES (253, 0, 254);
INSERT INTO contacto VALUES (257, 0, 258);
INSERT INTO contacto VALUES (261, 0, 262);
INSERT INTO contacto VALUES (265, 0, 266);
INSERT INTO contacto VALUES (269, 0, 270);
INSERT INTO contacto VALUES (273, 0, 274);
INSERT INTO contacto VALUES (277, 0, 278);
INSERT INTO contacto VALUES (281, 0, 282);


--
-- Data for Name: coordinador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO coordinador VALUES (57, 93, false);
INSERT INTO coordinador VALUES (61, 93, true);
INSERT INTO coordinador VALUES (65, 93, false);


--
-- Data for Name: correlatividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO correlatividad VALUES (140, 0, 109, 111);
INSERT INTO correlatividad VALUES (141, 0, 108, 112);
INSERT INTO correlatividad VALUES (142, 0, 110, 113);
INSERT INTO correlatividad VALUES (143, 0, 111, 114);
INSERT INTO correlatividad VALUES (144, 0, 114, 115);
INSERT INTO correlatividad VALUES (145, 0, 112, 115);
INSERT INTO correlatividad VALUES (146, 0, 117, 119);
INSERT INTO correlatividad VALUES (147, 0, 116, 120);
INSERT INTO correlatividad VALUES (148, 0, 118, 121);
INSERT INTO correlatividad VALUES (149, 0, 119, 122);
INSERT INTO correlatividad VALUES (150, 0, 122, 123);
INSERT INTO correlatividad VALUES (151, 0, 120, 123);
INSERT INTO correlatividad VALUES (152, 0, 125, 127);
INSERT INTO correlatividad VALUES (153, 0, 124, 128);
INSERT INTO correlatividad VALUES (154, 0, 126, 129);
INSERT INTO correlatividad VALUES (155, 0, 127, 130);
INSERT INTO correlatividad VALUES (156, 0, 130, 131);
INSERT INTO correlatividad VALUES (157, 0, 128, 131);
INSERT INTO correlatividad VALUES (158, 0, 133, 135);
INSERT INTO correlatividad VALUES (159, 0, 132, 136);
INSERT INTO correlatividad VALUES (160, 0, 134, 137);
INSERT INTO correlatividad VALUES (161, 0, 135, 138);
INSERT INTO correlatividad VALUES (162, 0, 138, 139);
INSERT INTO correlatividad VALUES (163, 0, 136, 139);


--
-- Data for Name: cronograma_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cronograma_carrera VALUES (371, 0, 365, 104);
INSERT INTO cronograma_carrera VALUES (372, 0, 365, 105);
INSERT INTO cronograma_carrera VALUES (373, 0, 365, 106);
INSERT INTO cronograma_carrera VALUES (374, 0, 365, 107);
INSERT INTO cronograma_carrera VALUES (375, 0, 366, 104);


--
-- Data for Name: curriculum; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: curriculum_adjunto; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: curriculum_aptitud; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: curriculum_educacion_adquirida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: curriculum_experiencia_laboral; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO curso VALUES (376, 1, '2012C1N101', 375, 'CERRADO', 108, 369, 31);
INSERT INTO curso VALUES (377, 1, '2012C1N102', 375, 'CERRADO', 109, 369, 31);
INSERT INTO curso VALUES (378, 1, '2012C1N103', 375, 'CERRADO', 110, 369, 31);
INSERT INTO curso VALUES (379, 1, '2012C1N104', 375, 'CERRADO', 111, 369, 31);
INSERT INTO curso VALUES (380, 1, '2012C1N105', 375, 'CERRADO', 112, 369, 31);
INSERT INTO curso VALUES (381, 1, '2012C1N106', 375, 'CERRADO', 113, 369, 31);
INSERT INTO curso VALUES (382, 1, '2012C1N107', 375, 'CERRADO', 114, 369, 31);
INSERT INTO curso VALUES (383, 1, '2012C1N108', 375, 'CERRADO', 115, 369, 31);
INSERT INTO curso VALUES (384, 1, '2012C2N101', 375, 'CERRADO', 108, 370, 31);
INSERT INTO curso VALUES (385, 1, '2012C2N102', 375, 'CERRADO', 109, 370, 31);
INSERT INTO curso VALUES (386, 1, '2012C2N103', 375, 'CERRADO', 110, 370, 31);
INSERT INTO curso VALUES (387, 1, '2012C2N104', 375, 'CERRADO', 111, 370, 31);
INSERT INTO curso VALUES (388, 1, '2012C2N105', 375, 'CERRADO', 112, 370, 31);
INSERT INTO curso VALUES (389, 1, '2012C2N106', 375, 'CERRADO', 113, 370, 31);
INSERT INTO curso VALUES (390, 1, '2012C2N107', 375, 'CERRADO', 114, 370, 31);
INSERT INTO curso VALUES (391, 1, '2012C2N108', 375, 'CERRADO', 115, 370, 31);
INSERT INTO curso VALUES (392, 1, '2012C1M101', 375, 'CERRADO', 108, 369, 29);
INSERT INTO curso VALUES (393, 1, '2012C1M102', 375, 'CERRADO', 109, 369, 29);
INSERT INTO curso VALUES (394, 1, '2012C1M103', 375, 'CERRADO', 110, 369, 29);
INSERT INTO curso VALUES (395, 1, '2012C1M104', 375, 'CERRADO', 111, 369, 29);
INSERT INTO curso VALUES (396, 1, '2012C1M105', 375, 'CERRADO', 112, 369, 29);
INSERT INTO curso VALUES (397, 1, '2012C1M106', 375, 'CERRADO', 113, 369, 29);
INSERT INTO curso VALUES (398, 1, '2012C1M107', 375, 'CERRADO', 114, 369, 29);
INSERT INTO curso VALUES (399, 1, '2012C1M108', 375, 'CERRADO', 115, 369, 29);
INSERT INTO curso VALUES (400, 1, '2012C2M101', 375, 'CERRADO', 108, 370, 29);
INSERT INTO curso VALUES (401, 1, '2012C2M102', 375, 'CERRADO', 109, 370, 29);
INSERT INTO curso VALUES (402, 1, '2012C2M103', 375, 'CERRADO', 110, 370, 29);
INSERT INTO curso VALUES (403, 1, '2012C2M104', 375, 'CERRADO', 111, 370, 29);
INSERT INTO curso VALUES (404, 1, '2012C2M105', 375, 'CERRADO', 112, 370, 29);
INSERT INTO curso VALUES (405, 1, '2012C2M106', 375, 'CERRADO', 113, 370, 29);
INSERT INTO curso VALUES (406, 1, '2012C2M107', 375, 'CERRADO', 114, 370, 29);
INSERT INTO curso VALUES (407, 1, '2012C2M108', 375, 'CERRADO', 115, 370, 29);


--
-- Data for Name: departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departamento VALUES (228, 0, 229, 'La mision de nuestro departamento es...', 'Ingenieria', 'La visión de nuestro departamenteo es...');


--
-- Data for Name: departamento_autoridad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: departamento_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO departamento_carrera VALUES (228, 93);
INSERT INTO departamento_carrera VALUES (228, 97);


--
-- Data for Name: docente; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO docente VALUES (236, NULL, 228);
INSERT INTO docente VALUES (240, NULL, 228);
INSERT INTO docente VALUES (244, NULL, 228);
INSERT INTO docente VALUES (248, NULL, 228);
INSERT INTO docente VALUES (252, NULL, 228);
INSERT INTO docente VALUES (256, NULL, 228);
INSERT INTO docente VALUES (260, NULL, 228);
INSERT INTO docente VALUES (264, NULL, 228);
INSERT INTO docente VALUES (268, NULL, 228);
INSERT INTO docente VALUES (272, NULL, 228);
INSERT INTO docente VALUES (276, NULL, 228);
INSERT INTO docente VALUES (280, NULL, 228);


--
-- Data for Name: documento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO documento VALUES (42, 0, 28230014, 'DNI');
INSERT INTO documento VALUES (43, 0, 20282300142, 'CUIL');
INSERT INTO documento VALUES (44, 0, 27777777, 'DNI');
INSERT INTO documento VALUES (45, 0, 27777778, 'DNI');
INSERT INTO documento VALUES (46, 0, 27777779, 'DNI');
INSERT INTO documento VALUES (69, 0, 21111111, 'DNI');
INSERT INTO documento VALUES (70, 0, 21111112, 'DNI');
INSERT INTO documento VALUES (71, 0, 21111113, 'DNI');
INSERT INTO documento VALUES (72, 0, 21111114, 'DNI');
INSERT INTO documento VALUES (73, 0, 21111115, 'DNI');
INSERT INTO documento VALUES (74, 0, 21111116, 'DNI');
INSERT INTO documento VALUES (75, 0, 21111117, 'DNI');
INSERT INTO documento VALUES (76, 0, 21111118, 'DNI');
INSERT INTO documento VALUES (77, 0, 21111109, 'DNI');
INSERT INTO documento VALUES (78, 0, 29999910, 'DNI');
INSERT INTO documento VALUES (79, 0, 29999911, 'DNI');
INSERT INTO documento VALUES (80, 0, 29999912, 'DNI');
INSERT INTO documento VALUES (81, 0, 29999913, 'DNI');
INSERT INTO documento VALUES (82, 0, 29999914, 'DNI');


--
-- Data for Name: domicilio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO domicilio VALUES (49, 0, 'Martin Irigoyen', 1712, 'Castelar', 556, 'Triplex del Medio.');
INSERT INTO domicilio VALUES (54, 0, 'Luis Maria Drago', 1712, 'Castelar', 2519, NULL);
INSERT INTO domicilio VALUES (59, 0, 'Acá va la calle', 1100, 'Capital Federal', 5555, NULL);
INSERT INTO domicilio VALUES (63, 0, 'Acá va la calle', 1100, 'Capital Federal', 5555, NULL);
INSERT INTO domicilio VALUES (67, 0, 'Acá va la calle', 1100, 'Capital Federal', 5555, NULL);
INSERT INTO domicilio VALUES (85, 0, 'Rivadavia', 5400, 'Capital Federal', 5685, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (89, 0, 'Rivadavia', 5400, 'Capital Federal', 5686, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (230, 0, 'Direccion de la unlam', 1704, 'San Justo', 556, 'De la entrada principal a la izquierda.');
INSERT INTO domicilio VALUES (234, 0, 'Direccion de la unlam', 1704, 'San Justo', 556, NULL);
INSERT INTO domicilio VALUES (238, 0, 'Rivadavia', 5400, 'Capital Federal', 5677, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (242, 0, 'Rivadavia', 5400, 'Capital Federal', 5678, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (246, 0, 'Rivadavia', 5400, 'Capital Federal', 5679, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (250, 0, 'Rivadavia', 5400, 'Capital Federal', 5680, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (254, 0, 'Rivadavia', 5400, 'Capital Federal', 5681, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (258, 0, 'Rivadavia', 5400, 'Capital Federal', 5682, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (262, 0, 'Rivadavia', 5400, 'Capital Federal', 5683, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (266, 0, 'Rivadavia', 5400, 'Capital Federal', 5684, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (270, 0, 'Rivadavia', 5400, 'Capital Federal', 5681, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (274, 0, 'Rivadavia', 5400, 'Capital Federal', 5682, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (278, 0, 'Rivadavia', 5400, 'Capital Federal', 5683, 'tocar timbre del medio');
INSERT INTO domicilio VALUES (282, 0, 'Rivadavia', 5400, 'Capital Federal', 5684, 'tocar timbre del medio');


--
-- Data for Name: educacion_adquirida; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: equivalencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO equivalencia VALUES (164, 0, 124, 108);
INSERT INTO equivalencia VALUES (165, 0, 108, 124);
INSERT INTO equivalencia VALUES (166, 0, 125, 109);
INSERT INTO equivalencia VALUES (167, 0, 109, 125);
INSERT INTO equivalencia VALUES (168, 0, 126, 110);
INSERT INTO equivalencia VALUES (169, 0, 110, 126);
INSERT INTO equivalencia VALUES (170, 0, 127, 111);
INSERT INTO equivalencia VALUES (171, 0, 111, 127);
INSERT INTO equivalencia VALUES (172, 0, 128, 112);
INSERT INTO equivalencia VALUES (173, 0, 112, 128);
INSERT INTO equivalencia VALUES (174, 0, 129, 113);
INSERT INTO equivalencia VALUES (175, 0, 113, 129);
INSERT INTO equivalencia VALUES (176, 0, 130, 114);
INSERT INTO equivalencia VALUES (177, 0, 114, 130);
INSERT INTO equivalencia VALUES (178, 0, 131, 115);
INSERT INTO equivalencia VALUES (179, 0, 115, 131);
INSERT INTO equivalencia VALUES (180, 0, 132, 116);
INSERT INTO equivalencia VALUES (181, 0, 116, 132);
INSERT INTO equivalencia VALUES (182, 0, 133, 117);
INSERT INTO equivalencia VALUES (183, 0, 117, 133);
INSERT INTO equivalencia VALUES (184, 0, 134, 118);
INSERT INTO equivalencia VALUES (185, 0, 118, 134);
INSERT INTO equivalencia VALUES (186, 0, 135, 119);
INSERT INTO equivalencia VALUES (187, 0, 119, 135);
INSERT INTO equivalencia VALUES (188, 0, 136, 120);
INSERT INTO equivalencia VALUES (189, 0, 120, 136);
INSERT INTO equivalencia VALUES (190, 0, 137, 121);
INSERT INTO equivalencia VALUES (191, 0, 121, 137);
INSERT INTO equivalencia VALUES (192, 0, 138, 122);
INSERT INTO equivalencia VALUES (193, 0, 122, 138);
INSERT INTO equivalencia VALUES (194, 0, 139, 123);
INSERT INTO equivalencia VALUES (195, 0, 123, 139);
INSERT INTO equivalencia VALUES (196, 0, 132, 108);
INSERT INTO equivalencia VALUES (197, 0, 116, 108);
INSERT INTO equivalencia VALUES (198, 0, 133, 109);
INSERT INTO equivalencia VALUES (199, 0, 117, 109);
INSERT INTO equivalencia VALUES (200, 0, 134, 110);
INSERT INTO equivalencia VALUES (201, 0, 118, 110);
INSERT INTO equivalencia VALUES (202, 0, 135, 111);
INSERT INTO equivalencia VALUES (203, 0, 119, 111);
INSERT INTO equivalencia VALUES (204, 0, 136, 112);
INSERT INTO equivalencia VALUES (205, 0, 120, 112);
INSERT INTO equivalencia VALUES (206, 0, 137, 113);
INSERT INTO equivalencia VALUES (207, 0, 121, 113);
INSERT INTO equivalencia VALUES (208, 0, 138, 114);
INSERT INTO equivalencia VALUES (209, 0, 122, 114);
INSERT INTO equivalencia VALUES (210, 0, 139, 115);
INSERT INTO equivalencia VALUES (211, 0, 123, 115);
INSERT INTO equivalencia VALUES (212, 0, 132, 124);
INSERT INTO equivalencia VALUES (213, 0, 116, 124);
INSERT INTO equivalencia VALUES (214, 0, 133, 125);
INSERT INTO equivalencia VALUES (215, 0, 117, 125);
INSERT INTO equivalencia VALUES (216, 0, 134, 126);
INSERT INTO equivalencia VALUES (217, 0, 118, 126);
INSERT INTO equivalencia VALUES (218, 0, 135, 127);
INSERT INTO equivalencia VALUES (219, 0, 119, 127);
INSERT INTO equivalencia VALUES (220, 0, 136, 128);
INSERT INTO equivalencia VALUES (221, 0, 120, 128);
INSERT INTO equivalencia VALUES (222, 0, 137, 129);
INSERT INTO equivalencia VALUES (223, 0, 121, 129);
INSERT INTO equivalencia VALUES (224, 0, 138, 130);
INSERT INTO equivalencia VALUES (225, 0, 122, 130);
INSERT INTO equivalencia VALUES (226, 0, 139, 131);
INSERT INTO equivalencia VALUES (227, 0, 123, 131);


--
-- Data for Name: espacio_fisico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO espacio_fisico VALUES (284, 0, 101, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (285, 0, 102, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (286, 0, 103, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (287, 0, 104, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (288, 0, 105, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (289, 0, 106, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (290, 0, 107, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (291, 0, 108, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (292, 0, 109, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (293, 0, 110, NULL, 'Pabellon Nro 1');
INSERT INTO espacio_fisico VALUES (294, 0, 111, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (295, 0, 112, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (296, 0, 113, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (297, 0, 114, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (298, 0, 115, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (299, 0, 116, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (300, 0, 117, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (301, 0, 118, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (302, 0, 119, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (303, 0, 120, NULL, 'Pabellon Nro 3');
INSERT INTO espacio_fisico VALUES (304, 0, 121, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (305, 0, 122, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (306, 0, 123, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (307, 0, 124, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (308, 0, 125, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (309, 0, 126, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (310, 0, 127, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (311, 0, 128, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (312, 0, 129, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (313, 0, 130, NULL, 'Pabellon Nro 5');
INSERT INTO espacio_fisico VALUES (314, 0, 131, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (315, 0, 132, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (316, 0, 133, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (317, 0, 134, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (318, 0, 135, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (319, 0, 136, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (320, 0, 137, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (321, 0, 138, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (322, 0, 139, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (323, 0, 140, NULL, 'Pabellon Nro 7');
INSERT INTO espacio_fisico VALUES (324, 0, 141, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (325, 0, 142, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (326, 0, 143, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (327, 0, 144, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (328, 0, 145, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (329, 0, 146, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (330, 0, 147, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (331, 0, 148, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (332, 0, 149, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (333, 0, 150, NULL, 'Pabellon Nro 9');
INSERT INTO espacio_fisico VALUES (334, 0, 151, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (335, 0, 152, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (336, 0, 153, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (337, 0, 154, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (338, 0, 155, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (339, 0, 156, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (340, 0, 157, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (341, 0, 158, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (342, 0, 159, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (343, 0, 160, NULL, 'Pabellon Nro 11');
INSERT INTO espacio_fisico VALUES (344, 0, 161, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (345, 0, 162, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (346, 0, 163, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (347, 0, 164, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (348, 0, 165, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (349, 0, 166, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (350, 0, 167, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (351, 0, 168, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (352, 0, 169, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (353, 0, 170, NULL, 'Pabellon Nro 13');
INSERT INTO espacio_fisico VALUES (354, 0, 171, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (355, 0, 172, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (356, 0, 173, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (357, 0, 174, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (358, 0, 175, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (359, 0, 176, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (360, 0, 177, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (361, 0, 178, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (362, 0, 179, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (363, 0, 180, NULL, 'Pabellon Nro 15');
INSERT INTO espacio_fisico VALUES (364, 0, 181, NULL, 'Pabellon Nro 17');
INSERT INTO espacio_fisico VALUES (408, 0, 901, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (412, 0, 907, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (413, 0, 903, NULL, 'LABORATORIO 3');
INSERT INTO espacio_fisico VALUES (419, 0, 902, NULL, 'PABELLON 2');
INSERT INTO espacio_fisico VALUES (423, 0, 905, NULL, 'LABOTARORIO WEB');
INSERT INTO espacio_fisico VALUES (428, 0, 906, NULL, 'AULA MAGNA');
INSERT INTO espacio_fisico VALUES (432, 0, 801, NULL, 'PABELLON 3');
INSERT INTO espacio_fisico VALUES (436, 0, 802, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (437, 0, 803, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (443, 0, 804, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (444, 0, 805, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (450, 0, 700, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (454, 0, 701, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (455, 0, 702, NULL, 'LABORATORIO 3');
INSERT INTO espacio_fisico VALUES (461, 0, 703, NULL, 'PABELLON 2');
INSERT INTO espacio_fisico VALUES (465, 0, 704, NULL, 'LABOTARORIO WEB');
INSERT INTO espacio_fisico VALUES (470, 0, 705, NULL, 'AULA MAGNA');
INSERT INTO espacio_fisico VALUES (474, 0, 706, NULL, 'PABELLON 3');
INSERT INTO espacio_fisico VALUES (478, 0, 707, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (479, 0, 708, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (485, 0, 721, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (486, 0, 722, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (492, 0, 601, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (496, 0, 607, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (497, 0, 603, NULL, 'LABORATORIO 3');
INSERT INTO espacio_fisico VALUES (503, 0, 602, NULL, 'PABELLON 2');
INSERT INTO espacio_fisico VALUES (507, 0, 605, NULL, 'LABOTARORIO WEB');
INSERT INTO espacio_fisico VALUES (512, 0, 617, NULL, 'AULA MAGNA');
INSERT INTO espacio_fisico VALUES (516, 0, 618, NULL, 'PABELLON 3');
INSERT INTO espacio_fisico VALUES (520, 0, 619, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (521, 0, 620, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (527, 0, 625, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (528, 0, 621, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (534, 0, 500, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (538, 0, 501, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (539, 0, 502, NULL, 'LABORATORIO 3');
INSERT INTO espacio_fisico VALUES (545, 0, 503, NULL, 'PABELLON 2');
INSERT INTO espacio_fisico VALUES (549, 0, 504, NULL, 'LABOTARORIO WEB');
INSERT INTO espacio_fisico VALUES (554, 0, 505, NULL, 'AULA MAGNA');
INSERT INTO espacio_fisico VALUES (558, 0, 506, NULL, 'PABELLON 3');
INSERT INTO espacio_fisico VALUES (562, 0, 507, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (563, 0, 508, NULL, 'ZONA DE LABORATORIOS');
INSERT INTO espacio_fisico VALUES (569, 0, 521, NULL, 'PABELLON 1');
INSERT INTO espacio_fisico VALUES (570, 0, 522, NULL, 'ZONA DE LABORATORIOS');


--
-- Data for Name: evento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: evento_alumno; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: evento_docente; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: experiencia_laboral; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 575, true);


--
-- Data for Name: inscripcion_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inscripcion_curso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: inscripcion_institucion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: institucion_educativa; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO institucion_educativa VALUES (232, 1, 233, 'UNLAM');


--
-- Data for Name: institucion_educativa_autoridad; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: institucion_educativa_departamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO institucion_educativa_departamento VALUES (232, 228);


--
-- Data for Name: materia; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO materia VALUES (108, 0, 'Acá va la bibliografia.', 2, 40, 101, 'Aca va el contenido minimo...', 30, 20, 'BASE DE DATOS 1', 98, 104);
INSERT INTO materia VALUES (109, 0, 'Acá va la bibliografia.', 3, 80, 102, 'Aca va el contenido minimo...', 40, 30, 'PROGRAMACION BASICA 1', 98, 104);
INSERT INTO materia VALUES (110, 0, 'Acá va la bibliografia.', 1, 40, 103, 'Aca va el contenido minimo...', 30, 15, 'MATEMATICA', 98, 104);
INSERT INTO materia VALUES (111, 0, 'Acá va la bibliografia.', 2, 40, 104, 'Aca va el contenido minimo...', 30, 20, 'PROGRAMACION WEB 1', 99, 104);
INSERT INTO materia VALUES (112, 0, 'Acá va la bibliografia.', 1, 40, 105, 'Aca va el contenido minimo...', 30, 8, 'BASE DE DATOS 2', 99, 104);
INSERT INTO materia VALUES (113, 0, 'Acá va la bibliografia.', 2, 40, 106, 'Aca va el contenido minimo...', 30, 8, 'REDES', 100, 104);
INSERT INTO materia VALUES (114, 0, 'Acá va la bibliografia.', 2, 80, 107, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 2', 100, 104);
INSERT INTO materia VALUES (115, 0, 'Acá va la bibliografia.', 2, 80, 108, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 3', 101, 104);
INSERT INTO materia VALUES (116, 0, 'Acá va la bibliografia.', 2, 80, 201, 'Aca va el contenido minimo...', 32, 20, 'BASE DE DATOS 1', 98, 106);
INSERT INTO materia VALUES (117, 0, 'Acá va la bibliografia.', 3, 80, 202, 'Aca va el contenido minimo...', 20, 30, 'PROGRAMACION BASICA 1', 98, 106);
INSERT INTO materia VALUES (118, 0, 'Acá va la bibliografia.', 1, 40, 203, 'Aca va el contenido minimo...', 30, 15, 'MATEMATICA', 98, 106);
INSERT INTO materia VALUES (119, 0, 'Acá va la bibliografia.', 2, 40, 204, 'Aca va el contenido minimo...', 30, 10, 'PROGRAMACION WEB 1', 99, 106);
INSERT INTO materia VALUES (120, 0, 'Acá va la bibliografia.', 1, 40, 205, 'Aca va el contenido minimo...', 30, 8, 'BASE DE DATOS 2', 99, 106);
INSERT INTO materia VALUES (121, 0, 'Acá va la bibliografia.', 2, 40, 206, 'Aca va el contenido minimo...', 30, 8, 'REDES', 100, 106);
INSERT INTO materia VALUES (122, 0, 'Acá va la bibliografia.', 2, 80, 207, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 2', 101, 106);
INSERT INTO materia VALUES (123, 0, 'Acá va la bibliografia.', 2, 80, 208, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 3', 101, 106);
INSERT INTO materia VALUES (124, 0, 'Acá va la bibliografia.', 2, 40, 301, 'Aca va el contenido minimo...', 30, 20, 'BASE DE DATOS 1', 98, 105);
INSERT INTO materia VALUES (125, 0, 'Acá va la bibliografia.', 3, 80, 302, 'Aca va el contenido minimo...', 40, 30, 'PROGRAMACION BASICA 1', 98, 105);
INSERT INTO materia VALUES (126, 0, 'Acá va la bibliografia.', 1, 40, 303, 'Aca va el contenido minimo...', 30, 15, 'MATEMATICA', 98, 105);
INSERT INTO materia VALUES (127, 0, 'Acá va la bibliografia.', 2, 40, 304, 'Aca va el contenido minimo...', 30, 20, 'PROGRAMACION WEB 1', 99, 105);
INSERT INTO materia VALUES (128, 0, 'Acá va la bibliografia.', 1, 40, 305, 'Aca va el contenido minimo...', 30, 8, 'BASE DE DATOS 2', 99, 105);
INSERT INTO materia VALUES (129, 0, 'Acá va la bibliografia.', 2, 40, 306, 'Aca va el contenido minimo...', 30, 8, 'REDES', 100, 105);
INSERT INTO materia VALUES (130, 0, 'Acá va la bibliografia.', 2, 80, 307, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 2', 100, 105);
INSERT INTO materia VALUES (131, 0, 'Acá va la bibliografia.', 2, 80, 308, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 3', 101, 105);
INSERT INTO materia VALUES (132, 0, 'Acá va la bibliografia.', 2, 40, 401, 'Aca va el contenido minimo...', 30, 20, 'BASE DE DATOS 1', 98, 107);
INSERT INTO materia VALUES (133, 0, 'Acá va la bibliografia.', 3, 80, 402, 'Aca va el contenido minimo...', 20, 30, 'PROGRAMACION BASICA 1', 98, 107);
INSERT INTO materia VALUES (134, 0, 'Acá va la bibliografia.', 1, 40, 403, 'Aca va el contenido minimo...', 30, 15, 'MATEMATICA', 98, 107);
INSERT INTO materia VALUES (135, 0, 'Acá va la bibliografia.', 2, 40, 404, 'Aca va el contenido minimo...', 30, 10, 'PROGRAMACION WEB 1', 99, 107);
INSERT INTO materia VALUES (136, 0, 'Acá va la bibliografia.', 1, 40, 405, 'Aca va el contenido minimo...', 30, 8, 'BASE DE DATOS 2', 99, 107);
INSERT INTO materia VALUES (137, 0, 'Acá va la bibliografia.', 2, 40, 406, 'Aca va el contenido minimo...', 30, 8, 'REDES', 100, 107);
INSERT INTO materia VALUES (138, 0, 'Acá va la bibliografia.', 2, 80, 407, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 2', 101, 107);
INSERT INTO materia VALUES (139, 0, 'Acá va la bibliografia.', 2, 80, 408, 'Aca va el contenido minimo...', 30, 8, 'PROGRAMACION WEB 3', 101, 107);


--
-- Data for Name: materia_tipo_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nivel_adquirido; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: nombramiento; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: objetivo_carrera; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO objetivo_carrera VALUES (94, 0, 93, 'Formar técnicos universitarios con conocimientos, técnicas, herramientas y habilidades para desempeñarse en el mercado laboral actual dando respuesta inmediata a la alta demanda de profesionales en áreas técnicas especializadas como es el desarrollo, mantenimiento y gestión de aplicaciones web.');
INSERT INTO objetivo_carrera VALUES (95, 0, 93, 'Formar técnicos en el empleo de estrategias, metodologías, técnicas y herramientas para abordar la resolución de problemas asociados a aplicaciones y procesos en la Web.');
INSERT INTO objetivo_carrera VALUES (96, 0, 93, 'Formar un egresado con conocimientos teóricos y prácticos en análisis, diseño, programación, mantenimiento, implementación y administración de aplicaciones web.');


--
-- Data for Name: objetivo_especifico; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: periodo_academico; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO periodo_academico VALUES (367, 0, 12, 365, '2013-07-26 00:00:00', '2013-04-01 00:00:00', 'PRIMER_CUATRIMESTRE');
INSERT INTO periodo_academico VALUES (368, 0, 12, 365, '2013-12-21 00:00:00', '2013-08-26 00:00:00', 'SEGUNDO_CUATRIMESTRE');
INSERT INTO periodo_academico VALUES (369, 0, 12, 366, '2012-07-26 00:00:00', '2012-04-01 00:00:00', 'PRIMER_CUATRIMESTRE');
INSERT INTO periodo_academico VALUES (370, 0, 12, 366, '2012-12-21 00:00:00', '2012-08-26 00:00:00', 'SEGUNDO_CUATRIMESTRE');


--
-- Data for Name: periodo_dedicacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO periodo_dedicacion VALUES (98, 0, 1, 1);
INSERT INTO periodo_dedicacion VALUES (99, 0, 1, 2);
INSERT INTO periodo_dedicacion VALUES (100, 0, 2, 1);
INSERT INTO periodo_dedicacion VALUES (101, 0, 2, 2);
INSERT INTO periodo_dedicacion VALUES (102, 0, 3, 1);
INSERT INTO periodo_dedicacion VALUES (103, 0, 4, 2);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO persona VALUES (47, 0, 'Fichera', 48, 42, NULL, 'Alejandro', 7);
INSERT INTO persona VALUES (52, 0, 'Margenats', 53, 43, NULL, 'Juan Diego', 26);
INSERT INTO persona VALUES (83, 0, 'Martinez', 84, 81, NULL, 'Daniel', 27);
INSERT INTO persona VALUES (87, 0, 'Gonzalez', 88, 82, NULL, 'Gabriel', 28);
INSERT INTO persona VALUES (236, 0, 'Fernandez', 237, 69, NULL, 'Juan', 8);
INSERT INTO persona VALUES (240, 0, 'Gonzalez', 241, 70, NULL, 'Matias', 9);
INSERT INTO persona VALUES (244, 0, 'Rodriguez', 245, 71, NULL, 'Karina', 10);
INSERT INTO persona VALUES (248, 0, 'Iglesias', 249, 72, NULL, 'Maria Fernanda', 11);
INSERT INTO persona VALUES (252, 0, 'Martinez', 253, 73, NULL, 'Sergio', 12);
INSERT INTO persona VALUES (256, 0, 'Perez', 257, 74, NULL, 'Carlos', 13);
INSERT INTO persona VALUES (260, 0, 'Gonzalez', 261, 75, NULL, 'Monica', 14);
INSERT INTO persona VALUES (264, 0, 'Cano', 265, 76, NULL, 'Sergio', 15);
INSERT INTO persona VALUES (268, 0, 'Barbosa', 269, 77, NULL, 'Gerardo', 16);
INSERT INTO persona VALUES (272, 0, 'Fernandez', 273, 78, NULL, 'Lito', 17);
INSERT INTO persona VALUES (276, 0, 'Garcia', 277, 79, NULL, 'Lucas', 18);
INSERT INTO persona VALUES (280, 0, 'Rusti', 281, 80, NULL, 'Ale', 19);
INSERT INTO persona VALUES (57, 1, 'GIOIA', 58, 44, NULL, 'CINTHIA', 20);
INSERT INTO persona VALUES (61, 1, 'ORTHUSTEGUY', 62, 45, NULL, 'FERNANDO', 21);
INSERT INTO persona VALUES (65, 1, 'RUSTICCINI', 66, 46, NULL, 'ALEJANDRO', 22);


--
-- Data for Name: persona_curriculum; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: plan_estudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO plan_estudio VALUES (104, 0, 5, 93, 'OFERTADA', 'TEC_DESA_2011');
INSERT INTO plan_estudio VALUES (105, 0, 5, 93, 'SIN_OFERTAR', 'TEC_DESA_2014');
INSERT INTO plan_estudio VALUES (106, 0, 10, 97, 'OFERTADA', 'ING_INF_1997');
INSERT INTO plan_estudio VALUES (107, 0, 10, 97, 'OFERTADA', 'ING_INF_2010');


--
-- Data for Name: postulacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO recurso VALUES (36, 0, 'PROY001', 'BUENO', 32);
INSERT INTO recurso VALUES (37, 0, 'PROY002', 'MALO', 32);
INSERT INTO recurso VALUES (38, 0, 'PROY003', 'INUTILIZABLE', 32);
INSERT INTO recurso VALUES (39, 0, 'PROY004', 'BUENO', 32);
INSERT INTO recurso VALUES (40, 0, 'VISUAL01', 'BUENO', 34);
INSERT INTO recurso VALUES (41, 0, 'VISUAL02', 'REGULAR', 34);


--
-- Data for Name: registration_code; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO rol VALUES (1, 0, 'ROLE_ALUMNO');
INSERT INTO rol VALUES (2, 0, 'ROLE_DOCENTE');
INSERT INTO rol VALUES (3, 0, 'ROLE_COORDINADOR');
INSERT INTO rol VALUES (4, 0, 'ROLE_ADMINISTRATIVO');
INSERT INTO rol VALUES (5, 0, 'ROLE_ADMINISTRADOR_SISTEMA');


--
-- Data for Name: solicitud_equivalencia; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: telefono; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO telefono VALUES (50, 0, 48, '54311816', 'CASA');
INSERT INTO telefono VALUES (51, 0, 48, '1166960007', 'MOVIL');
INSERT INTO telefono VALUES (55, 0, 53, '1500000000', 'MOVIL');
INSERT INTO telefono VALUES (56, 0, 53, '44444444', 'CASA');
INSERT INTO telefono VALUES (60, 0, 58, '1555555555', 'MOVIL');
INSERT INTO telefono VALUES (64, 0, 62, '1555555551', 'MOVIL');
INSERT INTO telefono VALUES (68, 0, 66, '1555555552', 'MOVIL');
INSERT INTO telefono VALUES (86, 0, 84, '444499990013', 'MOVIL');
INSERT INTO telefono VALUES (90, 0, 88, '444499990014', 'MOVIL');
INSERT INTO telefono VALUES (231, 0, 229, '01144444444', 'TRABAJO');
INSERT INTO telefono VALUES (235, 0, 233, '01155555555', 'TRABAJO');
INSERT INTO telefono VALUES (239, 0, 237, '444499990000', 'MOVIL');
INSERT INTO telefono VALUES (243, 0, 241, '444499990002', 'MOVIL');
INSERT INTO telefono VALUES (247, 0, 245, '444499990003', 'CASA');
INSERT INTO telefono VALUES (251, 0, 249, '444499990004', 'MOVIL');
INSERT INTO telefono VALUES (255, 0, 253, '444499990005', 'TRABAJO');
INSERT INTO telefono VALUES (259, 0, 257, '444499990006', 'MOVIL');
INSERT INTO telefono VALUES (263, 0, 261, '444499990007', 'CASA');
INSERT INTO telefono VALUES (267, 0, 265, '444499990008', 'MOVIL');
INSERT INTO telefono VALUES (271, 0, 269, '444499990009', 'TRABAJO');
INSERT INTO telefono VALUES (275, 0, 273, '444499990010', 'MOVIL');
INSERT INTO telefono VALUES (279, 0, 277, '444499990011', 'CASA');
INSERT INTO telefono VALUES (283, 0, 281, '444499990012', 'MOVIL');


--
-- Data for Name: tipo_recurso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tipo_recurso VALUES (32, 0, 'PROYECTOR');
INSERT INTO tipo_recurso VALUES (33, 0, 'PIZARRON');
INSERT INTO tipo_recurso VALUES (34, 0, 'MS VISUAL STUDIO');
INSERT INTO tipo_recurso VALUES (35, 0, 'MS PROJECT');


--
-- Data for Name: turno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO turno VALUES (29, 0, 'MANIANA', 8, 12, 8, 12);
INSERT INTO turno VALUES (30, 0, 'TARDE', 14, 18, 14, 18);
INSERT INTO turno VALUES (31, 0, 'NOCHE', 8, 12, 19, 23);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario VALUES (6, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'admin@deukin.com');
INSERT INTO usuario VALUES (7, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'alumno1@deukin.com');
INSERT INTO usuario VALUES (8, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente1@deukin.com');
INSERT INTO usuario VALUES (9, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente2@deukin.com');
INSERT INTO usuario VALUES (10, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente3@deukin.com');
INSERT INTO usuario VALUES (11, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente4@deukin.com');
INSERT INTO usuario VALUES (12, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente5@deukin.com');
INSERT INTO usuario VALUES (13, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente6@deukin.com');
INSERT INTO usuario VALUES (14, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente7@deukin.com');
INSERT INTO usuario VALUES (15, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente8@deukin.com');
INSERT INTO usuario VALUES (16, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente9@deukin.com');
INSERT INTO usuario VALUES (17, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente10@deukin.com');
INSERT INTO usuario VALUES (18, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente11@deukin.com');
INSERT INTO usuario VALUES (19, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docente12@deukin.com');
INSERT INTO usuario VALUES (20, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'coordinador1@deukin.com');
INSERT INTO usuario VALUES (21, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'coordinador2@deukin.com');
INSERT INTO usuario VALUES (22, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'coordinador3@deukin.com');
INSERT INTO usuario VALUES (23, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'administrativo1@deukin.com');
INSERT INTO usuario VALUES (24, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'alumnoDocente1@deukin.com');
INSERT INTO usuario VALUES (25, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'docenteCoordinador1@deukin.com');
INSERT INTO usuario VALUES (26, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'alumnoAdministrativo1@deukin.com');
INSERT INTO usuario VALUES (27, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'autoridad1@deukin.com');
INSERT INTO usuario VALUES (28, 0, false, false, true, '8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', false, 'autoridad2@deukin.com');


--
-- Data for Name: usuario_registro; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: usuario_rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO usuario_rol VALUES (5, 6);
INSERT INTO usuario_rol VALUES (1, 7);
INSERT INTO usuario_rol VALUES (2, 8);
INSERT INTO usuario_rol VALUES (2, 9);
INSERT INTO usuario_rol VALUES (2, 10);
INSERT INTO usuario_rol VALUES (2, 11);
INSERT INTO usuario_rol VALUES (2, 12);
INSERT INTO usuario_rol VALUES (2, 13);
INSERT INTO usuario_rol VALUES (2, 14);
INSERT INTO usuario_rol VALUES (2, 15);
INSERT INTO usuario_rol VALUES (2, 16);
INSERT INTO usuario_rol VALUES (2, 17);
INSERT INTO usuario_rol VALUES (2, 18);
INSERT INTO usuario_rol VALUES (2, 19);
INSERT INTO usuario_rol VALUES (3, 20);
INSERT INTO usuario_rol VALUES (3, 21);
INSERT INTO usuario_rol VALUES (3, 22);
INSERT INTO usuario_rol VALUES (4, 23);
INSERT INTO usuario_rol VALUES (1, 24);
INSERT INTO usuario_rol VALUES (2, 24);
INSERT INTO usuario_rol VALUES (2, 25);
INSERT INTO usuario_rol VALUES (3, 25);
INSERT INTO usuario_rol VALUES (1, 26);
INSERT INTO usuario_rol VALUES (4, 26);
INSERT INTO usuario_rol VALUES (3, 27);
INSERT INTO usuario_rol VALUES (4, 27);
INSERT INTO usuario_rol VALUES (3, 28);
INSERT INTO usuario_rol VALUES (4, 28);


--
-- Name: alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY alumno
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
-- Name: aptitud_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aptitud
    ADD CONSTRAINT aptitud_pkey PRIMARY KEY (id);


--
-- Name: aptitud_titulo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY aptitud
    ADD CONSTRAINT aptitud_titulo_key UNIQUE (titulo);


--
-- Name: area_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY area_carrera
    ADD CONSTRAINT area_carrera_pkey PRIMARY KEY (id);


--
-- Name: asignacion_docente_curso_configuracion_curso_dia_id_docente_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asignacion_docente_curso
    ADD CONSTRAINT asignacion_docente_curso_configuracion_curso_dia_id_docente_key UNIQUE (configuracion_curso_dia_id, docente_id);


--
-- Name: asignacion_docente_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY asignacion_docente_curso
    ADD CONSTRAINT asignacion_docente_curso_pkey PRIMARY KEY (id);


--
-- Name: async_mail_attachment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY async_mail_attachment
    ADD CONSTRAINT async_mail_attachment_pkey PRIMARY KEY (id);


--
-- Name: async_mail_mess_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY async_mail_mess
    ADD CONSTRAINT async_mail_mess_pkey PRIMARY KEY (id);


--
-- Name: autoridad_persona_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autoridad
    ADD CONSTRAINT autoridad_persona_id_key UNIQUE (persona_id);


--
-- Name: autoridad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY autoridad
    ADD CONSTRAINT autoridad_pkey PRIMARY KEY (id);


--
-- Name: business_exception_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY business_exception
    ADD CONSTRAINT business_exception_pkey PRIMARY KEY (id);


--
-- Name: calificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY calificacion
    ADD CONSTRAINT calificacion_pkey PRIMARY KEY (id);


--
-- Name: carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_pkey PRIMARY KEY (id);


--
-- Name: carrera_titulo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY carrera
    ADD CONSTRAINT carrera_titulo_key UNIQUE (titulo);


--
-- Name: ciclo_lectivo_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciclo_lectivo
    ADD CONSTRAINT ciclo_lectivo_codigo_key UNIQUE (codigo);


--
-- Name: ciclo_lectivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY ciclo_lectivo
    ADD CONSTRAINT ciclo_lectivo_pkey PRIMARY KEY (id);


--
-- Name: configuracion_curso_dia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuracion_curso_dia
    ADD CONSTRAINT configuracion_curso_dia_pkey PRIMARY KEY (id);


--
-- Name: contacto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id);


--
-- Name: coordinador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY coordinador
    ADD CONSTRAINT coordinador_pkey PRIMARY KEY (id);


--
-- Name: correlatividad_materia_predecesora_id_materia_principal_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY correlatividad
    ADD CONSTRAINT correlatividad_materia_predecesora_id_materia_principal_id_key UNIQUE (materia_predecesora_id, materia_principal_id);


--
-- Name: correlatividad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY correlatividad
    ADD CONSTRAINT correlatividad_pkey PRIMARY KEY (id);


--
-- Name: cronograma_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cronograma_carrera
    ADD CONSTRAINT cronograma_carrera_pkey PRIMARY KEY (id);


--
-- Name: cronograma_carrera_plan_estudio_id_ciclo_lectivo_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cronograma_carrera
    ADD CONSTRAINT cronograma_carrera_plan_estudio_id_ciclo_lectivo_id_key UNIQUE (plan_estudio_id, ciclo_lectivo_id);


--
-- Name: curriculum_adjunto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curriculum_adjunto
    ADD CONSTRAINT curriculum_adjunto_pkey PRIMARY KEY (id);


--
-- Name: curriculum_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curriculum
    ADD CONSTRAINT curriculum_pkey PRIMARY KEY (id);


--
-- Name: curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);


--
-- Name: curso_turno_id_materia_id_cronograma_carrera_id_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT curso_turno_id_materia_id_cronograma_carrera_id_codigo_key UNIQUE (turno_id, materia_id, cronograma_carrera_id, codigo);


--
-- Name: departamento_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_nombre_key UNIQUE (nombre);


--
-- Name: departamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT departamento_pkey PRIMARY KEY (id);


--
-- Name: docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT docente_pkey PRIMARY KEY (id);


--
-- Name: documento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id);


--
-- Name: documento_tipo_documento_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY documento
    ADD CONSTRAINT documento_tipo_documento_numero_key UNIQUE (tipo_documento, numero);


--
-- Name: domicilio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY domicilio
    ADD CONSTRAINT domicilio_pkey PRIMARY KEY (id);


--
-- Name: educacion_adquirida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY educacion_adquirida
    ADD CONSTRAINT educacion_adquirida_pkey PRIMARY KEY (id);


--
-- Name: equivalencia_materia_equivalente_id_materia_principal_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equivalencia
    ADD CONSTRAINT equivalencia_materia_equivalente_id_materia_principal_id_key UNIQUE (materia_equivalente_id, materia_principal_id);


--
-- Name: equivalencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equivalencia
    ADD CONSTRAINT equivalencia_pkey PRIMARY KEY (id);


--
-- Name: espacio_fisico_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espacio_fisico
    ADD CONSTRAINT espacio_fisico_numero_key UNIQUE (numero);


--
-- Name: espacio_fisico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY espacio_fisico
    ADD CONSTRAINT espacio_fisico_pkey PRIMARY KEY (id);


--
-- Name: evento_espacio_fisico_id_fecha_inicio_titulo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_espacio_fisico_id_fecha_inicio_titulo_key UNIQUE (espacio_fisico_id, fecha_inicio, titulo);


--
-- Name: evento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id);


--
-- Name: experiencia_laboral_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY experiencia_laboral
    ADD CONSTRAINT experiencia_laboral_pkey PRIMARY KEY (id);


--
-- Name: inscripcion_carrera_carrera_id_persona_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscripcion_carrera
    ADD CONSTRAINT inscripcion_carrera_carrera_id_persona_id_key UNIQUE (carrera_id, persona_id);


--
-- Name: inscripcion_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscripcion_carrera
    ADD CONSTRAINT inscripcion_carrera_pkey PRIMARY KEY (id);


--
-- Name: inscripcion_curso_alumno_id_curso_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscripcion_curso
    ADD CONSTRAINT inscripcion_curso_alumno_id_curso_id_key UNIQUE (alumno_id, curso_id);


--
-- Name: inscripcion_curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscripcion_curso
    ADD CONSTRAINT inscripcion_curso_pkey PRIMARY KEY (id);


--
-- Name: inscripcion_institucion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscripcion_institucion
    ADD CONSTRAINT inscripcion_institucion_pkey PRIMARY KEY (id);


--
-- Name: inscripcion_institucion_tipo_documento_documento_numero_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY inscripcion_institucion
    ADD CONSTRAINT inscripcion_institucion_tipo_documento_documento_numero_key UNIQUE (tipo_documento, documento_numero);


--
-- Name: institucion_educativa_nombre_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institucion_educativa
    ADD CONSTRAINT institucion_educativa_nombre_key UNIQUE (nombre);


--
-- Name: institucion_educativa_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY institucion_educativa
    ADD CONSTRAINT institucion_educativa_pkey PRIMARY KEY (id);


--
-- Name: materia_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT materia_codigo_key UNIQUE (codigo);


--
-- Name: materia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT materia_pkey PRIMARY KEY (id);


--
-- Name: nivel_adquirido_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nivel_adquirido
    ADD CONSTRAINT nivel_adquirido_codigo_key UNIQUE (codigo);


--
-- Name: nivel_adquirido_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nivel_adquirido
    ADD CONSTRAINT nivel_adquirido_pkey PRIMARY KEY (id);


--
-- Name: nombramiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY nombramiento
    ADD CONSTRAINT nombramiento_pkey PRIMARY KEY (id);


--
-- Name: objetivo_carrera_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objetivo_carrera
    ADD CONSTRAINT objetivo_carrera_pkey PRIMARY KEY (id);


--
-- Name: objetivo_especifico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT objetivo_especifico_pkey PRIMARY KEY (id);


--
-- Name: objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT objetivo_pkey PRIMARY KEY (id);


--
-- Name: parametro_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametro_codigo_key UNIQUE (codigo);


--
-- Name: parametro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY parametro
    ADD CONSTRAINT parametro_pkey PRIMARY KEY (id);


--
-- Name: periodo_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY periodo_academico
    ADD CONSTRAINT periodo_academico_pkey PRIMARY KEY (id);


--
-- Name: periodo_dedicacion_cuatrimestre_anio_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY periodo_dedicacion
    ADD CONSTRAINT periodo_dedicacion_cuatrimestre_anio_key UNIQUE (cuatrimestre, anio);


--
-- Name: periodo_dedicacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY periodo_dedicacion
    ADD CONSTRAINT periodo_dedicacion_pkey PRIMARY KEY (id);


--
-- Name: persona_documento_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_documento_id_key UNIQUE (documento_id);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: plan_estudio_identificacion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plan_estudio
    ADD CONSTRAINT plan_estudio_identificacion_key UNIQUE (identificacion);


--
-- Name: plan_estudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plan_estudio
    ADD CONSTRAINT plan_estudio_pkey PRIMARY KEY (id);


--
-- Name: postulacion_materia_id_persona_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postulacion
    ADD CONSTRAINT postulacion_materia_id_persona_id_key UNIQUE (materia_id, persona_id);


--
-- Name: postulacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY postulacion
    ADD CONSTRAINT postulacion_pkey PRIMARY KEY (id);


--
-- Name: recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT recurso_pkey PRIMARY KEY (id);


--
-- Name: recurso_tipo_recurso_id_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT recurso_tipo_recurso_id_codigo_key UNIQUE (tipo_recurso_id, codigo);


--
-- Name: registration_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY registration_code
    ADD CONSTRAINT registration_code_pkey PRIMARY KEY (id);


--
-- Name: rol_authority_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_authority_key UNIQUE (authority);


--
-- Name: rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (id);


--
-- Name: solicitud_equivalencia_materia_cursada_materia_solicitada_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitud_equivalencia
    ADD CONSTRAINT solicitud_equivalencia_materia_cursada_materia_solicitada_i_key UNIQUE (materia_cursada, materia_solicitada_id, alumno_id);


--
-- Name: solicitud_equivalencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY solicitud_equivalencia
    ADD CONSTRAINT solicitud_equivalencia_pkey PRIMARY KEY (id);


--
-- Name: telefono_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY telefono
    ADD CONSTRAINT telefono_pkey PRIMARY KEY (id);


--
-- Name: tipo_recurso_descripcion_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_recurso
    ADD CONSTRAINT tipo_recurso_descripcion_key UNIQUE (descripcion);


--
-- Name: tipo_recurso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipo_recurso
    ADD CONSTRAINT tipo_recurso_pkey PRIMARY KEY (id);


--
-- Name: turno_codigo_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY turno
    ADD CONSTRAINT turno_codigo_key UNIQUE (codigo);


--
-- Name: turno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY turno
    ADD CONSTRAINT turno_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario_registro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario_registro
    ADD CONSTRAINT usuario_registro_pkey PRIMARY KEY (id);


--
-- Name: usuario_rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT usuario_rol_pkey PRIMARY KEY (rol_id, usuario_id);


--
-- Name: usuario_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_username_key UNIQUE (username);


--
-- Name: fk112ab7852f3b9e1c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion_educativa_departamento
    ADD CONSTRAINT fk112ab7852f3b9e1c FOREIGN KEY (institucion_educativa_departamentos_id) REFERENCES institucion_educativa(id);


--
-- Name: fk112ab785f9b4ddf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion_educativa_departamento
    ADD CONSTRAINT fk112ab785f9b4ddf FOREIGN KEY (departamento_id) REFERENCES departamento(id);


--
-- Name: fk1caca0e817082b9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY async_mail_attachment
    ADD CONSTRAINT fk1caca0e817082b9 FOREIGN KEY (message_id) REFERENCES async_mail_mess(id);


--
-- Name: fk244119c0e63f8195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion_educativa_autoridad
    ADD CONSTRAINT fk244119c0e63f8195 FOREIGN KEY (autoridad_id) REFERENCES autoridad(id);


--
-- Name: fk244119c0fbaa753c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion_educativa_autoridad
    ADD CONSTRAINT fk244119c0fbaa753c FOREIGN KEY (institucion_educativa_autoridades_id) REFERENCES institucion_educativa(id);


--
-- Name: fk28bd603b5b3739cb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento_carrera
    ADD CONSTRAINT fk28bd603b5b3739cb FOREIGN KEY (departamento_carreras_id) REFERENCES departamento(id);


--
-- Name: fk28bd603b82e51835; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento_carrera
    ADD CONSTRAINT fk28bd603b82e51835 FOREIGN KEY (carrera_id) REFERENCES carrera(id);


--
-- Name: fk2db416cb18225198; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_experiencia_laboral
    ADD CONSTRAINT fk2db416cb18225198 FOREIGN KEY (experiencia_laboral_id) REFERENCES experiencia_laboral(id);


--
-- Name: fk2db416cbc58fa3b6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_experiencia_laboral
    ADD CONSTRAINT fk2db416cbc58fa3b6 FOREIGN KEY (curriculum_experiencias_id) REFERENCES curriculum(id);


--
-- Name: fk2ed4164c777c137; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_educacion_adquirida
    ADD CONSTRAINT fk2ed4164c777c137 FOREIGN KEY (curriculum_educaciones_id) REFERENCES curriculum(id);


--
-- Name: fk2ed4164cda69e4ac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_educacion_adquirida
    ADD CONSTRAINT fk2ed4164cda69e4ac FOREIGN KEY (educacion_adquirida_id) REFERENCES educacion_adquirida(id);


--
-- Name: fk3118953ebdf91d35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk3118953ebdf91d35 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: fk3118953ecf4ce315; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuario_rol
    ADD CONSTRAINT fk3118953ecf4ce315 FOREIGN KEY (rol_id) REFERENCES rol(id);


--
-- Name: fk321f97e5bd296c02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT fk321f97e5bd296c02 FOREIGN KEY (plan_estudio_id) REFERENCES plan_estudio(id);


--
-- Name: fk321f97e5f236747e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materia
    ADD CONSTRAINT fk321f97e5f236747e FOREIGN KEY (periodo_id) REFERENCES periodo_dedicacion(id);


--
-- Name: fk4089da49244e29ec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY recurso
    ADD CONSTRAINT fk4089da49244e29ec FOREIGN KEY (tipo_recurso_id) REFERENCES tipo_recurso(id);


--
-- Name: fk4955ff263ae33d8f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento_autoridad
    ADD CONSTRAINT fk4955ff263ae33d8f FOREIGN KEY (departamento_autoridades_id) REFERENCES departamento(id);


--
-- Name: fk4955ff26e63f8195; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento_autoridad
    ADD CONSTRAINT fk4955ff26e63f8195 FOREIGN KEY (autoridad_id) REFERENCES autoridad(id);


--
-- Name: fk4bf60e8287482b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_docente
    ADD CONSTRAINT fk4bf60e8287482b5 FOREIGN KEY (docente_id) REFERENCES docente(id);


--
-- Name: fk4bf60e8875bf0c9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_docente
    ADD CONSTRAINT fk4bf60e8875bf0c9 FOREIGN KEY (evento_docentes_id) REFERENCES evento(id);


--
-- Name: fk56c6f3c5499cdd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo
    ADD CONSTRAINT fk56c6f3c5499cdd5 FOREIGN KEY (materia_id) REFERENCES materia(id);


--
-- Name: fk5aa009c47fa6575; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT fk5aa009c47fa6575 FOREIGN KEY (turno_id) REFERENCES turno(id);


--
-- Name: fk5aa009c5499cdd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT fk5aa009c5499cdd5 FOREIGN KEY (materia_id) REFERENCES materia(id);


--
-- Name: fk5aa009c72912782; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT fk5aa009c72912782 FOREIGN KEY (periodo_academico_id) REFERENCES periodo_academico(id);


--
-- Name: fk5aa009c8285c862; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curso
    ADD CONSTRAINT fk5aa009c8285c862 FOREIGN KEY (cronograma_carrera_id) REFERENCES cronograma_carrera(id);


--
-- Name: fk5d65ee581862768b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materia_tipo_recurso
    ADD CONSTRAINT fk5d65ee581862768b FOREIGN KEY (materia_tipos_recurso_id) REFERENCES materia(id);


--
-- Name: fk5d65ee58244e29ec; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY materia_tipo_recurso
    ADD CONSTRAINT fk5d65ee58244e29ec FOREIGN KEY (tipo_recurso_id) REFERENCES tipo_recurso(id);


--
-- Name: fk640c0da137f4e475; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY autoridad
    ADD CONSTRAINT fk640c0da137f4e475 FOREIGN KEY (persona_id) REFERENCES persona(id);


--
-- Name: fk6cfbbe12df17050c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT fk6cfbbe12df17050c FOREIGN KEY (curriculum_docente_id) REFERENCES curriculum(id);


--
-- Name: fk6cfbbe12f9b4ddf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY docente
    ADD CONSTRAINT fk6cfbbe12f9b4ddf FOREIGN KEY (departamento_id) REFERENCES departamento(id);


--
-- Name: fk6f92ff2082e51835; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY coordinador
    ADD CONSTRAINT fk6f92ff2082e51835 FOREIGN KEY (carrera_id) REFERENCES carrera(id);


--
-- Name: fk74a96bc4e2e70bad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY area_carrera
    ADD CONSTRAINT fk74a96bc4e2e70bad FOREIGN KEY (area_madre_id) REFERENCES area_carrera(id);


--
-- Name: fk7ae245717431a583; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY correlatividad
    ADD CONSTRAINT fk7ae245717431a583 FOREIGN KEY (materia_predecesora_id) REFERENCES materia(id);


--
-- Name: fk7ae24571787fb306; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY correlatividad
    ADD CONSTRAINT fk7ae24571787fb306 FOREIGN KEY (materia_principal_id) REFERENCES materia(id);


--
-- Name: fk8a0d85b3c0aa1dd2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion_institucion
    ADD CONSTRAINT fk8a0d85b3c0aa1dd2 FOREIGN KEY (usuario_registro_id) REFERENCES usuario_registro(id);


--
-- Name: fk97b1df1ea632007f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY institucion_educativa
    ADD CONSTRAINT fk97b1df1ea632007f FOREIGN KEY (contacto_id) REFERENCES contacto(id);


--
-- Name: fk9d377ff737f4e475; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_adjunto
    ADD CONSTRAINT fk9d377ff737f4e475 FOREIGN KEY (persona_id) REFERENCES persona(id);


--
-- Name: fk9ef36df8287482b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asignacion_docente_curso
    ADD CONSTRAINT fk9ef36df8287482b5 FOREIGN KEY (docente_id) REFERENCES docente(id);


--
-- Name: fk9ef36df8ceffb45b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY asignacion_docente_curso
    ADD CONSTRAINT fk9ef36df8ceffb45b FOREIGN KEY (configuracion_curso_dia_id) REFERENCES configuracion_curso_dia(id);


--
-- Name: fka4a320c037f4e475; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion_carrera
    ADD CONSTRAINT fka4a320c037f4e475 FOREIGN KEY (persona_id) REFERENCES persona(id);


--
-- Name: fka4a320c082e51835; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion_carrera
    ADD CONSTRAINT fka4a320c082e51835 FOREIGN KEY (carrera_id) REFERENCES carrera(id);


--
-- Name: fka7b66bcf37f4e475; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postulacion
    ADD CONSTRAINT fka7b66bcf37f4e475 FOREIGN KEY (persona_id) REFERENCES persona(id);


--
-- Name: fka7b66bcf5499cdd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY postulacion
    ADD CONSTRAINT fka7b66bcf5499cdd5 FOREIGN KEY (materia_id) REFERENCES materia(id);


--
-- Name: fka8cf78176c16c0de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY periodo_academico
    ADD CONSTRAINT fka8cf78176c16c0de FOREIGN KEY (ciclo_lectivo_id) REFERENCES ciclo_lectivo(id);


--
-- Name: fka9ab036582e51835; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plan_estudio
    ADD CONSTRAINT fka9ab036582e51835 FOREIGN KEY (carrera_id) REFERENCES carrera(id);


--
-- Name: fkaee86af4a632007f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY telefono
    ADD CONSTRAINT fkaee86af4a632007f FOREIGN KEY (contacto_id) REFERENCES contacto(id);


--
-- Name: fkb041279b5499cdd5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo_especifico
    ADD CONSTRAINT fkb041279b5499cdd5 FOREIGN KEY (materia_id) REFERENCES materia(id);


--
-- Name: fkb0701c85287482b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY nombramiento
    ADD CONSTRAINT fkb0701c85287482b5 FOREIGN KEY (docente_id) REFERENCES docente(id);


--
-- Name: fkb239349b7a7db95; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_aptitud
    ADD CONSTRAINT fkb239349b7a7db95 FOREIGN KEY (aptitud_id) REFERENCES aptitud(id);


--
-- Name: fkb239349bdeeffeb1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY curriculum_aptitud
    ADD CONSTRAINT fkb239349bdeeffeb1 FOREIGN KEY (curriculum_aptitudes_id) REFERENCES curriculum(id);


--
-- Name: fkb307e115b21786ca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT fkb307e115b21786ca FOREIGN KEY (espacio_fisico_id) REFERENCES espacio_fisico(id);


--
-- Name: fkb3fd2c04a632007f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamento
    ADD CONSTRAINT fkb3fd2c04a632007f FOREIGN KEY (contacto_id) REFERENCES contacto(id);


--
-- Name: fkd0ef5c9f772fe7da; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY aptitud
    ADD CONSTRAINT fkd0ef5c9f772fe7da FOREIGN KEY (nivel_adquirido_id) REFERENCES nivel_adquirido(id);


--
-- Name: fkd529d6c1615d5135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY configuracion_curso_dia
    ADD CONSTRAINT fkd529d6c1615d5135 FOREIGN KEY (curso_id) REFERENCES curso(id);


--
-- Name: fkd529d6c1b21786ca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY configuracion_curso_dia
    ADD CONSTRAINT fkd529d6c1b21786ca FOREIGN KEY (espacio_fisico_id) REFERENCES espacio_fisico(id);


--
-- Name: fkd78fcfaca632007f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fkd78fcfaca632007f FOREIGN KEY (contacto_id) REFERENCES contacto(id);


--
-- Name: fkd78fcfacbdf91d35; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fkd78fcfacbdf91d35 FOREIGN KEY (usuario_id) REFERENCES usuario(id);


--
-- Name: fkd78fcfaccc0604b5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona
    ADD CONSTRAINT fkd78fcfaccc0604b5 FOREIGN KEY (documento_id) REFERENCES documento(id);


--
-- Name: fkde2d604f2070bb15; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY contacto
    ADD CONSTRAINT fkde2d604f2070bb15 FOREIGN KEY (domicilio_id) REFERENCES domicilio(id);


--
-- Name: fke2207f6e7a5e5c4f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_alumno
    ADD CONSTRAINT fke2207f6e7a5e5c4f FOREIGN KEY (evento_alumnos_id) REFERENCES evento(id);


--
-- Name: fke2207f6e8b60cd9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY evento_alumno
    ADD CONSTRAINT fke2207f6e8b60cd9f FOREIGN KEY (alumno_id) REFERENCES alumno(id);


--
-- Name: fke2c0ad31360a9259; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equivalencia
    ADD CONSTRAINT fke2c0ad31360a9259 FOREIGN KEY (materia_equivalente_id) REFERENCES materia(id);


--
-- Name: fke2c0ad31787fb306; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equivalencia
    ADD CONSTRAINT fke2c0ad31787fb306 FOREIGN KEY (materia_principal_id) REFERENCES materia(id);


--
-- Name: fkf0c19a66615d5135; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion_curso
    ADD CONSTRAINT fkf0c19a66615d5135 FOREIGN KEY (curso_id) REFERENCES curso(id);


--
-- Name: fkf0c19a66634ef0bf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion_curso
    ADD CONSTRAINT fkf0c19a66634ef0bf FOREIGN KEY (calificacion_id) REFERENCES calificacion(id);


--
-- Name: fkf0c19a668b60cd9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY inscripcion_curso
    ADD CONSTRAINT fkf0c19a668b60cd9f FOREIGN KEY (alumno_id) REFERENCES alumno(id);


--
-- Name: fkf331eb7382e51835; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY objetivo_carrera
    ADD CONSTRAINT fkf331eb7382e51835 FOREIGN KEY (carrera_id) REFERENCES carrera(id);


--
-- Name: fkf70945206c16c0de; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronograma_carrera
    ADD CONSTRAINT fkf70945206c16c0de FOREIGN KEY (ciclo_lectivo_id) REFERENCES ciclo_lectivo(id);


--
-- Name: fkf7094520bd296c02; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cronograma_carrera
    ADD CONSTRAINT fkf7094520bd296c02 FOREIGN KEY (plan_estudio_id) REFERENCES plan_estudio(id);


--
-- Name: fkf90742ec8b60cd9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_equivalencia
    ADD CONSTRAINT fkf90742ec8b60cd9f FOREIGN KEY (alumno_id) REFERENCES alumno(id);


--
-- Name: fkf90742ecab01d937; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY solicitud_equivalencia
    ADD CONSTRAINT fkf90742ecab01d937 FOREIGN KEY (materia_solicitada_id) REFERENCES materia(id);


--
-- Name: fkff52deae57f901fc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_curriculum
    ADD CONSTRAINT fkff52deae57f901fc FOREIGN KEY (persona_curriculums_id) REFERENCES persona(id);


--
-- Name: fkff52deaeafab3bf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY persona_curriculum
    ADD CONSTRAINT fkff52deaeafab3bf FOREIGN KEY (curriculum_id) REFERENCES curriculum(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

