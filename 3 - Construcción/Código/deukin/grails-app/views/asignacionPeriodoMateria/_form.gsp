<%@ page import="com.deukin.AsignacionPeriodoMateria" %>



<div class="fieldcontain ${hasErrors(bean: asignacionPeriodoMateriaInstance, field: 'materia', 'error')} required">
	<label for="materia" class="control-label col-lg-2">
		<g:message code="asignacionPeriodoMateria.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${asignacionPeriodoMateriaInstance?.materia?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: asignacionPeriodoMateriaInstance, field: 'periodo', 'error')} required">
	<label for="periodo" class="control-label col-lg-2">
		<g:message code="asignacionPeriodoMateria.periodo.label" default="Periodo" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="periodo" name="periodo.id" from="${com.deukin.PeriodoDedicacion.list()}" optionKey="id" required="" value="${asignacionPeriodoMateriaInstance?.periodo?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: asignacionPeriodoMateriaInstance, field: 'planEstudio', 'error')} required">
	<label for="planEstudio" class="control-label col-lg-2">
		<g:message code="asignacionPeriodoMateria.planEstudio.label" default="Plan Estudio" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="planEstudio" name="planEstudio.id" from="${com.deukin.PlanEstudio.list()}" optionKey="id" required="" value="${asignacionPeriodoMateriaInstance?.planEstudio?.id}" class="many-to-one"/>
	</div>
</div>

