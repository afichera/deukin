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
<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
	<div id="edit-usuarioRol"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="default.edit.label" args="[entityName]" />
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
			<div class="col-lg-6">
				<div class="well">
					<g:form method="post"
						>
						<g:hiddenField name="id" value="${usuarioRolInstance?.id}" />
						<g:hiddenField name="version" value="${usuarioRolInstance?.version}" />
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
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
