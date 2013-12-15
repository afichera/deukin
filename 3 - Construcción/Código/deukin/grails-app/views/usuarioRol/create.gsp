<%@ page import="com.deukin.UsuarioRol" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function eligeUsuario(usuarioId){
      document.getElementById('usuario.id').value = usuarioId;
    }

</script>
<resource:autoComplete />
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuarioRol.label', default: 'UsuarioRol')}" />
<title><g:message code="usuarioRol.new.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link controller="usuario" class="list" action="list">
					<g:message code="usuario.list.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-usuarioRol"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="usuarioRol.new.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${usuarioRolInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${usuarioRolInstance}" var="error">
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
								value="${message(code: 'default.button.asignar.label', default: 'Asignar')}" />
						
						<g:link class="btn btn-default" controller="usuario" action="show" id="${usuarioRolInstance?.usuario?.id}">
					<g:message code="cancelar" default="Cancelar" />
				</g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
