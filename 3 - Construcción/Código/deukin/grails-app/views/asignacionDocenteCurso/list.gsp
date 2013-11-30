
<%@ page import="com.deukin.AsignacionDocenteCurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-asignacionDocenteCurso" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="asignacionDocenteCurso.docente.label" default="Docente" /></th>
					
						<th><g:message code="asignacionDocenteCurso.configuracionCursoDia.label" default="Configuracion Curso Dia" /></th>
					
						<g:sortableColumn property="tipoPorcentajeAsignacion" title="${message(code: 'asignacionDocenteCurso.tipoPorcentajeAsignacion.label', default: 'Tipo Porcentaje Asignacion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${asignacionDocenteCursoInstanceList}" status="i" var="asignacionDocenteCursoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${asignacionDocenteCursoInstance.id}">${fieldValue(bean: asignacionDocenteCursoInstance, field: "docente")}</g:link></td>
					
						<td>${fieldValue(bean: asignacionDocenteCursoInstance, field: "configuracionCursoDia")}</td>
					
						<td>${fieldValue(bean: asignacionDocenteCursoInstance, field: "tipoPorcentajeAsignacion")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${asignacionDocenteCursoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
