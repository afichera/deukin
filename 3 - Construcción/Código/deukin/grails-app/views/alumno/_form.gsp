<%@ page import="com.deukin.Alumno"%>

<div
	class="row">
	<label for="usuario" class="control-label col-lg-2"> <g:message
			code="alumno.usuario.label" default="Usuario" />
	: </label>
	<div class="col-lg-10">${alumnoInstance?.usuario?.username}</div>
</div>

<div
	class="row">
	<label for="apellido" class="control-label col-lg-2"> <g:message
			code="alumno.apellido.label" default="Apellido" />

	: </label>
	<div class="col-lg-10">${alumnoInstance?.apellido}</div>
</div>

<div
	class="row">
	<label for="nombre" class="control-label col-lg-2"> <g:message
			code="alumno.nombre.label" default="Nombre" />

	: </label>
	<div class="col-lg-10">${alumnoInstance?.nombre}</div>
</div>


<div
	class="row">
	<label for="documento.tipoDocumento" class="control-label col-lg-2"> <g:message
			code="documento.tipoDocumento.label" default="Tipo Documento" />
	: </label>

		<div class="col-lg-10">${alumnoInstance?.documento?.tipoDocumento?.name()}</div>




</div>


<div
	class="row">
	<label for="documento.numero" class="control-label col-lg-2"> <g:message
			code="documento.numero.label" default="Numero" />
	: </label>

	<div class="col-lg-10">${alumnoInstance?.documento?.numero}
	</div>



</div>

<div class="row">
<label for="calle" class="control-label col-lg-2"> <g:message
									code="domicilio.calle.label" default="Calle" /> <span
								class="required-indicator">*</span> :
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="contacto.domicilio.calle"
									value="${alumnoInstance?.contacto?.domicilio?.calle}" maxlength="100" required="true" />


								
							</div>
						</div>


						<div class="row">
							<label for="numero" class="control-label col-lg-2">
								<g:message code="domicilio.numero.label"
									default="Número" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="contacto.domicilio.numero"
									type="number" value="${alumnoInstance?.contacto?.domicilio?.numero}"
									required="true"
									onkeyup="soloNumeros(this,'#validaNumeroCalle')" />
								<span class="alert alert-error" id="validaNumeroCalle"
									style="display: none;"> <g:message
										code="invalid.soloNumeros" /></span>



							
							</div>
						</div>

						<div class="row">
							<label for="localidad" class="control-label col-lg-2"> <g:message
									code="domicilio.localidad.label"
									default="Localidad" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="contacto.domicilio.localidad"
									value="${alumnoInstance?.contacto?.domicilio?.localidad}" maxlength="100"
									required="true" />


							</div>
						</div>


						<div class="row">
							<label for="codigoPostal" class="control-label col-lg-2">
								<g:message code="domicilio.codigoPostal.label"
									default="Código Postal" /> <span class="required-indicator">*</span>
								:
							</label>
							<div class="col-lg-10">
								<g:textField name="contacto.domicilio.codigoPostal" type="number" required="true"
									maxlength="4" value="${alumnoInstance?.contacto?.domicilio?.codigoPostal}"
									onkeyup="soloNumeros(this,'#validaCodigo')" />
								<span class="alert alert-error" id="validaCodigo"
									style="display: none;"> <g:message
										code="invalid.soloNumeros" /></span>


								
							</div>
						</div>


						<div class="row">
							<label for="observaciones" class="control-label col-lg-2">
								<g:message code="domicilio.observaciones.label"
									default="Observaciones" /> :
							</label>
							<div class="col-lg-10">
								<g:textField class="form-control" name="contacto.domicilio.observaciones"
									value="${alumnoInstance?.contacto?.domicilio?.observaciones}" />


								
							</div>
						</div>
<div class="row"><div class="col-lg-12">
<em><g:message code="aclaracionTelefonos.label" default="" /></em>

</div></div>
<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'fotoPerfil', 'error')}  row">
	<label for="fotoPerfil" class="control-label col-lg-2"> <g:message
			code="alumno.fotoPerfil.label" default="Foto Perfil" />
	: </label>
	<div class="col-lg-2 foto">
	<g:if test="${alumnoInstance?.fotoPerfil}">
		<div class="fieldcontain col-lg-10"><rendering:inlinePng
				bytes="${alumnoInstance.fotoPerfil}" width="165" /></div>
		<g:link controller="alumno" action="eliminarFotoPerfil"
			id="${alumnoInstance?.id}">Quitar
		</g:link>
	</g:if>



	<g:if test="${alumnoInstance?.fotoPerfil == null}">
		<div class="fieldcontain col-lg-10"><span id="fotoPerfil-label"
			class="property-label"></span> <img width="165"
			src="${resource(dir: 'images', file: 'buddyicon.jpg')}" alt="Foto de Perfil" /></div>
	</g:if>
	</div><div class="col-lg-8">
	<input type="file" id="fotoPerfil" name="fotoPerfil" /></div>
</div>





