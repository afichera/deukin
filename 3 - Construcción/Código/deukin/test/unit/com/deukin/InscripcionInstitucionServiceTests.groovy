package com.deukin



import grails.test.mixin.*

import org.junit.*

/**
 * See the API for {@link grails.test.mixin.services.ServiceUnitTestMixin} for usage instructions
 */
@TestFor(InscripcionInstitucionService)
@Mock([UsuarioRegistro, InscripcionInstitucion, Documento, Alumno, Persona, Contacto, Telefono, Usuario, Rol, InstitucionEducativa])
class InscripcionInstitucionServiceTests {



	void testConfirmarInscripcionOK(){
		def inscripcionInstitucionService = new InscripcionInstitucionService()
		def usuarioService = mockFor(UsuarioService)
		Usuario usuario = obtenerUsuarioMock()
		inscripcionInstitucionService.usuarioService = usuarioService
		
		
		def inscripcionInstitucion = obtenerInscripcionMock()
		inscripcionInstitucion = inscripcionInstitucion.save(failOnError:true)

		usuarioService.demand.crear(0..2){String username, String password, String rol ->return usuario}
		inscripcionInstitucionService.usuarioService = usuarioService.createMock()
		inscripcionInstitucionService.confirmarInscripcion(inscripcionInstitucion)
		
		assert inscripcionInstitucion.estadoInscripcionInstitucion.equals(EstadoInscripcionInstitucion.CONFIRMADA)
		
	}


	void testRechazarInscripcionOK(){
		def inscripcionInstitucionService = new InscripcionInstitucionService()
		def inscripcionInstitucion = obtenerInscripcionMock()		
		inscripcionInstitucion = inscripcionInstitucion.save(failOnError:true)
		inscripcionInstitucionService.rechazarInscripcion(inscripcionInstitucion)		
		assert inscripcionInstitucion.estadoInscripcionInstitucion.equals(EstadoInscripcionInstitucion.RECHAZADA)
		assert inscripcionInstitucion.fechaBaja != null
	}

	private Usuario obtenerUsuarioMock() {
		Usuario usuario = new Usuario()
		usuario.username = "usuariotest"
		usuario.password = "passwordtest"
		return usuario
	}
	
		
	private InscripcionInstitucion obtenerInscripcionMock() {
		def inscripcionInstitucion = new InscripcionInstitucion()
		inscripcionInstitucion.usuarioRegistro = new UsuarioRegistro()
		inscripcionInstitucion.usuarioRegistro.username = "usuariotest"
		inscripcionInstitucion.usuarioRegistro.password = "passwordtest"
		inscripcionInstitucion.usuarioRegistro.password2 = "passwordtest"
		inscripcionInstitucion.nombre = "nombretest"
		inscripcionInstitucion.apellido = "apellidotest"
		inscripcionInstitucion.tipoDocumento = TipoDocumento.DNI
		inscripcionInstitucion.documentoNumero = 28230014L
		inscripcionInstitucion.fechaNacimiento = new Date()
		inscripcionInstitucion.calle = "calleTest"
		inscripcionInstitucion.calleNumero = 123
		inscripcionInstitucion.localidad = "localidad test"
		inscripcionInstitucion.codigoPostal = 1234
		inscripcionInstitucion.sexo = "M"
		inscripcionInstitucion.tipoTelefono = TipoTelefono.MOVIL
		inscripcionInstitucion.telefonoNumero = "1156779878"
		inscripcionInstitucion.estadoInscripcionInstitucion = EstadoInscripcionInstitucion.PENDIENTE_CONFIRMACION_PRESENCIAL
		inscripcionInstitucion.fechaInscripcion = new Date()
		return inscripcionInstitucion
	}
}
