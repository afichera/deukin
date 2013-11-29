
<%@ page import="com.deukin.CronogramaCarrera" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cronogramaCarrera" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="cronogramaCarrera.cicloLectivo.label" default="Ciclo Lectivo" /></th>
					
						<th><g:message code="cronogramaCarrera.planEstudio.label" default="Plan Estudio" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cronogramaCarreraInstanceList}" status="i" var="cronogramaCarreraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cronogramaCarreraInstance.id}">${fieldValue(bean: cronogramaCarreraInstance, field: "cicloLectivo")}</g:link></td>
					
						<td>${fieldValue(bean: cronogramaCarreraInstance, field: "planEstudio")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cronogramaCarreraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
