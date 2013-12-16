<%@ page import="com.deukin.Telefono" %>

<g:hiddenField id ="origen" name ="origen" value="${params?.origen}"/>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'numero', 'error')} required row">
	<label for="numero" class="control-label col-lg-2">
		<g:message code="telefono.numero.label" default="Numero" />:
		
	</label>
	<div class="col-lg-10">
	<g:textField  class="form-control"  name="numero" value="${telefonoInstance?.numero}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'contacto', 'error')} required">
	<g:hiddenField name="contacto.id" value="${telefonoInstance?.contacto?.id}"/>	
<%--	<g:select id="contacto" disabled="true" name="contacto.id" from="${com.deukin.Contacto.list()}" optionKey="id" required="" value="${telefonoInstance?.contacto?.id}" class="many-to-one"/>--%>
</div>

<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'tipoTelefono', 'error')} required row">
	<label for="tipoTelefono" class="control-label  col-lg-2">
		<g:message code="telefono.tipoTelefono.label" default="Tipo Telefono" />
		:
	</label>
	<div class="col-lg-10"><g:select name="tipoTelefono" class="form-control" from="${com.deukin.TipoTelefono?.values()}" keys="${com.deukin.TipoTelefono.values()*.name()}" required="" value="${telefonoInstance?.tipoTelefono?.name()}"/></div>
</div>

