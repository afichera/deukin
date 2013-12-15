
<%@ page import="com.deukin.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuario.label', default: 'Usuario')}" />
<title><g:message code="usuario.list.label" /></title>
</head>
<body>

	<div id="list-usuario" class="content scaffold-list" role="main">
		<h1>
			<g:message code="usuario.list.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="table-responsive">
		<table class="table table-striped table-responsive table-bordered table-hover">
			<thead>
				<tr>
					<g:sortableColumn property="username"
						title="${message(code: 'usuario.username.label', default: 'Username')}" />
					<g:sortableColumn property="accountLocked"
						title="${message(code: 'usuario.accountLocked.label', default: 'Bloqueado')}" />
					<g:sortableColumn property="enabled"
						title="${message(code: 'usuario.enabled.label', default: 'Activo')}" />
						<th><g:message code="usuario.rolAsignado.label" default= "Roles" /></th>


				</tr>
			</thead>
			<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${usuarioInstance.id}">
								${fieldValue(bean: usuarioInstance, field: "username")}
							</g:link></td>

						<td>
						<g:if test="${usuarioInstance.accountLocked}">
						X
						</g:if>

								</td>

						<td><g:if test="${usuarioInstance.enabled}">X</g:if></td>

					<td><g:if test="${roles}">


														<g:each in="${roles}" status="y" var="r">
														
															<g:if test="${r?.usuario?.id==usuarioInstance?.id}">
																
																	${r?.rol.encodeAsHTML()}<br />
																
															</g:if>
														</g:each>

													</g:if></td>
					</tr>
					
					
					
				</g:each>
			</tbody>
		</table></div>
		<div class="pagination">
			<g:paginate total="${usuarioInstanceTotal}" />
		</div>
	</div>
</body>
</html>
