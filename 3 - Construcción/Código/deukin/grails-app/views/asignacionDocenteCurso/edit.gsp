<%@ page import="com.deukin.AsignacionDocenteCurso" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>

	<div id="edit-asignacionDocenteCurso"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="cursos.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${asignacionDocenteCursoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${asignacionDocenteCursoInstance}" var="error">
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
						<g:hiddenField name="id" value="${asignacionDocenteCursoInstance?.id}" />
						<g:hiddenField name="version" value="${asignacionDocenteCursoInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								formnovalidate=""
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						<g:link class="btn btn-default" controller="cursos" action="show" id="${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.id}">
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
