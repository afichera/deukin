

<%@ page import="com.deukin.Docente" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'docente.label', default: 'Docente')}" />
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

	<div id="show-docente"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<ol class="property-list docente">
						
				<g:if test="${docenteInstance?.usuario}">
				<li class="fieldcontain">
					<span id="usuario-label" class="property-label"><g:message code="docente.usuario.label" default="Usuario" /></span>
					
						<span class="property-value" aria-labelledby="usuario-label"><g:link controller="usuario" action="show" id="${docenteInstance?.usuario?.id}">${docenteInstance?.usuario?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.documento}">
				<li class="fieldcontain">
					<span id="documento-label" class="property-label"><g:message code="docente.documento.label" default="Documento" /></span>
					
						<span class="property-value" aria-labelledby="documento-label"><g:link controller="documento" action="show" id="${docenteInstance?.documento?.id}">${docenteInstance?.documento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.fotoPerfil}">
				<li class="fieldcontain">
					<span id="fotoPerfil-label" class="property-label"><g:message code="docente.fotoPerfil.label" default="Foto Perfil" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.nombramiento}">
				<li class="fieldcontain">
					<span id="nombramiento-label" class="property-label"><g:message code="docente.nombramiento.label" default="Nombramiento" /></span>
					
						<g:each in="${docenteInstance.nombramiento}" var="n">
						<span class="property-value" aria-labelledby="nombramiento-label"><g:link controller="nombramiento" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.curriculumDocente}">
				<li class="fieldcontain">
					<span id="curriculumDocente-label" class="property-label"><g:message code="docente.curriculumDocente.label" default="Curriculum Docente" /></span>
					
						<span class="property-value" aria-labelledby="curriculumDocente-label"><g:link controller="curriculum" action="show" id="${docenteInstance?.curriculumDocente?.id}">${docenteInstance?.curriculumDocente?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.departamento}">
				<li class="fieldcontain">
					<span id="departamento-label" class="property-label"><g:message code="docente.departamento.label" default="Departamento" /></span>
					
						<span class="property-value" aria-labelledby="departamento-label"><g:link controller="departamento" action="show" id="${docenteInstance?.departamento?.id}">${docenteInstance?.departamento?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.apellido}">
				<li class="fieldcontain">
					<span id="apellido-label" class="property-label"><g:message code="docente.apellido.label" default="Apellido" /></span>
					
						<span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${docenteInstance}" field="apellido"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.contacto}">
				<li class="fieldcontain">
					<span id="contacto-label" class="property-label"><g:message code="docente.contacto.label" default="Contacto" /></span>
					
						<span class="property-value" aria-labelledby="contacto-label"><g:link controller="contacto" action="show" id="${docenteInstance?.contacto?.id}">${docenteInstance?.contacto?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.curriculums}">
				<li class="fieldcontain">
					<span id="curriculums-label" class="property-label"><g:message code="docente.curriculums.label" default="Curriculums" /></span>
					
						<g:each in="${docenteInstance.curriculums}" var="c">
						<span class="property-value" aria-labelledby="curriculums-label"><g:link controller="curriculum" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.curriculumsAdjuntos}">
				<li class="fieldcontain">
					<span id="curriculumsAdjuntos-label" class="property-label"><g:message code="docente.curriculumsAdjuntos.label" default="Curriculums Adjuntos" /></span>
					
						<g:each in="${docenteInstance.curriculumsAdjuntos}" var="c">
						<span class="property-value" aria-labelledby="curriculumsAdjuntos-label"><g:link controller="curriculumAdjunto" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${docenteInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="docente.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${docenteInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${docenteInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${docenteInstance?.id}">
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
