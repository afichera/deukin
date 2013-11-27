
<%@ page import="com.deukin.Equivalencia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'equivalencia.label', default: 'Equivalencia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="equivalencia.create.label"/></g:link></li>
			</ul>
		</div>
		<div id="list-equivalencia" class="content scaffold-list" role="main">
			<h1><g:message code="equivalencia.list.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="equivalencia.materiaPrincipal.label" default="Materia Principal" /></th>
					
						<th><g:message code="equivalencia.materiaEquivalente.label" default="Materia Equivalente" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${equivalenciaInstanceList}" status="i" var="equivalenciaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${equivalenciaInstance.id}">${fieldValue(bean: equivalenciaInstance, field: "materiaPrincipal")}</g:link></td>
					
						<td>${fieldValue(bean: equivalenciaInstance, field: "materiaEquivalente")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${equivalenciaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
