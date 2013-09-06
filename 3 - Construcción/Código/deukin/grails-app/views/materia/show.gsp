

<%@ page import="com.deukin.Materia" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'materia.label', default: 'Materia')}" />
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

	<div id="show-materia"
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
					<ol class="property-list materia">
						
				<g:if test="${materiaInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="materia.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${materiaInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="materia.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${materiaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.bibliografia}">
				<li class="fieldcontain">
					<span id="bibliografia-label" class="property-label"><g:message code="materia.bibliografia.label" default="Bibliografia" /></span>
					
						<span class="property-value" aria-labelledby="bibliografia-label"><g:fieldValue bean="${materiaInstance}" field="bibliografia"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.cantidadDocentesRequeridos}">
				<li class="fieldcontain">
					<span id="cantidadDocentesRequeridos-label" class="property-label"><g:message code="materia.cantidadDocentesRequeridos.label" default="Cantidad Docentes Requeridos" /></span>
					
						<span class="property-value" aria-labelledby="cantidadDocentesRequeridos-label"><g:fieldValue bean="${materiaInstance}" field="cantidadDocentesRequeridos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.cantidadUnidadesHorarias}">
				<li class="fieldcontain">
					<span id="cantidadUnidadesHorarias-label" class="property-label"><g:message code="materia.cantidadUnidadesHorarias.label" default="Cantidad Unidades Horarias" /></span>
					
						<span class="property-value" aria-labelledby="cantidadUnidadesHorarias-label"><g:fieldValue bean="${materiaInstance}" field="cantidadUnidadesHorarias"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.contenidoMinimo}">
				<li class="fieldcontain">
					<span id="contenidoMinimo-label" class="property-label"><g:message code="materia.contenidoMinimo.label" default="Contenido Minimo" /></span>
					
						<span class="property-value" aria-labelledby="contenidoMinimo-label"><g:fieldValue bean="${materiaInstance}" field="contenidoMinimo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.cupoMaximoAlumnos}">
				<li class="fieldcontain">
					<span id="cupoMaximoAlumnos-label" class="property-label"><g:message code="materia.cupoMaximoAlumnos.label" default="Cupo Maximo Alumnos" /></span>
					
						<span class="property-value" aria-labelledby="cupoMaximoAlumnos-label"><g:fieldValue bean="${materiaInstance}" field="cupoMaximoAlumnos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.cupoMinimoAlumnos}">
				<li class="fieldcontain">
					<span id="cupoMinimoAlumnos-label" class="property-label"><g:message code="materia.cupoMinimoAlumnos.label" default="Cupo Minimo Alumnos" /></span>
					
						<span class="property-value" aria-labelledby="cupoMinimoAlumnos-label"><g:fieldValue bean="${materiaInstance}" field="cupoMinimoAlumnos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.materiasCorrelativas}">
				<li class="fieldcontain">
					<span id="materiasCorrelativas-label" class="property-label"><g:message code="materia.materiasCorrelativas.label" default="Materias Correlativas" /></span>
					
						<g:each in="${materiaInstance.materiasCorrelativas}" var="m">
						<span class="property-value" aria-labelledby="materiasCorrelativas-label"><g:link controller="materia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.materiasEquivalentes}">
				<li class="fieldcontain">
					<span id="materiasEquivalentes-label" class="property-label"><g:message code="materia.materiasEquivalentes.label" default="Materias Equivalentes" /></span>
					
						<g:each in="${materiaInstance.materiasEquivalentes}" var="m">
						<span class="property-value" aria-labelledby="materiasEquivalentes-label"><g:link controller="materia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.objetivosEspecificos}">
				<li class="fieldcontain">
					<span id="objetivosEspecificos-label" class="property-label"><g:message code="materia.objetivosEspecificos.label" default="Objetivos Especificos" /></span>
					
						<span class="property-value" aria-labelledby="objetivosEspecificos-label"><g:fieldValue bean="${materiaInstance}" field="objetivosEspecificos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.objetivosGenerales}">
				<li class="fieldcontain">
					<span id="objetivosGenerales-label" class="property-label"><g:message code="materia.objetivosGenerales.label" default="Objetivos Generales" /></span>
					
						<span class="property-value" aria-labelledby="objetivosGenerales-label"><g:fieldValue bean="${materiaInstance}" field="objetivosGenerales"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${materiaInstance?.tiposRecurso}">
				<li class="fieldcontain">
					<span id="tiposRecurso-label" class="property-label"><g:message code="materia.tiposRecurso.label" default="Tipos Recurso" /></span>
					
						<g:each in="${materiaInstance.tiposRecurso}" var="t">
						<span class="property-value" aria-labelledby="tiposRecurso-label"><g:link controller="tipoRecurso" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${materiaInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${materiaInstance?.id}">
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
