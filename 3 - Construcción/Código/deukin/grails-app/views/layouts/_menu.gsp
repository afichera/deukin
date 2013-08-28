<ul class="nav navbar-nav">
	<sec:ifLoggedIn><li><g:link controller='home'>Mi Inicio</g:link></li></sec:ifLoggedIn>
	<sec:ifAnyGranted
		roles="ROLE_ALUMNO,ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
		<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Académicas<b class="caret"></b></a>
			<ul class="dropdown-menu">
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Carreras</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Materias</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Cursos</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Planes de Estudio</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Cronogramas de cursos</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Finales</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO"><li><g:link controller='home'>Congresos talleres, etc.</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_ALUMNO"><li><g:link controller='home'>Materias en curso</g:link></li></sec:ifAnyGranted>
				<sec:ifAnyGranted
		roles="ROLE_ALUMNO"><li><g:link controller='home'>Materias cursadas</g:link></li></sec:ifAnyGranted>
			</ul></li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_ALUMNO,ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Solicitudes<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Solicitud de equivalencias</g:link></li>
			<sec:ifNotGranted
		roles="ROLE_ALUMNO"><li><g:link controller='home'>Solicitudes de recursos</g:link></li></sec:ifNotGranted>
			<sec:ifNotGranted
		roles="ROLE_ALUMNO"><li><g:link controller='home'>Solicitudes de espacios físicos</g:link></li></sec:ifNotGranted>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Docentes<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Docentes</g:link></li>
			<sec:ifAnyGranted
		roles="ROLE_COORDINADOR"><li><g:link controller='home'>Buscar Postulantes</g:link></li></sec:ifAnyGranted>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	
			<li><g:link controller='alumno'>Alumnos</g:link></li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Espacios físicos<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Administración de espacios físicos</g:link></li>
			<li><g:link controller='home'>Asignación de espacios físicos</g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
		<sec:ifAnyGranted
		roles="ROLE_DOCENTE,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
		<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Estadísticas<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>x</g:link></li>
			<li><g:link controller='home'>x</g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_ALUMNO">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Inscripciones<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Inscripció a materias</g:link></li>
			<li><g:link controller='home'>Inscripción a finales</g:link></li>
			<li><g:link controller='home'>Inscripción a Congresos talleres, etc.</g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA">	
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Institución<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Datos de la institución</g:link></li>
			<li><g:link controller='home'>Departamentos</g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
		<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Usuarios<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Usuarios/Perfiles</g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>
		<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA">
	<li class="dropdown"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown">Aplicación<b class="caret"></b></a>
		<ul class="dropdown-menu">
			<li><g:link controller='home'>Opciones de configuración</g:link></li>
		</ul>
	</li>
	</sec:ifAnyGranted>	
</ul>