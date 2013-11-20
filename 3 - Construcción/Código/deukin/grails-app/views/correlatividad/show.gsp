

<%@ page import="com.deukin.Correlatividad" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'correlatividad.label', default: 'Correlatividad')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="correlatividad.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="correlatividad.create.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-correlatividad"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="correlatividad.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
				
				<div class="row">		
				<g:if test="${correlatividadInstance?.materiaPrincipal}">
				
					<label id="materiaPrincipal-label" class="property-label col-lg-2"><g:message code="correlatividad.materiaPrincipal.label" default="Materia Principal" />: </label>
					<div class="col-lg-10">
						<span class="property-value" aria-labelledby="materiaPrincipal-label"><g:link controller="materia" action="show" id="${correlatividadInstance?.materiaPrincipal?.id}">${correlatividadInstance?.materiaPrincipal?.encodeAsHTML()}</g:link></span>
					</div>
				
				</g:if>
			</div>
				<div class="row">	
				<g:if test="${correlatividadInstance?.materiaPredecesora}">
				
					<label id="materiaPredecesora-label" class="property-label col-lg-2"><g:message code="correlatividad.materiaPredecesora.label" default="Materia Predecesora" />: </label>
					<div class="col-lg-10">
						<span class="property-value" aria-labelledby="materiaPredecesora-label"><g:link controller="materia" action="show" id="${correlatividadInstance?.materiaPredecesora?.id}">${correlatividadInstance?.materiaPredecesora?.encodeAsHTML()}</g:link></span>
					
		</div>
				</g:if>
			</div>
				
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${correlatividadInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${correlatividadInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						<g:link class="btn btn-default" controller="correlatividad" action="list">
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
