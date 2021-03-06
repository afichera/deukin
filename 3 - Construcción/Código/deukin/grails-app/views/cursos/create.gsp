<%@ page import="com.deukin.Curso" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curso.label', default: 'Curso')}" />
<title><g:message code="cursos.create.label"
		 /></title>
		
		<script type="text/javascript">
    function eligeMateria(materiaId){
      document.getElementById('materia.id').value = materiaId;
    }

    function eligeEspacioFisico(espacioId){
        document.getElementById('espacioFisico.id').value = espacioId;
      }

</script>
<resource:autoComplete />
<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script src="${createLink(uri: '/')}js/validaciones.js"></script>

</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="list" action="list">
					<g:message code="cursos.list.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-curso"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="cursos.create.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${cursoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${cursoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
				<g:hasErrors bean="${configuracionCursoDiaInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${configuracionCursoDiaInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
				<g:hasErrors bean="${cicloLectivoInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${cicloLectivoInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
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
							<g:render template="formCreate" />
						</fieldset>
						<fieldset class="buttons">
							<g:submitButton name="create" class="btn btn-primary"
								value="${message(code: 'default.button.create.label', default: 'Create')}" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
