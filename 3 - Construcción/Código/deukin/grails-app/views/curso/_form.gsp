<%@ page import="com.deukin.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'codigo', 'error')} ">
	<label for="codigo" class="control-label col-lg-2">
		<g:message code="curso.codigo.label" default="Codigo" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="codigo" maxlength="20" value="${cursoInstance?.codigo}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'cronogramaCarrera', 'error')} required">
	<label for="cronogramaCarrera" class="control-label col-lg-2">
		<g:message code="curso.cronogramaCarrera.label" default="Cronograma Carrera" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="cronogramaCarrera" name="cronogramaCarrera.id" from="${com.deukin.CronogramaCarrera.list()}" optionKey="id" required="" value="${cursoInstance?.cronogramaCarrera?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'docentes', 'error')} ">
	<label for="docentes" class="control-label col-lg-2">
		<g:message code="curso.docentes.label" default="Docentes" />
		
	: </label>
	<div class="col-lg-10">
	<g:select name="docentes" from="${com.deukin.Docente.list()}" multiple="multiple" optionKey="id" size="5" value="${cursoInstance?.docentes*.id}" class="many-to-many"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'espacioFisico', 'error')} required">
	<label for="espacioFisico" class="control-label col-lg-2">
		<g:message code="curso.espacioFisico.label" default="Espacio Fisico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="espacioFisico" name="espacioFisico.id" from="${com.deukin.EspacioFisico.list()}" optionKey="id" required="" value="${cursoInstance?.espacioFisico?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'estadoCurso', 'error')} required">
	<label for="estadoCurso" class="control-label col-lg-2">
		<g:message code="curso.estadoCurso.label" default="Estado Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="estadoCurso" from="${com.deukin.EstadoCurso?.values()}" keys="${com.deukin.EstadoCurso.values()*.name()}" required="" value="${cursoInstance?.estadoCurso?.name()}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'horaDesde', 'error')} required">
	<label for="horaDesde" class="control-label col-lg-2">
		<g:message code="curso.horaDesde.label" default="Hora Desde" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'horaHasta', 'error')} required">
	<label for="horaHasta" class="control-label col-lg-2">
		<g:message code="curso.horaHasta.label" default="Hora Hasta" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'materia', 'error')} required">
	<label for="materia" class="control-label col-lg-2">
		<g:message code="curso.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${cursoInstance?.materia?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'recursosFijos', 'error')} ">
	<label for="recursosFijos" class="control-label col-lg-2">
		<g:message code="curso.recursosFijos.label" default="Recursos Fijos" />
		
	: </label>
	<div class="col-lg-10">
	<g:select name="recursosFijos" from="${com.deukin.Recurso.list()}" multiple="multiple" optionKey="id" size="5" value="${cursoInstance?.recursosFijos*.id}" class="many-to-many"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'turno', 'error')} required">
	<label for="turno" class="control-label col-lg-2">
		<g:message code="curso.turno.label" default="Turno" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="turno" name="turno.id" from="${com.deukin.Turno.list()}" optionKey="id" required="" value="${cursoInstance?.turno?.id}" class="many-to-one"/>
	</div>
</div>

