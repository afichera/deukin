
<%@ page import="com.deukin.Parametro" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'parametro.label', default: 'Parametro')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-parametro" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'parametro.codigo.label', default: 'Codigo <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="valor" title="${message(code: 'parametro.valor.label', default: 'Valor <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="tipoParametro" title="${message(code: 'parametro.tipoParametro.label', default: 'Tipo Parametro <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${parametroInstanceList}" status="i" var="parametroInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${parametroInstance.id}">${fieldValue(bean: parametroInstance, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: parametroInstance, field: "valor")}</td>
					
						<td>${fieldValue(bean: parametroInstance, field: "tipoParametro")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${parametroInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
