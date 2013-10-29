<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Deukin Inscripción - Paso 2</title>
</head>
<body>
	<div class="body">
		<h1>
			<g:message code="inscripcionInstitucion.titulos.datosContacto" />
		</h1>

		<g:form action="pasos">
			<p>
				<label for="calle" class="control-label"> <g:message
						code="inscripcionInstitucion.calle.label" default="Calle" /> <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="calle" value="${inscripcion?.calle}" />
			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="calle">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="calle" />
				</div>
			</g:hasErrors>

			<p>
				<label for="calleNumero" class="control-label"> <g:message
						code="inscripcionInstitucion.calleNumero.label" default="Número" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="calleNumero" type="number"
					value="${inscripcion?.calleNumero}" />
			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="calleNumero">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="calleNumero" />
				</div>
			</g:hasErrors>
			<p>
				<label for="localidad" class="control-label"> <g:message
						code="inscripcionInstitucion.localidad.label" default="Localidad" />
					<span class="required-indicator">*</span>
				</label>
				<g:textField name="localidad" value="${inscripcion?.localidad}" />
			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="localidad">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="localidad" />
				</div>
			</g:hasErrors>

			<p>
				<label for="codigoPostal" class="control-label"> <g:message
						code="inscripcionInstitucion.codigoPostal.label"
						default="Código Postal" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="codigoPostal" type="number"
					value="${inscripcion?.codigoPostal}" />
			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="codigoPostal">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="codigoPostal" />
				</div>
			</g:hasErrors>

			<p>
				<label for="observaciones" class="control-label"> <g:message
						code="inscripcionInstitucion.observaciones.label"
						default="Observaciones" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="observaciones"
					value="${inscripcion?.observaciones}" />
			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="observaciones">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="observaciones" />
				</div>
			</g:hasErrors>

			<p>
				<label for="tipoTelefono" class="control-label"> <g:message
						code="inscripcionInstitucion.tipoTelefono.label"
						default="Tipo Teléfono" /> <span class="required-indicator">*</span>
				</label>
				<g:select name="tipoTelefono"
					from="${com.deukin.TipoTelefono?.values()}"
					keys="${com.deukin.TipoTelefono.values()*.name()}" required=""
					value="${inscripcion?.tipoTelefono?.name()}" />

			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="tipoTelefono">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="tipoTelefono" />
				</div>
			</g:hasErrors>
			<p>
				<label for="telefonoNumero" class="control-label"> <g:message
						code="inscripcionInstitucion.telefonoNumero.label"
						default="Teléfono" /> <span class="required-indicator">*</span>
				</label>
				<g:textField name="telefonoNumero"
					value="${inscripcion?.telefonoNumero}" />
			</p>
			<br />
			<g:hasErrors bean="${inscripcion}" field="telefonoNumero">
				<div class="errors">
					<g:renderErrors bean="${inscripcion}" field="telefonoNumero" />
				</div>
			</g:hasErrors>

			<p>
				<g:submitButton name="siguiente"
					value="${message(code: 'inscripcionInstitucion.botones.siguiente', default: 'Siguiente')}" />
			</p>
		</g:form>


	</div>
</body>
</html>