
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
		<table class="table table-striped table-responsive table-bordered table-hover">
			<thead>
				<tr>
					<g:sortableColumn property="username"
						title="${message(code: 'usuario.username.label', default: 'Username <span class="glyphicon glyphicon-sort"></span>')}" />
					<g:sortableColumn property="accountLocked"
						title="${message(code: 'usuario.accountLocked.label', default: 'Cuenta Bloqueada <span class="glyphicon glyphicon-sort"></span>')}" />
					<g:sortableColumn property="enabled"
						title="${message(code: 'usuario.enabled.label', default: 'Activo <span class="glyphicon glyphicon-sort"></span>')}" />


				</tr>
			</thead>
			<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${usuarioInstance.id}">
								${fieldValue(bean: usuarioInstance, field: "username")}
							</g:link></td>

						<td><g:formatBoolean
								boolean="${usuarioInstance.accountLocked}" /></td>

						<td><g:formatBoolean boolean="${usuarioInstance.enabled}" /></td>

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
