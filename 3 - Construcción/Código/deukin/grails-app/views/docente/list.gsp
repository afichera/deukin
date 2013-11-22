
<%@ page import="com.deukin.Docente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'docente.label', default: 'Docente')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-docente" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="docente.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="docente.documento.label" default="Documento" /></th>
					
						<g:sortableColumn property="fotoPerfil" title="${message(code: 'docente.fotoPerfil.label', default: 'Foto Perfil <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="docente.curriculumDocente.label" default="Curriculum Docente" /></th>
					
						<th><g:message code="docente.departamento.label" default="Departamento" /></th>
					
						<g:sortableColumn property="apellido" title="${message(code: 'docente.apellido.label', default: 'Apellido <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${docenteInstanceList}" status="i" var="docenteInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${docenteInstance.id}">${fieldValue(bean: docenteInstance, field: "usuario")}</g:link></td>
					
						<td>${fieldValue(bean: docenteInstance, field: "documento")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "fotoPerfil")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "curriculumDocente")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "departamento")}</td>
					
						<td>${fieldValue(bean: docenteInstance, field: "apellido")}</td>
					
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
