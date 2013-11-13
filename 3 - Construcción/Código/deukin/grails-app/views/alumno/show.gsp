

<%@ page import="com.deukin.Alumno" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'alumno.label', default: 'Alumno')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-alumno"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-6">
				<div class="well">
					<ol class="property-list alumno">
						
				<g:if test="${alumnoInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="alumno.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${alumnoInstance?.usuario?.id}">${alumnoInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.documento}">
				<li class="fieldcontain">
					<span id="documento-label" class="property-label"><g:message code="alumno.documento.label" default="Documento" /></span>
					
						<span class="property-value" aria-labelledby="documento-label"><g:link controller="documento" action="show" id="${alumnoInstance?.documento?.id}">${alumnoInstance?.documento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.fotoPerfil}">
				<li class="fieldcontain">
					<span id="fotoPerfil-label" class="property-label"><g:message code="alumno.fotoPerfil.label" default="Foto Perfil" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="alumno.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${alumnoInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.contacto}">
				<li class="fieldcontain">
					<span id="contacto-label" class="property-label"><g:message code="alumno.contacto.label" default="Contacto" /></span>
					
						<span class="property-value" aria-labelledby="contacto-label"><g:link controller="contacto" action="show" id="${alumnoInstance?.contacto?.id}">${alumnoInstance?.contacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.curriculums}">
				<li class="fieldcontain">
					<span id="curriculums-label" class="property-label"><g:message code="alumno.curriculums.label" default="Curriculums" /></span>
					
						<g:each in="${alumnoInstance.curriculums}" var="c">
						<span class="property-value" aria-labelledby="curriculums-label"><g:link controller="curriculum" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.curriculumsAdjuntos}">
				<li class="fieldcontain">
					<span id="curriculumsAdjuntos-label" class="property-label"><g:message code="alumno.curriculumsAdjuntos.label" default="Curriculums Adjuntos" /></span>
					
						<g:each in="${alumnoInstance.curriculumsAdjuntos}" var="c">
						<span class="property-value" aria-labelledby="curriculumsAdjuntos-label"><g:link controller="curriculumAdjunto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${alumnoInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="alumno.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${alumnoInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${alumnoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${alumnoInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
