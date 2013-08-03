import org.jfree.data.time.Hour

import com.deukin.Rol
import com.deukin.Turno
import com.deukin.Usuario
import com.deukin.UsuarioRol


class BootStrap {

	def init = { servletContext ->
		Calendar calendarAux = new GregorianCalendar()
		//		Roles
		def alumnoRol = Rol.findByAuthority('ROLE_ALUMNO') ?: new Rol(authority: 'ROLE_ALUMNO').save(failOnError: true)
		def docenteRol = Rol.findByAuthority('ROLE_DOCENTE') ?: new Rol(authority: 'ROLE_DOCENTE').save(failOnError: true)
		def coordinadorRol = Rol.findByAuthority('ROLE_COORDINADOR') ?: new Rol(authority: 'ROLE_COORDINADOR').save(failOnError: true)
		def administrativoRol = Rol.findByAuthority('ROLE_ADMINISTRATIVO') ?: new Rol(authority: 'ROLE_ADMINISTRATIVO').save(failOnError: true)
		def admininstradorSistemaRol = Rol.findByAuthority('ROLE_ADMINISTRADOR_SISTEMA') ?: new Rol(authority: 'ROLE_ADMINISTRADOR_SISTEMA').save(failOnError: true)

		//		Usuarios
		//		Admin default
		def adminUser = Usuario.findByUsername('admin') ?: new Usuario(
				username: 'admin',
				password: 'admin',
				enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(admininstradorSistemaRol)) {
			UsuarioRol.create(adminUser, admininstradorSistemaRol, true)
		}




		//Usuarios Simples solo para Test
		//Usuario Alumno Solo para pruebas
		def alumnoUser1 = Usuario.findByUsername('alumno1') ?: new Usuario(
				username: 'alumno1',
				password: 'alumno1',
				enabled: true).save(failOnError: true)

		if (!alumnoUser1.authorities.contains(alumnoRol)) {
			UsuarioRol.create(alumnoUser1, alumnoRol, true)
		}

		//Usuario Docente Solo para pruebas
		def docenteUser1 = Usuario.findByUsername('docente1') ?: new Usuario(
				username: 'docente1',
				password: 'docente1',
				enabled: true).save(failOnError: true)

		if (!docenteUser1.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser1, docenteRol, true)
		}


		//Usuario Coordinador Solo para pruebas
		def usuarioCoordinador1 = Usuario.findByUsername('coordinador1') ?: new Usuario(
				username: 'coordinador1',
				password: 'coordinador1',
				enabled: true).save(failOnError: true)

		if (!usuarioCoordinador1.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(usuarioCoordinador1, coordinadorRol , true)
		}

		//Usuario Administrativo Solo para pruebas
		def usuarioAdministrativo1 = Usuario.findByUsername('administrativo1') ?: new Usuario(
				username: 'administrativo1',
				password: 'administrativo1',
				enabled: true).save(failOnError: true)

		if (!usuarioAdministrativo1.authorities.contains(administrativoRol)) {
			UsuarioRol.create(usuarioAdministrativo1, administrativoRol, true)
		}

		//Usuarios Combinados solo para Test
		//Usuario Alumno y Docente Solo para pruebas
		def alumnoDocenteUser1 = Usuario.findByUsername('alumnoDocente1') ?: new Usuario(
				username: 'alumnoDocente1',
				password: 'alumnoDocente1',
				enabled: true).save(failOnError: true)

		if (!alumnoDocenteUser1.authorities.contains(alumnoRol)) {
			UsuarioRol.create(alumnoDocenteUser1, alumnoRol, true)
		}

		if (!alumnoDocenteUser1.authorities.contains(docenteRol)) {
			UsuarioRol.create(alumnoDocenteUser1, docenteRol, true)
		}

		//Usuario Docente y Coordinador Solo para pruebas
		def docenteCoordinadorUser1 = Usuario.findByUsername('docenteCoordinador1') ?: new Usuario(
				username: 'docenteCoordinador1',
				password: 'docenteCoordinador1',
				enabled: true).save(failOnError: true)

		if (!docenteCoordinadorUser1.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteCoordinadorUser1, docenteRol, true)
		}

		if (!docenteCoordinadorUser1.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(docenteCoordinadorUser1, coordinadorRol, true)
		}

		//Usuario Alumno y Administrativo Solo para pruebas
		def alumnoAdministrativoUser1 = Usuario.findByUsername('alumnoAdministrativo1') ?: new Usuario(
				username: 'alumnoAdministrativo1',
				password: 'alumnoAdministrativo1',
				enabled: true).save(failOnError: true)

		if (!alumnoAdministrativoUser1.authorities.contains(alumnoRol)) {
			UsuarioRol.create(alumnoAdministrativoUser1, alumnoRol, true)
		}

		if (!alumnoAdministrativoUser1.authorities.contains(administrativoRol)) {
			UsuarioRol.create(alumnoAdministrativoUser1, administrativoRol, true)
		}


		//Turnos Solo para Test
		def turnoMañana = Turno.findByCodigo('MAÑANA') ?: new Turno(codigo: 'MAÑANA',
		horaSemanaDesde: 8, horaSemanaHasta: 12, horaSabadoDesde: 8, horaSabadoHasta: 12
		).save(failOnError: true)

		def turnoTarde = Turno.findByCodigo('TARDE') ?: new Turno(codigo:'TARDE',
		horaSemanaDesde: 14, horaSemanaHasta: 18, horaSabadoDesde: 14, horaSabadoHasta:18
		).save(failOnError: true)


		def turnoNoche = Turno.findByCodigo('NOCHE') ?: new Turno(codigo:'NOCHE',
		horaSemanaDesde: 19,horaSemanaHasta: 23, horaSabadoDesde: 8, horaSabadoHasta: 12
		).save(failOnError: true)

	}
	def destroy = {
	}
}
