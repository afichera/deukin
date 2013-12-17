<!DOCTYPE html>
<html>
	<head>
		<title>Grails Runtime Exception</title>
		<meta name="layout" content="main">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'errors.css')}" type="text/css">
	</head>
	<body>
	  <div class="row">
  <div class="col-lg.12 alert alert-error">
		Lo sentimos, se ha producido un error inesperado. Intente nuevamente y si el problema persiste contacte al administrador.
		</div></div>
		<g:renderException exception="${exception}" />
	</body>
</html>
