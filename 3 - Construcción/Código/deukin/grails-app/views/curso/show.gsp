

<%@ page import="com.deukin.Curso" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curso.label', default: 'Curso')}" />
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

	<div id="show-curso"
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
					<ol class="property-list curso">
						
				<g:if test="${cursoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="curso.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${cursoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.cronogramaCarrera}">
				<li class="fieldcontain">
					<span id="cronogramaCarrera-label" class="property-label"><g:message code="curso.cronogramaCarrera.label" default="Cronograma Carrera" /></span>
					
						<span class="property-value" aria-labelledby="cronogramaCarrera-label"><g:link controller="cronogramaCarrera" action="show" id="${cursoInstance?.cronogramaCarrera?.id}">${cursoInstance?.cronogramaCarrera?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.docentes}">
				<li class="fieldcontain">
					<span id="docentes-label" class="property-label"><g:message code="curso.docentes.label" default="Docentes" /></span>
					
						<g:each in="${cursoInstance.docentes}" var="d">
						<span class="property-value" aria-labelledby="docentes-label"><g:link controller="docente" action="show" id="${d.id}">${d?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.espacioFisico}">
				<li class="fieldcontain">
					<span id="espacioFisico-label" class="property-label"><g:message code="curso.espacioFisico.label" default="Espacio Fisico" /></span>
					
						<span class="property-value" aria-labelledby="espacioFisico-label"><g:link controller="espacioFisico" action="show" id="${cursoInstance?.espacioFisico?.id}">${cursoInstance?.espacioFisico?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.estadoCurso}">
				<li class="fieldcontain">
					<span id="estadoCurso-label" class="property-label"><g:message code="curso.estadoCurso.label" default="Estado Curso" /></span>
					
						<span class="property-value" aria-labelledby="estadoCurso-label"><g:fieldValue bean="${cursoInstance}" field="estadoCurso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.horaDesde}">
				<li class="fieldcontain">
					<span id="horaDesde-label" class="property-label"><g:message code="curso.horaDesde.label" default="Hora Desde" /></span>
					
						<span class="property-value" aria-labelledby="horaDesde-label"><g:fieldValue bean="${cursoInstance}" field="horaDesde"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.horaHasta}">
				<li class="fieldcontain">
					<span id="horaHasta-label" class="property-label"><g:message code="curso.horaHasta.label" default="Hora Hasta" /></span>
					
						<span class="property-value" aria-labelledby="horaHasta-label"><g:fieldValue bean="${cursoInstance}" field="horaHasta"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.materia}">
				<li class="fieldcontain">
					<span id="materia-label" class="property-label"><g:message code="curso.materia.label" default="Materia" /></span>
					
						<span class="property-value" aria-labelledby="materia-label"><g:link controller="materia" action="show" id="${cursoInstance?.materia?.id}">${cursoInstance?.materia?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.recursosFijos}">
				<li class="fieldcontain">
					<span id="recursosFijos-label" class="property-label"><g:message code="curso.recursosFijos.label" default="Recursos Fijos" /></span>
					
						<g:each in="${cursoInstance.recursosFijos}" var="r">
						<span class="property-value" aria-labelledby="recursosFijos-label"><g:link controller="recurso" action="show" id="${r.id}">${r?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${cursoInstance?.turno}">
				<li class="fieldcontain">
					<span id="turno-label" class="property-label"><g:message code="curso.turno.label" default="Turno" /></span>
					
						<span class="property-value" aria-labelledby="turno-label"><g:link controller="turno" action="show" id="${cursoInstance?.turno?.id}">${cursoInstance?.turno?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${cursoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${cursoInstance?.id}">
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
