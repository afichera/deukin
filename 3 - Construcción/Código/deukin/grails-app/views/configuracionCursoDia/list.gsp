
<%@ page import="com.deukin.ConfiguracionCursoDia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-configuracionCursoDia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="configuracionCursoDia.curso.label" default="Curso" /></th>
					
						<g:sortableColumn property="diaSemana" title="${message(code: 'configuracionCursoDia.diaSemana.label', default: 'Dia Semana <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="configuracionCursoDia.espacioFisico.label" default="Espacio Fisico" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracionCursoDiaInstanceList}" status="i" var="configuracionCursoDiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracionCursoDiaInstance.id}">${fieldValue(bean: configuracionCursoDiaInstance, field: "curso")}</g:link></td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "diaSemana")}</td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "espacioFisico")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configuracionCursoDiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
