<%@ page import="com.deukin.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'codigo', 'error')}   row">
	<label for="codigo" class="control-label col-lg-2">
		<g:message code="curso.codigo.label" default="Codigo" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="codigo" maxlength="20" value="${cursoInstance?.codigo}"/>
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

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'diaSemana', 'error')} required  row">
	<label for="diaSemana" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.diaSemana.label" default="Dia Semana" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="diaSemana" from="${com.deukin.DiaSemana?.values()}" keys="${com.deukin.DiaSemana.values()*.name()}" required="" value="${configuracionCursoDiaInstance?.diaSemana?.name()}"/>
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
<div class="row">
<label for="horaInicio" class="control-label col-lg-2"><g:message code="configuracionCursoDia.horaInicio.label" default="Hora Inicio" />*: </label>
<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaInicio', 'error')} required  ">
	<label for="horaInicio" class="control-label col-lg-1">
	hh: </label>
	<div class="col-lg-1">
	<g:select name="horaInicio" from="${0..23}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaInicio')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosInicio', 'error')} required  ">
	<label for="minutosInicio" class="control-label col-lg-1">
	mm: </label>
	<div class="col-lg-1">
	<g:select name="minutosInicio" from="${0..59}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'minutosInicio')}"/>
	</div>
</div>
</div>
<div class="row">
<label for="horaFin" class="control-label col-lg-2"><g:message code="configuracionCursoDia.horaFin.label" default="Hora Fin" />*: </label>
<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaFin', 'error')} required  ">
	<label for="horaFin" class="control-label col-lg-1">
		hh: </label>
	<div class="col-lg-1">
	<g:select name="horaFin" from="${0..23}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaFin')}"/>
	</div>
</div>



<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosFin', 'error')} required  ">
	<label for="minutosFin" class="control-label col-lg-1 ">
		mm: </label>
	<div class="col-lg-1">
	<g:select name="minutosFin" from="${0..59}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'minutosFin')}"/>
	</div>
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



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'periodoAcademico', 'error')} required  row">
	<label for="periodoAcademico" class="control-label col-lg-2">
		<g:message code="curso.periodoAcademico.label" default="Periodo Academico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="periodoAcademico" name="periodoAcademico.id" from="${com.deukin.PeriodoAcademico.list()}" optionKey="id" required="" value="${cursoInstance?.periodoAcademico?.id}" class="many-to-one"/>
	</div>
</div>



