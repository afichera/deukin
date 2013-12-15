<%@ page import="com.deukin.Docente" %>



<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'usuario', 'error')} row">
	<label for="usuario" class="control-label col-lg-2"> <g:message
			code="docente.usuario.label" default="Usuario" /><span
		class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10"><g:textField name="usuarioUsername"
		value="${docenteInstance?.usuario?.username}" disabled="true" /></div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'apellido', 'error')} row">
	<label for="apellido" class="control-label col-lg-2"> <g:message
			code="docente.apellido.label" default="Apellido" /><span
		class="required-indicator">*</span>

	: </label>
	<div class="col-lg-10"><g:textField name="apellido" value="${docenteInstance?.apellido}" /></div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'nombre', 'error')} row">
	<label for="nombre" class="control-label col-lg-2"> <g:message
			code="docente.nombre.label" default="Nombre" /><span
		class="required-indicator">*</span>

	: </label>
	<div class="col-lg-10"><g:textField name="nombre" value="${docenteInstance?.nombre}" /></div>
</div>


<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'documento.tipoDocumento', 'error')} required row">
	<label for="documento.tipoDocumento" class="control-label col-lg-2"> <g:message
			code="documento.tipoDocumento.label" default="Tipo Documento" /> <span
		class="required-indicator">*</span>
	: </label>

		<div class="col-lg-10"><g:select name="documento.tipoDocumento"
			from="${com.deukin.TipoDocumento?.values()}"
			keys="${com.deukin.TipoDocumento.values()*.name()}" required="true"
			value="${docenteInstance?.documento?.tipoDocumento?.name()}" /></div>



</div>


<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'documento.numero', 'error')} required row">
	<label for="documento.numero" class="control-label col-lg-2"> <g:message
			code="documento.numero.label" default="Numero" /> <span
		class="required-indicator">*</span>
	: </label>

	<div class="col-lg-10"><g:textField name="documento.numero" type="number"
		value="${docenteInstance?.documento?.numero}" required="true" onkeyup="soloNumeros(this,'#validaDocumento')"/>
	<span class="alert alert-error" id="validaDocumento" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	</div>
	

</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'departamento', 'error')} required row">
	<label for="departamento" class="control-label col-lg-2">
		<g:message code="docente.departamento.label" default="Departamento" /><span
		class="required-indicator">*</span>
	: </label>
	

		<div class="col-lg-10"><g:select id="departamento" name="departamento.id" from="${com.deukin.Departamento.list()}" optionKey="id" value="${docenteInstance?.departamento?.id}"  noSelection="['null': '']"/></div>	



	
</div>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'fotoPerfil', 'error')} row">
	<label for="fotoPerfil" class="control-label col-lg-2"> <g:message
			code="docente.fotoPerfil.label" default="Foto Perfil" />
	: </label>
	<g:if test="${docenteInstance?.fotoPerfil}">
		<div class="fieldcontain col-lg-10"><rendering:inlinePng
				bytes="${docenteInstance.fotoPerfil}" height="200" /></div>
		<g:link controller="alumno" action="eliminarFotoPerfil"
			id="${docenteInstance?.id}">Quitar
		</g:link>
	</g:if>



	<g:if test="${docenteInstance?.fotoPerfil == null}">
		<div class="fieldcontain col-lg-10"><span id="fotoPerfil-label"
			class="property-label"></span> <img height="200"
			src="${resource(dir: 'images', file: 'buddyicon.jpg')}" alt="Grails" /></div>
	</g:if>
	<input type="file" id="fotoPerfil" name="fotoPerfil" />
</div>
