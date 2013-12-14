import com.deukin.Alumno
import com.deukin.AsignacionDocenteCurso
import com.deukin.Autoridad
import com.deukin.Carrera
import com.deukin.CicloLectivo
import com.deukin.ConfiguracionCursoDia
import com.deukin.Contacto
import com.deukin.Coordinador
import com.deukin.Correlatividad
import com.deukin.CronogramaCarrera
import com.deukin.Curso
import com.deukin.Departamento
import com.deukin.DiaSemana
import com.deukin.Docente
import com.deukin.Documento
import com.deukin.Domicilio
import com.deukin.Equivalencia
import com.deukin.EspacioFisico
import com.deukin.EstadoCurso
import com.deukin.EstadoDeCreacion
import com.deukin.EstadoRecurso
import com.deukin.InstitucionEducativa
import com.deukin.Materia
import com.deukin.ModalidadAsistencia
import com.deukin.ObjetivoCarrera
import com.deukin.PeriodoAcademico
import com.deukin.PeriodoDedicacion
import com.deukin.Persona
import com.deukin.PlanEstudio
import com.deukin.Recurso
import com.deukin.Rol
import com.deukin.Telefono
import com.deukin.TipoDocumento
import com.deukin.TipoPeriodoAcademico
import com.deukin.TipoPorcentajeAsignacion
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
		def adminUser = Usuario.findByUsername('admin@deukin.com') ?: new Usuario(
				username: 'admin@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!adminUser.authorities.contains(admininstradorSistemaRol)) {
			UsuarioRol.create(adminUser, admininstradorSistemaRol, true)
		}

		//Usuarios Simples solo para Test
		//Usuario Alumno Solo para pruebas
		def alumnoUser1 = Usuario.findByUsername('alumno1@deukin.com') ?: new Usuario(
				username: 'alumno1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!alumnoUser1.authorities.contains(alumnoRol)) {
			UsuarioRol.create(alumnoUser1, alumnoRol, true)
		}

		//Usuario Docente Solo para pruebas
		def docenteUser1 = Usuario.findByUsername('docente1@deukin.com') ?: new Usuario(
				username: 'docente1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser1.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser1, docenteRol, true)
		}

		def docenteUser2 = Usuario.findByUsername('docente2@deukin.com') ?: new Usuario(
				username: 'docente2@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser2.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser2, docenteRol, true)
		}

		def docenteUser3 = Usuario.findByUsername('docente3@deukin.com') ?: new Usuario(
				username: 'docente3@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser3.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser3, docenteRol, true)
		}

		def docenteUser4 = Usuario.findByUsername('docente4@deukin.com') ?: new Usuario(
				username: 'docente4@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser4.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser4, docenteRol, true)
		}

		def docenteUser5 = Usuario.findByUsername('docente5@deukin.com') ?: new Usuario(
				username: 'docente5@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser5.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser5, docenteRol, true)
		}

		def docenteUser6 = Usuario.findByUsername('docente6@deukin.com') ?: new Usuario(
				username: 'docente6@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser6.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser6, docenteRol, true)
		}

		def docenteUser7 = Usuario.findByUsername('docente7@deukin.com') ?: new Usuario(
				username: 'docente7@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser7.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser7, docenteRol, true)
		}

		def docenteUser8 = Usuario.findByUsername('docente8@deukin.com') ?: new Usuario(
				username: 'docente8@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser8.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser8, docenteRol, true)
		}


		def docenteUser9 = Usuario.findByUsername('docente9@deukin.com') ?: new Usuario(
				username: 'docente9@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser9.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser9, docenteRol, true)
		}

		def docenteUser10 = Usuario.findByUsername('docente10@deukin.com') ?: new Usuario(
				username: 'docente10@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser10.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser10, docenteRol, true)
		}

		def docenteUser11 = Usuario.findByUsername('docente11@deukin.com') ?: new Usuario(
				username: 'docente11@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser11.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser11, docenteRol, true)
		}

		def docenteUser12 = Usuario.findByUsername('docente12@deukin.com') ?: new Usuario(
				username: 'docente12@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteUser12.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteUser12, docenteRol, true)
		}


		//Usuario Coordinador Solo para pruebas
		def usuarioCoordinador1 = Usuario.findByUsername('coordinador1@deukin.com') ?: new Usuario(
				username: 'coordinador1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!usuarioCoordinador1.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(usuarioCoordinador1, coordinadorRol , true)
		}

		def usuarioCoordinador2 = Usuario.findByUsername('coordinador2@deukin.com') ?: new Usuario(
				username: 'coordinador2@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!usuarioCoordinador2.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(usuarioCoordinador2, coordinadorRol , true)
		}

		def usuarioCoordinador3 = Usuario.findByUsername('coordinador3@deukin.com') ?: new Usuario(
				username: 'coordinador3@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!usuarioCoordinador3.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(usuarioCoordinador3, coordinadorRol , true)
		}


		//Usuario Administrativo Solo para pruebas
		def usuarioAdministrativo1 = Usuario.findByUsername('administrativo1@deukin.com') ?: new Usuario(
				username: 'administrativo1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!usuarioAdministrativo1.authorities.contains(administrativoRol)) {
			UsuarioRol.create(usuarioAdministrativo1, administrativoRol, true)
		}

		//Usuarios Combinados solo para Test
		//Usuario Alumno y Docente Solo para pruebas
		def alumnoDocenteUser1 = Usuario.findByUsername('alumnoDocente1@deukin.com') ?: new Usuario(
				username: 'alumnoDocente1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!alumnoDocenteUser1.authorities.contains(alumnoRol)) {
			UsuarioRol.create(alumnoDocenteUser1, alumnoRol, true)
		}

		if (!alumnoDocenteUser1.authorities.contains(docenteRol)) {
			UsuarioRol.create(alumnoDocenteUser1, docenteRol, true)
		}

		//Usuario Docente y Coordinador Solo para pruebas
		def docenteCoordinadorUser1 = Usuario.findByUsername('docenteCoordinador1@deukin.com') ?: new Usuario(
				username: 'docenteCoordinador1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!docenteCoordinadorUser1.authorities.contains(docenteRol)) {
			UsuarioRol.create(docenteCoordinadorUser1, docenteRol, true)
		}

		if (!docenteCoordinadorUser1.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(docenteCoordinadorUser1, coordinadorRol, true)
		}

		//Usuario Alumno y Administrativo Solo para pruebas
		def alumnoAdministrativoUser1 = Usuario.findByUsername('alumnoAdministrativo1@deukin.com') ?: new Usuario(
				username: 'alumnoAdministrativo1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!alumnoAdministrativoUser1.authorities.contains(alumnoRol)) {
			UsuarioRol.create(alumnoAdministrativoUser1, alumnoRol, true)
		}

		if (!alumnoAdministrativoUser1.authorities.contains(administrativoRol)) {
			UsuarioRol.create(alumnoAdministrativoUser1, administrativoRol, true)
		}
		
		def usuarioAutoridad1 = Usuario.findByUsername('autoridad1@deukin.com') ?: new Usuario(
				username: 'autoridad1@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!usuarioAutoridad1.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(usuarioAutoridad1, coordinadorRol , true)
		}

		if (!usuarioAutoridad1.authorities.contains(administrativoRol)) {
			UsuarioRol.create(usuarioAutoridad1, administrativoRol, true)
		}

		def usuarioAutoridad2 = Usuario.findByUsername('autoridad2@deukin.com') ?: new Usuario(
				username: 'autoridad2@deukin.com',
				password: '123456',
				enabled: true).save(failOnError: true)

		if (!usuarioAutoridad2.authorities.contains(coordinadorRol)) {
			UsuarioRol.create(usuarioAutoridad2, coordinadorRol , true)
		}

		if (!usuarioAutoridad2.authorities.contains(administrativoRol)) {
			UsuarioRol.create(usuarioAutoridad2, administrativoRol, true)
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
		def tipoRecurso3 = TipoRecurso.findByDescripcion('MS VISUAL STUDIO')?: new TipoRecurso(descripcion:'MS VISUAL STUDIO').save(failOnError: true)
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
		def telefono1Coordinador1 = Telefono.findByNumero('1555555555')?: new Telefono(numero: '1555555555', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Coordinador2 = Telefono.findByNumero('1555555551')?: new Telefono(numero: '1555555551', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Coordinador3 = Telefono.findByNumero('1555555552')?: new Telefono(numero: '1555555552', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Docente1 = Telefono.findByNumero('444499990000')?: new Telefono(numero: '444499990000', tipoTelefono:TipoTelefono.MOVIL)

		def telefono1Docente2 = Telefono.findByNumero('444499990002')?: new Telefono(numero: '444499990002', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Docente3 = Telefono.findByNumero('444499990003')?: new Telefono(numero: '444499990003', tipoTelefono:TipoTelefono.CASA)
		def telefono1Docente4 = Telefono.findByNumero('444499990004')?: new Telefono(numero: '444499990004', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Docente5 = Telefono.findByNumero('444499990005')?: new Telefono(numero: '444499990005', tipoTelefono:TipoTelefono.TRABAJO)
		def telefono1Docente6 = Telefono.findByNumero('444499990006')?: new Telefono(numero: '444499990006', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Docente7 = Telefono.findByNumero('444499990007')?: new Telefono(numero: '444499990007', tipoTelefono:TipoTelefono.CASA)
		def telefono1Docente8 = Telefono.findByNumero('444499990008')?: new Telefono(numero: '444499990008', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Docente9 = Telefono.findByNumero('444499990009')?: new Telefono(numero: '444499990009', tipoTelefono:TipoTelefono.TRABAJO)
		def telefono1Docente10 = Telefono.findByNumero('444499990010')?: new Telefono(numero: '444499990010', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Docente11 = Telefono.findByNumero('444499990011')?: new Telefono(numero: '444499990011', tipoTelefono:TipoTelefono.CASA)
		def telefono1Docente12 = Telefono.findByNumero('444499990012')?: new Telefono(numero: '444499990012', tipoTelefono:TipoTelefono.MOVIL)
		
		def telefono1Autoridad1 = Telefono.findByNumero('444499990013')?: new Telefono(numero: '444499990013', tipoTelefono:TipoTelefono.MOVIL)
		def telefono1Autoridad2 = Telefono.findByNumero('444499990014')?: new Telefono(numero: '444499990014', tipoTelefono:TipoTelefono.MOVIL)
		


		def DomicilioAlumno1 = new Domicilio(calle: 'Martin Irigoyen', numero: 556, codigoPostal: 1712,localidad: 'Castelar', observaciones: 'Triplex del Medio.')
		def DomicilioAlumno2 = new Domicilio(calle: 'Luis Maria Drago', numero: 2519, codigoPostal: 1712,localidad: 'Castelar')
		def DomicilioCoordinador1 = new Domicilio(calle: 'Acá va la calle', numero: 5555, codigoPostal: 1100,localidad: 'Capital Federal', observaciones: '')
		def DomicilioCoordinador2 = new Domicilio(calle: 'Acá va la calle', numero: 5555, codigoPostal: 1100,localidad: 'Capital Federal', observaciones: '')
		def DomicilioCoordinador3 = new Domicilio(calle: 'Acá va la calle', numero: 5555, codigoPostal: 1100,localidad: 'Capital Federal', observaciones: '')
		def domicilioDocente1 = new Domicilio(calle: 'Rivadavia', numero: 5677, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente2 = new Domicilio(calle: 'Rivadavia', numero: 5678, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente3 = new Domicilio(calle: 'Rivadavia', numero: 5679, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente4 = new Domicilio(calle: 'Rivadavia', numero: 5680, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente5 = new Domicilio(calle: 'Rivadavia', numero: 5681, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente6 = new Domicilio(calle: 'Rivadavia', numero: 5682, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente7 = new Domicilio(calle: 'Rivadavia', numero: 5683, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente8 = new Domicilio(calle: 'Rivadavia', numero: 5684, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente9 = new Domicilio(calle: 'Rivadavia', numero: 5681, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente10 = new Domicilio(calle: 'Rivadavia', numero: 5682, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente11 = new Domicilio(calle: 'Rivadavia', numero: 5683, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioDocente12 = new Domicilio(calle: 'Rivadavia', numero: 5684, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')

		def domicilioAutoridad1 = new Domicilio(calle: 'Rivadavia', numero: 5685, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		def domicilioAutoridad2 = new Domicilio(calle: 'Rivadavia', numero: 5686, codigoPostal: 5400,localidad: 'Capital Federal', observaciones: 'tocar timbre del medio')
		


		def contactoAlumno1 = new Contacto(domicilio: DomicilioAlumno1)
		contactoAlumno1.telefonos = []
		contactoAlumno1.telefonos.add(telefono1Alumno1)
		contactoAlumno1.telefonos.add(telefono2Alumno1)
		telefono1Alumno1.contacto =contactoAlumno1
		telefono2Alumno1.contacto =contactoAlumno1

		def contactoAlumno2 = new Contacto(domicilio: DomicilioAlumno2)
		contactoAlumno2.telefonos = []
		contactoAlumno2.telefonos.add(telefono1Alumno2)
		contactoAlumno2.telefonos.add(telefono2Alumno2)
		telefono1Alumno2.contacto=contactoAlumno2
		telefono2Alumno2.contacto=contactoAlumno2
		
		def contactoCoordinador1 = new Contacto(domicilio: DomicilioCoordinador1)
		contactoCoordinador1.telefonos = []
		contactoCoordinador1.telefonos.add(telefono1Coordinador1)
		telefono1Coordinador1.contacto = contactoCoordinador1

		def contactoCoordinador2 = new Contacto(domicilio: DomicilioCoordinador2)
		contactoCoordinador2.telefonos = []
		contactoCoordinador2.telefonos.add(telefono1Coordinador2)
		telefono1Coordinador2.contacto = contactoCoordinador2

		def contactoCoordinador3 = new Contacto(domicilio: DomicilioCoordinador3)
		contactoCoordinador3.telefonos = []
		contactoCoordinador3.telefonos.add(telefono1Coordinador3)
		telefono1Coordinador3.contacto = contactoCoordinador3
		
		def contactoDocente1 = new Contacto(domicilio: domicilioDocente1)
		contactoDocente1.telefonos = []
		contactoDocente1.telefonos.add(telefono1Docente1)
		telefono1Docente1.contacto = contactoDocente1
		
		def contactoDocente2 = new Contacto(domicilio: domicilioDocente2)
		contactoDocente2.telefonos = []
		contactoDocente2.telefonos.add(telefono1Docente2)
		telefono1Docente2.contacto = contactoDocente2
		
		def contactoDocente3 = new Contacto(domicilio: domicilioDocente3)
		contactoDocente3.telefonos = []
		contactoDocente3.telefonos.add(telefono1Docente3)
		telefono1Docente3.contacto = contactoDocente3
		
		def contactoDocente4 = new Contacto(domicilio: domicilioDocente4)
		contactoDocente4.telefonos = []
		contactoDocente4.telefonos.add(telefono1Docente4)
		telefono1Docente4.contacto = contactoDocente4
		
		def contactoDocente5 = new Contacto(domicilio: domicilioDocente5)
		contactoDocente5.telefonos = []
		contactoDocente5.telefonos.add(telefono1Docente5)
		telefono1Docente5.contacto = contactoDocente5
		
		def contactoDocente6 = new Contacto(domicilio: domicilioDocente6)
		contactoDocente6.telefonos = []
		contactoDocente6.telefonos.add(telefono1Docente6)
		telefono1Docente6.contacto = contactoDocente6
		def contactoDocente7 = new Contacto(domicilio: domicilioDocente7)
		contactoDocente7.telefonos = []
		contactoDocente7.telefonos.add(telefono1Docente7)
		telefono1Docente7.contacto = contactoDocente7
		def contactoDocente8 = new Contacto(domicilio: domicilioDocente8)
		contactoDocente8.telefonos = []
		contactoDocente8.telefonos.add(telefono1Docente8)
		telefono1Docente8.contacto = contactoDocente8
		def contactoDocente9 = new Contacto(domicilio: domicilioDocente9)
		contactoDocente9.telefonos = []
		contactoDocente9.telefonos.add(telefono1Docente9)
		telefono1Docente9.contacto = contactoDocente9
		def contactoDocente10 = new Contacto(domicilio: domicilioDocente10)
		contactoDocente10.telefonos = []
		contactoDocente10.telefonos.add(telefono1Docente10)
		telefono1Docente10.contacto = contactoDocente10
		def contactoDocente11 = new Contacto(domicilio: domicilioDocente11)
		contactoDocente11.telefonos = []
		contactoDocente11.telefonos.add(telefono1Docente11)
		telefono1Docente11.contacto = contactoDocente11
		def contactoDocente12 = new Contacto(domicilio: domicilioDocente12)
		contactoDocente12.telefonos = []
		contactoDocente12.telefonos.add(telefono1Docente12)
		telefono1Docente11.contacto = contactoDocente11
		def contactoAutoridad1 = new Contacto(domicilio: domicilioAutoridad1)
		contactoAutoridad1.telefonos = []
		contactoAutoridad1.telefonos.add(telefono1Autoridad1)
		telefono1Autoridad1.contacto = contactoAutoridad1
		def contactoAutoridad2 = new Contacto(domicilio: domicilioAutoridad2)
		contactoAutoridad2.telefonos = []
		contactoAutoridad2.telefonos.add(telefono1Autoridad2)
		telefono1Autoridad2.contacto = contactoAutoridad2

		//documentos solo para test
		def documentoDNIAlumno1 = Documento.findByNumeroAndTipoDocumento(28230014, TipoDocumento.DNI)?:new Documento(numero:28230014, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoCUILAlumno2 = Documento.findByNumeroAndTipoDocumento(20282300142, TipoDocumento.CUIL)?:new Documento(numero:20282300142, tipoDocumento:TipoDocumento.CUIL).save(failOnError:true)
		def documentoDNICoordinador1= Documento.findByNumeroAndTipoDocumento(27777777, TipoDocumento.DNI)?:new Documento(numero:27777777, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNICoordinador2= Documento.findByNumeroAndTipoDocumento(27777778, TipoDocumento.DNI)?:new Documento(numero:27777778, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNICoordinador3= Documento.findByNumeroAndTipoDocumento(27777779, TipoDocumento.DNI)?:new Documento(numero:27777779, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		//Alumnos solo para test
		def alumno1 = Alumno.findByDocumento(documentoDNIAlumno1)?:new Alumno(nombre:'Alejandro',apellido:'Fichera',documento:documentoDNIAlumno1, contacto: contactoAlumno1, usuario:alumnoUser1).save(failOnError:true)
		def alumno2 = Alumno.findByDocumento(documentoCUILAlumno2)?:new Alumno(nombre:'Juan Diego',apellido:'Margenats',documento:documentoCUILAlumno2, contacto: contactoAlumno2, usuario:alumnoAdministrativoUser1).save(failOnError:true)
		def personaCoordinador1 = Coordinador.findByUsuario(usuarioCoordinador1) ?: new Coordinador(apellido: 'GIOIA',nombre: 'CINTHIA', usuario: usuarioCoordinador1, documento: documentoDNICoordinador1, contacto: contactoCoordinador1, coordinadorGeneral:false).save(failOnError:true)
		def personaCoordinador2 = Coordinador.findByUsuario(usuarioCoordinador2) ?: new Coordinador(apellido: 'ORTHUSTEGUY',nombre: 'FERNANDO', usuario: usuarioCoordinador2, documento: documentoDNICoordinador2, contacto: contactoCoordinador2, coordinadorGeneral:true).save(failOnError:true)
		def personaCoordinador3 = Coordinador.findByUsuario(usuarioCoordinador3) ?: new Coordinador(apellido: 'RUSTICCINI',nombre: 'ALEJANDRO', usuario: usuarioCoordinador3, documento: documentoDNICoordinador3, contacto: contactoCoordinador3, coordinadorGeneral:false).save(failOnError:true)


		def documentoDNIdocente1= Documento.findByNumeroAndTipoDocumento(21111111, TipoDocumento.DNI)?:new Documento(numero:21111111, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente2= Documento.findByNumeroAndTipoDocumento(21111112, TipoDocumento.DNI)?:new Documento(numero:21111112, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente3= Documento.findByNumeroAndTipoDocumento(21111113, TipoDocumento.DNI)?:new Documento(numero:21111113, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente4= Documento.findByNumeroAndTipoDocumento(21111114, TipoDocumento.DNI)?:new Documento(numero:21111114, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente5= Documento.findByNumeroAndTipoDocumento(21111115, TipoDocumento.DNI)?:new Documento(numero:21111115, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente6= Documento.findByNumeroAndTipoDocumento(21111116, TipoDocumento.DNI)?:new Documento(numero:21111116, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente7= Documento.findByNumeroAndTipoDocumento(21111117, TipoDocumento.DNI)?:new Documento(numero:21111117, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente8= Documento.findByNumeroAndTipoDocumento(21111118, TipoDocumento.DNI)?:new Documento(numero:21111118, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente9= Documento.findByNumeroAndTipoDocumento(21111109, TipoDocumento.DNI)?:new Documento(numero:21111109, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente10= Documento.findByNumeroAndTipoDocumento(29999910, TipoDocumento.DNI)?:new Documento(numero:29999910, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente11= Documento.findByNumeroAndTipoDocumento(29999911, TipoDocumento.DNI)?:new Documento(numero:29999911, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIdocente12= Documento.findByNumeroAndTipoDocumento(29999912, TipoDocumento.DNI)?:new Documento(numero:29999912, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)

		def documentoDNIAutoridad1= Documento.findByNumeroAndTipoDocumento(29999913, TipoDocumento.DNI)?:new Documento(numero:29999913, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)
		def documentoDNIAutoridad2= Documento.findByNumeroAndTipoDocumento(29999914, TipoDocumento.DNI)?:new Documento(numero:29999914, tipoDocumento:TipoDocumento.DNI).save(failOnError:true)

		def personaAutoridad1 = Persona.findByDocumento(documentoDNIAutoridad1)?:new Persona(documento: documentoDNIAutoridad1, nombre:'Daniel', apellido:'Martinez', usuario:usuarioAutoridad1, contacto:contactoAutoridad1).save(failOnError:true)   // findByUsuario(docenteUser12) ?: new Docente(apellido:'Rusti',nombre: 'Ale', usuario: docenteUser12, documento: documentoDNIdocente12, contacto: contactoDocente12, departamento: departamentoIngenieria).save(failOnError:true)
		def personaAutoridad2 = Persona.findByDocumento(documentoDNIAutoridad2)?:new Persona(documento: documentoDNIAutoridad2, nombre:'Gabriel', apellido:'Gonzalez', usuario:usuarioAutoridad2, contacto:contactoAutoridad2).save(failOnError:true)

		def autoridad1 = Autoridad.findByPersonaAndCargo(personaAutoridad1, "DECANO") ?: new Autoridad(persona: personaAutoridad1, cargo:"DECANO").save(failOnError:true)
		def autoridad2 = Autoridad.findByPersonaAndCargo(personaAutoridad2, "VICE DECANO") ?: new Autoridad(persona: personaAutoridad2, cargo:"VICE DECANO").save(failOnError:true)


		def coordinadoresCarrera1 = []
		coordinadoresCarrera1.add(personaCoordinador1)
		coordinadoresCarrera1.add(personaCoordinador2)
		coordinadoresCarrera1.add(personaCoordinador3)

		//carreras solo para test
		def carrera1 = Carrera.findByTitulo('TECNICO UNIVERSITARIO EN DESARROLLO WEB')
		def fundamentacion1 = 'Esta carrera se sustenta en contenidos que promuevan la adquisición de conocimientos básicos en las áreas lingüística y matemática para luego incursionar en las áreas de programación y arquitectura de aplicaciones web que permitan desarrollar y administrar las mismas, programar servicios remotos, diseñar interfaces de usuario, tecnología multimedia y aspectos sociales de las nuevas tecnologías. La articulación de las áreas mencionadas, posibilitará aplicaciones de software con los fundamentos teóricos indispensables y una importante carga horaria destinada a la práctica y al uso de herramientas de desarrollo.\n Resumiendo, se pretende satisfacer las crecientes necesidades del mercado en cuanto a la formación de profesionales expertos en administración y programación de aplicaciones web, con la incorporación de nuevos conocimientos, habilidades, aptitudes y valores, dentro de un sistema curricular flexible que brinde las opciones para encauzar adecuadamente al egresado de acuerdo a las tendencias propias de las diferentes áreas de su profesión.'
		def perfil1 = 'El Técnico Desarrollador de Aplicaciones web es un profesional que posee conocimientos teóricos y con un destacado manejo de actividades prácticas para desempeñarse en gestiones específicas del diseño, configuración y mantenimiento de aplicaciones web así como también estar en condiciones de interactuar en actividades multidisciplinarias relacionadas con proyectos sobre las mismas. Asimismo, estará capacitado para desarrollar aplicaciones web que contemplen aspectos tales como la seguridad, calidad y accesibilidad, entre otros. '
		def descripcion1 = 'La carrera se organiza en áreas: área de programación; área de arquitectura; área de comunicaciones y un área denominada de apoyo la cual contiene asignaturas de lingüística, de matemáticas y de normas de calidad. Por tanto se cuenta con asignaturas básicas y complementarias para la adecuada formación del alumno así como también una materia optativa para cubrir tópicos que reflejen el constante avance en este campo.\n El área de Programación brinda una perspectiva completa de lenguajes y técnicas de programación actuales. Se enfoca la especificidad en tres ejes: a) Manejo de estructuras y algoritmos de programación, b) Manejo de bases de datos y estructuras de archivos de datos y c) Técnicas y metodologías de programación web.\n El área de Arquitecturas tiene como propósito acercar al alumno a las tecnologías de hardware y software actuales, presentando sus características principales, componentes, tecnologías actuales y manejo.\n El área de Comunicaciones debe capacitar al alumno para desempeñarse satisfactoriamente y con independencia dentro de las actividades mencionadas en el perfil, y para actualizarse de acuerdo a las nuevas tecnologías de comunicaciones que surgirán durante su actividad laboral.'
		if(!carrera1){
			carrera1 = new Carrera(titulo: 'TECNICO UNIVERSITARIO EN DESARROLLO WEB', descripcion:descripcion1, perfilDelGraduado:perfil1,fundamentacion:fundamentacion1, condicionIngreso: 'SECUNDARIO COMPLETO', modalidadAsistencia: ModalidadAsistencia.PRESENCIAL, coordinadores: coordinadoresCarrera1, estado: EstadoDeCreacion.BORRADOR).save(failOnError:true)
			personaCoordinador1.carrera = carrera1
			personaCoordinador1.save(failOnError:true)
			personaCoordinador2.carrera = carrera1
			personaCoordinador2.save(failOnError:true)
			personaCoordinador3.carrera = carrera1
			personaCoordinador3.save(failOnError:true)
		}

		def objetivoCarrera1 = new ObjetivoCarrera(carrera:carrera1, descripcion: 'Formar técnicos universitarios con conocimientos, técnicas, herramientas y habilidades para desempeñarse en el mercado laboral actual dando respuesta inmediata a la alta demanda de profesionales en áreas técnicas especializadas como es el desarrollo, mantenimiento y gestión de aplicaciones web.').save(failOnError:true)
		def objetivoCarrera2 = new ObjetivoCarrera(carrera:carrera1, descripcion: 'Formar técnicos en el empleo de estrategias, metodologías, técnicas y herramientas para abordar la resolución de problemas asociados a aplicaciones y procesos en la Web.').save(failOnError:true)
		def objetivoCarrera3 = new ObjetivoCarrera(carrera:carrera1, descripcion: 'Formar un egresado con conocimientos teóricos y prácticos en análisis, diseño, programación, mantenimiento, implementación y administración de aplicaciones web.').save(failOnError:true)



		def carrera2 = Carrera.findByTitulo('INGENIERIO EN INFORMATICA')?:new Carrera(titulo: 'INGENIERIO EN INFORMATICA', descripcion:'INGENIERIA EN INFORMATICA', condicionIngreso: 'SECUNDARIO COMPLETO', modalidadAsistencia: ModalidadAsistencia.PRESENCIAL, estado: EstadoDeCreacion.BORRADOR).save(failOnError:true)

		//Solo Para Test
		def periodoDedicacion1 = PeriodoDedicacion.findByAnioAndCuatrimestre(1, 1)?: new PeriodoDedicacion(anio:1, cuatrimestre:1).save(failOnError:true)
		def periodoDedicacion2 = PeriodoDedicacion.findByAnioAndCuatrimestre(1, 2)?: new PeriodoDedicacion(anio:1, cuatrimestre:2).save(failOnError:true)
		def periodoDedicacion3 = PeriodoDedicacion.findByAnioAndCuatrimestre(2, 1)?: new PeriodoDedicacion(anio:2, cuatrimestre:1).save(failOnError:true)
		def periodoDedicacion4 = PeriodoDedicacion.findByAnioAndCuatrimestre(2, 2)?: new PeriodoDedicacion(anio:2, cuatrimestre:2).save(failOnError:true)
		def periodoDedicacion5 = PeriodoDedicacion.findByAnioAndCuatrimestre(3, 1)?: new PeriodoDedicacion(anio:3, cuatrimestre:1).save(failOnError:true)
		def periodoDedicacion6 = PeriodoDedicacion.findByAnioAndCuatrimestre(4, 2)?: new PeriodoDedicacion(anio:4, cuatrimestre:2).save(failOnError:true)



		//Planes de Estudio
		def planEstudio1 = PlanEstudio.findByIdentificacion('TEC_DESA_2011')?:new PlanEstudio(identificacion: 'TEC_DESA_2011', carrera:carrera1, estado: EstadoDeCreacion.OFERTADA, cantidadPeriodosAcademicos: 5).save(failOnError:true)
		def planEstudio2 = PlanEstudio.findByIdentificacion('TEC_DESA_2014')?:new PlanEstudio(identificacion: 'TEC_DESA_2014', carrera:carrera1, estado: EstadoDeCreacion.SIN_OFERTAR, cantidadPeriodosAcademicos: 5).save(failOnError:true)
		def planEstudio3 = PlanEstudio.findByIdentificacion('ING_INF_1997')?:new PlanEstudio(identificacion: 'ING_INF_1997', carrera:carrera2, estado: EstadoDeCreacion.OFERTADA, cantidadPeriodosAcademicos: 10).save(failOnError:true)
		def planEstudio4 = PlanEstudio.findByIdentificacion('ING_INF_2010')?:new PlanEstudio(identificacion: 'ING_INF_2010', carrera:carrera2, estado: EstadoDeCreacion.OFERTADA, cantidadPeriodosAcademicos: 10).save(failOnError:true)



		//Materias solo para test
		def materia1 = Materia.findByCodigo(101)?: new Materia(codigo:101, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion1, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio1).save(failOnError:true)
		
		def materia2 = Materia.findByCodigo(102)?: new Materia(codigo:102, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80,periodo:periodoDedicacion1, cupoMinimoAlumnos:30, cupoMaximoAlumnos:40, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia3 = Materia.findByCodigo(103)?: new Materia(codigo:103, nombre:'MATEMATICA', cantidadUnidadesHorarias:40,periodo:periodoDedicacion1, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia4 = Materia.findByCodigo(104)?: new Materia(codigo:104, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia5 = Materia.findByCodigo(105)?: new Materia(codigo:105, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia6 = Materia.findByCodigo(106)?: new Materia(codigo:106, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8,periodo:periodoDedicacion3, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia7 = Materia.findByCodigo(107)?: new Materia(codigo:107, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80,periodo:periodoDedicacion3, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia8 = Materia.findByCodigo(108)?: new Materia(codigo:108, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80,periodo:periodoDedicacion4, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		
		def materia11 = Materia.findByCodigo(201)?: new Materia(codigo:201, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:80,periodo:periodoDedicacion1, cupoMinimoAlumnos:20, cupoMaximoAlumnos:32, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio3).save(failOnError:true)
		
		def materia12 = Materia.findByCodigo(202)?: new Materia(codigo:202, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80,periodo:periodoDedicacion1, cupoMinimoAlumnos:30, cupoMaximoAlumnos:20, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		
		def materia13 = Materia.findByCodigo(203)?: new Materia(codigo:203, nombre:'MATEMATICA', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:15,periodo:periodoDedicacion1, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		
		def materia14 = Materia.findByCodigo(204)?: new Materia(codigo:204, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:10, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		
		def materia15 = Materia.findByCodigo(205)?: new Materia(codigo:205, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		
		def materia16 = Materia.findByCodigo(206)?: new Materia(codigo:206, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8,periodo:periodoDedicacion3, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		
		def materia17 = Materia.findByCodigo(207)?: new Materia(codigo:207, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80,periodo:periodoDedicacion4, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		
		def materia18 = Materia.findByCodigo(208)?: new Materia(codigo:208, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80,periodo:periodoDedicacion4, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)

		def materia21 = Materia.findByCodigo(301)?: new Materia(codigo:301, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion1, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio2).save(failOnError:true)
		
		def materia22 = Materia.findByCodigo(302)?: new Materia(codigo:302, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80,periodo:periodoDedicacion1, cupoMinimoAlumnos:30, cupoMaximoAlumnos:40, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		
		def materia23 = Materia.findByCodigo(303)?: new Materia(codigo:303, nombre:'MATEMATICA', cantidadUnidadesHorarias:40,periodo:periodoDedicacion1, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		
		def materia24 = Materia.findByCodigo(304)?: new Materia(codigo:304, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		
		def materia25 = Materia.findByCodigo(305)?: new Materia(codigo:305, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		
		def materia26 = Materia.findByCodigo(306)?: new Materia(codigo:306, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8,periodo:periodoDedicacion3, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		
		def materia27 = Materia.findByCodigo(307)?: new Materia(codigo:307, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80,periodo:periodoDedicacion3, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		
		def materia28 = Materia.findByCodigo(308)?: new Materia(codigo:308, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80,periodo:periodoDedicacion4, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		

		def materia31 = Materia.findByCodigo(301)?: new Materia(codigo:401, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion1, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio4).save(failOnError:true)
		
		def materia32 = Materia.findByCodigo(402)?: new Materia(codigo:402, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80,periodo:periodoDedicacion1, cupoMinimoAlumnos:30, cupoMaximoAlumnos:20, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		
		def materia33 = Materia.findByCodigo(403)?: new Materia(codigo:403, nombre:'MATEMATICA', cantidadUnidadesHorarias:40,periodo:periodoDedicacion1, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		
		def materia34 = Materia.findByCodigo(404)?: new Materia(codigo:404, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:10, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		
		def materia35 = Materia.findByCodigo(405)?: new Materia(codigo:405, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40,periodo:periodoDedicacion2, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		
		def materia36 = Materia.findByCodigo(406)?: new Materia(codigo:406, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8,periodo:periodoDedicacion3, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		
		def materia37 = Materia.findByCodigo(407)?: new Materia(codigo:407, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80,periodo:periodoDedicacion4, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		
		def materia38 = Materia.findByCodigo(408)?: new Materia(codigo:408, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80,periodo:periodoDedicacion4, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		

		//correlatividades
		def correlatividad1 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia4,materia2)?:new Correlatividad(materiaPrincipal:materia4,materiaPredecesora:materia2).save(failOnError:true)
		def correlatividad2 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia5,materia1)?:new Correlatividad(materiaPrincipal:materia5,materiaPredecesora:materia1).save(failOnError:true)
		def correlatividad3 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia6,materia3)?:new Correlatividad(materiaPrincipal:materia6,materiaPredecesora:materia3).save(failOnError:true)
		def correlatividad4 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia7,materia4)?:new Correlatividad(materiaPrincipal:materia7,materiaPredecesora:materia4).save(failOnError:true)
		def correlatividad5 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia8,materia7)?:new Correlatividad(materiaPrincipal:materia8,materiaPredecesora:materia7).save(failOnError:true)
		def correlatividad6 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia8,materia5)?:new Correlatividad(materiaPrincipal:materia8,materiaPredecesora:materia5).save(failOnError:true)
		def correlatividad11 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia14,materia12)?:new Correlatividad(materiaPrincipal:materia14,materiaPredecesora:materia12).save(failOnError:true)
		def correlatividad12 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia15,materia11)?:new Correlatividad(materiaPrincipal:materia15,materiaPredecesora:materia11).save(failOnError:true)
		def correlatividad13 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia16,materia13)?:new Correlatividad(materiaPrincipal:materia16,materiaPredecesora:materia13).save(failOnError:true)
		def correlatividad14 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia17,materia14)?:new Correlatividad(materiaPrincipal:materia17,materiaPredecesora:materia14).save(failOnError:true)
		def correlatividad15 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia18,materia17)?:new Correlatividad(materiaPrincipal:materia18,materiaPredecesora:materia17).save(failOnError:true)
		def correlatividad16 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia18,materia15)?:new Correlatividad(materiaPrincipal:materia18,materiaPredecesora:materia15).save(failOnError:true)
		def correlatividad21 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia24,materia22)?:new Correlatividad(materiaPrincipal:materia24,materiaPredecesora:materia22).save(failOnError:true)
		def correlatividad22 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia25,materia21)?:new Correlatividad(materiaPrincipal:materia25,materiaPredecesora:materia21).save(failOnError:true)
		def correlatividad23 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia26,materia23)?:new Correlatividad(materiaPrincipal:materia26,materiaPredecesora:materia23).save(failOnError:true)
		def correlatividad24 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia27,materia24)?:new Correlatividad(materiaPrincipal:materia27,materiaPredecesora:materia24).save(failOnError:true)
		def correlatividad25 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia28,materia27)?:new Correlatividad(materiaPrincipal:materia28,materiaPredecesora:materia27).save(failOnError:true)
		def correlatividad26 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia28,materia25)?:new Correlatividad(materiaPrincipal:materia28,materiaPredecesora:materia25).save(failOnError:true)
		def correlatividad31 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia34,materia32)?:new Correlatividad(materiaPrincipal:materia34,materiaPredecesora:materia32).save(failOnError:true)
		def correlatividad32 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia35,materia31)?:new Correlatividad(materiaPrincipal:materia35,materiaPredecesora:materia31).save(failOnError:true)
		def correlatividad33 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia36,materia33)?:new Correlatividad(materiaPrincipal:materia36,materiaPredecesora:materia33).save(failOnError:true)
		def correlatividad34 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia37,materia34)?:new Correlatividad(materiaPrincipal:materia37,materiaPredecesora:materia34).save(failOnError:true)
		def correlatividad35 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia38,materia37)?:new Correlatividad(materiaPrincipal:materia38,materiaPredecesora:materia37).save(failOnError:true)
		def correlatividad36 = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materia38,materia35)?:new Correlatividad(materiaPrincipal:materia38,materiaPredecesora:materia35).save(failOnError:true)

		//Equivalencias sólo para test
		//bidireccionales
		def equivalencia1a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia1,materia21)?:new Equivalencia(materiaPrincipal:materia1,materiaEquivalente:materia21).save(failOnError:true)
		def equivalencia1b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia21,materia1)?:new Equivalencia(materiaPrincipal:materia21,materiaEquivalente:materia1).save(failOnError:true)
		def equivalencia2a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia2,materia22)?:new Equivalencia(materiaPrincipal:materia2,materiaEquivalente:materia22).save(failOnError:true)
		def equivalencia2b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia22,materia2)?:new Equivalencia(materiaPrincipal:materia22,materiaEquivalente:materia2).save(failOnError:true)
		def equivalencia3a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia3,materia23)?:new Equivalencia(materiaPrincipal:materia3,materiaEquivalente:materia23).save(failOnError:true)
		def equivalencia3b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia23,materia3)?:new Equivalencia(materiaPrincipal:materia23,materiaEquivalente:materia3).save(failOnError:true)
		def equivalencia4a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia4,materia24)?:new Equivalencia(materiaPrincipal:materia4,materiaEquivalente:materia24).save(failOnError:true)
		def equivalencia4b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia24,materia4)?:new Equivalencia(materiaPrincipal:materia24,materiaEquivalente:materia4).save(failOnError:true)
		def equivalencia5a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia5,materia25)?:new Equivalencia(materiaPrincipal:materia5,materiaEquivalente:materia25).save(failOnError:true)
		def equivalencia5b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia25,materia5)?:new Equivalencia(materiaPrincipal:materia25,materiaEquivalente:materia5).save(failOnError:true)
		def equivalencia6a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia6,materia26)?:new Equivalencia(materiaPrincipal:materia6,materiaEquivalente:materia26).save(failOnError:true)
		def equivalencia6b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia26,materia6)?:new Equivalencia(materiaPrincipal:materia26,materiaEquivalente:materia6).save(failOnError:true)
		def equivalencia7a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia7,materia27)?:new Equivalencia(materiaPrincipal:materia7,materiaEquivalente:materia27).save(failOnError:true)
		def equivalencia7b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia27,materia7)?:new Equivalencia(materiaPrincipal:materia27,materiaEquivalente:materia7).save(failOnError:true)
		def equivalencia8a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia8,materia28)?:new Equivalencia(materiaPrincipal:materia8,materiaEquivalente:materia28).save(failOnError:true)
		def equivalencia8b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia28,materia8)?:new Equivalencia(materiaPrincipal:materia28,materiaEquivalente:materia8).save(failOnError:true)
		def equivalencia11a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia11,materia31)?:new Equivalencia(materiaPrincipal:materia11,materiaEquivalente:materia31).save(failOnError:true)
		def equivalencia11b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia31,materia11)?:new Equivalencia(materiaPrincipal:materia31,materiaEquivalente:materia11).save(failOnError:true)
		def equivalencia12a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia12,materia32)?:new Equivalencia(materiaPrincipal:materia12,materiaEquivalente:materia32).save(failOnError:true)
		def equivalencia12b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia32,materia12)?:new Equivalencia(materiaPrincipal:materia32,materiaEquivalente:materia12).save(failOnError:true)
		def equivalencia13a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia13,materia33)?:new Equivalencia(materiaPrincipal:materia13,materiaEquivalente:materia33).save(failOnError:true)
		def equivalencia13b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia33,materia13)?:new Equivalencia(materiaPrincipal:materia33,materiaEquivalente:materia13).save(failOnError:true)
		def equivalencia14a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia14,materia34)?:new Equivalencia(materiaPrincipal:materia14,materiaEquivalente:materia34).save(failOnError:true)
		def equivalencia14b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia34,materia14)?:new Equivalencia(materiaPrincipal:materia34,materiaEquivalente:materia14).save(failOnError:true)
		def equivalencia15a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia15,materia35)?:new Equivalencia(materiaPrincipal:materia15,materiaEquivalente:materia35).save(failOnError:true)
		def equivalencia15b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia35,materia15)?:new Equivalencia(materiaPrincipal:materia35,materiaEquivalente:materia15).save(failOnError:true)
		def equivalencia16a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia16,materia36)?:new Equivalencia(materiaPrincipal:materia16,materiaEquivalente:materia36).save(failOnError:true)
		def equivalencia16b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia36,materia16)?:new Equivalencia(materiaPrincipal:materia36,materiaEquivalente:materia16).save(failOnError:true)
		def equivalencia17a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia17,materia37)?:new Equivalencia(materiaPrincipal:materia17,materiaEquivalente:materia37).save(failOnError:true)
		def equivalencia17b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia37,materia17)?:new Equivalencia(materiaPrincipal:materia37,materiaEquivalente:materia17).save(failOnError:true)
		def equivalencia18a = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia18,materia38)?:new Equivalencia(materiaPrincipal:materia18,materiaEquivalente:materia38).save(failOnError:true)
		def equivalencia18b= Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia38,materia18)?:new Equivalencia(materiaPrincipal:materia38,materiaEquivalente:materia18).save(failOnError:true)
		//unidireccionales
		def equivalencia1c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia1,materia31)?:new Equivalencia(materiaPrincipal:materia1,materiaEquivalente:materia31).save(failOnError:true)
		def equivalencia1d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia1,materia11)?:new Equivalencia(materiaPrincipal:materia1,materiaEquivalente:materia11).save(failOnError:true)
		def equivalencia2c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia2,materia32)?:new Equivalencia(materiaPrincipal:materia2,materiaEquivalente:materia32).save(failOnError:true)
		def equivalencia2d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia2,materia12)?:new Equivalencia(materiaPrincipal:materia2,materiaEquivalente:materia12).save(failOnError:true)
		def equivalencia3c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia3,materia33)?:new Equivalencia(materiaPrincipal:materia3,materiaEquivalente:materia33).save(failOnError:true)
		def equivalencia3d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia3,materia13)?:new Equivalencia(materiaPrincipal:materia3,materiaEquivalente:materia13).save(failOnError:true)
		def equivalencia4c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia4,materia34)?:new Equivalencia(materiaPrincipal:materia4,materiaEquivalente:materia34).save(failOnError:true)
		def equivalencia4d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia4,materia14)?:new Equivalencia(materiaPrincipal:materia4,materiaEquivalente:materia14).save(failOnError:true)
		def equivalencia5c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia5,materia35)?:new Equivalencia(materiaPrincipal:materia5,materiaEquivalente:materia35).save(failOnError:true)
		def equivalencia5d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia5,materia15)?:new Equivalencia(materiaPrincipal:materia5,materiaEquivalente:materia15).save(failOnError:true)
		def equivalencia6c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia6,materia36)?:new Equivalencia(materiaPrincipal:materia6,materiaEquivalente:materia36).save(failOnError:true)
		def equivalencia6d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia6,materia16)?:new Equivalencia(materiaPrincipal:materia6,materiaEquivalente:materia16).save(failOnError:true)
		def equivalencia7c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia7,materia37)?:new Equivalencia(materiaPrincipal:materia7,materiaEquivalente:materia37).save(failOnError:true)
		def equivalencia7d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia7,materia17)?:new Equivalencia(materiaPrincipal:materia7,materiaEquivalente:materia17).save(failOnError:true)
		def equivalencia8c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia8,materia38)?:new Equivalencia(materiaPrincipal:materia8,materiaEquivalente:materia38).save(failOnError:true)
		def equivalencia8d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia8,materia18)?:new Equivalencia(materiaPrincipal:materia8,materiaEquivalente:materia18).save(failOnError:true)
		def equivalencia11c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia21,materia31)?:new Equivalencia(materiaPrincipal:materia21,materiaEquivalente:materia31).save(failOnError:true)
		def equivalencia11d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia21,materia11)?:new Equivalencia(materiaPrincipal:materia21,materiaEquivalente:materia11).save(failOnError:true)
		def equivalencia12c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia22,materia32)?:new Equivalencia(materiaPrincipal:materia22,materiaEquivalente:materia32).save(failOnError:true)
		def equivalencia12d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia22,materia12)?:new Equivalencia(materiaPrincipal:materia22,materiaEquivalente:materia12).save(failOnError:true)
		def equivalencia13c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia23,materia33)?:new Equivalencia(materiaPrincipal:materia23,materiaEquivalente:materia33).save(failOnError:true)
		def equivalencia13d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia23,materia13)?:new Equivalencia(materiaPrincipal:materia23,materiaEquivalente:materia13).save(failOnError:true)
		def equivalencia14c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia24,materia34)?:new Equivalencia(materiaPrincipal:materia24,materiaEquivalente:materia34).save(failOnError:true)
		def equivalencia14d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia24,materia14)?:new Equivalencia(materiaPrincipal:materia24,materiaEquivalente:materia14).save(failOnError:true)
		def equivalencia15c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia25,materia35)?:new Equivalencia(materiaPrincipal:materia25,materiaEquivalente:materia35).save(failOnError:true)
		def equivalencia15d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia25,materia15)?:new Equivalencia(materiaPrincipal:materia25,materiaEquivalente:materia15).save(failOnError:true)
		def equivalencia16c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia26,materia36)?:new Equivalencia(materiaPrincipal:materia26,materiaEquivalente:materia36).save(failOnError:true)
		def equivalencia16d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia26,materia16)?:new Equivalencia(materiaPrincipal:materia26,materiaEquivalente:materia16).save(failOnError:true)
		def equivalencia17c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia27,materia37)?:new Equivalencia(materiaPrincipal:materia27,materiaEquivalente:materia37).save(failOnError:true)
		def equivalencia17d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia27,materia17)?:new Equivalencia(materiaPrincipal:materia27,materiaEquivalente:materia17).save(failOnError:true)
		def equivalencia18c = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia28,materia38)?:new Equivalencia(materiaPrincipal:materia28,materiaEquivalente:materia38).save(failOnError:true)
		def equivalencia18d = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(materia28,materia18)?:new Equivalencia(materiaPrincipal:materia28,materiaEquivalente:materia18).save(failOnError:true)



		//Departamentos solo para Test

		def telefonoDepartamentoIngenieria= Telefono.findByNumero('01144444444')?: new Telefono(numero: '01144444444', tipoTelefono:TipoTelefono.TRABAJO)
		def DomicilioDepartamentoIngenieria = new Domicilio(calle: 'Direccion de la unlam', numero: 556, codigoPostal: 1704,localidad: 'San Justo', observaciones: 'De la entrada principal a la izquierda.')
		def contactoDepartamentoIngenieria = new Contacto(domicilio: DomicilioDepartamentoIngenieria)
		contactoDepartamentoIngenieria.telefonos = []
		contactoDepartamentoIngenieria.telefonos.add(telefonoDepartamentoIngenieria)
		


		def telefonoInstitucion= Telefono.findByNumero('01155555555')?: new Telefono(numero: '01155555555', tipoTelefono:TipoTelefono.TRABAJO)
		def DomicilioInstitucion = new Domicilio(calle: 'Direccion de la unlam', numero: 556, codigoPostal: 1704,localidad: 'San Justo', observaciones: '')
		def contactoInstitucion= new Contacto(domicilio: DomicilioInstitucion)
		contactoInstitucion.telefonos = []
		contactoInstitucion.telefonos.add(telefonoInstitucion)
		contactoInstitucion.save(failOnError:true)

		def carreras = []
		carreras.add(carrera1)
		carreras.add(carrera2)
		
		
		
		def autoridades = []
		autoridades.add(autoridad1)
		autoridades.add(autoridad2)
		
				
		def institucionEducativaUnica = InstitucionEducativa.findByNombre('UNLAM')?: new InstitucionEducativa(contacto: contactoInstitucion, nombre: 'UNLAM').save(failOnError:true)
		def departamentoIngenieria = Departamento.findByNombre('Ingenieria')?: new Departamento(nombre: 'Ingenieria', mision: 'La mision de nuestro departamento es...', vision: 'La visión de nuestro departamenteo es...', contacto: contactoDepartamentoIngenieria, carreras:carreras, autoridades:autoridades, institucionEducativa:institucionEducativaUnica).save(failOnError:true)
		
		//Docentes only for Test
		def docente1 = Docente.findByUsuario(docenteUser1) ?: new Docente(apellido:'Fernandez',nombre: 'Juan', usuario: docenteUser1, documento: documentoDNIdocente1, contacto: contactoDocente1, departamento: departamentoIngenieria).save(failOnError:true)
		def docente2 = Docente.findByUsuario(docenteUser2) ?: new Docente(apellido:'Gonzalez',nombre: 'Matias', usuario: docenteUser2, documento: documentoDNIdocente2, contacto: contactoDocente2, departamento: departamentoIngenieria).save(failOnError:true)
		def docente3 = Docente.findByUsuario(docenteUser3) ?: new Docente(apellido:'Rodriguez',nombre: 'Karina', usuario: docenteUser3, documento: documentoDNIdocente3, contacto: contactoDocente3, departamento: departamentoIngenieria).save(failOnError:true)
		def docente4 = Docente.findByUsuario(docenteUser4) ?: new Docente(apellido:'Iglesias',nombre: 'Maria Fernanda', usuario: docenteUser4, documento: documentoDNIdocente4, contacto: contactoDocente4, departamento: departamentoIngenieria).save(failOnError:true)
		def docente5 = Docente.findByUsuario(docenteUser5) ?: new Docente(apellido:'Martinez',nombre: 'Sergio', usuario: docenteUser5, documento: documentoDNIdocente5, contacto: contactoDocente5, departamento: departamentoIngenieria).save(failOnError:true)
		def docente6 = Docente.findByUsuario(docenteUser6) ?: new Docente(apellido:'Perez',nombre: 'Carlos', usuario: docenteUser6, documento: documentoDNIdocente6, contacto: contactoDocente6, departamento: departamentoIngenieria).save(failOnError:true)
		def docente7 = Docente.findByUsuario(docenteUser7) ?: new Docente(apellido:'Gonzalez',nombre: 'Monica', usuario: docenteUser7, documento: documentoDNIdocente7, contacto: contactoDocente7, departamento: departamentoIngenieria).save(failOnError:true)
		def docente8 = Docente.findByUsuario(docenteUser8) ?: new Docente(apellido:'Cano',nombre: 'Sergio', usuario: docenteUser8, documento: documentoDNIdocente8, contacto: contactoDocente8, departamento: departamentoIngenieria).save(failOnError:true)
		def docente9 = Docente.findByUsuario(docenteUser9) ?: new Docente(apellido:'Barbosa',nombre: 'Gerardo', usuario: docenteUser9, documento: documentoDNIdocente9, contacto: contactoDocente9, departamento: departamentoIngenieria).save(failOnError:true)
		def docente10 = Docente.findByUsuario(docenteUser10) ?: new Docente(apellido:'Fernandez',nombre: 'Lito', usuario: docenteUser10, documento: documentoDNIdocente10, contacto: contactoDocente10, departamento: departamentoIngenieria).save(failOnError:true)
		def docente11 = Docente.findByUsuario(docenteUser11) ?: new Docente(apellido:'Garcia',nombre: 'Lucas', usuario: docenteUser11, documento: documentoDNIdocente11, contacto: contactoDocente11, departamento: departamentoIngenieria).save(failOnError:true)
		def docente12 = Docente.findByUsuario(docenteUser12) ?: new Docente(apellido:'Rusti',nombre: 'Ale', usuario: docenteUser12, documento: documentoDNIdocente12, contacto: contactoDocente12, departamento: departamentoIngenieria).save(failOnError:true)




		int numeroInicial = 101
		int cantidadCrear = 80
		def espacioFisicoAux
		def nroPabellon = 1
		def ubicacion
		for(int i = numeroInicial; i<=numeroInicial+cantidadCrear;i++){
			ubicacion = "Pabellon Nro "+nroPabellon
			espacioFisicoAux = EspacioFisico.findByNumero(i) ?: new EspacioFisico(numero: i, ubicacion: ubicacion).save(failOnError:true)
			if(i%10==0){
				nroPabellon = nroPabellon + 2
			}

		}

		Date fechaInicioCiclo1 = Date.parse("dd/MM/yyyy", "01/04/2013")
		Date fechaFinCiclo1 = Date.parse("dd/MM/yyyy", "21/12/2013")
		def cicloLectivo1 = CicloLectivo.findByCodigo('CICLO LECTIVO 2013') ?: new CicloLectivo(codigo:'CICLO LECTIVO 2013', fechaInicio: fechaInicioCiclo1, fechaFin: fechaFinCiclo1).save(failOnError:true)
		Date fechaInicioCiclo2 = Date.parse("dd/MM/yyyy", "01/04/2012")
		Date fechaFinCiclo2 = Date.parse("dd/MM/yyyy", "21/12/2012")
		def cicloLectivo2 = CicloLectivo.findByCodigo('CICLO LECTIVO 2012') ?: new CicloLectivo(codigo:'CICLO LECTIVO 2012', fechaInicio: fechaInicioCiclo2, fechaFin: fechaFinCiclo2).save(failOnError:true)

		Date fechaInicioPeriodo1 = Date.parse("dd/MM/yyyy", "01/04/2013")
		Date fechaFinPeriodo1 = Date.parse("dd/MM/yyyy", "26/07/2013")
		Date fechaInicioPeriodo2 = Date.parse("dd/MM/yyyy", "26/08/2013")
		Date fechaFinPeriodo2 = Date.parse("dd/MM/yyyy", "21/12/2013")

		Date fechaInicioPeriodo3 = Date.parse("dd/MM/yyyy", "01/04/2012")
		Date fechaFinPeriodo3 = Date.parse("dd/MM/yyyy", "26/07/2012")
		Date fechaInicioPeriodo4 = Date.parse("dd/MM/yyyy", "26/08/2012")
		Date fechaFinPeriodo4 = Date.parse("dd/MM/yyyy", "21/12/2012")


		def periodoAcademico1 = PeriodoAcademico.findByTipoPeriodoAcademicoAndCicloLectivo(TipoPeriodoAcademico.PRIMER_CUATRIMESTRE, cicloLectivo1)?: new PeriodoAcademico(tipoPeriodoAcademico:TipoPeriodoAcademico.PRIMER_CUATRIMESTRE, cicloLectivo:cicloLectivo1, cantidadSemanas:12, fechaInicioPeriodo: fechaInicioPeriodo1, fechaFinPeriodo: fechaFinPeriodo1).save(failOnError:true)
		def periodoAcademico2 = PeriodoAcademico.findByTipoPeriodoAcademicoAndCicloLectivo(TipoPeriodoAcademico.SEGUNDO_CUATRIMESTRE, cicloLectivo1)?: new PeriodoAcademico(tipoPeriodoAcademico:TipoPeriodoAcademico.SEGUNDO_CUATRIMESTRE, cicloLectivo:cicloLectivo1, cantidadSemanas:12, fechaInicioPeriodo: fechaInicioPeriodo2, fechaFinPeriodo: fechaFinPeriodo2).save(failOnError:true)
		def periodoAcademico3 = PeriodoAcademico.findByTipoPeriodoAcademicoAndCicloLectivo(TipoPeriodoAcademico.PRIMER_CUATRIMESTRE, cicloLectivo2)?: new PeriodoAcademico(tipoPeriodoAcademico:TipoPeriodoAcademico.PRIMER_CUATRIMESTRE, cicloLectivo:cicloLectivo2, cantidadSemanas:12, fechaInicioPeriodo: fechaInicioPeriodo3, fechaFinPeriodo: fechaFinPeriodo3).save(failOnError:true)
		def periodoAcademico4 = PeriodoAcademico.findByTipoPeriodoAcademicoAndCicloLectivo(TipoPeriodoAcademico.SEGUNDO_CUATRIMESTRE, cicloLectivo2)?: new PeriodoAcademico(tipoPeriodoAcademico:TipoPeriodoAcademico.SEGUNDO_CUATRIMESTRE, cicloLectivo:cicloLectivo2, cantidadSemanas:12, fechaInicioPeriodo: fechaInicioPeriodo4, fechaFinPeriodo: fechaFinPeriodo4).save(failOnError:true)

		def cronogramaCarrera1 = CronogramaCarrera.findByPlanEstudioAndCicloLectivo(planEstudio1,cicloLectivo1)?: new CronogramaCarrera(planEstudio:planEstudio1,cicloLectivo:cicloLectivo1).save(failOnError:true)
		def cronogramaCarrera2 = CronogramaCarrera.findByPlanEstudioAndCicloLectivo(planEstudio2,cicloLectivo1)?: new CronogramaCarrera(planEstudio:planEstudio2,cicloLectivo:cicloLectivo1).save(failOnError:true)
		def cronogramaCarrera3 = CronogramaCarrera.findByPlanEstudioAndCicloLectivo(planEstudio3,cicloLectivo1)?: new CronogramaCarrera(planEstudio:planEstudio3,cicloLectivo:cicloLectivo1).save(failOnError:true)
		def cronogramaCarrera4 = CronogramaCarrera.findByPlanEstudioAndCicloLectivo(planEstudio4,cicloLectivo1)?: new CronogramaCarrera(planEstudio:planEstudio4,cicloLectivo:cicloLectivo1).save(failOnError:true)

		def cronogramaAnioPasado = CronogramaCarrera.findByCicloLectivoAndPlanEstudio(cicloLectivo2, planEstudio1)?: new CronogramaCarrera(cicloLectivo: cicloLectivo2, planEstudio:planEstudio1).save(failOnError:true)

		//Cursos 2012 Cuatrimestre 1 Turno Noche
		def curso1 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N101', cronogramaAnioPasado, materia1, turnoNoche)?:new Curso(codigo:'2012C1N101', cronogramaCarrera:cronogramaAnioPasado, materia:materia1, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso2 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N102', cronogramaAnioPasado, materia2, turnoNoche)?:new Curso(codigo:'2012C1N102', cronogramaCarrera:cronogramaAnioPasado, materia:materia2, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso3 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N103', cronogramaAnioPasado, materia3, turnoNoche)?:new Curso(codigo:'2012C1N103', cronogramaCarrera:cronogramaAnioPasado, materia:materia3, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso4 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N104', cronogramaAnioPasado, materia4, turnoNoche)?:new Curso(codigo:'2012C1N104', cronogramaCarrera:cronogramaAnioPasado, materia:materia4, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso5 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N105', cronogramaAnioPasado, materia5, turnoNoche)?:new Curso(codigo:'2012C1N105', cronogramaCarrera:cronogramaAnioPasado, materia:materia5, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso6 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N106', cronogramaAnioPasado, materia6, turnoNoche)?:new Curso(codigo:'2012C1N106', cronogramaCarrera:cronogramaAnioPasado, materia:materia6, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso7 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N107', cronogramaAnioPasado, materia7, turnoNoche)?:new Curso(codigo:'2012C1N107', cronogramaCarrera:cronogramaAnioPasado, materia:materia7, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso8 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1N108', cronogramaAnioPasado, materia8, turnoNoche)?:new Curso(codigo:'2012C1N108', cronogramaCarrera:cronogramaAnioPasado, materia:materia8, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)

		//Cursos 2012 Cuatrimestre 2 Turno Noche
		def curso9 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N101', cronogramaAnioPasado, materia1, turnoNoche)?:new Curso(codigo:'2012C2N101', cronogramaCarrera:cronogramaAnioPasado, materia:materia1, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso10 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N102', cronogramaAnioPasado, materia2, turnoNoche)?:new Curso(codigo:'2012C2N102', cronogramaCarrera:cronogramaAnioPasado, materia:materia2, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso11 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N103', cronogramaAnioPasado, materia3, turnoNoche)?:new Curso(codigo:'2012C2N103', cronogramaCarrera:cronogramaAnioPasado, materia:materia3, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso12 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N104', cronogramaAnioPasado, materia4, turnoNoche)?:new Curso(codigo:'2012C2N104', cronogramaCarrera:cronogramaAnioPasado, materia:materia4, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso13 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N105', cronogramaAnioPasado, materia5, turnoNoche)?:new Curso(codigo:'2012C2N105', cronogramaCarrera:cronogramaAnioPasado, materia:materia5, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso14 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N106', cronogramaAnioPasado, materia6, turnoNoche)?:new Curso(codigo:'2012C2N106', cronogramaCarrera:cronogramaAnioPasado, materia:materia6, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso15 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N107', cronogramaAnioPasado, materia7, turnoNoche)?:new Curso(codigo:'2012C2N107', cronogramaCarrera:cronogramaAnioPasado, materia:materia7, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso16 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2N108', cronogramaAnioPasado, materia8, turnoNoche)?:new Curso(codigo:'2012C2N108', cronogramaCarrera:cronogramaAnioPasado, materia:materia8, turno:turnoNoche, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)

		//Cursos 2012 Cuatrimestre 1 Turno Mañana
		def curso17 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M101', cronogramaAnioPasado, materia1, turnoManiana)?:new Curso(codigo:'2012C1M101', cronogramaCarrera:cronogramaAnioPasado, materia:materia1, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso18 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M102', cronogramaAnioPasado, materia2, turnoManiana)?:new Curso(codigo:'2012C1M102', cronogramaCarrera:cronogramaAnioPasado, materia:materia2, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso19 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M103', cronogramaAnioPasado, materia3, turnoManiana)?:new Curso(codigo:'2012C1M103', cronogramaCarrera:cronogramaAnioPasado, materia:materia3, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso20 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M104', cronogramaAnioPasado, materia4, turnoManiana)?:new Curso(codigo:'2012C1M104', cronogramaCarrera:cronogramaAnioPasado, materia:materia4, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso21 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M105', cronogramaAnioPasado, materia5, turnoManiana)?:new Curso(codigo:'2012C1M105', cronogramaCarrera:cronogramaAnioPasado, materia:materia5, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso22 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M106', cronogramaAnioPasado, materia6, turnoManiana)?:new Curso(codigo:'2012C1M106', cronogramaCarrera:cronogramaAnioPasado, materia:materia6, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso23 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M107', cronogramaAnioPasado, materia7, turnoManiana)?:new Curso(codigo:'2012C1M107', cronogramaCarrera:cronogramaAnioPasado, materia:materia7, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)
		def curso24 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C1M108', cronogramaAnioPasado, materia8, turnoManiana)?:new Curso(codigo:'2012C1M108', cronogramaCarrera:cronogramaAnioPasado, materia:materia8, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico3).save(failOnError:true)

		//Cursos 2012 Cuatrimestre 2 Turno Mañana
		def curso25 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M101', cronogramaAnioPasado, materia1, turnoManiana)?:new Curso(codigo:'2012C2M101', cronogramaCarrera:cronogramaAnioPasado, materia:materia1, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso26 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M102', cronogramaAnioPasado, materia2, turnoManiana)?:new Curso(codigo:'2012C2M102', cronogramaCarrera:cronogramaAnioPasado, materia:materia2, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso27 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M103', cronogramaAnioPasado, materia3, turnoManiana)?:new Curso(codigo:'2012C2M103', cronogramaCarrera:cronogramaAnioPasado, materia:materia3, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso28 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M104', cronogramaAnioPasado, materia4, turnoManiana)?:new Curso(codigo:'2012C2M104', cronogramaCarrera:cronogramaAnioPasado, materia:materia4, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso29 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M105', cronogramaAnioPasado, materia5, turnoManiana)?:new Curso(codigo:'2012C2M105', cronogramaCarrera:cronogramaAnioPasado, materia:materia5, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso30 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M106', cronogramaAnioPasado, materia6, turnoManiana)?:new Curso(codigo:'2012C2M106', cronogramaCarrera:cronogramaAnioPasado, materia:materia6, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso31 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M107', cronogramaAnioPasado, materia7, turnoManiana)?:new Curso(codigo:'2012C2M107', cronogramaCarrera:cronogramaAnioPasado, materia:materia7, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)
		def curso32 = Curso.findByCodigoAndCronogramaCarreraAndMateriaAndTurno('2012C2M108', cronogramaAnioPasado, materia8, turnoManiana)?:new Curso(codigo:'2012C2M108', cronogramaCarrera:cronogramaAnioPasado, materia:materia8, turno:turnoManiana, estadoCurso:EstadoCurso.CERRADO, periodoAcademico:periodoAcademico4).save(failOnError:true)

		//Solo para Test

		//Configuraciones Curso Dia Primer Cuatrimestre 2012 Turno Noche
		initCursosDia2012TurnoNocheCuatrimestre1(docente1, docente2, curso1, docente3, docente4, curso2, docente5, docente6, curso3, docente7, curso4, curso5, curso6, curso7, docente9, docente10, docente11, curso8)

		//Configuraciones CursoDia Primer Cuatrimestre Turno Mañana
		initCursosDia2012TurnoManianaCuatrimestre1(docente1, docente2, curso17, docente3, docente4, curso18, docente5, docente6, curso19, docente7, curso20, curso21, docente12, docente11, curso22, curso23, docente9, docente10, curso24)

		//Configuraciones Curso Dia Segundo Cuatrimestre 2012 Turno Noche
		initCursosDia2012TurnoNocheCuatrimestre2(docente1, docente2, curso9, docente3, docente4, curso10, docente5, docente6, docente7, curso11, curso12, curso13, curso14, docente9, docente10, docente11, curso15, curso16)

		//Configuraciones CursoDia Segundo Cuatrimestre Turno Mañana
		initCursosDia2012TurnoManianaCuatrimestre2(docente1, docente2, curso25, docente3, docente4, curso26, docente5, docente6, curso27, docente7, curso28, curso29, docente12, docente11, curso30, curso31, docente9, docente10, curso32)
		
	}

	private initCursosDia2012TurnoManianaCuatrimestre2(Docente docente1, Docente docente2, def curso25, Docente docente3, Docente docente4, def curso26, Docente docente5, Docente docente6, def curso27, Docente docente7, def curso28, def curso29, Docente docente12, Docente docente11, def curso30, def curso31, Docente docente9, Docente docente10, def curso32) {
		//Caso de 1 Dia de cursada con 2 docentes al 100
		if(!curso25?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(500) ?: new EspacioFisico(numero:500, ubicacion: 'PABELLON 1').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente1, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso25, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso25.configuracionesCursoDia = configuracionesCursoDia1
			curso25 = curso25.save()

		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso26?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(501) ?: new EspacioFisico(numero:501, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(502) ?: new EspacioFisico(numero:502, ubicacion: 'LABORATORIO 3').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MARTES, espacioFisico:espacioFisico1, curso:curso26, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.JUEVES, espacioFisico:espacioFisico2, curso:curso26, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso26.configuracionesCursoDia = configuracionesCursoDia1
			curso26 = curso26.save()
		}

		//caso del 1 solo dia 2 Docentes al 50% es decir, 2 hs cada docente
		if(!curso27?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(503) ?: new EspacioFisico(numero:503, ubicacion: 'PABELLON 2').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente5, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico1, curso:curso27, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso27.configuracionesCursoDia = configuracionesCursoDia1
			curso27 = curso27.save()

		}

		//caso del 1 solo dia 2 Docentes al 50% y uno al 100 es decir, 2 hs cada docente salvo 1 que se queda todo el dia
		if(!curso28?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(504) ?: new EspacioFisico(numero:504, ubicacion: 'LABOTARORIO WEB').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.VIERNES, espacioFisico:espacioFisico1, curso:curso28, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso3)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso28.configuracionesCursoDia = configuracionesCursoDia1
			curso28 = curso28.save()
		}

		//Materia BDD 2 Ocupando mismo dia que BDD1 pero diferentes docentes/espacios Fisicos
		if(!curso29?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(505) ?: new EspacioFisico(numero:505, ubicacion: 'AULA MAGNA').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso29, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso29.configuracionesCursoDia = configuracionesCursoDia1
			curso29 = curso29.save()
		}

		//Curso de los sabados
		if(!curso30?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(506) ?: new EspacioFisico(numero:506, ubicacion: 'PABELLON 3').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente12, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente11, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.SABADO, espacioFisico:espacioFisico1, curso:curso30, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso30.configuracionesCursoDia = configuracionesCursoDia1
			curso30 = curso30.save()
		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso31?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(507) ?: new EspacioFisico(numero:507, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(508) ?: new EspacioFisico(numero:508, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso31, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso31, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso31.configuracionesCursoDia = configuracionesCursoDia1
			curso31 = curso31.save()
		}


		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso32?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(521) ?: new EspacioFisico(numero:521, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(522) ?: new EspacioFisico(numero:522, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente9, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente10, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente11, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso32, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso32, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso32.configuracionesCursoDia = configuracionesCursoDia1
			curso32 = curso32.save()
		}
	}

	private initCursosDia2012TurnoNocheCuatrimestre2(Docente docente1, Docente docente2, def curso9, Docente docente3, Docente docente4, def curso10, Docente docente5, Docente docente6, Docente docente7, def curso11, def curso12, def curso13, def curso14, Docente docente9, Docente docente10, Docente docente11, def curso15, def curso16) {		
		//Caso de 1 Dia de cursada con 2 docentes al 100
		if(!curso9?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(601) ?: new EspacioFisico(numero:601, ubicacion: 'PABELLON 1').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente1, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso9, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso9.configuracionesCursoDia = configuracionesCursoDia1
			curso9 = curso9.save()

		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso10?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(607) ?: new EspacioFisico(numero:607, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(603) ?: new EspacioFisico(numero:603, ubicacion: 'LABORATORIO 3').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MARTES, espacioFisico:espacioFisico1, curso:curso10, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.JUEVES, espacioFisico:espacioFisico2, curso:curso10, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso10.configuracionesCursoDia = configuracionesCursoDia1
			curso10 = curso10.save()
		}

		//caso del 1 solo dia 2 Docentes al 50% es decir, 2 hs cada docente
		if(!curso11?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(602) ?: new EspacioFisico(numero:602, ubicacion: 'PABELLON 2').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente5, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico1, curso:curso11, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso11.configuracionesCursoDia = configuracionesCursoDia1
			curso11 = curso11.save()

		}

		//caso del 1 solo dia 2 Docentes al 50% y uno al 100 es decir, 2 hs cada docente salvo 1 que se queda todo el dia
		if(!curso12?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(605) ?: new EspacioFisico(numero:605, ubicacion: 'LABOTARORIO WEB').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.VIERNES, espacioFisico:espacioFisico1, curso:curso12, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso3)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso12.configuracionesCursoDia = configuracionesCursoDia1
			curso12 = curso12.save()
		}

		//Materia BDD 2 Ocupando mismo dia que BDD1 pero diferentes docentes/espacios Fisicos
		if(!curso13?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(617) ?: new EspacioFisico(numero:617, ubicacion: 'AULA MAGNA').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso13, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso13.configuracionesCursoDia = configuracionesCursoDia1
			curso13 = curso13.save()
		}

		//Curso de los sabados
		if(!curso14?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(618) ?: new EspacioFisico(numero:618, ubicacion: 'PABELLON 3').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente1, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.SABADO, espacioFisico:espacioFisico1, curso:curso14, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso14.configuracionesCursoDia = configuracionesCursoDia1
			curso14 = curso14.save()
		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso15?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(619) ?: new EspacioFisico(numero:619, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(620) ?: new EspacioFisico(numero:620, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso15, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso15, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso15.configuracionesCursoDia = configuracionesCursoDia1
			curso15 = curso15.save()
		}


		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso16?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(625) ?: new EspacioFisico(numero:625, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(621) ?: new EspacioFisico(numero:621, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente9, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente10, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente11, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso16, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso16, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso16.configuracionesCursoDia = configuracionesCursoDia1
			curso16 = curso16.save()
		}
	}

	private initCursosDia2012TurnoManianaCuatrimestre1(Docente docente1, Docente docente2, def curso17, Docente docente3, Docente docente4, def curso18, Docente docente5, Docente docente6, def curso19, Docente docente7, def curso20, def curso21, Docente docente12, Docente docente11, def curso22, def curso23, Docente docente9, Docente docente10, def curso24) {
		//Caso de 1 Dia de cursada con 2 docentes al 100
		if(!curso17?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(700) ?: new EspacioFisico(numero:700, ubicacion: 'PABELLON 1').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente1, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso17, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso17.configuracionesCursoDia = configuracionesCursoDia1
			curso17 = curso17.save()

		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso18?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(701) ?: new EspacioFisico(numero:701, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(702) ?: new EspacioFisico(numero:702, ubicacion: 'LABORATORIO 3').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MARTES, espacioFisico:espacioFisico1, curso:curso18, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.JUEVES, espacioFisico:espacioFisico2, curso:curso18, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso18.configuracionesCursoDia = configuracionesCursoDia1
			curso18 = curso18.save()
		}

		//caso del 1 solo dia 2 Docentes al 50% es decir, 2 hs cada docente
		if(!curso19?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(703) ?: new EspacioFisico(numero:703, ubicacion: 'PABELLON 2').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente5, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico1, curso:curso19, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso19.configuracionesCursoDia = configuracionesCursoDia1
			curso19 = curso19.save()

		}

		//caso del 1 solo dia 2 Docentes al 50% y uno al 100 es decir, 2 hs cada docente salvo 1 que se queda todo el dia
		if(!curso20?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(704) ?: new EspacioFisico(numero:704, ubicacion: 'LABOTARORIO WEB').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.VIERNES, espacioFisico:espacioFisico1, curso:curso20, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso3)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso20.configuracionesCursoDia = configuracionesCursoDia1
			curso20 = curso20.save()
		}

		//Materia BDD 2 Ocupando mismo dia que BDD1 pero diferentes docentes/espacios Fisicos
		if(!curso21?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(705) ?: new EspacioFisico(numero:705, ubicacion: 'AULA MAGNA').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso21, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso21.configuracionesCursoDia = configuracionesCursoDia1
			curso21 = curso21.save()
		}

		//Curso de los sabados
		if(!curso22?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(706) ?: new EspacioFisico(numero:706, ubicacion: 'PABELLON 3').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente12, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente11, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.SABADO, espacioFisico:espacioFisico1, curso:curso22, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso22.configuracionesCursoDia = configuracionesCursoDia1
			curso22 = curso22.save()
		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso23?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(707) ?: new EspacioFisico(numero:707, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(708) ?: new EspacioFisico(numero:708, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso23, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso23, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso23.configuracionesCursoDia = configuracionesCursoDia1
			curso23 = curso23.save()
		}


		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso24?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(721) ?: new EspacioFisico(numero:721, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(722) ?: new EspacioFisico(numero:722, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente9, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente10, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente11, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso24, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso24, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso24.configuracionesCursoDia = configuracionesCursoDia1
			curso24 = curso24.save()
		}
	}

	private initCursosDia2012TurnoNocheCuatrimestre1(Docente docente1, Docente docente2, def curso1, Docente docente3, Docente docente4, def curso2, Docente docente5, Docente docente6, def curso3, Docente docente7, def curso4, def curso5, def curso6, def curso7, Docente docente9, Docente docente10, Docente docente11, def curso8) {
		
		//Caso de 1 Dia de cursada con 2 docentes al 100		
		if(!curso1?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(901) ?: new EspacioFisico(numero:901, ubicacion: 'PABELLON 1').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente1, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso1, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso1.configuracionesCursoDia = configuracionesCursoDia1
			curso1 = curso1.save()

		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso2?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(907) ?: new EspacioFisico(numero:907, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(903) ?: new EspacioFisico(numero:903, ubicacion: 'LABORATORIO 3').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MARTES, espacioFisico:espacioFisico1, curso:curso2, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.JUEVES, espacioFisico:espacioFisico2, curso:curso2, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso2.configuracionesCursoDia = configuracionesCursoDia1
			curso2 = curso2.save()
		}

		//caso del 1 solo dia 2 Docentes al 50% es decir, 2 hs cada docente
		if(!curso3?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(902) ?: new EspacioFisico(numero:902, ubicacion: 'PABELLON 2').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente5, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico1, curso:curso3, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso3.configuracionesCursoDia = configuracionesCursoDia1
			curso3 = curso3.save()

		}

		//caso del 1 solo dia 2 Docentes al 50% y uno al 100 es decir, 2 hs cada docente salvo 1 que se queda todo el dia
		if(!curso4?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(905) ?: new EspacioFisico(numero:905, ubicacion: 'LABOTARORIO WEB').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente6, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.VIERNES, espacioFisico:espacioFisico1, curso:curso4, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia1
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso3)
			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso4.configuracionesCursoDia = configuracionesCursoDia1
			curso4 = curso4.save()
		}

		//Materia BDD 2 Ocupando mismo dia que BDD1 pero diferentes docentes/espacios Fisicos
		if(!curso5?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(906) ?: new EspacioFisico(numero:906, ubicacion: 'AULA MAGNA').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente3, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente4, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso5, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso5.configuracionesCursoDia = configuracionesCursoDia1
			curso5 = curso5.save()
		}

		//Curso de los sabados
		if(!curso6?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(801) ?: new EspacioFisico(numero:801, ubicacion: 'PABELLON 3').save(failOnError:true)
			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente1, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.SABADO, espacioFisico:espacioFisico1, curso:curso6, horaInicio:8, horaFin:12, minutosInicio:0, minutosFin:0)
			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionesCursoDia1.add(configuracionCursoDia1)
			curso6.configuracionesCursoDia = configuracionesCursoDia1
			curso6 = curso6.save()
		}

		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso7?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(802) ?: new EspacioFisico(numero:802, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(803) ?: new EspacioFisico(numero:803, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente7, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente2, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso7, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso7, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso7.configuracionesCursoDia = configuracionesCursoDia1
			curso7 = curso7.save()
		}


		//Caso de Materia de 2 Dias 2 Espacios Fisicos Distintos y diferentes asignaciones en diferentes porcentajes por dia.
		if(!curso8?.configuracionesCursoDia){
			def configuracionesCursoDia1 = []
			def asignacionesDocenteCursoDia1 = []
			def asignacionesDocenteCursoDia2 = []
			EspacioFisico espacioFisico1 = EspacioFisico.findByNumero(804) ?: new EspacioFisico(numero:804, ubicacion: 'PABELLON 1').save(failOnError:true)
			EspacioFisico espacioFisico2 = EspacioFisico.findByNumero(805) ?: new EspacioFisico(numero:805, ubicacion: 'ZONA DE LABORATORIOS').save(failOnError:true)

			AsignacionDocenteCurso asignacionDocenteCurso1 = new AsignacionDocenteCurso(docente:docente9, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)
			AsignacionDocenteCurso asignacionDocenteCurso2 = new AsignacionDocenteCurso(docente:docente10, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_50)
			AsignacionDocenteCurso asignacionDocenteCurso3 = new AsignacionDocenteCurso(docente:docente11, tipoPorcentajeAsignacion:TipoPorcentajeAsignacion.ASIGNADO_AL_100)

			ConfiguracionCursoDia configuracionCursoDia1 = new ConfiguracionCursoDia(diaSemana: DiaSemana.LUNES, espacioFisico:espacioFisico1, curso:curso7, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)
			ConfiguracionCursoDia configuracionCursoDia2 = new ConfiguracionCursoDia(diaSemana: DiaSemana.MIERCOLES, espacioFisico:espacioFisico2, curso:curso7, horaInicio:19, horaFin:23, minutosInicio:0, minutosFin:0)

			asignacionDocenteCurso1.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso2.configuracionCursoDia = configuracionCursoDia1
			asignacionDocenteCurso3.configuracionCursoDia = configuracionCursoDia2

			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso1)
			asignacionesDocenteCursoDia1.add(asignacionDocenteCurso2)
			asignacionesDocenteCursoDia2.add(asignacionDocenteCurso3)

			configuracionCursoDia1.asignacionesDocenteCurso = asignacionesDocenteCursoDia1
			configuracionCursoDia2.asignacionesDocenteCurso = asignacionesDocenteCursoDia2

			configuracionCursoDia1 = configuracionCursoDia1.save(failOnError:true)
			configuracionCursoDia2 = configuracionCursoDia2.save(failOnError:true)

			configuracionesCursoDia1.add(configuracionCursoDia1)
			configuracionesCursoDia1.add(configuracionCursoDia2)

			curso8.configuracionesCursoDia = configuracionesCursoDia1
			curso8 = curso8.save()
		}
	}
	
	def destroy = {
	}
}
