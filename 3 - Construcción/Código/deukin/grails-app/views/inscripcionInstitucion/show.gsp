

<%@ page import="com.deukin.InscripcionInstitucion"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion')}" />
<title><g:message code="inscripcionInstitucion.show.label" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="inscripcionInstitucion.list.label"
						args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" controller="inscripcionInstitucion">
					<g:message code="inscripcionInstitucion.new.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-inscripcionInstitucion" class="content scaffold-show"
		role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<ol class="property-list inscripcionInstitucion">
						<div>
							<label class="control-label"> <g:message
									code="inscripcionInstitucion.datosPersonales.label" />
							</label>

						</div>
						<g:if test="${inscripcionInstitucionInstance?.usuarioRegistro}">
							<li class="fieldcontain"><span id="usuarioRegistro-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.usuarioRegistro.label"
										default="Usuario Registro" /></span> <span class="property-value"
								aria-labelledby="usuarioRegistro-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}"
										field="usuarioRegistro.username"></g:fieldValue> </span></li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.apellido}">
							<li class="fieldcontain"><span id="apellido-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.apellido.label"
										default="Apellido" /></span> <span class="property-value"
								aria-labelledby="apellido-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="apellido" /></span></li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.nombre}">
							<li class="fieldcontain"><span id="nombre-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.nombre.label" default="Nombre" /></span>

								<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="nombre" /></span></li>
						</g:if>
						<g:if test="${inscripcionInstitucionInstance?.fechaNacimiento}">
							<li class="fieldcontain"><span id="fechaNacimiento-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.fechaNacimiento.label"
										default="Fecha Nacimiento" /></span> <span class="property-value"
								aria-labelledby="fechaNacimiento-label"><g:formatDate
										date="${inscripcionInstitucionInstance?.fechaNacimiento}" /></span>

							</li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.sexo}">
							<li class="fieldcontain"><span id="sexo-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.sexo.label" default="Sexo" /></span> <span
								class="property-value" aria-labelledby="sexo-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="sexo" /></span></li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.tipoDocumento}">
							<li class="fieldcontain"><span id="tipoDocumento-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.tipoDocumento.label"
										default="Tipo Documento" /></span> <span class="property-value"
								aria-labelledby="tipoDocumento-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="tipoDocumento" /></span>

							</li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.documentoNumero}">
							<li class="fieldcontain"><span id="documentoNumero-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.documentoNumero.label"
										default="Documento Numero" /></span> <span class="property-value"
								aria-labelledby="documentoNumero-label"> ${inscripcionInstitucionInstance?.numeroDocumentoAsText()}
							</span></li>
						</g:if>

						<br />
						<div>
							<label class="control-label"> <g:message
									code="inscripcionInstitucion.titulos.datosContacto" />
							</label>

						</div>
						<g:if test="${inscripcionInstitucionInstance?.calle}">
							<li class="fieldcontain"><span id="calle-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.calle.label" default="Calle" /></span>

								<span class="property-value" aria-labelledby="calle-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="calle" /></span></li>
						</g:if>
						<g:if test="${inscripcionInstitucionInstance?.calleNumero}">
							<li class="fieldcontain"><span id="calleNumero-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.calleNumero.label"
										default="Calle Numero" /></span> <span class="property-value"
								aria-labelledby="calleNumero-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="calleNumero" /></span>

							</li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.localidad}">
							<li class="fieldcontain"><span id="localidad-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.localidad.label"
										default="Localidad" /></span> <span class="property-value"
								aria-labelledby="localidad-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="localidad" /></span>

							</li>
						</g:if>
						<g:if test="${inscripcionInstitucionInstance?.codigoPostal}">
							<li class="fieldcontain"><span id="codigoPostal-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.codigoPostal.label"
										default="Codigo Postal" /></span> <span class="property-value"
								aria-labelledby="codigoPostal-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="codigoPostal" /></span>

							</li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance?.observaciones}">
							<li class="fieldcontain"><span id="observaciones-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.observaciones.label"
										default="Observaciones" /></span> <span class="property-value"
								aria-labelledby="observaciones-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="observaciones" /></span>

							</li>
						</g:if>
						<g:if test="${inscripcionInstitucionInstance?.tipoTelefono}">
							<li class="fieldcontain"><span id="tipoTelefono-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.tipoTelefono.label"
										default="Tipo Telefono" /></span> <span class="property-value"
								aria-labelledby="tipoTelefono-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}" field="tipoTelefono" /></span>

							</li>
						</g:if>


						<g:if test="${inscripcionInstitucionInstance?.telefonoNumero}">
							<li class="fieldcontain"><span id="telefonoNumero-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.telefonoNumero.label"
										default="Telefono Numero" /></span> <span class="property-value"
								aria-labelledby="telefonoNumero-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}"
										field="telefonoNumero" /></span></li>
						</g:if>



						<br />
						<div>
							<label class="control-label"> <g:message
									code="inscripcionInstitucion.datosInscripcion.label"
									class="control-label" />
							</label>

						</div>

						<g:if test="${inscripcionInstitucionInstance?.fechaInscripcion}">
							<li class="fieldcontain"><span id="fechaInscripcion-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.fechaInscripcion.label"
										default="Fecha Inscripcion" /></span> <span class="property-value"
								aria-labelledby="fechaInscripcion-label"><g:formatDate
										date="${inscripcionInstitucionInstance?.fechaInscripcion}" /></span>

							</li>
						</g:if>

						<g:if
							test="${inscripcionInstitucionInstance?.estadoInscripcionInstitucion}">
							<li class="fieldcontain"><span
								id="estadoInscripcionInstitucion-label" class="property-label"><g:message
										code="inscripcionInstitucion.estadoInscripcionInstitucion.label"
										default="Estado Inscripcion Institucion" /></span> <span
								class="property-value"
								aria-labelledby="estadoInscripcionInstitucion-label"><g:fieldValue
										bean="${inscripcionInstitucionInstance}"
										field="estadoInscripcionInstitucion" /></span></li>
						</g:if>



						<g:if test="${inscripcionInstitucionInstance?.fechaBaja}">
							<li class="fieldcontain"><span id="fechaBaja-label"
								class="property-label"><g:message
										code="inscripcionInstitucion.fechaBaja.label"
										default="Fecha Baja" /></span> <span class="property-value"
								aria-labelledby="fechaBaja-label"><g:formatDate
										date="${inscripcionInstitucionInstance?.fechaBaja}" /></span></li>
						</g:if>

						<g:if test="${inscripcionInstitucionInstance}">
							<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
								<div
									class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoInscripcionInstitucion', 'error')} required">
									<label for="tipoInscripcionInstitucion" class="control-label">
										<g:message
											code="inscripcionInstitucion.tipoInscripcionInstitucion.label"
											default="Tipo de Inscripcion" /> <span
										class="required-indicator">*</span>
									</label>
									<g:select name="tipoInscripcionInstitucion" disabled="true"
										from="${com.deukin.TipoInscripcionInstitucion?.values()}"
										keys="${com.deukin.TipoInscripcionInstitucion.values()*.name()}"
										required="true"
										value="${inscripcionInstitucionInstance?.tipoInscripcionInstitucion?.name()}" />

								</div>
							</sec:ifAnyGranted>

						</g:if>
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id"
								value="${inscripcionInstitucionInstance?.id}" />
							<g:actionSubmit class="btn btn-info"
								action="confirmarInscripcion"
								value="${message(code: 'default.button.confirmarInscripcion.label', default: 'Confirmar')}"
								onclick="return confirm('${message(code: 'default.button.confirmarInscripcion.confirm.message', default: '¿Esta seguro de querer activar el registro a la institución del alumno?')}');" />


							<g:link class="btn btn-info" action="edit"
								id="${inscripcionInstitucionInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>

							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
