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

<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css">
<link rel="stylesheet" href="${resource(dir: 'css', file: 'navbar-static-top.css')}" type="text/css">
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
			<a class="navbar-brand" href="${createLink(uri: '/')}"><img
				src="${resource(dir: 'images', file: 'logo.png')}" alt="Deukin" /></a>
			<div class="nav-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#about">Académicas</a></li>
					<li><a href="#contact">Docentes</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Alumnos <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li class="nav-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
					<li><a href="#contact">Espacios Físicos</a></li>
					<li><a href="#contact">Estadísticas</a></li>
				</ul>
				<form class="navbar-form pull-right">
					<input class="span2" type="text" placeholder="Email"> <input
						class="span2" type="password" placeholder="Password">
					<button type="submit" class="btn">Sign in</button>
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
			<g:javascript library="application" />
			<r:layoutResources />
			<script src="assets/js/jquery.js"></script>
			<script src="js/bootstrap.min.js"></script>
</body>
</html>
