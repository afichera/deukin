<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta name="layout" content="main" />
<title>Deukin</title>
</head>
<body>
	<div class="body">
		<div class="row">
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.academicas" />
						</h3>
					</div>

					<ul>
						<li><g:link class='disabled' controller='proximamente'>
								<g:message code="secciones.academicas.cursos" />
							</g:link></li>
						<li><g:link class='disabled' controller='proximamente'>
								<g:message code="secciones.academicas.finales" />
							</g:link></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.solicitudes" />
						</h3>
					</div>
					<ul>
						<li><g:link class='disabled' controller='proximamente'>
								<g:message code="secciones.solicitudes.recursos" />
							</g:link></li>
						<li><g:link class='disabled' controller='proximamente'>
								<g:message code="secciones.solicitudes.espaciosFisicos" />
							</g:link></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel ">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.estadisticas" />
						</h3>
					</div>
					<ul>
						<li><g:link class='disabled' controller='proximamente'>
								<g:message code="secciones.estadisticas.x" />
							</g:link></li>
						<li><g:link class='disabled' controller='proximamente'>
								<g:message code="secciones.estadisticas.x" />
							</g:link></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.misDatos" />
						</h3>
					</div>
					<ul>
						<li><g:link controller='homeDocente' action="misDatos">
								<g:message code="secciones.misDatos" />
							</g:link></li>
					</ul>
				</div>
			</div>
		</div>
	</div>


</body>
</html>