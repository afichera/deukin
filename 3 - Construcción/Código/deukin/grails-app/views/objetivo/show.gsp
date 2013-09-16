

<%@ page import="com.deukin.Objetivo" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'objetivo.label', default: 'Objetivo')}" />
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

	<div id="show-objetivo"
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
					<ol class="property-list objetivo">
						
				<g:if test="${objetivoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="objetivo.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${objetivoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${objetivoInstance?.materia}">
				<li class="fieldcontain">
					<span id="materia-label" class="property-label"><g:message code="objetivo.materia.label" default="Materia" /></span>
					
						<span class="property-value" aria-labelledby="materia-label"><g:link controller="materia" action="show" id="${objetivoInstance?.materia?.id}">${objetivoInstance?.materia?.descripcion}</g:link></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${objetivoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${objetivoInstance?.id}">
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
