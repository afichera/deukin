import com.deukin.Alumno
import com.deukin.AsignacionPeriodoMateria
import com.deukin.Carrera
import com.deukin.CicloLectivo
import com.deukin.Contacto
import com.deukin.Coordinador
import com.deukin.Departamento
import com.deukin.Docente
import com.deukin.Documento
import com.deukin.Domicilio
import com.deukin.EspacioFisico
import com.deukin.EstadoDeCreacion
import com.deukin.EstadoRecurso
import com.deukin.InstitucionEducativa
import com.deukin.Materia
import com.deukin.ModalidadAsistencia
import com.deukin.ObjetivoCarrera
import com.deukin.PeriodoDedicacion
import com.deukin.PlanEstudio
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
		
		

		def contactoAlumno1 = new Contacto(domicilio: DomicilioAlumno1)
		contactoAlumno1.telefonos = []
		contactoAlumno1.telefonos.add(telefono1Alumno1)
		contactoAlumno1.telefonos.add(telefono2Alumno1)

		def contactoAlumno2 = new Contacto(domicilio: DomicilioAlumno2)
		contactoAlumno2.telefonos = []
		contactoAlumno2.telefonos.add(telefono1Alumno2)
		contactoAlumno2.telefonos.add(telefono2Alumno2)

		def contactoCoordinador1 = new Contacto(domicilio: DomicilioCoordinador1)
		contactoCoordinador1.telefonos = []
		contactoCoordinador1.telefonos.add(telefono1Coordinador1)

		def contactoCoordinador2 = new Contacto(domicilio: DomicilioCoordinador2)
		contactoCoordinador2.telefonos = []
		contactoCoordinador2.telefonos.add(telefono1Coordinador2)

		def contactoCoordinador3 = new Contacto(domicilio: DomicilioCoordinador3)
		contactoCoordinador3.telefonos = []
		contactoCoordinador3.telefonos.add(telefono1Coordinador3)

		def contactoDocente1 = new Contacto(domicilio: domicilioDocente1)
		contactoDocente1.telefonos = []
		contactoDocente1.telefonos.add(telefono1Docente1)

		def contactoDocente2 = new Contacto(domicilio: domicilioDocente2)
		contactoDocente2.telefonos = []
		contactoDocente2.telefonos.add(telefono1Docente2)

		def contactoDocente3 = new Contacto(domicilio: domicilioDocente3)
		contactoDocente3.telefonos = []
		contactoDocente3.telefonos.add(telefono1Docente3)

		def contactoDocente4 = new Contacto(domicilio: domicilioDocente4)
		contactoDocente4.telefonos = []
		contactoDocente4.telefonos.add(telefono1Docente4)

		def contactoDocente5 = new Contacto(domicilio: domicilioDocente5)
		contactoDocente5.telefonos = []
		contactoDocente5.telefonos.add(telefono1Docente5)

		def contactoDocente6 = new Contacto(domicilio: domicilioDocente6)
		contactoDocente6.telefonos = []
		contactoDocente6.telefonos.add(telefono1Docente6)

		def contactoDocente7 = new Contacto(domicilio: domicilioDocente7)
		contactoDocente7.telefonos = []
		contactoDocente7.telefonos.add(telefono1Docente7)

		def contactoDocente8 = new Contacto(domicilio: domicilioDocente8)
		contactoDocente8.telefonos = []
		contactoDocente8.telefonos.add(telefono1Docente8)

		
		
		
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
		def materia1 = Materia.findByCodigo(101)?: new Materia(codigo:101, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio1).save(failOnError:true)
		def asignacion1 = AsignacionPeriodoMateria.findByMateria(materia1)?: new AsignacionPeriodoMateria(materia:materia1,periodo:periodoDedicacion1,planEstudio:planEstudio1).save(failOnError:true)
		def materia2 = Materia.findByCodigo(102)?: new Materia(codigo:102, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:30, cupoMaximoAlumnos:40, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion2 = AsignacionPeriodoMateria.findByMateria(materia2)?: new AsignacionPeriodoMateria(materia:materia2,periodo:periodoDedicacion1,planEstudio:planEstudio1).save(failOnError:true)
		def materia3 = Materia.findByCodigo(103)?: new Materia(codigo:103, nombre:'MATEMATICA', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion3 = AsignacionPeriodoMateria.findByMateria(materia3)?: new AsignacionPeriodoMateria(materia:materia3,periodo:periodoDedicacion1,planEstudio:planEstudio1).save(failOnError:true)
		def materia4 = Materia.findByCodigo(104)?: new Materia(codigo:104, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion4 = AsignacionPeriodoMateria.findByMateria(materia4)?: new AsignacionPeriodoMateria(materia:materia4,periodo:periodoDedicacion2,planEstudio:planEstudio1).save(failOnError:true)
		def materia5 = Materia.findByCodigo(105)?: new Materia(codigo:105, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion5 = AsignacionPeriodoMateria.findByMateria(materia5)?: new AsignacionPeriodoMateria(materia:materia5,periodo:periodoDedicacion2,planEstudio:planEstudio1).save(failOnError:true)
		def materia6 = Materia.findByCodigo(106)?: new Materia(codigo:106, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion6 = AsignacionPeriodoMateria.findByMateria(materia6)?: new AsignacionPeriodoMateria(materia:materia6,periodo:periodoDedicacion3,planEstudio:planEstudio1).save(failOnError:true)
		def materia7 = Materia.findByCodigo(107)?: new Materia(codigo:107, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion7 = AsignacionPeriodoMateria.findByMateria(materia7)?: new AsignacionPeriodoMateria(materia:materia7,periodo:periodoDedicacion3,planEstudio:planEstudio1).save(failOnError:true)
		def materia8 = Materia.findByCodigo(108)?: new Materia(codigo:108, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio1).save(failOnError:true)
		def asignacion8 = AsignacionPeriodoMateria.findByMateria(materia8)?: new AsignacionPeriodoMateria(materia:materia8,periodo:periodoDedicacion4,planEstudio:planEstudio1).save(failOnError:true)
		def materia11 = Materia.findByCodigo(201)?: new Materia(codigo:201, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:20, cupoMaximoAlumnos:32, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio3).save(failOnError:true)
		def asignacion11 = AsignacionPeriodoMateria.findByMateria(materia11)?: new AsignacionPeriodoMateria(materia:materia11,periodo:periodoDedicacion1,planEstudio:planEstudio3).save(failOnError:true)
		def materia12 = Materia.findByCodigo(202)?: new Materia(codigo:202, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:30, cupoMaximoAlumnos:20, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion12 = AsignacionPeriodoMateria.findByMateria(materia12)?: new AsignacionPeriodoMateria(materia:materia12,periodo:periodoDedicacion1,planEstudio:planEstudio3).save(failOnError:true)
		def materia13 = Materia.findByCodigo(203)?: new Materia(codigo:203, nombre:'MATEMATICA', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion13 = AsignacionPeriodoMateria.findByMateria(materia13)?: new AsignacionPeriodoMateria(materia:materia13,periodo:periodoDedicacion1,planEstudio:planEstudio3).save(failOnError:true)
		def materia14 = Materia.findByCodigo(204)?: new Materia(codigo:204, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:10, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion14 = AsignacionPeriodoMateria.findByMateria(materia14)?: new AsignacionPeriodoMateria(materia:materia14,periodo:periodoDedicacion2,planEstudio:planEstudio3).save(failOnError:true)
		def materia15 = Materia.findByCodigo(205)?: new Materia(codigo:205, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion15 = AsignacionPeriodoMateria.findByMateria(materia15)?: new AsignacionPeriodoMateria(materia:materia15,periodo:periodoDedicacion2,planEstudio:planEstudio3).save(failOnError:true)
		def materia16 = Materia.findByCodigo(206)?: new Materia(codigo:206, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion16 = AsignacionPeriodoMateria.findByMateria(materia16)?: new AsignacionPeriodoMateria(materia:materia16,periodo:periodoDedicacion3,planEstudio:planEstudio3).save(failOnError:true)
		def materia17 = Materia.findByCodigo(207)?: new Materia(codigo:207, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion17 = AsignacionPeriodoMateria.findByMateria(materia17)?: new AsignacionPeriodoMateria(materia:materia17,periodo:periodoDedicacion4,planEstudio:planEstudio3).save(failOnError:true)
		def materia18 = Materia.findByCodigo(208)?: new Materia(codigo:208, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio3).save(failOnError:true)
		def asignacion18 = AsignacionPeriodoMateria.findByMateria(materia18)?: new AsignacionPeriodoMateria(materia:materia18,periodo:periodoDedicacion4,planEstudio:planEstudio3).save(failOnError:true)

		def materia21 = Materia.findByCodigo(301)?: new Materia(codigo:301, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio2).save(failOnError:true)
		def asignacion21 = AsignacionPeriodoMateria.findByMateria(materia1)?: new AsignacionPeriodoMateria(materia:materia21,periodo:periodoDedicacion1,planEstudio:planEstudio2).save(failOnError:true)
		def materia22 = Materia.findByCodigo(302)?: new Materia(codigo:302, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:30, cupoMaximoAlumnos:40, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion22 = AsignacionPeriodoMateria.findByMateria(materia2)?: new AsignacionPeriodoMateria(materia:materia22,periodo:periodoDedicacion1,planEstudio:planEstudio2).save(failOnError:true)
		def materia23 = Materia.findByCodigo(303)?: new Materia(codigo:303, nombre:'MATEMATICA', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion23 = AsignacionPeriodoMateria.findByMateria(materia3)?: new AsignacionPeriodoMateria(materia:materia23,periodo:periodoDedicacion1,planEstudio:planEstudio2).save(failOnError:true)
		def materia24 = Materia.findByCodigo(304)?: new Materia(codigo:304, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion24 = AsignacionPeriodoMateria.findByMateria(materia4)?: new AsignacionPeriodoMateria(materia:materia24,periodo:periodoDedicacion2,planEstudio:planEstudio2).save(failOnError:true)
		def materia25 = Materia.findByCodigo(305)?: new Materia(codigo:305, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion25 = AsignacionPeriodoMateria.findByMateria(materia5)?: new AsignacionPeriodoMateria(materia:materia25,periodo:periodoDedicacion2,planEstudio:planEstudio2).save(failOnError:true)
		def materia26 = Materia.findByCodigo(306)?: new Materia(codigo:306, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion26 = AsignacionPeriodoMateria.findByMateria(materia6)?: new AsignacionPeriodoMateria(materia:materia26,periodo:periodoDedicacion3,planEstudio:planEstudio2).save(failOnError:true)
		def materia27 = Materia.findByCodigo(307)?: new Materia(codigo:307, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion27 = AsignacionPeriodoMateria.findByMateria(materia7)?: new AsignacionPeriodoMateria(materia:materia27,periodo:periodoDedicacion3,planEstudio:planEstudio2).save(failOnError:true)
		def materia28 = Materia.findByCodigo(308)?: new Materia(codigo:308, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio2).save(failOnError:true)
		def asignacion28 = AsignacionPeriodoMateria.findByMateria(materia8)?: new AsignacionPeriodoMateria(materia:materia28,periodo:periodoDedicacion4,planEstudio:planEstudio2).save(failOnError:true)

		def materia31 = Materia.findByCodigo(301)?: new Materia(codigo:401, nombre:'BASE DE DATOS 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:20, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.', planEstudio:planEstudio4).save(failOnError:true)
		def asignacion31 = AsignacionPeriodoMateria.findByMateria(materia31)?: new AsignacionPeriodoMateria(materia:materia31,periodo:periodoDedicacion1,planEstudio:planEstudio4).save(failOnError:true)
		def materia32 = Materia.findByCodigo(402)?: new Materia(codigo:402, nombre:'PROGRAMACION BASICA 1', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:30, cupoMaximoAlumnos:20, cantidadDocentesRequeridos:3, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion32 = AsignacionPeriodoMateria.findByMateria(materia32)?: new AsignacionPeriodoMateria(materia:materia32,periodo:periodoDedicacion1,planEstudio:planEstudio4).save(failOnError:true)
		def materia33 = Materia.findByCodigo(403)?: new Materia(codigo:403, nombre:'MATEMATICA', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:15, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion33 = AsignacionPeriodoMateria.findByMateria(materia33)?: new AsignacionPeriodoMateria(materia:materia33,periodo:periodoDedicacion1,planEstudio:planEstudio4).save(failOnError:true)
		def materia34 = Materia.findByCodigo(404)?: new Materia(codigo:404, nombre:'PROGRAMACION WEB 1', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:10, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion34 = AsignacionPeriodoMateria.findByMateria(materia34)?: new AsignacionPeriodoMateria(materia:materia34,periodo:periodoDedicacion2,planEstudio:planEstudio4).save(failOnError:true)
		def materia35 = Materia.findByCodigo(405)?: new Materia(codigo:405, nombre:'BASE DE DATOS 2', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:1, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion35 = AsignacionPeriodoMateria.findByMateria(materia35)?: new AsignacionPeriodoMateria(materia:materia35,periodo:periodoDedicacion2,planEstudio:planEstudio4).save(failOnError:true)
		def materia36 = Materia.findByCodigo(406)?: new Materia(codigo:406, nombre:'REDES', cantidadUnidadesHorarias:40, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion36 = AsignacionPeriodoMateria.findByMateria(materia36)?: new AsignacionPeriodoMateria(materia:materia36,periodo:periodoDedicacion3,planEstudio:planEstudio4).save(failOnError:true)
		def materia37 = Materia.findByCodigo(407)?: new Materia(codigo:407, nombre:'PROGRAMACION WEB 2', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion37 = AsignacionPeriodoMateria.findByMateria(materia37)?: new AsignacionPeriodoMateria(materia:materia37,periodo:periodoDedicacion4,planEstudio:planEstudio4).save(failOnError:true)
		def materia38 = Materia.findByCodigo(408)?: new Materia(codigo:408, nombre:'PROGRAMACION WEB 3', cantidadUnidadesHorarias:80, cupoMinimoAlumnos:8, cupoMaximoAlumnos:30, cantidadDocentesRequeridos:2, contenidoMinimo:'Aca va el contenido minimo...', bibliografia:'Acá va la bibliografia.',planEstudio:planEstudio4).save(failOnError:true)
		def asignacion38 = AsignacionPeriodoMateria.findByMateria(materia18)?: new AsignacionPeriodoMateria(materia:materia38,periodo:periodoDedicacion4,planEstudio:planEstudio4).save(failOnError:true)


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

		def departamentoIngenieria = Departamento.findByNombre('Ingenieria')?: new Departamento(nombre: 'Ingenieria', mision: 'La mision de nuestro departamento es...', vision: 'La visión de nuestro departamenteo es...', contacto: contactoInstitucion).save(failOnError:true)
		def institucionEducativaUnica = InstitucionEducativa.findByNombre('UNLAM')?: new InstitucionEducativa(contacto: contactoInstitucion, nombre: 'UNLAM').save(failOnError:true)
		institucionEducativaUnica.departamentos = []
		institucionEducativaUnica.departamentos.add(departamentoIngenieria)
		institucionEducativaUnica = institucionEducativaUnica.save(failOnError:true)


		//Docentes only for Test
		def docente1 = Docente.findByUsuario(docenteUser1) ?: new Docente(apellido:'Fernandez',nombre: 'Juan', usuario: docenteUser1, documento: documentoDNIdocente1, contacto: contactoDocente1, departamento: departamentoIngenieria).save(failOnError:true)
		def docente2 = Docente.findByUsuario(docenteUser2) ?: new Docente(apellido:'Gonzalez',nombre: 'Matias', usuario: docenteUser2, documento: documentoDNIdocente2, contacto: contactoDocente2, departamento: departamentoIngenieria).save(failOnError:true)
		def docente3 = Docente.findByUsuario(docenteUser3) ?: new Docente(apellido:'Rodriguez',nombre: 'Karina', usuario: docenteUser3, documento: documentoDNIdocente3, contacto: contactoDocente3, departamento: departamentoIngenieria).save(failOnError:true)
		def docente4 = Docente.findByUsuario(docenteUser4) ?: new Docente(apellido:'Iglesias',nombre: 'Maria Fernanda', usuario: docenteUser4, documento: documentoDNIdocente4, contacto: contactoDocente4, departamento: departamentoIngenieria).save(failOnError:true)
		def docente5 = Docente.findByUsuario(docenteUser5) ?: new Docente(apellido:'Martinez',nombre: 'Sergio', usuario: docenteUser5, documento: documentoDNIdocente5, contacto: contactoDocente5, departamento: departamentoIngenieria).save(failOnError:true)
		def docente6 = Docente.findByUsuario(docenteUser6) ?: new Docente(apellido:'Perez',nombre: 'Carlos', usuario: docenteUser6, documento: documentoDNIdocente6, contacto: contactoDocente6, departamento: departamentoIngenieria).save(failOnError:true)
		def docente7 = Docente.findByUsuario(docenteUser7) ?: new Docente(apellido:'Gonzalez',nombre: 'Monica', usuario: docenteUser7, documento: documentoDNIdocente7, contacto: contactoDocente7, departamento: departamentoIngenieria).save(failOnError:true)
		def docente8 = Docente.findByUsuario(docenteUser8) ?: new Docente(apellido:'Cano',nombre: 'Sergio', usuario: docenteUser8, documento: documentoDNIdocente8, contacto: contactoDocente8, departamento: departamentoIngenieria).save(failOnError:true)


		int numeroInicial = 101
		int cantidadCrear = 80
		def espacioFisico
		def nroPabellon = 1
		def ubicacion
		for(int i = numeroInicial; i<=numeroInicial+cantidadCrear;i++){
			ubicacion = "Pabellon Nro "+nroPabellon
			espacioFisico = EspacioFisico.findByNumero(i) ?: new EspacioFisico(numero: i, ubicacion: ubicacion).save(failOnError:true)
			if(i%10==0){
				nroPabellon = nroPabellon + 2
			}

		}
		Date fechaInicioCiclo1 = Date.parse("dd/MM/yyyy", "01/04/2013")
		Date fechaFinCiclo1 = new Date('21/12/2014')
		def cicloLectivo = CicloLectivo.findByCodigo('CICLO LECTIVO 2013') ?: new CicloLectivo(codigo:'CICLO LECTIVO 2013', fechaInicio: new Date(), fechaFin: new Date()).save(failOnError:true)

	}
	def destroy = {
	}
}
