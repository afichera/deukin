

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
			<div class="message alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					
						
				
				<div class="fieldcontain row">
					<label id="numero-label" class="property-label col-lg-2"><g:message code="espacioFisico.numero.label" default="Numero" />:</label>
					
						<div class="property-value col-lg-10" aria-labelledby="numero-label"><g:if test="${espacioFisicoInstance?.numero}"><g:fieldValue bean="${espacioFisicoInstance}" field="numero"/></g:if></div>
					
				</div>
				
			
				
				<div class="fieldcontain row">
					<label id="ubicacion-label" class="property-label col-lg-2"><g:message code="espacioFisico.ubicacion.label" default="Ubicacion" />:</label>
					
						<div class="property-value col-lg-10" aria-labelledby="ubicacion-label"><g:if test="${espacioFisicoInstance?.ubicacion}"><g:fieldValue bean="${espacioFisicoInstance}" field="ubicacion"/></g:if></div>
					
				</div>
				
			<div class="fieldcontain row">
				
				
					<label id="observaciones-label" class="property-label col-lg-2"><g:message code="espacioFisico.observaciones.label" default="Observaciones" />:</label>
					
						<div class="property-value col-lg-10" aria-labelledby="observaciones-label"><g:if test="${espacioFisicoInstance?.observaciones}"><g:fieldValue bean="${espacioFisicoInstance}" field="observaciones"/></g:if></div>
					
				</div>
				
			
					
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
