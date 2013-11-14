<%@ page import="com.deukin.Contacto"%>



<div
	class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'domicilio.calle', 'error')} ">
	<label for="domicilioCalle" class="control-label"> <g:message
			code="domicilio.calle.label" default="Calle" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="domicilioCalle"
		value="${contactoInstance?.domicilio?.calle}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'domicilio.numero', 'error')} required">
	<label for="domicilioNumero" class="control-label"> <g:message
			code="domicilio.numero.label" default="Numero" /> <span
		class="required-indicator">*</span>
	</label>
	<g:field name="domicilioNumero" type="number"
		value="${contactoInstance?.domicilio?.numero}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'domicilio.localidad', 'error')} ">
	<label for="domicilioLocalidad" class="control-label"> <g:message
			code="domicilio.localidad.label" default="Localidad" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="domicilioLocalidad"
		value="${contactoInstance?.domicilio?.localidad}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'domicilio.codigoPostal', 'error')} required">
	<label for="domicilioCodigoPostal" class="control-label"> <g:message
			code="domicilio.codigoPostal.label" default="Codigo Postal" /> <span
		class="required-indicator">*</span>
	</label>
	<g:field name="domicilioCodigoPostal" type="number"
		value="${contactoInstance?.domicilio?.codigoPostal}" required="" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'observaciones', 'error')} ">
	<label for="domicilioObservaciones" class="control-label"> <g:message
			code="domicilio.observaciones.label" default="Observaciones" />

	</label>
	<g:textField name="domicilioObservaciones"
		value="${contactoInstance?.domicilio?.observaciones}" />
</div>

<br>
<div
	class="fieldcontain ${hasErrors(bean: contactoInstance, field: 'telefonos', 'error')} ">
	<label for="telefonos" class="control-label"> <g:message
			code="contacto.telefonos.label" default="Telefonos" />
	</label>

	<ul class="one-to-many">
		<g:each in="${contactoInstance?.telefonos?}" var="t">
			<li><g:link controller="telefono" action="show" id="${t.id}">
					${t?.tipoTelefono} - ${t?.numero}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="telefono" action="create"
				params="['contacto.id': contactoInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Telefono')])}
			</g:link></li>
	</ul>

</div>

