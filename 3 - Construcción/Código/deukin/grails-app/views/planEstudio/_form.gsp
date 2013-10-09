<%@ page import="com.deukin.PlanEstudio" %>



<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'identificacion', 'error')} ">
	<label for="identificacion" class="control-label">
		<g:message code="planEstudio.identificacion.label" default="Identificacion" />
		
	</label>
	<g:textField name="identificacion" value="${planEstudioInstance?.identificacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'cantidadPeriodosAcademicos', 'error')} ">
	<label for="cantidadPeriodosAcademicos" class="control-label">
		<g:message code="planEstudio.cantidadPeriodosAcademicos.label" default="Cantidad Periodos Academicos" />
		
	</label>
	<g:field name="cantidadPeriodosAcademicos" type="number" value="${planEstudioInstance.cantidadPeriodosAcademicos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'asignacionesPeriodosMaterias', 'error')} ">
	<label for="asignacionesPeriodosMaterias" class="control-label">
		<g:message code="planEstudio.asignacionesPeriodosMaterias.label" default="Asignaciones Periodos Materias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planEstudioInstance?.asignacionesPeriodosMaterias?}" var="a">
    <li><g:link controller="asignacionPeriodoMateria" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="asignacionPeriodoMateria" action="create" params="['planEstudio.id': planEstudioInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'carrera', 'error')} required">
	<label for="carrera" class="control-label">
		<g:message code="planEstudio.carrera.label" default="Carrera" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carrera" name="carrera.id" from="${com.deukin.Carrera.list()}" optionKey="id" required="" value="${planEstudioInstance?.carrera?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: planEstudioInstance, field: 'estado', 'error')} required">
	<label for="estado" class="control-label">
		<g:message code="planEstudio.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${com.deukin.EstadoDeCreacion?.values()}" keys="${com.deukin.EstadoDeCreacion.values()*.name()}" required="" value="${planEstudioInstance?.estado?.name()}"/>
</div>

