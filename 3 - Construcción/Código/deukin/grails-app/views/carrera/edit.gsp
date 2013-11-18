<%@ page import="com.deukin.Carrera" %>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
    function eligeCoordinador(personaId){
      document.getElementById('coordinador.id').value = personaId;
    }

</script>
<resource:autoComplete />

<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'carrera.label', default: 'Carrera')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="carrera.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="carrera.new.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-carrera"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${carreraInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${carreraInstance}" var="error">
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
						<g:hiddenField name="id" value="${carreraInstance?.id}" />
						<g:hiddenField name="version" value="${carreraInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:link class="btn btn-default" controller="carrera" action="show" id="${carreraInstance?.id}">		
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
