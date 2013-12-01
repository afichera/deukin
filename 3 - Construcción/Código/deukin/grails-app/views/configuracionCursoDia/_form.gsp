<%@ page import="com.deukin.ConfiguracionCursoDia" %>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'curso', 'error')} required  row">
	<label for="curso" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:hiddenField id ="curso.id" name ="curso.id" value="${configuracionCursoDiaInstance?.curso?.id}"/>
	${configuracionCursoDiaInstance?.curso?.codigo}
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





<div class="row">
<label for="horaInicio" class="control-label col-lg-2"><g:message code="configuracionCursoDia.horaInicio.label" default="Hora Inicio" />*: </label>
<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaInicio', 'error')} required  ">
	<label for="horaInicio" class="control-label col-lg-1">
	hh: </label>
	<div class="col-lg-2">
	<g:select name="horaInicio" from="${0..23}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaInicio')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosInicio', 'error')} required  ">
	<label for="minutosInicio" class="control-label col-lg-1">
	mm: </label>
	<div class="col-lg-2">
	<g:select name="minutosInicio"  from="${0..59}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'minutosInicio')}"/>
	</div>
</div>
</div>
<div class="row">
<label for="horaFin" class="control-label col-lg-2"><g:message code="configuracionCursoDia.horaFin.label" default="Hora Fin" />*: </label>
<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaFin', 'error')} required  ">
	<label for="horaFin" class="control-label col-lg-1">
		hh: </label>
	<div class="col-lg-2">
	<g:select name="horaFin" from="${0..23}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaFin')}"/>
	</div>
</div>



<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosFin', 'error')} required  ">
	<label for="minutosFin" class="control-label col-lg-1 ">
		mm: </label>
	<div class="col-lg-2">
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








