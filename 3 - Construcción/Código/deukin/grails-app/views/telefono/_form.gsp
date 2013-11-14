<%@ page import="com.deukin.Telefono" %>



<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'numero', 'error')} ">
	<label for="numero" class="control-label">
		<g:message code="telefono.numero.label" default="Numero" />
		
	</label>
	<g:textField name="numero" value="${telefonoInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono" class="control-label">
		<g:message code="telefono.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoTelefono" from="${com.deukin.TipoTelefono?.values()}" keys="${com.deukin.TipoTelefono.values()*.name()}" required="" value="${telefonoInstance?.tipoTelefono?.name()}"/>
</div>

