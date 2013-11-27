

<%@ page import="com.deukin.Equivalencia" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'equivalencia.label', default: 'Equivalencia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="equivalencia.list.label"/>
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="equivalencia.create.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-equivalencia"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="equivalencia.show.label"/>
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
				
					<div class="row">	
				<g:if test="${equivalenciaInstance?.materiaPrincipal}">
				
					<label id="materiaPrincipal-label" class="property-label col-lg-2"><g:message code="equivalencia.materiaPrincipal.label" default="Materia Principal" />: </label>
					<div class="col-lg-10">
					
						<g:link controller="materia" action="show" id="${equivalenciaInstance?.materiaPrincipal?.id}">${equivalenciaInstance?.materiaPrincipal?.encodeAsHTML()}</g:link>
					</div>
			
				</g:if>
			</div>
		<div class="row">
				<g:if test="${equivalenciaInstance?.materiaEquivalente}">
				
					<label id="materiaEquivalente-label" class="property-label col-lg-2"><g:message code="equivalencia.materiaEquivalente.label" default="Materia Equivalente" />: </label>
					<div class="col-lg-10">
					
						<g:link controller="materia" action="show" id="${equivalenciaInstance?.materiaEquivalente?.id}">${equivalenciaInstance?.materiaEquivalente?.encodeAsHTML()}</g:link>
					</div>
			
				</g:if>
</div>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${equivalenciaInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${equivalenciaInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
								<g:link class="btn btn-default" controller="equivalencia" action="list">
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
