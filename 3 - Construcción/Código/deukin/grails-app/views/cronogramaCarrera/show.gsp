

<%@ page import="com.deukin.CronogramaCarrera" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera')}" />
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

	<div id="show-cronogramaCarrera"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<ol class="property-list cronogramaCarrera">
						
				<g:if test="${cronogramaCarreraInstance?.cicloLectivo}">
				<li class="fieldcontain">
					<span id="cicloLectivo-label" class="property-label"><g:message code="cronogramaCarrera.cicloLectivo.label" default="Ciclo Lectivo" /></span>
					
						<span class="property-value" aria-labelledby="cicloLectivo-label"><g:link controller="cicloLectivo" action="show" id="${cronogramaCarreraInstance?.cicloLectivo?.id}">${cronogramaCarreraInstance?.cicloLectivo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cronogramaCarreraInstance?.cursos}">
				<li class="fieldcontain">
					<span id="cursos-label" class="property-label"><g:message code="cronogramaCarrera.cursos.label" default="Cursos" /></span>
					
						<g:each in="${cronogramaCarreraInstance.cursos}" var="c">
						<span class="property-value" aria-labelledby="cursos-label"><g:link controller="curso" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cronogramaCarreraInstance?.planEstudio}">
				<li class="fieldcontain">
					<span id="planEstudio-label" class="property-label"><g:message code="cronogramaCarrera.planEstudio.label" default="Plan Estudio" /></span>
					
						<span class="property-value" aria-labelledby="planEstudio-label"><g:link controller="planEstudio" action="show" id="${cronogramaCarreraInstance?.planEstudio?.id}">${cronogramaCarreraInstance?.planEstudio?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${cronogramaCarreraInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${cronogramaCarreraInstance?.id}">
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
