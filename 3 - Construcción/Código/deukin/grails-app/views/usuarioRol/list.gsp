
<%@ page import="com.deukin.UsuarioRol"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'usuarioRol.label', default: 'UsuarioRol')}" />
<title><g:message code="usuarioRol.list.label" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="create" action="create">
					<g:message code="usuarioRol.new.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-usuarioRol" class="content scaffold-list" role="main">
		<h1>
			<g:message code="usuarioRol.list.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
			<thead>
				<tr>
					<th><g:message code="usuarioRol.usuario.label"
							default="Usuario" /></th>
					<th><g:message code="usuarioRol.rol.label" default="Rol" /></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${usuarioRolInstanceList}" status="i"
					var="usuarioRolInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td><g:link action="show" id="${usuarioRolInstance.id}" params="[userId: usuarioRolInstance.usuario.id, rolId: usuarioRolInstance.rol.id]">
								${fieldValue(bean: usuarioRolInstance?.usuario, field: "username")}
							</g:link></td>
						<td>
							${fieldValue(bean: usuarioRolInstance?.rol, field: "authority")}
						</td>
					</tr>
				</g:each>
			</tbody>
		</table></div>
		<div class="pagination">
			<g:paginate total="${usuarioRolInstanceTotal}" />
		</div>
	</div>
</body>
</html>
