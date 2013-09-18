<%@ page import="com.deukin.Correlatividad" %>



<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materia', 'error')} required">
	<label for="materia" class="control-label">
		<g:message code="correlatividad.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${correlatividadInstance?.materia?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'predecesoras', 'error')} ">
	<label for="predecesoras" class="control-label">
		<g:message code="correlatividad.predecesoras.label" default="Predecesoras" />
		
	</label>
	<g:select name="predecesoras" from="${com.deukin.Materia.list()}" multiple="multiple" optionKey="id" size="5" value="${correlatividadInstance?.predecesoras*.id}" class="many-to-many"/>
</div>

