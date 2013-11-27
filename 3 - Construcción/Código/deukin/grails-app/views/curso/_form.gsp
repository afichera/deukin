<%@ page import="com.deukin.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'codigo', 'error')}   row">
	<label for="codigo" class="control-label col-lg-2">
		<g:message code="curso.codigo.label" default="Codigo" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="codigo" maxlength="20" value="${cursoInstance?.codigo}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'configuracionesCursoDia', 'error')}   row">
	<label for="configuracionesCursoDia" class="control-label col-lg-2">
		<g:message code="curso.configuracionesCursoDia.label" default="Configuraciones Curso Dia" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${cursoInstance?.configuracionesCursoDia?}" var="c">
    <li><g:link controller="configuracionCursoDia" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="configuracionCursoDia" action="create" params="['curso.id': cursoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia')])}</g:link>
</li>
</ul>

	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cronogramaCarrera', 'error')} required  row">
	<label for="cronogramaCarrera" class="control-label col-lg-2">
		<g:message code="curso.cronogramaCarrera.label" default="Cronograma Carrera" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="cronogramaCarrera" name="cronogramaCarrera.id" from="${com.deukin.CronogramaCarrera.list()}" optionKey="id" required="" value="${cursoInstance?.cronogramaCarrera?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'estadoCurso', 'error')} required  row">
	<label for="estadoCurso" class="control-label col-lg-2">
		<g:message code="curso.estadoCurso.label" default="Estado Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="estadoCurso" from="${com.deukin.EstadoCurso?.values()}" keys="${com.deukin.EstadoCurso.values()*.name()}" required="" value="${cursoInstance?.estadoCurso?.name()}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'materia', 'error')} required  row">
	<label for="materia" class="control-label col-lg-2">
		<g:message code="curso.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${cursoInstance?.materia?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'periodoAcademico', 'error')} required  row">
	<label for="periodoAcademico" class="control-label col-lg-2">
		<g:message code="curso.periodoAcademico.label" default="Periodo Academico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="periodoAcademico" name="periodoAcademico.id" from="${com.deukin.PeriodoAcademico.list()}" optionKey="id" required="" value="${cursoInstance?.periodoAcademico?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'turno', 'error')} required  row">
	<label for="turno" class="control-label col-lg-2">
		<g:message code="curso.turno.label" default="Turno" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="turno" name="turno.id" from="${com.deukin.Turno.list()}" optionKey="id" required="" value="${cursoInstance?.turno?.id}" class="many-to-one"/>
	</div>
</div>

