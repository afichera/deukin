--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: deukin_test; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE deukin_test WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Argentina.1252' LC_CTYPE = 'Spanish_Argentina.1252';


ALTER DATABASE deukin_test OWNER TO postgres;

\connect deukin_test

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

