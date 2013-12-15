<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Deukin Inscripción - Paso 2</title>
<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
</head>
<body>
	<div class="body">
		<h1>
			<g:message code="inscripcionInstitucion.titulos.datosContacto" />
		</h1>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<g:form action="pasos">

						<div class="row">
							<label for="calle" class="control-label col-lg-2"> <g:message
									code="inscripcionInstitucion.calle.label" default="Calle" /> <span
								class="required-indicator">*</span> :
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="calle"
									value="${inscripcion?.calle}" maxlength="100" required="true" />


								<g:hasErrors bean="${inscripcion}" field="calle">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="calle"
											class="alert alert-danger" />
									</div>
								</g:hasErrors>
							</div>
						</div>


						<div class="row">
							<label for="calleNumero" class="control-label col-lg-2">
								<g:message code="inscripcionInstitucion.calleNumero.label"
									default="Número" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="calleNumero"
									type="number" value="${inscripcion?.calleNumero}"
									required="true"
									onkeyup="soloNumeros(this,'#validaNumeroCalle')" />
								<span class="alert alert-error" id="validaNumeroCalle"
									style="display: none;"> <g:message
										code="invalid.soloNumeros" /></span>



								<g:hasErrors bean="${inscripcion}" field="calleNumero">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="calleNumero" />
									</div>
								</g:hasErrors>
							</div>
						</div>

						<div class="row">
							<label for="localidad" class="control-label col-lg-2"> <g:message
									code="inscripcionInstitucion.localidad.label"
									default="Localidad" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="localidad"
									value="${inscripcion?.localidad}" maxlength="100"
									required="true" />


								<g:hasErrors bean="${inscripcion}" field="localidad">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="localidad" />
									</div>
								</g:hasErrors>
							</div>
						</div>


						<div class="row">
							<label for="codigoPostal" class="control-label col-lg-2">
								<g:message code="inscripcionInstitucion.codigoPostal.label"
									default="Código Postal" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField name="codigoPostal" type="number" required="true"
									maxlength="4" value="${inscripcion?.codigoPostal}"
									onkeyup="soloNumeros(this,'#validaCodigo')" />
								<span class="alert alert-error" id="validaCodigo"
									style="display: none;"> <g:message
										code="invalid.soloNumeros" /></span>


								<g:hasErrors bean="${inscripcion}" field="codigoPostal">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="codigoPostal" />
									</div>
								</g:hasErrors>
							</div>
						</div>


						<div class="row">
							<label for="observaciones" class="control-label col-lg-2">
								<g:message code="inscripcionInstitucion.observaciones.label"
									default="Observaciones" /> :
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="observaciones"
									value="${inscripcion?.observaciones}" />


								<g:hasErrors bean="${inscripcion}" field="observaciones">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="observaciones" />
									</div>
								</g:hasErrors>
							</div>
						</div>


						<div class="row">
							<label for="tipoTelefono" class="control-label col-lg-2">
								<g:message code="inscripcionInstitucion.tipoTelefono.label"
									default="Tipo Teléfono" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:select class="form-control" name="tipoTelefono"
									from="${com.deukin.TipoTelefono?.values()}"
									keys="${com.deukin.TipoTelefono.values()*.name()}" required=""
									value="${inscripcion?.tipoTelefono?.name()}" />



								<g:hasErrors bean="${inscripcion}" field="tipoTelefono">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="tipoTelefono" />
									</div>
								</g:hasErrors>
							</div>
						</div>

						<div class="row">
							<label for="telefonoNumero" class="control-label col-lg-2">
								<g:message code="inscripcionInstitucion.telefonoNumero.label"
									default="Teléfono" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="telefonoNumero"
									maxlength="20" required="true"
									value="${inscripcion?.telefonoNumero}" />


								<g:hasErrors bean="${inscripcion}" field="telefonoNumero">
									<div class="errors alert alert-danger">
										<g:renderErrors bean="${inscripcion}" field="telefonoNumero" />
									</div>
								</g:hasErrors>
							</div>
						</div>



<g:submitButton class="btn btn-default" formnovalidate="true" name="anterior" value="${message(code: 'inscripcionInstitucion.botones.anterior', default: 'Anterior')}" />
						<g:submitButton name="siguiente" class="btn btn-primary"
							value="${message(code: 'inscripcionInstitucion.botones.FinalizarInscripcion', default: 'Finalizar Inscripcion')}" />

					</g:form>
				</div>
			</div>
		</div>

	</div>
</body>
</html>