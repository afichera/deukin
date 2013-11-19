<%@ page import="com.deukin.Alumno"%>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'usuario', 'error')} ">
	<label for="usuario" class="control-label"> <g:message
			code="alumno.usuario.label" default="Usuario" /><span
		class="required-indicator">*</span>
	</label>
	<g:textField name="usuarioUsername"
		value="${alumnoInstance?.usuario?.username}" disabled="true" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellido', 'error')} ">
	<label for="apellido" class="control-label"> <g:message
			code="alumno.apellido.label" default="Apellido" /><span
		class="required-indicator">*</span>

	</label>
	<g:textField name="apellido" value="${alumnoInstance?.apellido}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} ">
	<label for="nombre" class="control-label"> <g:message
			code="alumno.nombre.label" default="Nombre" /><span
		class="required-indicator">*</span>

	</label>
	<g:textField name="nombre" value="${alumnoInstance?.nombre}" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'documento.tipoDocumento', 'error')} required">
	<label for="documento.tipoDocumento" class="control-label"> <g:message
			code="documento.tipoDocumento.label" default="Tipo Documento" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select name="documento.tipoDocumento"
		from="${com.deukin.TipoDocumento?.values()}"
		keys="${com.deukin.TipoDocumento.values()*.name()}" required="true"
		value="${alumnoInstance?.documento?.tipoDocumento?.name()}" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'documento.numero', 'error')} required">
	<label for="documento.numero" class="control-label"> <g:message
			code="documento.numero.label" default="Numero" /> <span
		class="required-indicator">*</span>
	</label>
	<g:field name="documento.numero" type="number"
		value="${alumnoInstance?.documento?.numero}" required="true" />

</div>


<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'fotoPerfil', 'error')} ">
	<label for="fotoPerfil" class="control-label"> <g:message
			code="alumno.fotoPerfil.label" default="Foto Perfil" />
	</label>
	<g:if test="${alumnoInstance?.fotoPerfil}">
		<li class="fieldcontain"><rendering:inlinePng
				bytes="${alumnoInstance.fotoPerfil}" height="200" /></li>
		<g:link
				controller="alumno" action="eliminarFotoPerfil"
				id="${alumnoInstance?.id}">Quitar
		</g:link>
	</g:if>



	<g:if test="${alumnoInstance?.fotoPerfil == null}">
		<li class="fieldcontain"><span id="fotoPerfil-label"
			class="property-label"><g:message
					code="alumno.fotoPerfil.label" default="Foto Perfil" /></span> <img
			height="200" src="${resource(dir: 'images', file: 'buddyicon.jpg')}"
			alt="Grails" /></li>
	</g:if>
	<input type="file" id="fotoPerfil" name="fotoPerfil" }"/>
</div>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'curriculums', 'error')} ">
	<label for="curriculums" class="control-label"> <g:message
			code="alumno.curriculums.label" default="Curriculums" />

	</label>
	<g:select name="curriculums" from="${com.deukin.Curriculum.list()}"
		multiple="multiple" optionKey="id" size="5"
		value="${alumnoInstance?.curriculums*.id}" class="many-to-many" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'curriculumsAdjuntos', 'error')} ">
	<label for="curriculumsAdjuntos" class="control-label"> <g:message
			code="alumno.curriculumsAdjuntos.label"
			default="Curriculums Adjuntos" />

	</label>

	<ul class="one-to-many">
		<g:each in="${alumnoInstance?.curriculumsAdjuntos?}" var="c">
			<li><g:link controller="curriculumAdjunto" action="show"
					id="${c.id}">
					${c?.nombreArchivo()}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="curriculumAdjunto"
				action="create" params="['alumno.id': alumnoInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')])}
			</g:link></li>
	</ul>

</div>


