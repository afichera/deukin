<%@ page import="com.deukin.Docente" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'docente.label', default: 'Docente')}" />
<title><g:message code="docente.edit.label" /></title>
		<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
</head>
<body>
<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="docente.list.label"/>
				</g:link></li>
		</ul>
	</div>
	</sec:ifAnyGranted>
	<div id="edit-docente"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="docente.edit.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${docenteInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${docenteInstance}" var="error">
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
						 enctype="multipart/form-data">
						<g:hiddenField name="id" value="${docenteInstance?.id}" />
						<g:hiddenField name="version" value="${docenteInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
						<g:link class="btn btn-default" controller="docente" action="show" id="${docenteInstance?.id}">		
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
