

<%@ page import="com.deukin.CurriculumAdjunto" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')}" />
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

	<div id="show-curriculumAdjunto"
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
					<ol class="property-list curriculumAdjunto">
						
				<g:if test="${curriculumAdjuntoInstance?.archivo}">
				<li class="fieldcontain">
					<span id="archivo-label" class="property-label">
						<g:message code="curriculumAdjunto.archivo.label" default="Archivo" /></span>						
						<g:link  class="curriculumAdjunto" action="showArchivo" id="${curriculumAdjuntoInstance?.id}">${curriculumAdjuntoInstance?.nombreArchivo}</g:link>						
				</li>
				</g:if>
			
				<g:if test="${curriculumAdjuntoInstance?.persona}">
				<li class="fieldcontain">
					<span id="persona-label" class="property-label"><g:message code="curriculumAdjunto.persona.label" default="Alumno" /></span>
					
						<span class="property-value" aria-labelledby="persona-label"><g:link controller="alumno" action="show" id="${curriculumAdjuntoInstance?.persona?.id}">${curriculumAdjuntoInstance?.persona?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${curriculumAdjuntoInstance?.id}" />
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
