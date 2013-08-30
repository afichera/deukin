import com.deukin.Alumno
import com.deukin.Contacto
import com.deukin.Documento
import com.deukin.Domicilio
import com.deukin.EstadoRecurso
import com.deukin.Recurso
import com.deukin.Rol
import com.deukin.Telefono
import com.deukin.TipoDocumento
import com.deukin.TipoRecurso
import com.deukin.TipoTelefono
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
		def turnoManiana = Turno.findByCodigo('MANIANA') ?: new Turno(codigo: 'MANIANA',
		horaSemanaDesde: 8, horaSemanaHasta: 12, horaSabadoDesde: 8, horaSabadoHasta: 12
		).save(failOnError: true)

		def turnoTarde = Turno.findByCodigo('TARDE') ?: new Turno(codigo:'TARDE',
		horaSemanaDesde: 14, horaSemanaHasta: 18, horaSabadoDesde: 14, horaSabadoHasta:18
		).save(failOnError: true)


		def turnoNoche = Turno.findByCodigo('NOCHE') ?: new Turno(codigo:'NOCHE',
		horaSemanaDesde: 19,horaSemanaHasta: 23, horaSabadoDesde: 8, horaSabadoHasta: 12
		).save(failOnError: true)

		//Tipos Recurso Solo para Test
		def tipoRecurso1 = TipoRecurso.findByDescripcion('PROYECTOR')?: new TipoRecurso(descripcion:'PROYECTOR').save(failOnError: true)
		def tipoRecurso2 = TipoRecurso.findByDescripcion('PIZARRON')?: new TipoRecurso(descripcion:'PIZARRON').save(failOnError: true)
		def tipoRecurso3 = TipoRecurso.findByDescripcion('MS VISUAL STUDIO')?: new TipoRecurso(descripcion:'VISUAL STUDIO').save(failOnError: true)
		def tipoRecurso4 = TipoRecurso.findByDescripcion('MS PROJECT')?: new TipoRecurso(descripcion:'MS PROJECT').save(failOnError: true)

		//Recursos Solo para Test
		def recurso1 = Recurso.findByCodigo('PROY001')?: new Recurso(codigo:'PROY001', tipoRecurso: tipoRecurso1, estadoRecurso: EstadoRecurso.BUENO).save(failOnError: true)
		def recurso2 = Recurso.findByCodigo('PROY002')?: new Recurso(codigo:'PROY002', tipoRecurso: tipoRecurso1, estadoRecurso: EstadoRecurso.MALO).save(failOnError: true)
		def recurso3 = Recurso.findByCodigo('PROY003')?: new Recurso(codigo:'PROY003', tipoRecurso: tipoRecurso1, estadoRecurso: EstadoRecurso.INUTILIZABLE).save(failOnError: true)
		def recurso4 = Recurso.findByCodigo('PROY004')?: new Recurso(codigo:'PROY004', tipoRecurso: tipoRecurso1, estadoRecurso: EstadoRecurso.BUENO).save(failOnError: true)
		def recurso5 = Recurso.findByCodigo('VISUAL01')?: new Recurso(codigo:'VISUAL01', tipoRecurso: tipoRecurso3, estadoRecurso: EstadoRecurso.BUENO).save(failOnError: true)
		def recurso6 = Recurso.findByCodigo('VISUAL02')?: new Recurso(codigo:'VISUAL02', tipoRecurso: tipoRecurso3, estadoRecurso: EstadoRecurso.REGULAR).save(failOnError: true)

		//Telefonos Solo para Test
		def telefono1Alumno1 = Telefono.findByNumero('1566960007')?: new Telefono(numero: '1166960007', tipoTelefono:TipoTelefono.MOVIL)
		def telefono2Alumno1 = Telefono.findByNumero('54311816')?: new Telefono(numero: '54311816', tipoTelefono:TipoTelefono.CASA)
		def telefono1Alumno2 = Telefono.findByNumero('1500000000')?: new Telefono(numero: '1500000000', tipoTelefono:TipoTelefono.MOVIL)
		def telefono2Alumno2 = Telefono.findByNumero('44444444')?: new Telefono(numero: '44444444', tipoTelefono:TipoTelefono.CASA)

		def DomicilioAlumno1 = new Domicilio(calle: 'Martin Irigoyen', numero: 556, codigoPostal: 1712,localidad: 'Castelar', observaciones: 'Triplex del Medio.')
		def DomicilioAlumno2 = new Domicilio(calle: 'Luis Maria Drago', numero: 2519, codigoPostal: 1712,localidad: 'Castelar')

		def contactoAlumno1 = new Contacto(domicilio: DomicilioAlumno1)
		contactoAlumno1.telefonos = []
		contactoAlumno1.telefonos.add(telefono1Alumno1)
		contactoAlumno1.telefonos.add(telefono2Alumno1)

		def contactoAlumno2 = new Contacto(domicilio: DomicilioAlumno2)
		contactoAlumno2.telefonos = []
		contactoAlumno2.telefonos.add(telefono1Alumno2)
		contactoAlumno2.telefonos.add(telefono2Alumno2)

		def documentoDNIAlumno1 = Documento.findByNumeroAndTipoDocumento(28230014, TipoDocumento.DNI)?:new Documento(numero:28230014, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoCUILAlumno2 = Documento.findByNumeroAndTipoDocumento(20282300142, TipoDocumento.CUIL)?:new Documento(numero:20282300142, tipoDocumento:TipoDocumento.CUIL).save(failOnError:true)

		def alumno1 = Alumno.findByDocumento(documentoDNIAlumno1)?:new Alumno(nombre:'Alejandro',apellido:'Fichera',documento:documentoDNIAlumno1, contacto: contactoAlumno1, usuario:alumnoUser1).save(failOnError:true)
		def alumno2 = Alumno.findByDocumento(documentoCUILAlumno2)?:new Alumno(nombre:'Juan Diego',apellido:'Margenats',documento:documentoCUILAlumno2, contacto: contactoAlumno2, usuario:alumnoAdministrativoUser1).save(failOnError:true)

	}
	def destroy = {
	}
}
