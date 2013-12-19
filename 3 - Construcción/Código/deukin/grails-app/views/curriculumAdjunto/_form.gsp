<%@ page import="com.deukin.CurriculumAdjunto" %>



<div class="fieldcontain ${hasErrors(bean: curriculumAdjuntoInstance, field: 'archivo', 'error')} required">
	<label for="archivo" class="control-label col-lg-2">
		<g:message code="curriculumAdjunto.archivo.label" default="Archivo" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<input type="file" id="archivo" name="archivo" />
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: curriculumAdjuntoInstance, field: 'persona', 'error')} required">
	<g:hiddenField name="persona.id" value="${curriculumAdjuntoInstance?.persona?.id}"/>
</div>


