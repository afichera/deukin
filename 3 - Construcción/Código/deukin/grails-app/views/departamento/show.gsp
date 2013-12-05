

<%@ page import="com.deukin.Departamento"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'departamento.label', default: 'Departamento')}" />
<title><g:message code="departamento.show.label"
		args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="default.list.de.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-departamento" class="content scaffold-show" role="main">
		<h1>
			<g:message code="departamento.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
						<g:if test="${departamentoInstance?.nombre}">
							<li class="fieldcontain"><span id="nombre-label"
								class="property-label"><g:message
										code="departamento.nombre.label" default="Nombre" /></span> <span
								class="property-value" aria-labelledby="nombre-label"><g:fieldValue
										bean="${departamentoInstance}" field="nombre" /></span></li>
						</g:if>

						<g:if test="${departamentoInstance?.mision}">
							<li class="fieldcontain"><span id="mision-label"
								class="property-label"><g:message
										code="departamento.mision.label" default="Mision" /></span> <span
								class="property-value" aria-labelledby="mision-label"><g:fieldValue
										bean="${departamentoInstance}" field="mision" /></span></li>
						</g:if>

						<g:if test="${departamentoInstance?.vision}">
							<li class="fieldcontain"><span id="vision-label"
								class="property-label"><g:message
										code="departamento.vision.label" default="Vision" /></span> <span
								class="property-value" aria-labelledby="vision-label"><g:fieldValue
										bean="${departamentoInstance}" field="vision" /></span></li>
						</g:if>

						<div class="fieldcontain row">
							<label id="domicilio-label" class="property-label col-lg-2"><g:message
									code="departamento.domicilio.label" default="Domicilio" /> </label>
							<div class="property-value col-lg-10"
								aria-labelledby="domicilio-label">
								<g:if test="${departamentoInstance?.contacto}">
									${departamentoInstance?.contacto?.domicilio.encodeAsHTML()}
								</g:if>
							</div>
						</div>

						<div class="fieldcontain row">
							<label id="telefonos-label" class="property-label col-lg-2"><g:message
									code="departamento.telefonos.label" /></label>
							<g:if test="${departamentoInstance?.contacto?.telefonos}">
								<g:each in="${departamentoInstance.contacto.telefonos}" var="t">
									<span class="property-value col-lg-10"
										aria-labelledby="telefonos-label"> ${t?.encodeAsHTML()}<br />
									</span>
								</g:each>
							</g:if>
						</div>


						<div class="fieldcontain row">
							<label id="autoridades-label" class="property-label"><g:message
									code="departamento.autoridades.label" />:</label>

							<g:if test="${departamentoInstance?.autoridades}">
								<g:each in="${departamentoInstance.autoridades}" var="a">
									<span class="property-value col-lg-10"
										aria-labelledby="autoridades-label"><g:link
											controller="autoridad" action="show" id="${a.id}">
											${a?.encodeAsHTML()}
										</g:link></span>
								</g:each>
								
							</g:if>
						</div>
						
						<div class="fieldcontain row">
							<label id="carreras-label" class="property-label"><g:message
									code="departamento.carreras.label" />:</label>

							<g:if test="${departamentoInstance?.carreras}">
							<g:each in="${departamentoInstance.carreras}" var="a">
									<span class="property-value col-lg-10"
										aria-labelledby="carreras-label"><g:link
											controller="carrera" action="show" id="${a.id}">
											${a?.titulo}
										</g:link></span>
								</g:each>
							</g:if>
						</div>
						
						<div class="fieldcontain row">
							<label id="docentes-label" class="property-label"><g:message
									code="departamento.docentes.label" />:</label>
						</div>
						
						<div class="fieldcontain row">
							<g:if test="${departamentoInstance?.docentes}">
							<g:each in="${departamentoInstance.docentes}" var="a">
									<span class="property-value col-lg-10"
										aria-labelledby="docentes-label"><g:link
											controller="docente" action="show" id="${a.id}">
											${a?.encodeAsHTML()}
										</g:link></span>
								</g:each>
							</g:if>
						</div>
						


					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${departamentoInstance?.id}" />
							<%--							<g:link class="btn btn-info" action="edit"--%>
							<%--								id="${departamentoInstance?.id}">--%>
							<%--								<g:message code="default.button.edit.label" default="Edit" />--%>
							<%--							</g:link>--%>
							<%--							<g:actionSubmit class="btn btn-danger" action="delete"--%>
							<%--								value="${message(code: 'default.button.delete.label', default: 'Delete')}"--%>
							<%--								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--%>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
