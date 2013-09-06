
<%@ page import="com.deukin.Materia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'materia.label', default: 'Materia')}" />
		<title><g:message code="default.list.de.label" args="[entityName]"/></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.newF.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-materia" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.de.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="codigo" title="${message(code: 'materia.codigo.label', default: 'Codigo <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'materia.nombre.label', default: 'Nombre <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="bibliografia" title="${message(code: 'materia.bibliografia.label', default: 'Bibliografia <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="cantidadDocentesRequeridos" title="${message(code: 'materia.cantidadDocentesRequeridos.label', default: 'Cantidad Docentes Requeridos <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="cantidadUnidadesHorarias" title="${message(code: 'materia.cantidadUnidadesHorarias.label', default: 'Cantidad Unidades Horarias <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="contenidoMinimo" title="${message(code: 'materia.contenidoMinimo.label', default: 'Contenido Minimo <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${materiaInstanceList}" status="i" var="materiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}" 
						onclick='document.location = "<g:createLink action='show' id='${materiaInstance.id}'/>" '>
	         			
					
						<td>${fieldValue(bean: materiaInstance, field: "codigo")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "bibliografia")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "cantidadDocentesRequeridos")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "cantidadUnidadesHorarias")}</td>
					
						<td>${fieldValue(bean: materiaInstance, field: "contenidoMinimo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${materiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
