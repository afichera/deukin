
<%@ page import="com.deukin.Carrera" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'carrera.label', default: 'Carrera')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-carrera" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'carrera.titulo.label', default: 'Titulo <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="fundamentacion" title="${message(code: 'carrera.fundamentacion.label', default: 'Fundamentacion <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="perfilDelGraduado" title="${message(code: 'carrera.perfilDelGraduado.label', default: 'Perfil Del Graduado <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'carrera.descripcion.label', default: 'Descripcion <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="condicionIngreso" title="${message(code: 'carrera.condicionIngreso.label', default: 'Condicion Ingreso <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="modalidadAsistencia" title="${message(code: 'carrera.modalidadAsistencia.label', default: 'Modalidad Asistencia <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carreraInstanceList}" status="i" var="carreraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carreraInstance.id}">${fieldValue(bean: carreraInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: carreraInstance, field: "fundamentacion")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "perfilDelGraduado")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "condicionIngreso")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "modalidadAsistencia")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${carreraInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
