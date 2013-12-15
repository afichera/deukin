<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
<meta name="layout" content="main"/>
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
						<li><g:link controller='proximamente'><g:message code="secciones.academicas.materiasEnCurso" /></g:link></li>
						<li><g:link controller='proximamente'><g:message code="secciones.academicas.materiasCursadas" /></g:link></li>
						
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.solicitudes" />
						</h3>
					</div>
					<ul>
						<li><g:link controller='proximamente'><g:message code="secciones.solicitudes.equivalencias" /></g:link></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.inscripciones" />
						</h3>
					</div>
					<ul>
						<li><g:link controller='proximamente'><g:message code="secciones.inscripciones.materias" /></g:link></li>
						<li><g:link controller='proximamente'><g:message code="secciones.inscripciones.finales" /></g:link></li>
						<li><g:link controller='proximamente'><g:message code="secciones.inscripciones.cursosEspeciales" /></g:link></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						<g:message code="secciones.misDatos" />
					</h3>
				</div>
				<ul>
					<li><g:link controller='homeAlumno' action="misDatos">
							<g:message code="secciones.misDatos" />
						</g:link></li>
				</ul>
			</div>
		</div>
	
  </div>
  
</body>
</html>