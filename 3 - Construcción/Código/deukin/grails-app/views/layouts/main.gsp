<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Grails" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'navbar-static-top.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap-glyphicons.css')}" type="text/css">
<g:layoutHead />
<r:layoutResources />
</head>
<body>
	<div class="navbar navbar-static-top">
		<div class="container">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".nav-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<sec:ifNotLoggedIn>
			<a class="navbar-brand" href="${createLink(uri: '/')}"><img
				src="${resource(dir: 'images', file: 'logo.png')}" alt="Deukin" /></a></sec:ifNotLoggedIn>
			<sec:ifLoggedIn><g:link controller='home' class="navbar-brand"><img
				src="${resource(dir: 'images', file: 'logo.png')}" alt="Deukin" /></g:link></sec:ifLoggedIn>	
			<div class="nav-collapse collapse navbar-responsive-collapse">
<g:render template="/layouts/menu"></g:render>
				<form class="navbar-form pull-right">
<sec:ifLoggedIn>
<p>Bienvenido, <sec:username/>. <g:link controller='logout' > Salir</g:link></p>
</sec:ifLoggedIn>
<sec:ifNotLoggedIn>
<g:link controller='home' class="btn btn-default">Ingresar</g:link>
</sec:ifNotLoggedIn>
				</form>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>

	<div class="container">
		<g:layoutBody />
		<div class="container">
			<div class="footer" role="contentinfo"></div>
			<div id="spinner" class="spinner" style="display: none;">
				<g:message code="spinner.alt" default="Loading&hellip;" />
			</div>
			</div>
			</div>
			<g:javascript library="application" />
			<r:layoutResources />
			<script src="${resource(dir: 'assets/js', file: 'jquery.js')}"></script>
			<script src="${resource(dir: 'js', file: 'bootstrap.min.js')}"></script>
</body>
</html>
