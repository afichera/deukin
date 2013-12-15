<%@ page import="com.deukin.Alumno"%>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'usuario', 'error')} row">
	<label for="usuario" class="control-label col-lg-2"> <g:message
			code="alumno.usuario.label" default="Usuario" /><span
		class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10"><g:textField name="usuarioUsername"
		value="${alumnoInstance?.usuario?.username}" disabled="true" /></div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellido', 'error')}  row">
	<label for="apellido" class="control-label col-lg-2"> <g:message
			code="alumno.apellido.label" default="Apellido" /><span
		class="required-indicator">*</span>

	: </label>
	<div class="col-lg-10"><g:textField name="apellido" value="${alumnoInstance?.apellido}" /></div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')}  row">
	<label for="nombre" class="control-label col-lg-2"> <g:message
			code="alumno.nombre.label" default="Nombre" /><span
		class="required-indicator">*</span>

	: </label>
	<div class="col-lg-10"><g:textField name="nombre" value="${alumnoInstance?.nombre}" /></div>
</div>


<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'documento.tipoDocumento', 'error')} required row">
	<label for="documento.tipoDocumento" class="control-label col-lg-2"> <g:message
			code="documento.tipoDocumento.label" default="Tipo Documento" /> <span
		class="required-indicator">*</span>
	: </label>

		<div class="col-lg-10"><g:select name="documento.tipoDocumento"
			from="${com.deukin.TipoDocumento?.values()}"
			keys="${com.deukin.TipoDocumento.values()*.name()}" required="true"
			value="${alumnoInstance?.documento?.tipoDocumento?.name()}" /></div>




</div>


<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'documento.numero', 'error')} required row">
	<label for="documento.numero" class="control-label col-lg-2"> <g:message
			code="documento.numero.label" default="Numero" /> <span
		class="required-indicator">*</span>
	: </label>

	<div class="col-lg-10"><g:textField name="documento.numero" type="number"
		value="${alumnoInstance?.documento?.numero}" required="true"  onkeyup="soloNumeros(this,'#validaDocumento')"/>
	<span class="alert alert-error" id="validaDocumento" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	</div>



</div>


<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'fotoPerfil', 'error')}  row">
	<label for="fotoPerfil" class="control-label col-lg-2"> <g:message
			code="alumno.fotoPerfil.label" default="Foto Perfil" />
	: </label>
	<g:if test="${alumnoInstance?.fotoPerfil}">
		<div class="fieldcontain col-lg-10"><rendering:inlinePng
				bytes="${alumnoInstance.fotoPerfil}" height="200" /></div>
		<g:link controller="alumno" action="eliminarFotoPerfil"
			id="${alumnoInstance?.id}">Quitar
		</g:link>
	</g:if>



	<g:if test="${alumnoInstance?.fotoPerfil == null}">
		<div class="fieldcontain col-lg-10"><span id="fotoPerfil-label"
			class="property-label"></span> <img height="200"
			src="${resource(dir: 'images', file: 'buddyicon.jpg')}" alt="Grails" /></div>
	</g:if>
	<input type="file" id="fotoPerfil" name="fotoPerfil" />
</div>





