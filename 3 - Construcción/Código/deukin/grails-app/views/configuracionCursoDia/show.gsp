

<%@ page import="com.deukin.ConfiguracionCursoDia" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia')}" />
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

	<div id="show-configuracionCursoDia"
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
					<ol class="property-list configuracionCursoDia">
						
				<g:if test="${configuracionCursoDiaInstance?.horaInicio}">
				<li class="fieldcontain">
					<span id="horaInicio-label" class="property-label"><g:message code="configuracionCursoDia.horaInicio.label" default="Hora Inicio" /></span>
					
						<span class="property-value" aria-labelledby="horaInicio-label"><g:fieldValue bean="${configuracionCursoDiaInstance}" field="horaInicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.horaFin}">
				<li class="fieldcontain">
					<span id="horaFin-label" class="property-label"><g:message code="configuracionCursoDia.horaFin.label" default="Hora Fin" /></span>
					
						<span class="property-value" aria-labelledby="horaFin-label"><g:fieldValue bean="${configuracionCursoDiaInstance}" field="horaFin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.minutosInicio}">
				<li class="fieldcontain">
					<span id="minutosInicio-label" class="property-label"><g:message code="configuracionCursoDia.minutosInicio.label" default="Minutos Inicio" /></span>
					
						<span class="property-value" aria-labelledby="minutosInicio-label"><g:fieldValue bean="${configuracionCursoDiaInstance}" field="minutosInicio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.minutosFin}">
				<li class="fieldcontain">
					<span id="minutosFin-label" class="property-label"><g:message code="configuracionCursoDia.minutosFin.label" default="Minutos Fin" /></span>
					
						<span class="property-value" aria-labelledby="minutosFin-label"><g:fieldValue bean="${configuracionCursoDiaInstance}" field="minutosFin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.asignacionesDocenteCurso}">
				<li class="fieldcontain">
					<span id="asignacionesDocenteCurso-label" class="property-label"><g:message code="configuracionCursoDia.asignacionesDocenteCurso.label" default="Asignaciones Docente Curso" /></span>
					
						<g:each in="${configuracionCursoDiaInstance.asignacionesDocenteCurso}" var="a">
						<span class="property-value" aria-labelledby="asignacionesDocenteCurso-label"><g:link controller="asignacionDocenteCurso" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.curso}">
				<li class="fieldcontain">
					<span id="curso-label" class="property-label"><g:message code="configuracionCursoDia.curso.label" default="Curso" /></span>
					
						<span class="property-value" aria-labelledby="curso-label"><g:link controller="curso" action="show" id="${configuracionCursoDiaInstance?.curso?.id}">${configuracionCursoDiaInstance?.curso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.diaSemana}">
				<li class="fieldcontain">
					<span id="diaSemana-label" class="property-label"><g:message code="configuracionCursoDia.diaSemana.label" default="Dia Semana" /></span>
					
						<span class="property-value" aria-labelledby="diaSemana-label"><g:fieldValue bean="${configuracionCursoDiaInstance}" field="diaSemana"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${configuracionCursoDiaInstance?.espacioFisico}">
				<li class="fieldcontain">
					<span id="espacioFisico-label" class="property-label"><g:message code="configuracionCursoDia.espacioFisico.label" default="Espacio Fisico" /></span>
					
						<span class="property-value" aria-labelledby="espacioFisico-label"><g:link controller="espacioFisico" action="show" id="${configuracionCursoDiaInstance?.espacioFisico?.id}">${configuracionCursoDiaInstance?.espacioFisico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${configuracionCursoDiaInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${configuracionCursoDiaInstance?.id}">
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
