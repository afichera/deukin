<%@ page import="com.deukin.Domicilio" %>



<div class="fieldcontain ${hasErrors(bean: domicilioInstance, field: 'calle', 'error')} ">
	<label for="calle" class="control-label">
		<g:message code="domicilio.calle.label" default="Calle" />
		
	</label>
	<g:textField name="calle" value="${domicilioInstance?.calle}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domicilioInstance, field: 'localidad', 'error')} ">
	<label for="localidad" class="control-label">
		<g:message code="domicilio.localidad.label" default="Localidad" />
		
	</label>
	<g:textField name="localidad" value="${domicilioInstance?.localidad}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domicilioInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones" class="control-label">
		<g:message code="domicilio.observaciones.label" default="Observaciones" />
		
	</label>
	<g:textField name="observaciones" value="${domicilioInstance?.observaciones}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: domicilioInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal" class="control-label">
		<g:message code="domicilio.codigoPostal.label" default="Codigo Postal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigoPostal" type="number" value="${domicilioInstance.codigoPostal}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: domicilioInstance, field: 'numero', 'error')} required">
	<label for="numero" class="control-label">
		<g:message code="domicilio.numero.label" default="Numero" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="numero" type="number" value="${domicilioInstance.numero}" required=""/>
</div>

