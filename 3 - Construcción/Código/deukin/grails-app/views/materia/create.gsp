<%@ page import="com.deukin.Materia" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function eligePlanEstudio(planId){
    document.getElementById('planEstudio.id').value = planId;
  }
</script>
<resource:autoComplete />
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'materia.label', default: 'Materia')}" />
<title><g:message code="materia.create.label"
		/></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="list" action="list">
					<g:message code="materia.list.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-materia"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="materia.create.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${materiaInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${materiaInstance}" var="error">
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
										<g:if test="${params.planEstudio}">
						<g:hiddenField id ="vieneDePlanEstudio" name ="vieneDePlanEstudio" value="true"/>
						<g:link class="btn btn-default" controller="planEstudio" action="show" id="${params.planEstudio?.id}">
					<g:message code="cancelar" default="Cancelar" />
				</g:link>
						</g:if>
						<g:else>
						<g:hiddenField id ="vieneDePlanEstudio" name ="vieneDePlanEstudio" value="false"/>
						<g:link class="btn btn-default" controller="materia" action="list" >
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
