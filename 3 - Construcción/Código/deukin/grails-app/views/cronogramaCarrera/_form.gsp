<%@ page import="com.deukin.CronogramaCarrera" %>



<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'cicloLectivo', 'error')} required">
	<label for="cicloLectivo" class="control-label">
		<g:message code="cronogramaCarrera.cicloLectivo.label" default="Ciclo Lectivo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cicloLectivo" name="cicloLectivo.id" from="${com.deukin.CicloLectivo.list()}" optionKey="id" required="" value="${cronogramaCarreraInstance?.cicloLectivo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'cursos', 'error')} ">
	<label for="cursos" class="control-label">
		<g:message code="cronogramaCarrera.cursos.label" default="Cursos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${cronogramaCarreraInstance?.cursos?}" var="c">
    <li><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="curso" action="create" params="['cronogramaCarrera.id': cronogramaCarreraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'curso.label', default: 'Curso')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'periodosAcademicos', 'error')} ">
	<label for="periodosAcademicos" class="control-label">
		<g:message code="cronogramaCarrera.periodosAcademicos.label" default="Periodos Academicos" />
		
	</label>
	<g:select name="periodosAcademicos" from="${com.deukin.PeriodoAcademico.list()}" multiple="multiple" optionKey="id" size="5" value="${cronogramaCarreraInstance?.periodosAcademicos*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: cronogramaCarreraInstance, field: 'planEstudio', 'error')} required">
	<label for="planEstudio" class="control-label">
		<g:message code="cronogramaCarrera.planEstudio.label" default="Plan Estudio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="planEstudio" name="planEstudio.id" from="${com.deukin.PlanEstudio.list()}" optionKey="id" required="" value="${cronogramaCarreraInstance?.planEstudio?.id}" class="many-to-one"/>
</div>

