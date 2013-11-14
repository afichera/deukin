

<%@ page import="com.deukin.Telefono" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'telefono.label', default: 'Telefono')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
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

	<div id="show-telefono"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<ol class="property-list telefono">
						
				<g:if test="${telefonoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="telefono.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${telefonoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoInstance?.contacto}">
				<li class="fieldcontain">
					<span id="contacto-label" class="property-label"><g:message code="telefono.contacto.label" default="Contacto" /></span>
					
						<span class="property-value" aria-labelledby="contacto-label"><g:link controller="contacto" action="show" id="${telefonoInstance?.contacto?.id}">${telefonoInstance?.contacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${telefonoInstance?.tipoTelefono}">
				<li class="fieldcontain">
					<span id="tipoTelefono-label" class="property-label"><g:message code="telefono.tipoTelefono.label" default="Tipo Telefono" /></span>
					
						<span class="property-value" aria-labelledby="tipoTelefono-label"><g:fieldValue bean="${telefonoInstance}" field="tipoTelefono"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${telefonoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${telefonoInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
