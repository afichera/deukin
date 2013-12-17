

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
					<g:message code="inscripcionInstitucion.list.label" />
				</g:link></li>
			<li><g:link class="create" controller="inscripcionInstitucion">
					<g:message code="inscripcionInstitucion.new.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-inscripcionInstitucion" class="content scaffold-show"
		role="main">
		<h1>
			<g:message code="inscripcionInstitucion.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">



					<div class="fieldcontain row">
						<div class="control-label col-lg-12">
							<h3>
								<g:message code="inscripcionInstitucion.datosInscripcion.label"
									class="control-label col-lg-2" />
								:
							</h3>

						</div>
						<label id="fechaInscripcion-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.fechaInscripcion.label"
								default="Fecha Inscripcion" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="fechaInscripcion-label">
							<g:if test="${inscripcionInstitucionInstance?.fechaInscripcion}">
								<g:formatDate
									date="${inscripcionInstitucionInstance?.fechaInscripcion}" />
							</g:if>
						</div>

					</div>



					<div class="fieldcontain row">
						<label id="estadoInscripcionInstitucion-label"
							class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.estadoInscripcionInstitucion.label"
								default="Estado Inscripcion Institucion" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="estadoInscripcionInstitucion-label">
							<g:if
								test="${inscripcionInstitucionInstance?.estadoInscripcionInstitucion}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="estadoInscripcionInstitucion" />
							</g:if>
						</div>
					</div>




					<g:if test="${inscripcionInstitucionInstance?.fechaBaja}">
						<div class="fieldcontain row">
							<label id="fechaBaja-label" class="property-label col-lg-2"><g:message
									code="inscripcionInstitucion.fechaBaja.label"
									default="Fecha Baja" />: </label>
							<div class="property-value col-lg-10"
								aria-labelledby="fechaBaja-label">
								<g:formatDate
									date="${inscripcionInstitucionInstance?.fechaBaja}" />
							</div>
						</div>

					</g:if>
					<div class="fieldcontain row">
						<label for="tipoInscripcionInstitucion"
							class="control-label col-lg-2"> <g:message
								code="inscripcionInstitucion.tipoInscripcionInstitucion.label"
								default="Tipo de Inscripcion" /> :
						</label>
						<div class="property-value col-lg-10">
							<g:if test="${inscripcionInstitucionInstance}">
								${inscripcionInstitucionInstance?.tipoInscripcionInstitucion?.name()}
							</g:if>
						</div>

					</div>





					<div class="fieldcontain row">
						<div class="control-label col-lg-12">
							<h3>
								<g:message code="inscripcionInstitucion.datosPersonales.label" />
								:
							</h3>

						</div>
						<label id="usuarioRegistro-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.usuarioRegistro.label"
								default="Usuario Registro" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="usuarioRegistro-label">
							<g:if test="${inscripcionInstitucionInstance?.usuarioRegistro}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="usuarioRegistro.username"></g:fieldValue>
							</g:if>
						</div>
					</div>



					<div class="fieldcontain row">
						<label id="apellido-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.apellido.label" default="Apellido" />:
						</label>
						<div class="property-value col-lg-10"
							aria-labelledby="apellido-label">
							<g:if test="${inscripcionInstitucionInstance?.apellido}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="apellido" />
							</g:if>
						</div>
					</div>



					<div class="fieldcontain row">
						<label id="nombre-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.nombre.label" default="Nombre" />:
						</label>

						<div class="property-value col-lg-10"
							aria-labelledby="nombre-label">
							<g:if test="${inscripcionInstitucionInstance?.nombre}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="nombre" />
							</g:if>
						</div>
					</div>


					<div class="fieldcontain row">
						<label id="fechaNacimiento-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.fechaNacimiento.label"
								default="Fecha Nacimiento" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="fechaNacimiento-label">
							<g:if test="${inscripcionInstitucionInstance?.fechaNacimiento}">
								<g:formatDate
									date="${inscripcionInstitucionInstance?.fechaNacimiento}" />
							</g:if>
						</div>

					</div>



					<div class="fieldcontain row">
						<label id="sexo-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.sexo.label" default="Sexo" />: </label>
						<div class="property-value col-lg-10" aria-labelledby="sexo-label">
							<g:if test="${inscripcionInstitucionInstance?.sexo}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="sexo" />
							</g:if>
						</div>
					</div>



					<div class="fieldcontain row">
						<label id="tipoYNroDocumento-label"
							class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.tipoYNroDocumento.label"
								default="Tipo y Nro. de Documento" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="tipoDocumento-label">
							<g:if test="${inscripcionInstitucionInstance?.tipoDocumento}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="tipoDocumento" />

							</g:if>

							<g:if test="${inscripcionInstitucionInstance?.documentoNumero}">


								${inscripcionInstitucionInstance?.numeroDocumentoAsText()}
							</g:if>
						</div>
					</div>


					<br />


					<div class="fieldcontain row">
						<div class="control-label col-lg-12">
							<h3>
								<g:message code="inscripcionInstitucion.titulos.datosContacto" />
								:
							</h3>

						</div>
						<label id="calle-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.calle.label" default="Calle" />: </label>

						<div class="property-value col-lg-10"
							aria-labelledby="calle-label">
							<g:if test="${inscripcionInstitucionInstance?.calle}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="calle" />
							</g:if>
						</div>
					</div>


					<div class="fieldcontain row">
						<label id="calleNumero-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.calleNumero.label"
								default="Calle Numero" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="calleNumero-label">
							<g:if test="${inscripcionInstitucionInstance?.calleNumero}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="calleNumero" />
							</g:if>
						</div>

					</div>



					<div class="fieldcontain row">
						<label id="localidad-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.localidad.label"
								default="Localidad" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="localidad-label">
							<g:if test="${inscripcionInstitucionInstance?.localidad}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="localidad" />
							</g:if>
						</div>

					</div>


					<div class="fieldcontain row">
						<label id="codigoPostal-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.codigoPostal.label"
								default="Codigo Postal" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="codigoPostal-label">
							<g:if test="${inscripcionInstitucionInstance?.codigoPostal}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="codigoPostal" />
							</g:if>
						</div>

					</div>



					<div class="fieldcontain row">
						<label id="observaciones-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.observaciones.label"
								default="Observaciones" />: </label>
						<div class="property-value col-lg-10"
							aria-labelledby="observaciones-label">
							<g:if test="${inscripcionInstitucionInstance?.observaciones}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="observaciones" />
							</g:if>
						</div>

					</div>


					<div class="fieldcontain row">
						<label id="tipoYNroTelefono-label" class="property-label col-lg-2"><g:message
								code="inscripcionInstitucion.tipoYNroTelefono.label"
								default="Tipo y Nro. de Teléfono" />: </label>
						<div class="col-lg-10">
							<g:if test="${inscripcionInstitucionInstance?.tipoTelefono}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="tipoTelefono" />
							</g:if>









							<g:if test="${inscripcionInstitucionInstance?.telefonoNumero}">
								<g:fieldValue bean="${inscripcionInstitucionInstance}"
									field="telefonoNumero" />
							</g:if>
						</div>


					</div>


					<br />



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
