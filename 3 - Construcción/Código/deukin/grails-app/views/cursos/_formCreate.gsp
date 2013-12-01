<%@ page import="com.deukin.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'codigo', 'error')}   row">
	<label for="codigo" class="control-label col-lg-2">
		<g:message code="curso.codigo.label" default="Codigo" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField class="form-control" name="codigo" maxlength="20" value="${cursoInstance?.codigo}" autofocus=""/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'materia', 'error')} required  row">
	<label for="materia" class="control-label col-lg-2">
		<g:message code="curso.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
<%--	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${cursoInstance?.materia?.id}" class="many-to-one form-control"/>--%>
	
	
	<g:hiddenField id ="materia.id" name ="materia.id" value="${cursoInstance?.materia?.id}"/>
	<richui:autoComplete name="materiaNombre" minQueryLength="2" onItemSelect="eligeMateria(id)" value="${cursoInstance?.materia}"
		action="${createLinkTo('dir': 'cursos/searchMateriasCoordinador')}" forceSelection="false" class="form-control"/>
	
	</div>
</div>
<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'turno', 'error')} required  row">
	<label for="turno" class="control-label col-lg-2">
		<g:message code="curso.turno.label" default="Turno" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="turno" name="turno.id" from="${com.deukin.Turno.list()}" optionKey="id" required="" value="${cursoInstance?.turno?.id}" class="many-to-one form-control"/>
	</div>
</div>
<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'diaSemana', 'error')} required  row">
	<label for="diaSemana" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.diaSemana.label" default="Dia Semana" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="diaSemana" from="${com.deukin.DiaSemana?.values()}" keys="${com.deukin.DiaSemana.values()*.name()}" required="" value="${configuracionCursoDiaInstance?.diaSemana?.name()}" class=" form-control"/>
	</div>
	<div class="col-lg-12"><em><g:message code="configuracionCursoDia.aclaracion.label" default="" /></em></div>
</div>


<div class="row">
<label for="horaInicio" class="control-label col-lg-2"><g:message code="configuracionCursoDia.horaInicio.label" default="Hora Inicio" />*: </label>
<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'horaInicio', 'error')} required  ">
	<label for="horaInicio" class="control-label col-lg-1">
	hh: </label>
	<div class="col-lg-2">
	<g:select name="horaInicio" from="${00..23}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'horaInicio')}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'minutosInicio', 'error')} required  ">
	<label for="minutosInicio" class="control-label col-lg-1">
	mm: </label>
	<div class="col-lg-2">
	<g:select name="minutosInicio" from="${0..59}" class="range form-control" required="" value="${fieldValue(bean: configuracionCursoDiaInstance, field: 'minutosInicio')}"/>
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
		<g:message code="configuracionCursoDia.espacioFisico.label" default="Aula / Laboratorio" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="espacioFisico" name="espacioFisico.id" from="${com.deukin.EspacioFisico.list()}" optionKey="id" required="" value="${configuracionCursoDiaInstance?.espacioFisico?.id}" class="many-to-one  form-control"/>
	</div>
</div>
<div class="fieldcontain required  row">
			<label class="col-lg-2"><g:message
					code="control-label cursos.cicloLectivo.label"
					default="Ciclo Lectivo" /></label>
			<div class="col-lg-10">
				<g:select id="cicloLectivo.id" name="cicloLectivo.id"
					from="${com.deukin.CicloLectivo.list()}" optionKey="id" required=""
					value="${cicloLectivo?.id}" class="many-to-one  form-control"
					  />
			</div>
			</div>


	<g:hiddenField name="estadoCurso" id="estadoCurso" value="ABIERTO"/>




<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'periodoAcademico', 'error')} required  row">
	<label for="periodoAcademico" class="control-label col-lg-2">
		<g:message code="curso.periodoAcademico.label" default="Periodo Academico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="periodoAcademico" name="periodoAcademico.id" from="${com.deukin.PeriodoAcademico.list()}" optionKey="id" required="" value="${cursoInstance?.periodoAcademico?.id}" class="many-to-one form-control"/>
	</div>
</div>



