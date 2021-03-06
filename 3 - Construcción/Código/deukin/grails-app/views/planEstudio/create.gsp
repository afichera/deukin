<%@ page import="com.deukin.PlanEstudio" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'planEstudio.label', default: 'PlanEstudio')}" />
<title><g:message code="planEstudio.create.label"
		/></title>
		<resource:autoComplete />
 
  <script type="text/javascript">
   function eligeCarrera(carreraId){
	document.getElementById('carrera.id').value = carreraId;
  }
  </script>
		<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="list" action="list">
					<g:message code="planEstudio.list.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-planEstudio"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="planEstudio.create.label"  />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${planEstudioInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${planEstudioInstance}" var="error">
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
						<g:if test="${params.carrera}">
						<g:link class="btn btn-default" controller="carrera" action="show" id="${params.carrera?.id}">
					<g:message code="cancelar" default="Cancelar" />
				</g:link>
						</g:if>
						<g:else>
						<g:link class="btn btn-default" controller="planEstudio" action="list" >
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
