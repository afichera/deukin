
<%@ page import="com.deukin.Recurso" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'recurso.label', default: 'Recurso')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-recurso" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-recurso" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list recurso">
			
				<g:if test="${recursoInstance?.tipoRecurso}">
				<li class="fieldcontain">
					<span id="tipoRecurso-label" class="property-label"><g:message code="recurso.tipoRecurso.label" default="Tipo Recurso" /></span>
					
						<span class="property-value" aria-labelledby="tipoRecurso-label"><g:link controller="tipoRecurso" action="show" id="${recursoInstance?.tipoRecurso?.id}">${recursoInstance?.tipoRecurso?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.estadoRecurso}">
				<li class="fieldcontain">
					<span id="estadoRecurso-label" class="property-label"><g:message code="recurso.estadoRecurso.label" default="Estado Recurso" /></span>
					
						<span class="property-value" aria-labelledby="estadoRecurso-label"><g:fieldValue bean="${recursoInstance}" field="estadoRecurso"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${recursoInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="recurso.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${recursoInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${recursoInstance?.id}" />
					<g:link class="edit" action="edit" id="${recursoInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
