
<%@ page import="com.deukin.Alumno" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'alumno.label', default: 'Alumno')}" />
		<title><g:message code="default.list.de.label" args="[entityName]" /></title>
		</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">

		</div>
		<div id="list-alumno" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.de.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th><g:message code="alumno.fotoPerfil.label" default="Foto" /></th>
						
						<g:sortableColumn property="apellido" title="${message(code: 'alumno.apellido.label', default: 'Apellido <span class="glyphicon glyphicon-sort"></span>')}" />
						<g:sortableColumn property="nombre" title="${message(code: 'alumno.nombre.label', default: 'Nombre <span class="glyphicon glyphicon-sort"></span>')}" />						
						<th><g:message code="alumno.usuario.label" default="Usuario" /></th>
					
						<th><g:message code="alumno.documento.tipoDocumento.label" default="Documento" /></th>
										
						<th><g:message code="alumno.documento.numero.label" default="Número" /></th>
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${alumnoInstanceList}" status="i" var="alumnoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<g:if test="${alumnoInstance?.fotoPerfil}">
							<td><g:link action="show" id="${alumnoInstance.id}">
									<rendering:inlinePng bytes="${alumnoInstance.fotoPerfil}" width="50" />
									
								</g:link> </td>
						</g:if>
						<g:if test="${alumnoInstance?.fotoPerfil == null}">
							<td><g:link action="show" id="${alumnoInstance.id}"><img height="50" width="50" src="${resource(dir: 'images', file: 'buddyicon.jpg')}"  alt="Grails"/></g:link></td>
						</g:if>
						<td>${fieldValue(bean: alumnoInstance, field: "apellido")}</td>
						<td>${fieldValue(bean: alumnoInstance, field: "nombre")}</td>
						<td> <a href="mailto:${fieldValue(bean: alumnoInstance, field: "usuario.username")}">${fieldValue(bean: alumnoInstance, field: "usuario.username")}</a> </td>
						<td>${fieldValue(bean: alumnoInstance, field: "documento.tipoDocumento")}</td>					
						<td>${alumnoInstance?.documento?.numeroAsText()}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${alumnoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
