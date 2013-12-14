
<%@ page import="com.deukin.InscripcionInstitucion"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'inscripcionInstitucion.label', default: 'Inscripcion a la Institucion')}" />
<title><g:message code="inscripcionInstitucion.list.label" /></title>
</head>

<body>
<div class="navbar navbar-inverse" role="navigation">
	<ul class="nav navbar-nav">
		<li><g:link class="create" controller="inscripcionInstitucion">
				<g:message code="inscripcionInstitucion.new.label" />
			</g:link></li>
	</ul>
</div>
	<div id="list-inscripcionInstitucion" class="content scaffold-list"
		role="main">
		<h1>
			<g:message code="inscripcionInstitucion.list.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="table-responsive"><table class="table table-responsive table-striped table-bordered table-hover">
			<thead>
				<tr>
					<g:sortableColumn property="usuarioRegistro.username"
						title="${message(code: 'inscripcionInstitucion.usuarioRegistro.label', default: 'Usuario <span class="glyphicon glyphicon-sort"></span>')}" />

					<g:sortableColumn property="apellido"
						title="${message(code: 'inscripcionInstitucion.apellido.label', default: 'Apellido <span class="glyphicon glyphicon-sort"></span>')}" />

					<g:sortableColumn property="nombre"
						title="${message(code: 'inscripcionInstitucion.nombre.label', default: 'Nombre <span class="glyphicon glyphicon-sort"></span>')}" />

					<g:sortableColumn property="tipoDocumento"
						title="${message(code: 'inscripcionInstitucion.tipoDocumento.label', default: 'Tipo Doc. <span class="glyphicon glyphicon-sort"></span>')}" />

					<g:sortableColumn property="documentoNumero"
						title="${message(code: 'inscripcionInstitucion.documentoNumero.label', default: 'Documento Numero <span class="glyphicon glyphicon-sort"></span>')}" />

					<g:sortableColumn property="fechaInscripcion"
						title="${message(code: 'inscripcionInstitucion.fechaInscripcion.label', default: 'Fecha <span class="glyphicon glyphicon-sort"></span>')}" />

					<sec:ifAnyGranted
						roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_ADMINISTRATIVO">
						<g:sortableColumn property="estadoInscripcionInstitucion"
							title="${message(code: 'inscripcionInstitucion.estadoInscripcionInstitucion.label', default: 'Estado <span class="glyphicon glyphicon-sort"></span>')}" />
					</sec:ifAnyGranted>

				</tr>
			</thead>
			<tbody>
				<g:each in="${inscripcionInstitucionInstanceList}" status="i"
					var="inscripcionInstitucionInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show"
								id="${inscripcionInstitucionInstance.id}">
								${fieldValue(bean: inscripcionInstitucionInstance.usuarioRegistro, field: "username")}
							</g:link></td>

						<td>
							${fieldValue(bean: inscripcionInstitucionInstance, field: "apellido")}
						</td>

						<td>
							${fieldValue(bean: inscripcionInstitucionInstance, field: "nombre")}
						</td>

						<td>
							${fieldValue(bean: inscripcionInstitucionInstance, field: "tipoDocumento")}
						</td>

						<td>
							${inscripcionInstitucionInstance?.numeroDocumentoAsText()}
						</td>

						<td><g:formatDate
								date="${inscripcionInstitucionInstance.fechaInscripcion}" /></td>

						<sec:ifAnyGranted
							roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_ADMINISTRATIVO">
							<td>
								${fieldValue(bean: inscripcionInstitucionInstance, field: "estadoInscripcionInstitucion")}
							</td>
						</sec:ifAnyGranted>

					</tr>
				</g:each>
			</tbody>
		</table></div>
		<div class="pagination">
			<g:paginate total="${inscripcionInstitucionInstanceTotal}" />
		</div>
	</div>
</body>
</html>
