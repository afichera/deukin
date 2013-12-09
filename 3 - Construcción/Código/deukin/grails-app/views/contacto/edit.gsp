<%@ page import="com.deukin.Contacto" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'contacto.label', default: 'Contacto')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
		<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
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
	<div id="edit-contacto"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${contactoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${contactoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<g:form method="post"
						>
						<g:hiddenField name="id" value="${contactoInstance?.id}" />
						<g:hiddenField name="version" value="${contactoInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
