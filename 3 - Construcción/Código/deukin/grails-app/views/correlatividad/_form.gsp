<%@ page import="com.deukin.Correlatividad" %>



<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materiaPrincipal', 'error')} required">
	<label for="materiaPrincipal" class="control-label">
		<g:message code="correlatividad.materiaPrincipal.label" default="Materia Principal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materiaPrincipal" name="materiaPrincipal.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${correlatividadInstance?.materiaPrincipal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: correlatividadInstance, field: 'materiaPredecesora', 'error')} required">
	<label for="materiaPredecesora" class="control-label">
		<g:message code="correlatividad.materiaPredecesora.label" default="Materia Predecesora" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materiaPredecesora" name="materiaPredecesora.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${correlatividadInstance?.materiaPredecesora?.id}" class="many-to-one"/>
</div>

