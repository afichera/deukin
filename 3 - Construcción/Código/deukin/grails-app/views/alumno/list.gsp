
<%@ page import="com.deukin.Alumno" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#">Alumnos</a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-alumno" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="alumno.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="alumno.documento.label" default="Documento" /></th>
					
						<th><g:message code="alumno.fotoPerfil.label" default="Foto Perfil" /></th>
					
						<g:sortableColumn property="apellido" title="${message(code: 'alumno.apellido.label', default: 'Apellido')}" />
					
						<th><g:message code="alumno.contacto.label" default="Contacto" /></th>
					
						<g:sortableColumn property="nombre" title="${message(code: 'alumno.nombre.label', default: 'Nombre')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${alumnoInstanceList}" status="i" var="alumnoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${alumnoInstance.id}">${fieldValue(bean: alumnoInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "documento")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "fotoPerfil")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "contacto")}</td>
					
						<td>${fieldValue(bean: alumnoInstance, field: "nombre")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alumnoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
