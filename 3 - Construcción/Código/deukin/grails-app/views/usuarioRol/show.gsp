

<%@ page import="com.deukin.UsuarioRol"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuarioRol.label', default: 'UsuarioRol')}" />
<title><g:message code="usuarioRol.show.label" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="usuarioRol.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="usuarioRol.new.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-usuarioRol" class="content scaffold-show" role="main">
		<h1>
			<g:message code="usuarioRol.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">






					<div class="fieldcontain row">
						<label id="usuario-label" class="property-label col-lg-2"><g:message
								code="usuarioRol.usuario.label" default="Usuario" />:</label>
						<g:if test="${usuarioRolInstance?.usuario}">
							<div class="property-value col-lg-10"
								aria-labelledby="usuario-label">
								<g:link controller="usuario" action="show"
									id="${usuarioRolInstance?.usuario?.id}">
									${usuarioRolInstance?.usuario?.username}
								</g:link>
							</div>
						</g:if>
					</div>

					<div class="fieldcontain row">
						<label id="rol-label" class="property-label col-lg-2"><g:message
								code="usuarioRol.rol.label" default="Rol" />:</label>
						<g:if test="${usuarioRolInstance?.rol}">
							<div class="property-value col-lg-10" aria-labelledby="rol-label">
								${usuarioRolInstance?.rol?.authority}
							</div>
						</g:if>
					</div>


					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${usuarioRolInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${usuarioRolInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							${usuarioRolInstance?.id}
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}" id="${usuarioRolInstance?.id}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
