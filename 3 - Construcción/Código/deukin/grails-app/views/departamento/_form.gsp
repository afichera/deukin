<%@ page import="com.deukin.Departamento" %>



<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'nombre', 'error')}   row">
	<label for="nombre" class="control-label col-lg-2">
		<g:message code="departamento.nombre.label" default="Nombre" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="nombre" maxlength="200" value="${departamentoInstance?.nombre}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'mision', 'error')}   row">
	<label for="mision" class="control-label col-lg-2">
		<g:message code="departamento.mision.label" default="Mision" />
		
	: </label>
	<div class="col-lg-10">
	<g:textArea name="mision" cols="40" rows="5" maxlength="5000" value="${departamentoInstance?.mision}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'vision', 'error')}   row">
	<label for="vision" class="control-label col-lg-2">
		<g:message code="departamento.vision.label" default="Vision" />
		
	: </label>
	<div class="col-lg-10">
	<g:textArea name="vision" cols="40" rows="5" maxlength="5000" value="${departamentoInstance?.vision}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'contacto', 'error')}   row">
	<label for="contacto" class="control-label col-lg-2">
		<g:message code="departamento.contacto.label" default="Contacto" />
		
	: </label>
	<div class="col-lg-10">
	<g:select id="contacto" name="contacto.id" from="${com.deukin.Contacto.list()}" optionKey="id" value="${departamentoInstance?.contacto?.id}" class="many-to-one" noSelection="['null': '']"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'autoridades', 'error')}   row">
	<label for="autoridades" class="control-label col-lg-2">
		<g:message code="departamento.autoridades.label" default="Autoridades" />
		
	: </label>
	<div class="col-lg-10">
	<g:select name="autoridades" from="${com.deukin.Autoridad.list()}" multiple="multiple" optionKey="id" size="5" value="${departamentoInstance?.autoridades*.id}" class="many-to-many"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'carreras', 'error')}   row">
	<label for="carreras" class="control-label col-lg-2">
		<g:message code="departamento.carreras.label" default="Carreras" />
		
	: </label>
	<div class="col-lg-10">
	<g:select name="carreras" from="${com.deukin.Carrera.list()}" multiple="multiple" optionKey="id" size="5" value="${departamentoInstance?.carreras*.id}" class="many-to-many"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: departamentoInstance, field: 'docentes', 'error')}   row">
	<label for="docentes" class="control-label col-lg-2">
		<g:message code="departamento.docentes.label" default="Docentes" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${departamentoInstance?.docentes?}" var="d">
    <li><g:link controller="docente" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="docente" action="create" params="['departamento.id': departamentoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'docente.label', default: 'Docente')])}</g:link>
</li>
</ul>

	</div>
</div>

