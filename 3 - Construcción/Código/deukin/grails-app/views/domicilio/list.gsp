
<%@ page import="com.deukin.Domicilio" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'domicilio.label', default: 'Domicilio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-domicilio" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="calle" title="${message(code: 'domicilio.calle.label', default: 'Calle <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="localidad" title="${message(code: 'domicilio.localidad.label', default: 'Localidad <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="observaciones" title="${message(code: 'domicilio.observaciones.label', default: 'Observaciones <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="codigoPostal" title="${message(code: 'domicilio.codigoPostal.label', default: 'Codigo Postal <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="numero" title="${message(code: 'domicilio.numero.label', default: 'Numero <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${domicilioInstanceList}" status="i" var="domicilioInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${domicilioInstance.id}">${fieldValue(bean: domicilioInstance, field: "calle")}</g:link></td>
					
						<td>${fieldValue(bean: domicilioInstance, field: "localidad")}</td>
					
						<td>${fieldValue(bean: domicilioInstance, field: "observaciones")}</td>
					
						<td>${fieldValue(bean: domicilioInstance, field: "codigoPostal")}</td>
					
						<td>${fieldValue(bean: domicilioInstance, field: "numero")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${domicilioInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
