<%@ page import="com.deukin.Equivalencia" %>



<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materiaPrincipal', 'error')} required">
	<label for="materiaPrincipal" class="control-label">
		<g:message code="equivalencia.materiaPrincipal.label" default="Materia Principal" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materiaPrincipal" name="materiaPrincipal.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${equivalenciaInstance?.materiaPrincipal?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: equivalenciaInstance, field: 'materiaEquivalente', 'error')} required">
	<label for="materiaEquivalente" class="control-label">
		<g:message code="equivalencia.materiaEquivalente.label" default="Materia Equivalente" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="materiaEquivalente" name="materiaEquivalente.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${equivalenciaInstance?.materiaEquivalente?.id}" class="many-to-one"/>
</div>

