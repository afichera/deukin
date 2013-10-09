
<%@ page import="com.deukin.PlanEstudio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planEstudio.label', default: 'PlanEstudio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-planEstudio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="identificacion" title="${message(code: 'planEstudio.identificacion.label', default: 'Identificacion <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="cantidadPeriodosAcademicos" title="${message(code: 'planEstudio.cantidadPeriodosAcademicos.label', default: 'Cantidad Periodos Academicos <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="planEstudio.carrera.label" default="Carrera" /></th>
					
						<g:sortableColumn property="estado" title="${message(code: 'planEstudio.estado.label', default: 'Estado <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planEstudioInstanceList}" status="i" var="planEstudioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planEstudioInstance.id}">${fieldValue(bean: planEstudioInstance, field: "identificacion")}</g:link></td>
					
						<td>${fieldValue(bean: planEstudioInstance, field: "cantidadPeriodosAcademicos")}</td>
					
						<td>${fieldValue(bean: planEstudioInstance, field: "carrera")}</td>
					
						<td>${fieldValue(bean: planEstudioInstance, field: "estado")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planEstudioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
