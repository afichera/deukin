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
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
		<g:form action="pasos">
			<h3>
				<g:message code="inscripcionInstitucion.titulos.datosPersonales"
					default="Datos Personales" />
			</h3>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'nombre', 'error')} required row">
				<label for="nombre" class="control-label col-lg-2"> <g:message
						code="inscripcionInstitucion.nombre.label" default="Nombre" /> <span
					class="required-indicator">*</span>
				: </label><div class="col-lg-10">
				<g:textField class="form-control" name="nombre" value="${inscripcion?.nombre}" maxlength="100" required="true"/>

				
				<g:hasErrors bean="${inscripcion}" field="nombre">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion}" field="nombre" />
					</div>
				</g:hasErrors></div>
			</div>


			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'apellido', 'error')} required row">
				<label for="apellido" class="control-label col-lg-2"> <g:message
						code="inscripcionInstitucion.apellido.label" default="Apellido" />
					<span class="required-indicator">*</span>
				: </label><div class="col-lg-10">
				<g:textField class="form-control" name="apellido" value="${inscripcion.apellido}" maxlength="50" required="true"/>

				
				<g:hasErrors bean="${inscripcion}" field="apellido">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion}" field="apellido" />
					</div>
				</g:hasErrors></div>
			</div>


			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'fechaNacimiento', 'error')} required row">
				<label for="fechaNacimiento" class="control-label col-lg-2"> <g:message
						code="inscripcionInstitucion.fechaNacimiento.label"
						default="Fecha de Nacimiento" /> <span class="required-indicator">*</span>
				: </label><div class="col-lg-10 selectChico">
				<g:datePicker name="fechaNacimiento"
					value="${inscripcion.fechaNacimiento}" precision="day"
					years="${(Calendar.instance.get(Calendar.YEAR)-16)..1910}"/>
				
				<g:hasErrors bean="${inscripcion}" field="fechaNacimiento">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion}" field="fechaNacimiento" />
					</div>
				</g:hasErrors></div>
			</div>
			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'sexo', 'error')} required row">
				<label for="sexo" class="control-label col-lg-2"> <g:message
						code="inscripcionInstitucion.campos.sexo" default="Sexo" /> <span
					class="required-indicator">*</span>
				: </label><div class="col-lg-10 selectChico">
				<g:select class="form-control" name="sexo" from="['M', 'F']" value="${inscripcion.sexo}"
					valueMessagePrefix="sexos" />

				
				<g:hasErrors bean="${inscripcion}" field="sexo">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion}" field="sexo" />
					</div>
				</g:hasErrors></div>
			</div>


			<div
				class="fieldcontain ${hasErrors(bean: inscripcion, field: 'tipoDocumento', 'error')} required row">

				<label for="tipoDocumento" class="control-label col-lg-2"> <g:message
						code="inscripcionInstitucion.tipoDocumento.label"
						default="Tipo de Documento" /> <span class="required-indicator">*</span>
				: </label><div class="col-lg-2 selectChico">
				<g:select class="form-control" name="tipoDocumento"
					from="${com.deukin.TipoDocumento?.values()}"
					keys="${com.deukin.TipoDocumento.values()*.name()}" required=""
					value="${inscripcion?.tipoDocumento?.name()}" />

				
				<g:hasErrors bean="${inscripcion}" field="tipoDocumento">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion}" field="tipoDocumento" />
					</div>
				</g:hasErrors></div>
			
				<label for="documentoNumero" class="control-label col-lg-1"> <g:message
						code="inscripcionInstitucion.documentoNumero.label"
						default="Nro." /> <span class="required-indicator">*</span>
				: </label><div class="col-lg-7">
				<g:textField class="form-control" name="documentoNumero" type="number"
					value="${inscripcion.documentoNumero}" required="true" onkeyup="soloNumeros(this,'#validaDocumento')"/>
	<span class="alert alert-error" id="validaDocumento" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	

				
				<g:hasErrors bean="${inscripcion}" field="documentoNumero">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion}" field="documentoNumero" />
					</div>
				</g:hasErrors></div>
			</div>

			<h3>
				<g:message
					code="inscripcionInstitucion.titulos.datosDeAccesoAlSitio"
					default="Datos de acceso" />
			</h3>
			<div
				class="fieldcontain ${hasErrors(bean: inscripcion?.usuarioRegistro, field: 'username', 'error')} required row">
				<label for="username" class="control-label col-lg-2">
					<g:message code="inscripcionInstitucion.campos.email"
						default="Email" /> <span class="required-indicator">*</span>
				: </label><div class="col-lg-10">
				<g:textField class="form-control" name="usuarioRegistro.username" size="50" type="email" required="true"
					value="${inscripcion?.usuarioRegistro?.username}" />

				
				<g:hasErrors bean="${inscripcion?.usuarioRegistro}" field="username">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion?.usuarioRegistro}"
							field="username" />
					</div>
				</g:hasErrors></div>
			</div>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion?.usuarioRegistro, field: 'password', 'error')} required row">
				<label for="password" class="control-label col-lg-2">
					<g:message code="inscripcionInstitucion.campos.password"
						default="Password" /> <span class="required-indicator">*</span>
				: </label><div class="col-lg-10">
				<g:passwordField class="form-control" name="usuarioRegistro.password"  maxlength="20" required="true"
					value="${inscripcion?.usuarioRegistro?.password}" />

				
				<g:hasErrors bean="${inscripcion?.usuarioRegistro}" field="password">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion?.usuarioRegistro}"
							field="password" />
					</div>
				</g:hasErrors></div>
			</div>

			<div
				class="fieldcontain ${hasErrors(bean: inscripcion?.usuarioRegistro, field: 'password2', 'error')} required row">
				<label for="password2" class="control-label col-lg-2">
					<g:message code="inscripcionInstitucion.campos.repitaPassword"
						default="Repita Password" /> <span class="required-indicator">*</span>
				: </label><div class="col-lg-10">
				<g:passwordField class="form-control" name="usuarioRegistro.password2"  maxlength="20" required="true"
					value="${inscripcion?.usuarioRegistro?.password2}" />
				
				<g:hasErrors bean="${inscripcion?.usuarioRegistro}" field="password2">
					<div class="errors alert alert-danger">
						<g:renderErrors bean="${inscripcion?.usuarioRegistro}"
							field="password2" />
					</div>
				</g:hasErrors></div>

			</div>
			
			<p>
				<g:submitButton name="siguiente" class="btn btn-primary"
					value="${message(code: 'inscripcionInstitucion.botones.siguiente', default: 'Siguiente')}" />
			</p>
		</g:form>
</div></div></div>
	</div>
</body>
</html>