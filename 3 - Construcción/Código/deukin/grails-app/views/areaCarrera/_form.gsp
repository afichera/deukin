<%@ page import="com.deukin.AreaCarrera" %>



<div class="fieldcontain ${hasErrors(bean: areaCarreraInstance, field: 'areaMadre', 'error')} required">
	<label for="areaMadre" class="control-label col-lg-2">
		<g:message code="areaCarrera.areaMadre.label" default="Area Madre" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="areaMadre" name="areaMadre.id" from="${com.deukin.AreaCarrera.list()}" optionKey="id" required="" value="${areaCarreraInstance?.areaMadre?.id}" class="many-to-one"/>
	</div>
</div>

