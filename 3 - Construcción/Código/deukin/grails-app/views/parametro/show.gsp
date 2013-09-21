

<%@ page import="com.deukin.Parametro" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'parametro.label', default: 'Parametro')}" />
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

	<div id="show-parametro"
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
					<ol class="property-list parametro">
						
				<g:if test="${parametroInstance?.codigo}">
				<li class="fieldcontain">
					<span id="codigo-label" class="property-label"><g:message code="parametro.codigo.label" default="Codigo" /></span>
					
						<span class="property-value" aria-labelledby="codigo-label"><g:fieldValue bean="${parametroInstance}" field="codigo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parametroInstance?.valor}">
				<li class="fieldcontain">
					<span id="valor-label" class="property-label"><g:message code="parametro.valor.label" default="Valor" /></span>
					
						<span class="property-value" aria-labelledby="valor-label"><g:fieldValue bean="${parametroInstance}" field="valor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${parametroInstance?.tipoParametro}">
				<li class="fieldcontain">
					<span id="tipoParametro-label" class="property-label"><g:message code="parametro.tipoParametro.label" default="Tipo Parametro" /></span>
					
						<span class="property-value" aria-labelledby="tipoParametro-label"><g:fieldValue bean="${parametroInstance}" field="tipoParametro"/></span>
					
				</li>
				</g:if>
			
					</ol>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${parametroInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${parametroInstance?.id}">
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
