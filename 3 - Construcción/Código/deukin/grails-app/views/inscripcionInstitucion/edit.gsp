<%@ page import="com.deukin.InscripcionInstitucion" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion')}" />
<title><g:message code="inscripcionInstitucion.list.label" /></title>
		<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="inscripcionInstitucion.list.label"/>
				</g:link></li>
		</ul>
	</div>
	<div id="edit-inscripcionInstitucion"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="inscripcionInstitucion.edit.label"/>
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${inscripcionInstitucionInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${inscripcionInstitucionInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<g:form method="post"
						>
						<g:hiddenField name="id" value="${inscripcionInstitucionInstance?.id}" />
						<g:hiddenField name="version" value="${inscripcionInstitucionInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:link class="btn btn-default" action="show" id="${inscripcionInstitucionInstance?.id}">		
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
