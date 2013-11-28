
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
					
										
						<th>${message(code: 'cursos.codigo.label', default: 'Código')}</th>
						
						<th>${message(code: 'cursos.materia.label', default: 'Materia')}</th>
						
						<th>${message(code: 'cursos.espacioFisico.label', default: 'Aula/Laboratorio')}</th>
					
						<th>${message(code: 'configuracionCursoDia.diaSemana.label', default: 'Día')}</th>
					
						<th>${message(code: 'configuracionCursoDia.horario.label', default: 'Horario')}</th>
					
						<th>${message(code: 'configuracionCursoDia.docentes.label', default: 'Docentes')}</th>
								
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${configuracionCursoDiaInstanceList}" status="i" var="configuracionCursoDiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${configuracionCursoDiaInstance.curso.id}">${fieldValue(bean: configuracionCursoDiaInstance?.curso, field: "codigo")}</g:link></td>					
						
						<td>${fieldValue(bean: configuracionCursoDiaInstance?.curso, field: "materia")}</td>
						
						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "espacioFisico")}</td>

						<td>${fieldValue(bean: configuracionCursoDiaInstance, field: "diaSemana")}</td>
					
						<td>${configuracionCursoDiaInstance.getStartTime()}-${configuracionCursoDiaInstance.getEndTime()}</td>
						
						<td>
						<g:each in="${configuracionCursoDiaInstance.asignacionesDocenteCurso}" status="y" var="a">
						<g:link controller="docente" action="show" id="${a.docente.id}">${fieldValue(bean: a, field: "docente")}</g:link><br/>
						</g:each>
						</td>
					

					
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
