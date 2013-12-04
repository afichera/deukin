<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Deukin - Error Pasos Inscripcion</title>
</head>
<body>
	<div class="body">
		<label class="control-label"> <g:message
				code="inscripcionInstitucion.error"
				default="Error en la Inscripción a la Institución" />

		</label>
	</div>
	<g:if test="${message}">
		<div class="message" role="status">
			${message}
		</div>
	</g:if>
</body>
</html>