

<%@ page import="com.deukin.Contacto"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'contacto.label', default: 'Contacto')}" />
<title><g:message code="default.datosDe.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-contacto" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<ol class="property-list contacto">

<%--						<g:if test="${contactoInstance?.domicilio}">--%>
<%--							<li class="fieldcontain"><span id="domicilio-label"--%>
<%--								class="property-label"><g:message--%>
<%--										code="contacto.domicilio.label" default="Domicilio" /></span> <span--%>
<%--								class="property-value" aria-labelledby="domicilio-label"><g:link--%>
<%--										controller="domicilio" action="show"--%>
<%--										id="${contactoInstance?.domicilio?.id}">--%>
<%--										${contactoInstance?.domicilio?.encodeAsHTML()}--%>
<%--									</g:link></span></li>--%>
<%--						</g:if>--%>
<%----%>
<%--						<g:if test="${contactoInstance?.telefonos}">--%>
<%--							<li class="fieldcontain"><span id="telefonos-label"--%>
<%--								class="property-label"><g:message--%>
<%--										code="contacto.telefonos.label" default="Telefonos" /></span> <g:each--%>
<%--									in="${contactoInstance.telefonos}" var="t">--%>
<%--									<span class="property-value" aria-labelledby="telefonos-label"><g:link--%>
<%--											controller="telefono" action="show" id="${t.id}">--%>
<%--											${t?.encodeAsHTML()}--%>
<%--										</g:link></span>--%>
<%--								</g:each></li>--%>
<%--						</g:if>--%>


						<g:if test="${contactoInstance?.domicilio}">
							<p>
								<g:message code="domicilio.list.label" default="Domicilio:" />
							</p>

							<g:if test="${contactoInstance?.domicilio?.calle}">
								<li class="fieldcontain"><span id="calle-label"
									class="property-label"><g:message
											code="domicilio.calle.label" default="Calle" /></span> <span
									class="property-value" aria-labelledby="calle-label"><g:fieldValue
											bean="${contactoInstance}" field="domicilio.calle" /></span></li>
							</g:if>


							<g:if test="${contactoInstance?.domicilio?.numero}">
								<li class="fieldcontain"><span id="numero-label"
									class="property-label"><g:message
											code="domicilio.numero.label" default="Numero" /></span> <span
									class="property-value" aria-labelledby="numero-label"><g:fieldValue
											bean="${contactoInstance}" field="domicilio.numero" /></span></li>
							</g:if>

							<g:if test="${contactoInstance?.domicilio?.localidad}">
								<li class="fieldcontain"><span id="localidad-label"
									class="property-label"><g:message
											code="domicilio.localidad.label" default="Localidad" /></span> <span
									class="property-value" aria-labelledby="localidad-label"><g:fieldValue
											bean="${contactoInstance}" field="domicilio.localidad" /></span></li>
							</g:if>


							<g:if test="${contactoInstance?.domicilio?.codigoPostal}">
								<li class="fieldcontain"><span id="codigoPostal-label"
									class="property-label"><g:message
											code="domicilio.codigoPostal.label" default="Codigo Postal" /></span>
									<span class="property-value"
									aria-labelledby="codigoPostal-label"><g:fieldValue
											bean="${contactoInstance}" field="domicilio.codigoPostal" /></span>

								</li>
							</g:if>

							<g:if test="${contactoInstance?.domicilio?.observaciones}">
								<li class="fieldcontain"><span id="observaciones-label"
									class="property-label"><g:message
											code="domicilio.observaciones.label" default="Observaciones" /></span>
									<span class="property-value"
									aria-labelledby="observaciones-label"><g:fieldValue
											bean="${contactoInstance}" field="domicilio.observaciones" /></span>

								</li>
							</g:if>

						</g:if>
						<p></p>
						<g:if test="${contactoInstance?.telefonos}">
							<p>
								<g:message code="telefono.list.label" default="Telefonos:" />
							</p>
							<g:each in="${contactoInstance?.telefonos}" status="i"
								var="telefonoInstance">


								<g:if test="${telefonoInstance?.tipoTelefono}">
									<li class="fieldcontain"><span id="tipoTelefono-label"
										class="property-label"><g:message
												code="telefono.tipoTelefono.label" default="Tipo" /></span> <span
										class="property-value" aria-labelledby="tipoTelefono-label"><g:fieldValue
												bean="${telefonoInstance}" field="tipoTelefono" /></span></li>
								</g:if>

								<g:if test="${telefonoInstance?.numero}">
									<li class="fieldcontain"><span id="numero-label"
										class="property-label"><g:message
												code="telefono.numero.label" default="Numero" /></span> <span
										class="property-value" aria-labelledby="numero-label"><g:fieldValue
												bean="${telefonoInstance}" field="numero" /></span></li>
								</g:if>


							</g:each>
						</g:if>



					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${contactoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${contactoInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
