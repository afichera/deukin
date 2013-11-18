
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
					
						<g:sortableColumn property="fundamentacion" title="${message(code: 'carrera.fundamentacion.label', default: 'Fundamentación')}" />
					
						<g:sortableColumn property="perfilDelGraduado" title="${message(code: 'carrera.perfilDelGraduado.label', default: 'Perfil Del Graduado')}" />
					
						<g:sortableColumn property="descripcion" title="${message(code: 'carrera.descripcion.label', default: 'Descripción')}" />
					
						<g:sortableColumn property="coordinador" title="${message(code: 'carrera.coordinador.label', default: 'Coordinador')}" />
						
						<g:sortableColumn property="estado" title="${message(code: 'carrera.estado.label', default: 'Estado')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carreraInstanceList}" status="i" var="carreraInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${carreraInstance.id}">${fieldValue(bean: carreraInstance, field: "titulo")}</g:link></td>
					
						<td>${fieldValue(bean: carreraInstance, field: "fundamentacion")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "perfilDelGraduado")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "descripcion")}</td>
					
						<td>${fieldValue(bean: carreraInstance, field: "coordinador")}</td>
					
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
