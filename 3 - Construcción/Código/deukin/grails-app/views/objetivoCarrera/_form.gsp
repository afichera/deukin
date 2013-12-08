<%@ page import="com.deukin.ObjetivoCarrera" %>





<div class="fieldcontain ${hasErrors(bean: objetivoCarreraInstance, field: 'descripcion', 'error')} row">
	<label for="descripcion" class="control-label col-lg-2">
		
		<g:message code="objetivoCarrera.descripcion.label" default="Descripcion" />: 
		
	</label>
	<div class="col-lg-10">
	<g:textArea rows="5" class="form-control" name="descripcion" required="" value="${objetivoCarreraInstance?.descripcion}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: objetivoCarreraInstance, field: 'carrera', 'error')} required row">
	<label for="carrera" class="control-label col-lg-2">
		<g:message code="objetivoCarrera.carrera.label" default="Carrera" />: 
		</label>
		<div class="col-lg-10"> ${objetivoCarreraInstance?.carrera?.toString()}</div>
	<g:hiddenField id="carrera" name="carrera.id" optionKey="id" required="" value="${objetivoCarreraInstance?.carrera?.id}" class="many-to-one"/>

</div>

