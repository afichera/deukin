<%@ page import="com.deukin.CronogramaCarrera" %>



<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'cicloLectivo', 'error')} required  row">
	<label for="cicloLectivo" class="control-label col-lg-2">
		<g:message code="cronogramaCarrera.cicloLectivo.label" default="Ciclo Lectivo" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="cicloLectivo" name="cicloLectivo.id" from="${com.deukin.CicloLectivo.list()}" optionKey="id" required="" value="${cronogramaCarreraInstance?.cicloLectivo?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'cursos', 'error')}   row">
	<label for="cursos" class="control-label col-lg-2">
		<g:message code="cronogramaCarrera.cursos.label" default="Cursos" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${cronogramaCarreraInstance?.cursos?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['cronogramaCarrera.id': cronogramaCarreraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'planEstudio', 'error')} required  row">
	<label for="planEstudio" class="control-label col-lg-2">
		<g:message code="cronogramaCarrera.planEstudio.label" default="Plan Estudio" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="planEstudio" name="planEstudio.id" from="${com.deukin.PlanEstudio.list()}" optionKey="id" required="" value="${cronogramaCarreraInstance?.planEstudio?.id}" class="many-to-one"/>
	</div>
</div>

