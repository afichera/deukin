<%@ page import="com.deukin.Telefono" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'telefono.label', default: 'Telefono')}" />
<title><g:message code="telefono.create.label"
		 /></title>
</head>
<body>

	<div id="create-telefono"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="telefono.create.label"/>
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${telefonoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${telefonoInstance}" var="error">
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
						>
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-primary"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
						
						
																		<g:if test="${params.origen=='alumno'}">
						
						<g:link class="btn btn-default" controller="alumno" action="show" id="${params.alumno?.id}">
					<g:message code="cancelar" default="Cancelar" />
				</g:link>
						</g:if>
						<g:elseif test="${params.origen=='docente'}">
						
						<g:link class="btn btn-default" controller="docente" action="show" id="${params.docente?.id}">
					<g:message code="cancelar" default="Cancelar" />
				</g:link>
						</g:elseif>
						
						
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
