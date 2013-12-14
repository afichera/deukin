
<%@ page import="com.deukin.CurriculumAdjunto" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-curriculumAdjunto" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="archivo" title="${message(code: 'curriculumAdjunto.archivo.label', default: 'Archivo <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<th><g:message code="curriculumAdjunto.persona.label" default="Persona" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${curriculumAdjuntoInstanceList}" status="i" var="curriculumAdjuntoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${curriculumAdjuntoInstance.id}">${fieldValue(bean: curriculumAdjuntoInstance, field: "archivo")}</g:link></td>
					
						<td>${fieldValue(bean: curriculumAdjuntoInstance, field: "persona")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table></div>
			<div class="pagination">
				<g:paginate total="${curriculumAdjuntoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
