
<%@ page import="com.deukin.Docente" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-docente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th><g:message code="docente.fotoPerfil.label" default="Foto" /></th>
						
						<g:sortableColumn property="usuario" title="${message(code: 'docente.usuario.label', default: 'Usuario <span class="glyphicon glyphicon-sort"></span>')}" />
						
						
						<g:sortableColumn property="apellido" title="${message(code: 'docente.apellido.label', default: 'Apellido <span class="glyphicon glyphicon-sort"></span>')}" />
						
						<g:sortableColumn property="nombre" title="${message(code: 'docente.nombre.label', default: 'Nombre <span class="glyphicon glyphicon-sort"></span>')}" />
										
						<th><g:message code="docente.departamento.label" default="Departamento" /></th>
					
					
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${docenteInstanceList}" status="i" var="docenteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						
					
						<g:if test="${docenteInstance?.fotoPerfil}">
							<td><g:link action="show" id="${docenteInstance.id}">
									<rendering:inlinePng bytes="${docenteInstance.fotoPerfil}"
										width="50" />

								</g:link></td>
						</g:if>
						<g:if test="${docenteInstance?.fotoPerfil == null}">
							<td><g:link action="show" id="${docenteInstance.id}">
									<img height="50" width="50"
										src="${resource(dir: 'images', file: 'buddyicon.jpg')}"
										alt="Grails" />
								</g:link></td>
						</g:if>
					
						<td><a
							href="mailto:${fieldValue(bean: docenteInstance, field: "usuario.username")}">
								${fieldValue(bean: docenteInstance, field: "usuario.username")}
						</a></td>				
												
						<td>${fieldValue(bean: docenteInstance, field: "apellido")}</td>
						
						<td>${fieldValue(bean: docenteInstance, field: "nombre")}</td>					
					
						<td>${fieldValue(bean: docenteInstance, field: "departamento")}</td>	
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${docenteInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
