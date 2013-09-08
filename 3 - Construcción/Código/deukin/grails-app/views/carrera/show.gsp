

<%@ page import="com.deukin.Carrera" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'carrera.label', default: 'Carrera')}" />
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

	<div id="show-carrera"
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
					<ol class="property-list carrera">
						
				<g:if test="${carreraInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="carrera.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${carreraInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.planesEstudio}">
				<li class="fieldcontain">
					<span id="planesEstudio-label" class="property-label"><g:message code="carrera.planesEstudio.label" default="Planes Estudio" /></span>
					
						<g:each in="${carreraInstance.planesEstudio}" var="p">
						<span class="property-value" aria-labelledby="planesEstudio-label"><g:link controller="planEstudio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.fundamentacion}">
				<li class="fieldcontain">
					<span id="fundamentacion-label" class="property-label"><g:message code="carrera.fundamentacion.label" default="Fundamentacion" /></span>
					
						<span class="property-value" aria-labelledby="fundamentacion-label"><g:fieldValue bean="${carreraInstance}" field="fundamentacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.perfilDelGraduado}">
				<li class="fieldcontain">
					<span id="perfilDelGraduado-label" class="property-label"><g:message code="carrera.perfilDelGraduado.label" default="Perfil Del Graduado" /></span>
					
						<span class="property-value" aria-labelledby="perfilDelGraduado-label"><g:fieldValue bean="${carreraInstance}" field="perfilDelGraduado"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="carrera.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${carreraInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.condicionIngreso}">
				<li class="fieldcontain">
					<span id="condicionIngreso-label" class="property-label"><g:message code="carrera.condicionIngreso.label" default="Condicion Ingreso" /></span>
					
						<span class="property-value" aria-labelledby="condicionIngreso-label"><g:fieldValue bean="${carreraInstance}" field="condicionIngreso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.modalidadAsistencia}">
				<li class="fieldcontain">
					<span id="modalidadAsistencia-label" class="property-label"><g:message code="carrera.modalidadAsistencia.label" default="Modalidad Asistencia" /></span>
					
						<span class="property-value" aria-labelledby="modalidadAsistencia-label"><g:fieldValue bean="${carreraInstance}" field="modalidadAsistencia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${carreraInstance?.objetivos}">
				<li class="fieldcontain">
					<span id="objetivos-label" class="property-label"><g:message code="carrera.objetivos.label" default="Objetivos" /></span>
					
						<span class="property-value" aria-labelledby="objetivos-label"><g:fieldValue bean="${carreraInstance}" field="objetivos"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${carreraInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${carreraInstance?.id}">
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
