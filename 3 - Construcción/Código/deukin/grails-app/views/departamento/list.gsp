
<%@ page import="com.deukin.Departamento"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'departamento.label', default: 'Departamento')}" />
<title><g:message code="default.list.de.label"
		args="[entityName]" /></title>
</head>
<body>
	<div id="list-departamento" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.de.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>

					<g:sortableColumn property="nombre"
						title="${message(code: 'departamento.nombre.label', default: 'Nombre')}" />
					<th><g:message code="departamento.autoridades.label"
							default="Autoridades" /></th>
					<th><g:message code="departamento.carreras.label"
							default="Carreras" /></th>
					<th><g:message code="departamento.contacto.label"
							default="Contacto" /></th>

				</tr>
			</thead>
			<tbody>
				<g:each in="${departamentoInstanceList}" status="i"
					var="departamentoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link controller="proximamente" id="${departamentoInstance.id}">
								${fieldValue(bean: departamentoInstance, field: "nombre")}
							</g:link></td>

						<td><g:if test="${departamentoInstanceList?.autoridades?.empty}">
								<g:each in="${departamentoInstanceList?.autoridades}" status="y"
									var="autoridad">

									${autoridad?.cargo}: ${autoridad?.persona?.nombre}<br />

								</g:each>

							</g:if></td>
						<td><g:if test="${departamentoInstanceList?.carreras?.empty}">
								<g:each in="${departamentoInstanceList?.carreras}" status="k" var="carrera">

									${carrera?.titulo}<br />

								</g:each>
							</g:if></td>

						<td>
							${departamentoInstance?.contacto?.domicilio?.calle} - ${departamentoInstance?.contacto?.domicilio?.numero}<br />
							${departamentoInstance?.contacto?.domicilio?.localidad} - ${departamentoInstance?.contacto?.domicilio?.codigoPostal}

						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${departamentoInstanceTotal}" />
		</div>
	</div>
</body>
</html>
