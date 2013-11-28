
<%@ page import="com.deukin.ConfiguracionCursoDia" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="cursos.create.label" /></g:link></li>
			</ul>
		</div>
		<div id="list-configuracionCursoDia" class="content scaffold-list" role="main">
			<h1><g:message code="cursos.list.label" /></h1>
			<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="horaInicio" title="${message(code: 'configuracionCursoDia.horaInicio.label', default: 'Hora Inicio')}" />
					
						<g:sortableColumn property="horaFin" title="${message(code: 'configuracionCursoDia.horaFin.label', default: 'Hora Fin')}" />
					
						<g:sortableColumn property="minutosInicio" title="${message(code: 'configuracionCursoDia.minutosInicio.label', default: 'Minutos Inicio')}" />
					
						<g:sortableColumn property="minutosFin" title="${message(code: 'configuracionCursoDia.minutosFin.label', default: 'Minutos Fin')}" />
					
						<th><g:message code="configuracionCursoDia.curso.label" default="Curso" /></th>
					
						<g:sortableColumn property="diaSemana" title="${message(code: 'configuracionCursoDia.diaSemana.label', default: 'Dia Semana')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracionCursoDiaInstanceList}" status="i" var="configuracionCursoDiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracionCursoDiaInstance.id}">${fieldValue(bean: configuracionCursoDiaInstance, field: "horaInicio")}</g:link></td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "horaFin")}</td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "minutosInicio")}</td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "minutosFin")}</td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "curso")}</td>
					
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "diaSemana")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${configuracionCursoDiaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
