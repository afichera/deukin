<%@ page import="com.deukin.Docente" %>



<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'usuario', 'error')} ">
	<label for="usuario" class="control-label col-lg-2">
		<g:message code="docente.usuario.label" default="Usuario" />
		
	: </label>
	<div class="col-lg-10">
	<g:select id="usuario" name="usuario.id" from="${com.deukin.Usuario.list()}" optionKey="id" value="${docenteInstance?.usuario?.id}" class="many-to-one" noSelection="['null': '']"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'documento', 'error')} required">
	<label for="documento" class="control-label col-lg-2">
		<g:message code="docente.documento.label" default="Documento" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="documento" name="documento.id" from="${com.deukin.Documento.list()}" optionKey="id" required="" value="${docenteInstance?.documento?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'fotoPerfil', 'error')} ">
	<label for="fotoPerfil" class="control-label col-lg-2">
		<g:message code="docente.fotoPerfil.label" default="Foto Perfil" />
		
	: </label>
	<div class="col-lg-10">
	<input type="file" id="fotoPerfil" name="fotoPerfil" />
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'nombramiento', 'error')} ">
	<label for="nombramiento" class="control-label col-lg-2">
		<g:message code="docente.nombramiento.label" default="Nombramiento" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${docenteInstance?.nombramiento?}" var="n">
    <li><g:link controller="nombramiento" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="nombramiento" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'nombramiento.label', default: 'Nombramiento')])}</g:link>
</li>
</ul>

	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'curriculumDocente', 'error')} ">
	<label for="curriculumDocente" class="control-label col-lg-2">
		<g:message code="docente.curriculumDocente.label" default="Curriculum Docente" />
		
	: </label>
	<div class="col-lg-10">
	<g:select id="curriculumDocente" name="curriculumDocente.id" from="${com.deukin.Curriculum.list()}" optionKey="id" value="${docenteInstance?.curriculumDocente?.id}" class="many-to-one" noSelection="['null': '']"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'departamento', 'error')} ">
	<label for="departamento" class="control-label col-lg-2">
		<g:message code="docente.departamento.label" default="Departamento" />
		
	: </label>
	<div class="col-lg-10">
	<g:select id="departamento" name="departamento.id" from="${com.deukin.Departamento.list()}" optionKey="id" value="${docenteInstance?.departamento?.id}" class="many-to-one" noSelection="['null': '']"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'apellido', 'error')} ">
	<label for="apellido" class="control-label col-lg-2">
		<g:message code="docente.apellido.label" default="Apellido" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="apellido" value="${docenteInstance?.apellido}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'contacto', 'error')} required">
	<label for="contacto" class="control-label col-lg-2">
		<g:message code="docente.contacto.label" default="Contacto" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="contacto" name="contacto.id" from="${com.deukin.Contacto.list()}" optionKey="id" required="" value="${docenteInstance?.contacto?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'curriculums', 'error')} ">
	<label for="curriculums" class="control-label col-lg-2">
		<g:message code="docente.curriculums.label" default="Curriculums" />
		
	: </label>
	<div class="col-lg-10">
	<g:select name="curriculums" from="${com.deukin.Curriculum.list()}" multiple="multiple" optionKey="id" size="5" value="${docenteInstance?.curriculums*.id}" class="many-to-many"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'curriculumsAdjuntos', 'error')} ">
	<label for="curriculumsAdjuntos" class="control-label col-lg-2">
		<g:message code="docente.curriculumsAdjuntos.label" default="Curriculums Adjuntos" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${docenteInstance?.curriculumsAdjuntos?}" var="c">
    <li><g:link controller="curriculumAdjunto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curriculumAdjunto" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')])}</g:link>
</li>
</ul>

	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'nombre', 'error')} ">
	<label for="nombre" class="control-label col-lg-2">
		<g:message code="docente.nombre.label" default="Nombre" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="nombre" value="${docenteInstance?.nombre}"/>
	</div>
</div>

