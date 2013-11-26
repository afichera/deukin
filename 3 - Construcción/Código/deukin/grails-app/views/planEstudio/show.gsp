

<%@ page import="com.deukin.PlanEstudio" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'planEstudio.label', default: 'PlanEstudio')}" />
<title><g:message code="planEstudio.show.label"  /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="planEstudio.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="planEstudio.new.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-planEstudio"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="planEstudio.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<ol class="property-list planEstudio">
						
				<g:if test="${planEstudioInstance?.identificacion}">
				<li class="fieldcontain">
					<span id="identificacion-label" class="property-label"><g:message code="planEstudio.identificacion.label" default="Identificacion" /></span>
					
						<span class="property-value" aria-labelledby="identificacion-label"><g:fieldValue bean="${planEstudioInstance}" field="identificacion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planEstudioInstance?.cantidadPeriodosAcademicos}">
				<li class="fieldcontain">
					<span id="cantidadPeriodosAcademicos-label" class="property-label"><g:message code="planEstudio.cantidadPeriodosAcademicos.label" default="Cantidad Periodos Academicos" /></span>
					
						<span class="property-value" aria-labelledby="cantidadPeriodosAcademicos-label"><g:fieldValue bean="${planEstudioInstance}" field="cantidadPeriodosAcademicos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${planEstudioInstance?.asignacionesPeriodosMaterias}">
				<li class="fieldcontain">
					<span id="asignacionesPeriodosMaterias-label" class="property-label"><g:message code="planEstudio.asignacionesPeriodosMaterias.label" default="Asignaciones Periodos Materias" /></span>
					
						<g:each in="${planEstudioInstance.asignacionesPeriodosMaterias}" var="a">
						<span class="property-value" aria-labelledby="asignacionesPeriodosMaterias-label"><g:link controller="asignacionPeriodoMateria" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${planEstudioInstance?.carrera}">
				<li class="fieldcontain">
					<span id="carrera-label" class="property-label"><g:message code="planEstudio.carrera.label" default="Carrera" /></span>
					
						<span class="property-value" aria-labelledby="carrera-label"><g:link controller="carrera" action="show" id="${planEstudioInstance?.carrera?.id}">${planEstudioInstance?.carrera?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${planEstudioInstance?.estado}">
				<li class="fieldcontain">
					<span id="estado-label" class="property-label"><g:message code="planEstudio.estado.label" default="Estado" /></span>
					
						<span class="property-value" aria-labelledby="estado-label"><g:fieldValue bean="${planEstudioInstance}" field="estado"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${planEstudioInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${planEstudioInstance?.id}">
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
