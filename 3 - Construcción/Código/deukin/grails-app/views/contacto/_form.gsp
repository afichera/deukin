<%@ page import="com.deukin.Contacto" %>



<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'domicilio', 'error')} required  row">
	<label for="domicilio" class="control-label col-lg-2">
		<g:message code="contacto.domicilio.label" default="Domicilio" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="domicilio" name="domicilio.id" from="${com.deukin.Domicilio.list()}" optionKey="id" required="" value="${contactoInstance?.domicilio?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'telefonos', 'error')}   row">
	<label for="telefonos" class="control-label col-lg-2">
		<g:message code="contacto.telefonos.label" default="Telefonos" />
		
	: </label>
	<div class="col-lg-10">
	
<ul class="one-to-many">
<g:each in="${contactoInstance?.telefonos?}" var="t">
    <li><g:link controller="telefono" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="telefono" action="create" params="['contacto.id': contactoInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}</g:link>
</li>
</ul>

	</div>
</div>

