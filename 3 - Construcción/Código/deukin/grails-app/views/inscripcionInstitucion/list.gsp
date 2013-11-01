
<%@ page import="com.deukin.InscripcionInstitucion" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-inscripcionInstitucion" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<g:sortableColumn property="documentoNumero" title="${message(code: 'inscripcionInstitucion.documentoNumero.label', default: 'Documento Numero <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="fechaBaja" title="${message(code: 'inscripcionInstitucion.fechaBaja.label', default: 'Fecha Baja <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="nombre" title="${message(code: 'inscripcionInstitucion.nombre.label', default: 'Nombre <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="apellido" title="${message(code: 'inscripcionInstitucion.apellido.label', default: 'Apellido <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="calle" title="${message(code: 'inscripcionInstitucion.calle.label', default: 'Calle <span class="glyphicon glyphicon-sort"></span>')}" />
					
						<g:sortableColumn property="localidad" title="${message(code: 'inscripcionInstitucion.localidad.label', default: 'Localidad <span class="glyphicon glyphicon-sort"></span>')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${inscripcionInstitucionInstanceList}" status="i" var="inscripcionInstitucionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${inscripcionInstitucionInstance.id}">${fieldValue(bean: inscripcionInstitucionInstance, field: "documentoNumero")}</g:link></td>
					
						<td><g:formatDate date="${inscripcionInstitucionInstance.fechaBaja}" /></td>
					
						<td>${fieldValue(bean: inscripcionInstitucionInstance, field: "nombre")}</td>
					
						<td>${fieldValue(bean: inscripcionInstitucionInstance, field: "apellido")}</td>
					
						<td>${fieldValue(bean: inscripcionInstitucionInstance, field: "calle")}</td>
					
						<td>${fieldValue(bean: inscripcionInstitucionInstance, field: "localidad")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${inscripcionInstitucionInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
