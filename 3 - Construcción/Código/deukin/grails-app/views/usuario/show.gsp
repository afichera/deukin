

<%@ page import="com.deukin.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
				<li><g:link class="list" action="list">
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</sec:ifAnyGranted>
		</ul>
	</div>

	<div id="show-usuario" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<ol class="property-list usuario">

						<g:if test="${usuarioInstance?.username}">
							<li class="fieldcontain"><span id="username-label"
								class="property-label"><g:message
										code="usuario.username.label" default="Username" /></span> <span
								class="property-value" aria-labelledby="username-label"><g:fieldValue
										bean="${usuarioInstance}" field="username" /></span></li>
						</g:if>

						<g:if test="${usuarioInstance?.accountExpired}">
							<li class="fieldcontain"><span id="accountExpired-label"
								class="property-label"><g:message
										code="usuario.accountExpired.label" default="Account Expired" /></span>

								<span class="property-value"
								aria-labelledby="accountExpired-label"><g:formatBoolean
										boolean="${usuarioInstance?.accountExpired}" /></span></li>
						</g:if>

						<g:if test="${usuarioInstance?.accountLocked}">
							<li class="fieldcontain"><span id="accountLocked-label"
								class="property-label"><g:message
										code="usuario.accountLocked.label" default="Account Locked" /></span>

								<span class="property-value"
								aria-labelledby="accountLocked-label"><g:formatBoolean
										boolean="${usuarioInstance?.accountLocked}" /></span></li>
						</g:if>

						<g:if test="${usuarioInstance?.enabled}">
							<li class="fieldcontain"><span id="enabled-label"
								class="property-label"><g:message
										code="usuario.enabled.label" default="Habilitado" /></span> <span
								class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
										boolean="${usuarioInstance?.enabled}" /></span></li>
						</g:if>

						<g:if test="${usuarioInstance?.passwordExpired}">
							<li class="fieldcontain"><span id="passwordExpired-label"
								class="property-label"><g:message
										code="usuario.passwordExpired.label"
										default="Password Expired" /></span> <span class="property-value"
								aria-labelledby="passwordExpired-label"><g:formatBoolean
										boolean="${usuarioInstance?.passwordExpired}" /></span></li>
						</g:if>

					</ol>

					<g:if test="${rolesInstanceList}">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th><g:message code="usuario.rolAsignado.label" /></th>
								</tr>
							</thead>
							<tbody>
								<g:each in="${rolesInstanceList}" status="i" var="rolesInstance">
									<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
										<td>
											${rolesInstance?.authority}
										</td>
									</tr>
								</g:each>
							</tbody>
						</table>
					</g:if>

					<g:form>
						<fieldset class="buttons">
							<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">

								<g:hiddenField name="id" value="${usuarioInstance?.id}" />
								<g:link class="btn btn-info" action="edit"
									id="${usuarioInstance?.id}">
									<g:message code="default.button.edit.label" default="Edit" />
								</g:link>
								<g:link class="btn btn-info" action="create" params="[usuarioId: usuarioInstance.id]"
									id="${usuarioInstance?.id}" controller="usuarioRol">
									<g:message code="usuarioRol.add.label" default="Edit" />
								</g:link>
								<g:actionSubmit class="btn btn-danger" action="resetearPassword"
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
