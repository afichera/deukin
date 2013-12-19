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
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.institucion" />
						</h3>
					</div>
					<ul>
						<li><g:link class="disabled" controller='proximamente'>
								<g:message code="secciones.institucion.datos" />
							</g:link></li>
						<li><g:link class="disabled" controller='proximamente'>
								<g:message code="secciones.institucion.departamentos" />
							</g:link></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.usuarios" />
						</h3>
					</div>
					<ul>
						<li><g:link controller='usuario'>
								<g:message code="secciones.usuarios.usuarios" />
							</g:link></li>

					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.aplicacion" />
						</h3>
					</div>
					<ul>
						<li><g:link class="disabled" controller='proximamente'>
								<g:message code="secciones.aplicacion.opciones" />
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
							<g:message code="secciones.alumnos" />
						</h3>
					</div>
					<ul>
						<li><g:link controller='alumno'>
								<g:message code="secciones.alumnos.alumnos" />
							</g:link></li>
						<li><g:link controller='inscripcionInstitucion'
								action="indexAdmin">
								<g:message code="secciones.inscripciones.institucion" />
							</g:link></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-4">
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">
							<g:message code="secciones.espaciosFisicos" />
						</h3>
					</div>
					<ul>
						<li><g:link controller='espacioFisico'>
								<g:message code="secciones.espaciosFisicos.administracion" />
							</g:link></li>
						<li><g:message code="secciones.espaciosFisicos.asignacion" /></li>
					</ul>
				</div>

			</div>

		</div>

	</div>
</body>
</html>