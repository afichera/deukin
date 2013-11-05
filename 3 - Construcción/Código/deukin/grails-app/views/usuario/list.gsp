
<%@ page import="com.deukin.Usuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-usuario" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'usuario.username.label', default: 'Username <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="password" title="${message(code: 'usuario.password.label', default: 'Password <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'usuario.accountExpired.label', default: 'Account Expired <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'usuario.accountLocked.label', default: 'Account Locked <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'usuario.enabled.label', default: 'Enabled <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'usuario.passwordExpired.label', default: 'Password Expired <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${usuarioInstanceList}" status="i" var="usuarioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${usuarioInstance.id}">${fieldValue(bean: usuarioInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: usuarioInstance, field: "password")}</td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.accountExpired}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.accountLocked}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.enabled}" /></td>
					
						<td><g:formatBoolean boolean="${usuarioInstance.passwordExpired}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${usuarioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
