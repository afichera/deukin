<%@ page import="com.deukin.Telefono" %>



<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'numero', 'error')} ">
	<label for="numero" class="control-label">
		<g:message code="telefono.numero.label" default="Numero" />
		
	</label>
	<g:textField name="numero" value="${telefonoInstance?.numero}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'contacto', 'error')} required">
	<g:hiddenField name="contacto.id" value="${telefonoInstance?.contacto?.id}"/>	
<%--	<g:select id="contacto" disabled="true" name="contacto.id" from="${com.deukin.Contacto.list()}" optionKey="id" required="" value="${telefonoInstance?.contacto?.id}" class="many-to-one"/>--%>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono" class="control-label">
		<g:message code="telefono.tipoTelefono.label" default="Tipo Telefono" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipoTelefono" from="${com.deukin.TipoTelefono?.values()}" keys="${com.deukin.TipoTelefono.values()*.name()}" required="" value="${telefonoInstance?.tipoTelefono?.name()}"/>
</div>

