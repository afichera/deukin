

<%@ page import="com.deukin.EspacioFisico" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'espacioFisico.label', default: 'EspacioFisico')}" />
<title><g:message code="espaciosFisicos.show.label" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="espaciosFisicos.lista"/>
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="espaciosFisicos.nuevo"/>
				</g:link></li>
		</ul>
	</div>

	<div id="show-espacioFisico"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="espaciosFisicos.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<ol class="property-list espacioFisico">
						
				<g:if test="${espacioFisicoInstance?.numero}">
				<li class="fieldcontain">
					<span id="numero-label" class="property-label"><g:message code="espacioFisico.numero.label" default="Numero" /></span>
					
						<span class="property-value" aria-labelledby="numero-label"><g:fieldValue bean="${espacioFisicoInstance}" field="numero"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${espacioFisicoInstance?.ubicacion}">
				<li class="fieldcontain">
					<span id="ubicacion-label" class="property-label"><g:message code="espacioFisico.ubicacion.label" default="Ubicacion" /></span>
					
						<span class="property-value" aria-labelledby="ubicacion-label"><g:fieldValue bean="${espacioFisicoInstance}" field="ubicacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${espacioFisicoInstance?.observaciones}">
				<li class="fieldcontain">
					<span id="observaciones-label" class="property-label"><g:message code="espacioFisico.observaciones.label" default="Observaciones" /></span>
					
						<span class="property-value" aria-labelledby="observaciones-label"><g:fieldValue bean="${espacioFisicoInstance}" field="observaciones"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${espacioFisicoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${espacioFisicoInstance?.id}">
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
