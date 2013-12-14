
<%@ page import="com.deukin.EspacioFisico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'espacioFisico.label', default: 'EspacioFisico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-espacioFisico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'espacioFisico.numero.label', default: 'Numero <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="ubicacion" title="${message(code: 'espacioFisico.ubicacion.label', default: 'Ubicacion <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'espacioFisico.observaciones.label', default: 'Observaciones <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${espacioFisicoInstanceList}" status="i" var="espacioFisicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${espacioFisicoInstance.id}">${fieldValue(bean: espacioFisicoInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: espacioFisicoInstance, field: "ubicacion")}</td>
					
						<td>${fieldValue(bean: espacioFisicoInstance, field: "observaciones")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${espacioFisicoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
