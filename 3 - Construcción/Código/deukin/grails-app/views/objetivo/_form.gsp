<%@ page import="com.deukin.Objetivo"%>



<div
	class="fieldcontain ${hasErrors(bean: objetivoInstance, field: 'descripcion', 'error')} row">
	<label for="descripcion" class="control-label col-lg-2"> <g:message
			code="objetivo.descripcion.label" default="Descripcion" />

	</label>
	<div class="col-lg-10">
		<g:textField name="descripcion"
			value="${objetivoInstance?.descripcion}" />
	</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: objetivoInstance, field: 'materia', 'error')} required row">
	<label for="materia" class="control-label col-lg-2"> <g:message
			code="objetivo.materia.label" default="Materia" />:

	</label>
	<div class="col-lg-10">
		${objetivoInstance?.materia?.toString()}
		<g:hiddenField id="materia" name="materia.id" optionKey="id"
			required="" value="${objetivoInstance?.materia?.id}"
			class="many-to-one" />

	</div>
</div>

