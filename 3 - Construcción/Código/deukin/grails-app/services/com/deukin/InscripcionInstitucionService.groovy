package com.deukin

import org.springframework.transaction.annotation.Transactional

import com.deukin.exceptions.BusinessException

class InscripcionInstitucionService {

	def mailService
	
	def asynchronousMailService
	
	def serviceMethod() {
	}


	@Transactional
	InscripcionInstitucion inscribir(InscripcionInstitucion inscripcion){
		Calendar hoy = Calendar.getInstance()
		inscripcion.fechaInscripcion = hoy.getTime()
		inscripcion.estadoInscripcionInstitucion = EstadoInscripcionInstitucion.PENDIENTE_CONFIRMACION_PRESENCIAL


		//validar preexistente
		def inscripcionExistente = InscripcionInstitucion.findByDocumentoNumeroAndTipoDocumentoAndSexoAndFechaBajaIsNull(inscripcion.documentoNumero, inscripcion.tipoDocumento, inscripcion.sexo)
		def usuarioRegistroExistente = UsuarioRegistro.findByUsername(inscripcion.usuarioRegistro.username)
		def usuarioDeukinExistente = Usuario.findByUsername(inscripcion.usuarioRegistro.username)

		if(inscripcionExistente == null){
			if(usuarioRegistroExistente == null){
				if(usuarioDeukinExistente == null){
					
					inscripcion.usuarioRegistro = inscripcion.usuarioRegistro.save(failOnError:true)
					inscripcion = inscripcion.save(failOnError:true)
					inscripcion
				}else{
					throw new BusinessException("El nombre de usuario elegido ya está en uso, por favor indique un nuevo nombre de usuario.")
				}
			}else{
				throw new BusinessException("El nombre de usuario elegido ya está en uso, por favor indique un nuevo nombre de usuario.")
			}

		}else{
			throw new BusinessException("Ud ya se encuentra inscripto!")
		}		
	}
	

	InscripcionInstitucion activar(InscripcionInstitucion inscripcion){
		inscripcion.estadoInscripcionInstitucion = EstadoInscripcionInstitucion.CONFIRMADA
		inscripcion.save()
		inscripcion
	}

	InscripcionInstitucion quitar(InscripcionInstitucion inscripcion){
		Calendar hoy = Calendar.getInstance()
		inscripcion.fechaBaja = hoy.getTime()
		inscripcion.save()
		inscripcion
	}


}
