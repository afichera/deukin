
<%@ page import="com.deukin.ObjetivoEspecifico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objetivoEspecifico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'objetivoEspecifico.descripcion.label', default: 'Descripcion <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="objetivoEspecifico.materia.label" default="Materia" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetivoEspecificoInstanceList}" status="i" var="objetivoEspecificoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetivoEspecificoInstance.id}">${fieldValue(bean: objetivoEspecificoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: objetivoEspecificoInstance, field: "materia")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${objetivoEspecificoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
