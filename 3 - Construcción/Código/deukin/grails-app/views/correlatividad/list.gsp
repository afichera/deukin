
<%@ page import="com.deukin.Correlatividad" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'correlatividad.label', default: 'Correlatividad')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-correlatividad" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="correlatividad.materia.label" default="Materia" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${correlatividadInstanceList}" status="i" var="correlatividadInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${correlatividadInstance.id}">${fieldValue(bean: correlatividadInstance, field: "materia")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${correlatividadInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
