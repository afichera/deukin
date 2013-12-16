
<%@ page import="com.deukin.Docente"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN">
<html>
<head>
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'docente.label', default: 'Docente')}" />
<title><g:message code="docente.list.label" /></title>
</head>
<body>
	<div id="list-docente" class="content scaffold-list" role="main">
		<h1>
			<g:message code="docente.list.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="table-responsive">
			<table
				class="table table-responsive table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th><g:message code="docente.fotoPerfil.label" default="Foto" /></th>

						<g:sortableColumn property="usuario"
							title="${message(code: 'docente.usuario.label', default: 'Usuario <span class="glyphicon glyphicon-sort"></span>')}" />


						<g:sortableColumn property="apellido"
							title="${message(code: 'docente.apellido.label', default: 'Apellido <span class="glyphicon glyphicon-sort"></span>')}" />

						<g:sortableColumn property="nombre"
							title="${message(code: 'docente.nombre.label', default: 'Nombre <span class="glyphicon glyphicon-sort"></span>')}" />

						<th><g:message code="docente.departamento.label"
								default="Departamento" /></th>
						<th><g:message code="docente.cantidadHorasCicloActual.label"
								default="Horas Ciclo Actual" /></th>


					</tr>
				</thead>
				<tbody>
					<g:each in="${docenteInstanceList}" status="i"
						var="docenteInstance">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">


							<td><g:if test="${docenteInstance?.fotoPerfil}">
									<g:link action="show" id="${docenteInstance.id}">
										<rendering:inlinePng bytes="${docenteInstance.fotoPerfil}"
											width="50" />

									</g:link>
								</g:if> <g:if test="${docenteInstance?.fotoPerfil == null}">
									<g:link action="show" id="${docenteInstance.id}">
											<img height="50" width="50"
												src="${resource(dir: 'images', file: 'buddyicon.jpg')}"
												alt="Grails" />
										</g:link>
								</g:if></td>
							<td><g:link action="show" id="${docenteInstance.id}">
									${fieldValue(bean: docenteInstance, field: "usuario.username")}
								</g:link></td>

							<td>
								${fieldValue(bean: docenteInstance, field: "apellido")}
							</td>

							<td>
								${fieldValue(bean: docenteInstance, field: "nombre")}
							</td>

							<td>
								${fieldValue(bean: docenteInstance, field: "departamento")}
							</td>

							<td>
								${fieldValue(bean: docenteInstance, field: "cantidadHorasCicloActual")}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</div>
		<div class="pagination">
			<g:paginate total="${docenteInstanceTotal}" />
		</div>
	</div>
</body>
</html>
