<%@ page import="com.deukin.TipoRecurso" %>



<div class="fieldcontain ${hasErrors(bean: tipoRecursoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="control-label col-lg-2">
		<g:message code="tipoRecurso.descripcion.label" default="Descripcion" />
		
	: </label>
	<div class="col-lg-10">
	<g:textField name="descripcion" value="${tipoRecursoInstance?.descripcion}"/>
	</div>
</div>

