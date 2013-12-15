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





