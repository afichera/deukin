<%@ page import="com.deukin.Correlatividad" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function eligeMateriaPredecesora(materiaId){
      document.getElementById('materiaPredecesora.id').value = materiaId;
    }

    function eligeMateriaPrincipal(materiaId){
        document.getElementById('materiaPrincipal.id').value = materiaId;
    }
</script>
<resource:autoComplete />
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'correlatividad.label', default: 'Correlatividad')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="correlatividad.list.label"  />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="correlatividad.create.label"/>
				</g:link></li>
		</ul>
	</div>
	<div id="edit-correlatividad"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="correlatividad.edit.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${correlatividadInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${correlatividadInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<g:form method="post"
						>
						<g:hiddenField name="id" value="${correlatividadInstance?.id}" />
						<g:hiddenField name="version" value="${correlatividadInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
						
						<g:link class="btn btn-default" controller="correlatividad" action="show" id="${correlatividadInstance?.id}">
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
