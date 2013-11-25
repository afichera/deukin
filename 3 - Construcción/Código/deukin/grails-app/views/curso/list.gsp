
<%@ page import="com.deukin.Curso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curso.label', default: 'Curso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-curso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'curso.codigo.label', default: 'Codigo <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="curso.cronogramaCarrera.label" default="Cronograma Carrera" /></th>
					
						<g:sortableColumn property="estadoCurso" title="${message(code: 'curso.estadoCurso.label', default: 'Estado Curso <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="curso.materia.label" default="Materia" /></th>
					
						<th><g:message code="curso.turno.label" default="Turno" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cursoInstanceList}" status="i" var="cursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cursoInstance.id}">${fieldValue(bean: cursoInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: cursoInstance, field: "cronogramaCarrera")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "estadoCurso")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "materia")}</td>
					
						<td>${fieldValue(bean: cursoInstance, field: "turno")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cursoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
