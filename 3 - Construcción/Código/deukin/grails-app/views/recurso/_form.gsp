<%@ page import="com.deukin.Recurso" %>



<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'tipoRecurso', 'error')} required">
	<label for="tipoRecurso">
		<g:message code="recurso.tipoRecurso.label" default="Tipo Recurso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipoRecurso" name="tipoRecurso.id" from="${com.deukin.TipoRecurso.list()}" optionKey="id" required="" value="${recursoInstance?.tipoRecurso?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'estadoRecurso', 'error')} required">
	<label for="estadoRecurso">
		<g:message code="recurso.estadoRecurso.label" default="Estado Recurso" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estadoRecurso" from="${com.deukin.EstadoRecurso?.values()}" keys="${com.deukin.EstadoRecurso.values()*.name()}" required="" value="${recursoInstance?.estadoRecurso?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: recursoInstance, field: 'codigo', 'error')} ">
	<label for="codigo">
		<g:message code="recurso.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${recursoInstance?.codigo}"/>
</div>

