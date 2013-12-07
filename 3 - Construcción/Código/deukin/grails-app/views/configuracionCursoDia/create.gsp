<%@ page import="com.deukin.ConfiguracionCursoDia" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'configuracionCursoDia.label', default: 'Día y Horario')}" />
<title><g:message code="configuracionCursoDia.create.label"
		args="[entityName]" /></title>
				<script type="text/javascript">

    function eligeEspacioFisico(espacioId){
        document.getElementById('espacioFisico.id').value = espacioId;
      }

</script>
<resource:autoComplete />
<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        $('.required').each(function (index) {
            jQuery(this).attr('required', 'required')
        });
    });
</script>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link  controller="cursos" class="list" action="list">
					<g:message code="cursos.list.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="create-configuracionCursoDia"
		class="content scaffold-create" role="main">
		<h1>
			<g:message code="configuracionCursoDia.create.label"  />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-danger" role="status">${flash.message}</div>
		</g:if>
		<g:hasErrors bean="${configuracionCursoDiaInstance}">
			<ul class="alert alert-danger" role="alert">
				<g:eachError bean="${configuracionCursoDiaInstance}" var="error">
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
								<g:link class="btn btn-default" controller="cursos" action="show" id="${params.curso?.id}">
					<g:message code="cancelar" default="Cancelar" /></g:link>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
