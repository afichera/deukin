<%@ page import="com.deukin.CurriculumAdjunto" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')}" />
<title><g:message code="curriculumAdjunto.New.label" /></title>
</head>
<body>
	<div id="create-curriculumAdjunto"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="curriculumAdjunto.New.label"/>
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${curriculumAdjuntoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${curriculumAdjuntoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<g:form action="save"
						 enctype="multipart/form-data">
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-primary"
								value="${message(code: 'default.button.adjuntar.label', default: 'Adjuntar')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
