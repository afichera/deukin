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
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
		<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="list" action="list">
					<g:message code="correlatividad.list.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-correlatividad"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="correlatividad.create.label" />
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
					<g:form action="save"
						>
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-primary"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
						
													<g:if test="${params.materiaPrincipal}">
						<g:hiddenField id ="vieneDeMateria" name ="vieneDeMateria" value="true"/>
						<g:link class="btn btn-default" controller="materia" action="show" id="${params.materiaPrincipal?.id}">
					<g:message code="cancelar" default="Cancelar" />
				</g:link>
						</g:if>
						<g:else>
						<g:hiddenField id ="vieneDeMateria" name ="vieneDeMateria" value="false"/>
						<g:link class="btn btn-default" controller="correlatividad" action="list" >
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</g:else>
						
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
