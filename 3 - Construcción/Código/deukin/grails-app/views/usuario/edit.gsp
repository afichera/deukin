<%@ page import="com.deukin.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
				<li><g:link class="list" action="list">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</sec:ifAnyGranted>

		</ul>
	</div>
	<div id="edit-usuario" class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${usuarioInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${usuarioInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<g:form method="post">
						<g:hiddenField name="id" value="${usuarioInstance?.id}" />
						<g:hiddenField name="version" value="${usuarioInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update"
								class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
