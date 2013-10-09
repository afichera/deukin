

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
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-correlatividad"
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
					<ol class="property-list correlatividad">
						
				<g:if test="${correlatividadInstance?.materiaPrincipal}">
				<li class="fieldcontain">
					<span id="materiaPrincipal-label" class="property-label"><g:message code="correlatividad.materiaPrincipal.label" default="Materia Principal" /></span>
					
						<span class="property-value" aria-labelledby="materiaPrincipal-label"><g:link controller="materia" action="show" id="${correlatividadInstance?.materiaPrincipal?.id}">${correlatividadInstance?.materiaPrincipal?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${correlatividadInstance?.materiaPredecesora}">
				<li class="fieldcontain">
					<span id="materiaPredecesora-label" class="property-label"><g:message code="correlatividad.materiaPredecesora.label" default="Materia Predecesora" /></span>
					
						<span class="property-value" aria-labelledby="materiaPredecesora-label"><g:link controller="materia" action="show" id="${correlatividadInstance?.materiaPredecesora?.id}">${correlatividadInstance?.materiaPredecesora?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
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
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
