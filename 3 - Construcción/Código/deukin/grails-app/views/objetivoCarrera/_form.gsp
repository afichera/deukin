<%@ page import="com.deukin.ObjetivoCarrera" %>





<div class="fieldcontain ${hasErrors(bean: objetivoCarreraInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="control-label">
		<g:message code="objetivoCarrera.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${objetivoCarreraInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: objetivoCarreraInstance, field: 'carrera', 'error')} required">
	<label for="carrera" class="control-label">
		<g:message code="objetivoCarrera.carrera.label" default="Carrera" />
		</label>
		: ${objetivoCarreraInstance?.carrera?.toString()}
	<g:hiddenField id="carrera" name="carrera.id" optionKey="id" required="" value="${objetivoCarreraInstance?.carrera?.id}" class="many-to-one"/>
</div>

