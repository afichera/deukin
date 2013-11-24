
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
				<li><g:link class="create" action="create"><g:message code="carrera.new.label" /></g:link></li>
			</ul>
		</div>
		<div id="list-carrera" class="content scaffold-list" role="main">
			<h1><g:message code="carrera.list.label"  /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="titulo" title="${message(code: 'carrera.titulo.label', default: 'Título')}" defaultOrder="true"/>
					
						<g:sortableColumn property="planesEstudio" title="${message(code: 'carrera.planesEstudio.label', default: 'Planes de Estudio')}" />
					
						<g:sortableColumn property="estado" title="${message(code: 'carrera.estado.label', default: 'Estado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carreraInstanceList}" status="i" var="carreraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carreraInstance.id}">${fieldValue(bean: carreraInstance, field: "titulo")}</g:link></td>
					
						<td>
														<g:if test="${carreraInstance?.planesEstudio}">
								
									<g:each in="${carreraInstance.planesEstudio}" var="pl">
									
										<g:link controller="planEstudio" action="show" id="${pl.id}">
												${pl?.identificacion.encodeAsHTML()}</g:link><br/>
										
									</g:each>
								
							</g:if>
						
						
						
						</td>
					
   						<td>${fieldValue(bean: carreraInstance, field: "estado")}</td>
					
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
