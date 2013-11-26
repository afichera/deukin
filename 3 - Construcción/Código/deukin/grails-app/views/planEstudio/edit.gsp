<%@ page import="com.deukin.PlanEstudio" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'planEstudio.label', default: 'PlanEstudio')}" />
<title><g:message code="planEstudio.edit.label"/></title>

 <resource:autoComplete />
 
  <script type="text/javascript">
   function eligeCarrera(carreraId){
	document.getElementById('carrera.id').value = carreraId;
  }
  </script>

</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="planEstudio.list.label"/>
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="planEstudio.new.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="edit-planEstudio"
		class="content scaffold-edit" role="main">
		<h1>
			<g:message code="planEstudio.edit.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
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
					<g:form method="post"
						>
						<g:hiddenField name="id" value="${planEstudioInstance?.id}" />
						<g:hiddenField name="version" value="${planEstudioInstance?.version}" />
						<fieldset class="form">
							<g:render template="form" />
						</fieldset>
						<fieldset class="buttons">
							<g:actionSubmit class="save" action="update" class="btn btn-success"
								value="${message(code: 'default.button.update.label', default: 'Update')}" />
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								formnovalidate=""
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
