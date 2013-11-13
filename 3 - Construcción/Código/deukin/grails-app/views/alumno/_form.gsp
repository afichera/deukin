<%@ page import="com.deukin.Alumno" %>



<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'usuario', 'error')} ">
	<label for="usuario" class="control-label">
		<g:message code="alumno.usuario.label" default="Usuario" />
		
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.deukin.Usuario.list()}" optionKey="id" value="${alumnoInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'documento', 'error')} required">
	<label for="documento" class="control-label">
		<g:message code="alumno.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="documento" name="documento.id" from="${com.deukin.Documento.list()}" optionKey="id" required="" value="${alumnoInstance?.documento?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'fotoPerfil', 'error')} ">
	<label for="fotoPerfil" class="control-label">
		<g:message code="alumno.fotoPerfil.label" default="Foto Perfil" />
		
	</label>
	<input type="file" id="fotoPerfil" name="fotoPerfil" />
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'apellido', 'error')} ">
	<label for="apellido" class="control-label">
		<g:message code="alumno.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${alumnoInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'contacto', 'error')} required">
	<label for="contacto" class="control-label">
		<g:message code="alumno.contacto.label" default="Contacto" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="contacto" name="contacto.id" from="${com.deukin.Contacto.list()}" optionKey="id" required="" value="${alumnoInstance?.contacto?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'curriculums', 'error')} ">
	<label for="curriculums" class="control-label">
		<g:message code="alumno.curriculums.label" default="Curriculums" />
		
	</label>
	<g:select name="curriculums" from="${com.deukin.Curriculum.list()}" multiple="multiple" optionKey="id" size="5" value="${alumnoInstance?.curriculums*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'curriculumsAdjuntos', 'error')} ">
	<label for="curriculumsAdjuntos" class="control-label">
		<g:message code="alumno.curriculumsAdjuntos.label" default="Curriculums Adjuntos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${alumnoInstance?.curriculumsAdjuntos?}" var="c">
    <li><g:link controller="curriculumAdjunto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curriculumAdjunto" action="create" params="['alumno.id': alumnoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: alumnoInstance, field: 'nombre', 'error')} ">
	<label for="nombre" class="control-label">
		<g:message code="alumno.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${alumnoInstance?.nombre}"/>
</div>

