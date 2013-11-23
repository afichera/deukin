
<%@ page import="com.deukin.AsignacionPeriodoMateria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asignacionPeriodoMateria" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="asignacionPeriodoMateria.materia.label" default="Materia" /></th>
					
						<th><g:message code="asignacionPeriodoMateria.periodo.label" default="Periodo" /></th>
					
						<th><g:message code="asignacionPeriodoMateria.planEstudio.label" default="Plan Estudio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asignacionPeriodoMateriaInstanceList}" status="i" var="asignacionPeriodoMateriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asignacionPeriodoMateriaInstance.id}">${fieldValue(bean: asignacionPeriodoMateriaInstance, field: "materia")}</g:link></td>
					
						<td>${fieldValue(bean: asignacionPeriodoMateriaInstance, field: "periodo")}</td>
					
						<td>${fieldValue(bean: asignacionPeriodoMateriaInstance, field: "planEstudio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asignacionPeriodoMateriaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
