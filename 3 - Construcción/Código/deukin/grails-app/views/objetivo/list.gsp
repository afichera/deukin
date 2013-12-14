
<%@ page import="com.deukin.Objetivo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetivo.label', default: 'Objetivo')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objetivo" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'objetivo.descripcion.label', default: 'Descripcion <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="objetivo.materia.label" default="Materia" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetivoInstanceList}" status="i" var="objetivoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetivoInstance.id}">${fieldValue(bean: objetivoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: objetivoInstance, field: "materia")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${objetivoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
