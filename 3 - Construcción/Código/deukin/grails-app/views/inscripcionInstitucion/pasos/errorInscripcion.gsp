<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Deukin - Error Pasos Inscripcion</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sx-12  alert alert-error">
			<label class="control-label"> <g:message
					code="inscripcionInstitucion.error"
					default="Error en la Inscripción a la Institución" />

			</label>
		</div>
		<g:if test="${message}">
			<div class=" col-lg-12 col-md-12 col-sx-12 message  alert alert-danger" role="status">
				${message}
			</div>
		</g:if>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
			<g:form action="pasos">
				<g:submitButton name="volver" class="btn btn-primary" value="Volver" />
			</g:form>
		</div>
	</div>
</body>
</html>