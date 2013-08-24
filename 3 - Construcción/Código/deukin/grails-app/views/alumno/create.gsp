<%@ page import="com.deukin.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li ><g:link class="list" action="list">Alumnos</g:link></li>
				<li class="active"><a href="#"><g:message code="default.new.label" args="[entityName]" /></a></li>
			</ul>
			</ul>
		</div>
		<div id="create-alumno" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${alumnoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${alumnoInstance}" var="error">
				<p <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></p>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<div class="row">
          <div class="col-lg-6">
            <div class="well">
			<g:form action="save" class=" form-horizontal" >

				
				<p>
				<label class="control-label" >Nombre: </label>
				<g:textField name="nombre" value="" class="form-control" />
			</p>
			<br />
			<g:hasErrors bean="${alumno}" field="nombre">
				<div class="errors">
					<g:renderErrors bean="${alumno}" field="nombre" />
				</div>
			</g:hasErrors>


			<p>
				<label class="control-label" >Apellido: </label>
				<g:textField name="apellido" value="" class="form-control" />
			</p>
			<br />
			<g:hasErrors bean="${alumno}" field="apellido">
				<div class="errors">
					<g:renderErrors bean="${alumno}" field="apellido" />
				</div>
			</g:hasErrors>
				
				
				<fieldset class="buttons">
					<g:submitButton name="create" class="save btn btn-primary" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
			</div>
			</div>
			</div>
		</div>
	</body>
</html>
