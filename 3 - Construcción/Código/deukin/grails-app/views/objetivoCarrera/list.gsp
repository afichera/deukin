
<%@ page import="com.deukin.ObjetivoCarrera" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-objetivoCarrera" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="objetivoCarrera.carrera.label" default="Carrera" /></th>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'objetivoCarrera.descripcion.label', default: 'Descripcion <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${objetivoCarreraInstanceList}" status="i" var="objetivoCarreraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${objetivoCarreraInstance.id}">${fieldValue(bean: objetivoCarreraInstance, field: "carrera")}</g:link></td>
					
						<td>${fieldValue(bean: objetivoCarreraInstance, field: "descripcion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${objetivoCarreraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
