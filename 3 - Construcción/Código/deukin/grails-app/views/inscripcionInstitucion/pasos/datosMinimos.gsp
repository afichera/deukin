<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Deukin Inscripción - Paso 1</title>
		<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
</head>
<body>
	<div class="body">
		<h1>
			<g:message code="inscripcionInstitucion.titulos.datosMinimos"
				default="Datos Mínimos" />
		</h1>
		<g:form action="pasos">
			<h3>
				<g:message code="inscripcionInstitucion.titulos.datosPersonales"
					default="Datos Personales" />
			</h3>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'nombre', 'error')} required">
				<label for="nombre" class="control-label"> <g:message
						code="inscripcionInstitucion.nombre.label" default="Nombre" /> <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="nombre" value="${inscripcion?.nombre}" maxlength="100" required="true"/>

				<br />
				<g:hasErrors bean="${inscripcion}" field="nombre">
					<div class="errors">
						<g:renderErrors bean="${inscripcion}" field="nombre" />
					</div>
				</g:hasErrors>
			</div>


			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'apellido', 'error')} required">
				<label for="apellido" class="control-label"> <g:message
						code="inscripcionInstitucion.apellido.label" default="Apellido" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="apellido" value="${inscripcion.apellido}" maxlength="50" required="true"/>

				<br />
				<g:hasErrors bean="${inscripcion}" field="apellido">
					<div class="errors">
						<g:renderErrors bean="${inscripcion}" field="apellido" />
					</div>
				</g:hasErrors>
			</div>


			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'fechaNacimiento', 'error')} required">
				<label for="fechaNacimiento" class="control-label"> <g:message
						code="inscripcionInstitucion.fechaNacimiento.label"
						default="Fecha de Nacimiento" /> <span class="required-indicator">*</span>
				</label>
				<g:datePicker name="fechaNacimiento"
					value="${inscripcion.fechaNacimiento}" precision="day"
					years="${1910..(Calendar.instance.get(Calendar.YEAR)-16)}" />
				<br />
				<g:hasErrors bean="${inscripcion}" field="fechaNacimiento">
					<div class="errors">
						<g:renderErrors bean="${inscripcion}" field="fechaNacimiento" />
					</div>
				</g:hasErrors>
			</div>
			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'sexo', 'error')} required">
				<label for="sexo" class="control-label"> <g:message
						code="inscripcionInstitucion.campos.sexo" default="Sexo" /> <span
					class="required-indicator">*</span>
				</label>
				<g:select name="sexo" from="['M', 'F']" value="${inscripcion.sexo}"
					valueMessagePrefix="sexos" />

				<br />
				<g:hasErrors bean="${inscripcion}" field="sexo">
					<div class="errors">
						<g:renderErrors bean="${inscripcion}" field="sexo" />
					</div>
				</g:hasErrors>
			</div>


			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'tipoDocumento', 'error')} required">

				<label for="tipoDocumento" class="control-label"> <g:message
						code="inscripcionInstitucion.tipoDocumento.label"
						default="Tipo de Documento" /> <span class="required-indicator">*</span>
				</label>
				<g:select name="tipoDocumento"
					from="${com.deukin.TipoDocumento?.values()}"
					keys="${com.deukin.TipoDocumento.values()*.name()}" required=""
					value="${inscripcion?.tipoDocumento?.name()}" />

				<br />
				<g:hasErrors bean="${inscripcion}" field="tipoDocumento">
					<div class="errors">
						<g:renderErrors bean="${inscripcion}" field="tipoDocumento" />
					</div>
				</g:hasErrors>
			</div>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'documentoNumero', 'error')} required">

				<label for="documentoNumero" class="control-label"> <g:message
						code="inscripcionInstitucion.documentoNumero.label"
						default="Numero de Documento" /> <span class="required-indicator">*</span>
				</label>
				<g:field name="documentoNumero" type="number"
					value="${inscripcion.documentoNumero}" required="true" />

				<br />
				<g:hasErrors bean="${inscripcion}" field="documentoNumero">
					<div class="errors">
						<g:renderErrors bean="${inscripcion}" field="documentoNumero" />
					</div>
				</g:hasErrors>
			</div>

			<h3>
				<g:message
					code="inscripcionInstitucion.titulos.datosDeAccesoAlSitio"
					default="Datos de acceso" />
			</h3>
			<div
				class="fieldcontain ${hasErrors(bean: inscripcion?.usuarioRegistro, field: 'username', 'error')} required">
				<label for="username" class="control-label">
					<g:message code="inscripcionInstitucion.campos.email"
						default="Email" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="usuarioRegistro.username" size="50" type="email" required="true"
					value="${inscripcion?.usuarioRegistro?.username}" />

				<br />
				<g:hasErrors bean="${inscripcion?.usuarioRegistro}" field="username">
					<div class="errors">
						<g:renderErrors bean="${inscripcion?.usuarioRegistro}"
							field="username" />
					</div>
				</g:hasErrors>
			</div>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion?.usuarioRegistro, field: 'password', 'error')} required">
				<label for="password" class="control-label">
					<g:message code="inscripcionInstitucion.campos.password"
						default="Password" /> <span class="required-indicator">*</span>
				</label>
				<g:passwordField name="usuarioRegistro.password" size="20" required="true"
					value="${inscripcion?.usuarioRegistro?.password}" />

				<br />
				<g:hasErrors bean="${inscripcion?.usuarioRegistro}" field="password">
					<div class="errors">
						<g:renderErrors bean="${inscripcion?.usuarioRegistro}"
							field="password" />
					</div>
				</g:hasErrors>
			</div>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion?.usuarioRegistro, field: 'password2', 'error')} required">
				<label for="password2" class="control-label">
					<g:message code="inscripcionInstitucion.campos.repitaPassword"
						default="Repita Password" /> <span class="required-indicator">*</span>
				</label>
				<g:passwordField name="usuarioRegistro.password2" size="20" required="true"
					value="${inscripcion?.usuarioRegistro?.password2}" />
				<br />
				<g:hasErrors bean="${inscripcion?.usuarioRegistro}" field="password2">
					<div class="errors">
						<g:renderErrors bean="${inscripcion?.usuarioRegistro}"
							field="password2" />
					</div>
				</g:hasErrors>

			</div>
			
			<p>
				<g:submitButton name="siguiente" class="btn btn-primary"
					value="${message(code: 'inscripcionInstitucion.botones.siguiente', default: 'Siguiente')}" />
			</p>
		</g:form>

	</div>
</body>
</html>