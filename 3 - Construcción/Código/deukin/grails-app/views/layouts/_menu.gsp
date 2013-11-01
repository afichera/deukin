<ul class="nav navbar-nav">
	<sec:ifAnyGranted
		roles="ROLE_ALUMNO,ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
		<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.academicas" /><b class="caret"></b></a>
			<ul class="dropdown-menu">
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='carrera'><g:message code="secciones.academicas.carreras" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='materia'><g:message code="secciones.academicas.materias" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='curso'><g:message code="secciones.academicas.cursos" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='planEstudio'><g:message code="secciones.academicas.planesDeEstudio" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR"><li><g:link controller='correlatividad'><g:message code="secciones.academicas.correlatividades" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR"><li><g:link controller='equivalencia'><g:message code="secciones.academicas.equivalencias" /></g:link></li></sec:ifAnyGranted>
		
		
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='cronogramaCarrera'><g:message code="secciones.academicas.cronogramasDeCursos" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='proximamente'><g:message code="secciones.academicas.finales" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='proximamente'><g:message code="secciones.academicas.cursosEspeciales" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_ALUMNO"><li><g:link controller='proximamente'><g:message code="secciones.academicas.materiasEnCurso" /></g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_ALUMNO"><li><g:link controller='proximamente'><g:message code="secciones.academicas.materiasCursadas" /></g:link></li></sec:ifAnyGranted>
			</ul></li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_ALUMNO,ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.solicitudes" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.solicitudes.equivalencias" /></g:link></li>
			<sec:ifNotGranted
		roles="ROLE_ALUMNO"><li><g:link controller='proximamente'><g:message code="secciones.solicitudes.recursos" /></g:link></li></sec:ifNotGranted>
			<sec:ifNotGranted
		roles="ROLE_ALUMNO"><li><g:link controller='proximamente'><g:message code="secciones.solicitudes.espaciosFisicos" /></g:link></li></sec:ifNotGranted>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.docentes" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.docentes.docentes" /></g:link></li>
			<sec:ifAnyGranted
		roles="ROLE_COORDINADOR"><li><g:link controller='proximamente'><g:message code="secciones.docentes.buscarPostulantes" /></g:link></li></sec:ifAnyGranted>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO,ROLE_ADMINISTRADOR_SISTEMA">
	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.alumnos" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<sec:ifAnyGranted
				roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
				<li><g:link controller='alumno'><g:message code="secciones.alumnos.alumnos" /></g:link></li>
			</sec:ifAnyGranted>
			<sec:ifAnyGranted
				roles="ROLE_ADMINISTRATIVO,ROLE_ADMINISTRADOR_SISTEMA">
			<li><g:link controller='inscripcionInstitucion' action="indexAdmin"><g:message code="secciones.inscripciones.institucion" /></g:link></li>
			</sec:ifAnyGranted>
			
			
			
			</ul>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.espaciosFisicos" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.espaciosFisicos.administracion" /></g:link></li>
			<li><g:link controller='proximamente'><g:message code="secciones.espaciosFisicos.asignacion" /></g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
		<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
		<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.estadisticas" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.estadisticas.x" /></g:link></li>
			<li><g:link controller='proximamente'><g:message code="secciones.estadisticas.x" /></g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_ALUMNO">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.inscripciones" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			
			<li><g:link controller='proximamente'><g:message code="secciones.inscripciones.materias" /></g:link></li>
			<li><g:link controller='proximamente'><g:message code="secciones.inscripciones.finales" /></g:link></li>
			<li><g:link controller='proximamente'><g:message code="secciones.inscripciones.cursosEspeciales" /></g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA">	
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.institucion" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.institucion.datos" /></g:link></li>
			<li><g:link controller='departamento'><g:message code="secciones.institucion.departamentos" /></g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
		<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.usuarios" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.usuarios.usuarios" /></g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
		<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"><g:message code="secciones.aplicacion" /><b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='proximamente'><g:message code="secciones.aplicacion.opciones" /></g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>	
</ul>