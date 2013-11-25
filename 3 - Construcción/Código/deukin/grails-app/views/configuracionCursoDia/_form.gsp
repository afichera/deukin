<%@ page import="com.deukin.ConfiguracionCursoDia" %>



<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'curso', 'error')} required">
	<label for="curso" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="curso" name="curso.id" from="${com.deukin.Curso.list()}" optionKey="id" required="" value="${configuracionCursoDiaInstance?.curso?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'diaSemana', 'error')} required">
	<label for="diaSemana" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.diaSemana.label" default="Dia Semana" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="diaSemana" from="${com.deukin.DiaSemana?.values()}" keys="${com.deukin.DiaSemana.values()*.name()}" required="" value="${configuracionCursoDiaInstance?.diaSemana?.name()}"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: configuracionCursoDiaInstance, field: 'espacioFisico', 'error')} required">
	<label for="espacioFisico" class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.espacioFisico.label" default="Espacio Fisico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="espacioFisico" name="espacioFisico.id" from="${com.deukin.EspacioFisico.list()}" optionKey="id" required="" value="${configuracionCursoDiaInstance?.espacioFisico?.id}" class="many-to-one"/>
	</div>
</div>

