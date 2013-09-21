<%@ page import="com.deukin.Parametro" %>



<div class="fieldcontain ${hasErrors(bean: parametroInstance, field: 'codigo', 'error')} ">
	<label for="codigo" class="control-label">
		<g:message code="parametro.codigo.label" default="Codigo" />
		
	</label>
	<g:textField name="codigo" value="${parametroInstance?.codigo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parametroInstance, field: 'valor', 'error')} ">
	<label for="valor" class="control-label">
		<g:message code="parametro.valor.label" default="Valor" />
		
	</label>
	<g:textField name="valor" value="${parametroInstance?.valor}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: parametroInstance, field: 'tipoParametro', 'error')} required">
	<label for="tipoParametro" class="control-label">
		<g:message code="parametro.tipoParametro.label" default="Tipo Parametro" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoParametro" from="${com.deukin.TipoParametro?.values()}" keys="${com.deukin.TipoParametro.values()*.name()}" required="" value="${parametroInstance?.tipoParametro?.name()}"/>
</div>

