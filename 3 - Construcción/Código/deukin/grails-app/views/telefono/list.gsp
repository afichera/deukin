
<%@ page import="com.deukin.Telefono" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'telefono.label', default: 'Telefono')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-telefono" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="numero" title="${message(code: 'telefono.numero.label', default: 'Numero <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="telefono.contacto.label" default="Contacto" /></th>
					
						<g:sortableColumn property="tipoTelefono" title="${message(code: 'telefono.tipoTelefono.label', default: 'Tipo Telefono <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${telefonoInstanceList}" status="i" var="telefonoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${telefonoInstance.id}">${fieldValue(bean: telefonoInstance, field: "numero")}</g:link></td>
					
						<td>${fieldValue(bean: telefonoInstance, field: "contacto")}</td>
					
						<td>${fieldValue(bean: telefonoInstance, field: "tipoTelefono")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${telefonoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
