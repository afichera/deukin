<%@ page import="com.deukin.ConfiguracionCursoDia" %>



<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaInicio', 'error')} required  row">
	<label for="horaInicio" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.horaInicio.label" default="Hora Inicio" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="horaInicio" from="${0..23}" class="range" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaInicio')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaFin', 'error')} required  row">
	<label for="horaFin" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.horaFin.label" default="Hora Fin" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="horaFin" from="${0..23}" class="range" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaFin')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosInicio', 'error')} required  row">
	<label for="minutosInicio" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.minutosInicio.label" default="Minutos Inicio" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="minutosInicio" from="${0..59}" class="range" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'minutosInicio')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosFin', 'error')} required  row">
	<label for="minutosFin" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.minutosFin.label" default="Minutos Fin" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="minutosFin" from="${0..59}" class="range" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'minutosFin')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'asignacionesDocenteCurso', 'error')}   row">
	<label for="asignacionesDocenteCurso" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.asignacionesDocenteCurso.label" default="Asignaciones Docente Curso" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${configuracionCursoDiaInstance?.asignacionesDocenteCurso?}" var="a">
    <li><g:link controller="asignacionDocenteCurso" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asignacionDocenteCurso" action="create" params="['configuracionCursoDia.id': configuracionCursoDiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso')])}</g:link>
</li>
</ul>

	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'curso', 'error')} required  row">
	<label for="curso" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="curso" name="curso.id" from="${com.deukin.Curso.list()}" optionKey="id" required="" value="${configuracionCursoDiaInstance?.curso?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'diaSemana', 'error')} required  row">
	<label for="diaSemana" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.diaSemana.label" default="Dia Semana" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="diaSemana" from="${com.deukin.DiaSemana?.values()}" keys="${com.deukin.DiaSemana.values()*.name()}" required="" value="${configuracionCursoDiaInstance?.diaSemana?.name()}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'espacioFisico', 'error')} required  row">
	<label for="espacioFisico" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.espacioFisico.label" default="Espacio Fisico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="espacioFisico" name="espacioFisico.id" from="${com.deukin.EspacioFisico.list()}" optionKey="id" required="" value="${configuracionCursoDiaInstance?.espacioFisico?.id}" class="many-to-one"/>
	</div>
</div>

