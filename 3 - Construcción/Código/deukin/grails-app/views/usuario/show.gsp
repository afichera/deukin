

<%@ page import="com.deukin.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="usuario.title" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
				<li><g:link class="list" action="list">
						<g:message code="usuario.list.label" />
					</g:link></li>
			</sec:ifAnyGranted>
		</ul>
	</div>

	<div id="show-usuario" class="content scaffold-show" role="main">
		<h1>
			<g:message code="usuario.show.label"
				args="${[usuarioInstance?.username]}" />

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
						<label id="estadosLabel" class="property-label col-lg-2"><g:message
								code="usuario.estados.label" default="Estados" />: </label>
						<div class="col-lg-10">
							<ul>
								<g:if test="${usuarioInstance?.accountExpired}">
									<li>USUARIO EXPIRADO</li>
								</g:if>

								<g:if test="${usuarioInstance?.accountLocked}">
									<li>USUARIO BLOQUEADO</li>
								</g:if>

								<g:if test="${usuarioInstance?.enabled}">
									<li>USUARIO ACTIVO</li>
								</g:if>

								<g:if test="${usuarioInstance?.passwordExpired}">
									<li>PASSWORD EXPIRADA</li>
								</g:if>
							</ul>
						</div>
						</div>
<div class="fieldcontain row">
						<label id="rolesLabel" class="property-label col-lg-2"><g:message
								code="usuario.roles.label" default="Roles" />: 
																
									<g:link action="create"
										params="[usuarioId: usuarioInstance.id]"
										id="${usuarioInstance?.id}" controller="usuarioRol">
										<span class="glyphicon glyphicon-plus"
									title="${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}"></span>
									</g:link>
								
								</label>
						<div class="col-lg-10">
						<g:if test="${rolesInstanceList}">
						<ul>
							<g:each in="${rolesInstanceList}" status="i"
											var="rolesInstance">
											
												<li>	${rolesInstance?.authority} 
												
											
									<g:link controller="usuarioRol" action="delete" id="${rolesInstance?.id}" params="[userId: usuarioInstance?.id, rolId: rolesInstance?.id]"><span class="glyphicon glyphicon-trash"
									title="${message(code: 'default.add.label', args: [message(code: 'rol.label', default: 'Rol')])}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"></span></g:link>
												</li>
											
										</g:each>
								
						</ul>
						</g:if>
</div></div>
						<g:form>
							<fieldset class="buttons">
								<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">

									<g:hiddenField name="id" value="${usuarioInstance?.id}" />
									<g:link class="btn btn-info" action="edit"
										id="${usuarioInstance?.id}">
										<g:message code="default.button.edit.label" default="Edit" />
									</g:link>
								
									<g:actionSubmit class="btn btn-danger"
										action="resetearPassword"
										value="${message(code: 'default.button.resetPassword.label', default: 'Resetear Password')}"
										onclick="return confirm('${message(code: 'default.button.resetPassword.label.confirm.message', default: '¿Esta Seguro que desea resetear el password?')}');" />
								</sec:ifAnyGranted>

							</fieldset>
						</g:form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>
