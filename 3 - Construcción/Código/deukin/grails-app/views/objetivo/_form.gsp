<%@ page import="com.deukin.Objetivo" %>



<div class="fieldcontain ${hasErrors(bean: objetivoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="control-label">
		<g:message code="objetivo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${objetivoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetivoInstance, field: 'materia', 'error')} required">
	<label for="materia" class="control-label">
		<g:message code="objetivo.materia.label" default="Materia" />
		
	</label>: ${objetivoInstance?.materia?.toString()}
	<g:hiddenField id="materia" name="materia.id"  optionKey="id" required="" value="${objetivoInstance?.materia?.id}" class="many-to-one"/>
</div>

