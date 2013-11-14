<%@ page import="com.deukin.Contacto" %>



<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'domicilio', 'error')} required">
	<label for="domicilio" class="control-label">
		<g:message code="contacto.domicilio.label" default="Domicilio" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="domicilio" name="domicilio.id" from="${com.deukin.Domicilio.list()}" optionKey="id" required="" value="${contactoInstance?.domicilio?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos" class="control-label">
		<g:message code="contacto.telefonos.label" default="Telefonos" />
		
	</label>
	<g:select name="telefonos" from="${com.deukin.Telefono.list()}" multiple="multiple" optionKey="id" size="5" value="${contactoInstance?.telefonos*.id}" class="many-to-many"/>
</div>

