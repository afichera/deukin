<%@ page import="com.deukin.ObjetivoEspecifico" %>



<div class="fieldcontain ${hasErrors(bean: objetivoEspecificoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="control-label">
		<g:message code="objetivoEspecifico.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${objetivoEspecificoInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetivoEspecificoInstance, field: 'materia', 'error')} required">
	<label for="materia" class="control-label">
		<g:message code="objetivoEspecifico.materia.label" default="Materia" />
		
	</label>: ${objetivoEspecificoInstance?.materia?.toString()}
	<g:hiddenField id="materia" name="materia.id" optionKey="id" required="" value="${objetivoEspecificoInstance?.materia?.id}" class="many-to-one"/>
</div>

