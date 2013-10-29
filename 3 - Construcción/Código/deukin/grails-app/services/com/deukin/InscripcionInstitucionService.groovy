package com.deukin

import org.springframework.transaction.annotation.Transactional

import com.deukin.exceptions.BusinessException

class InscripcionInstitucionService {

	def asyncMailService
	
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
//					inscripcion.usuarioRegistro.inscripcion = inscripcion
					
					
					enviarMailBienvenida(inscripcion)
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
	
	def enviarMailBienvenida(InscripcionInstitucion inscripcion){
		def retorno = true
		try{
			def cuerpo = '<h1><b> Bienvenido a Deukin ' + inscripcion.nombre +' '+ inscripcion.apellido +'!</b></h1><br/><br/>'
			cuerpo += 'A trav&eacute;s de nuestro sistema ud podr&aacute; contar&aacute con toda la informaci&oacuten relacionada con ' + inscripcion.nombre +'<br/>'
			cuerpo += 'Recuerde que para completar la inscripci&oacute;n debe asistir a nuestra instituci&oacute;n. <br/>'
			cuerpo += 'Muchas gracias por elegirnos.<br/>'
			cuerpo += 'Saludos Cordiales.<br/>'
			cuerpo += 'Deukin <br/>'
			cuerpo += 'Contacto: deukin.contacto@gmail.com <br/>'
			
			asyncMailService.sendMail{
				// Mail parameters
				to inscripcion.usuarioRegistro.username
				subject "Bienvenido a Deukin"
				html cuerpo;
//				attachBytes 'test.txt', 'text/plain', byteBuffer;
				// Additional asynchronous parameters (optional)
//				beginDate new Date(System.currentTimeMillis()+60000)    // Starts after one minute, default current date
//				endDate new Date(System.currentTimeMillis()+3600000)   // Must be sent in one hour, default infinity
//				maxAttemptsCount 5;   // Max 3 attempts to send, default 1
//				attemptInterval 300000;    // Minimum five minutes between attempts, default 300000 ms
//				delete true;    // Marks message for delete after sent
//				immediate true;    // Run send job after the message was created
//				priority 10;   // If priority is greater then message will be sent faster
			}
//
//			mailService.sendMail {
//				to inscripcion.usuarioRegistro.username
//				subject "Bienvenido a Deukin"
//				html cuerpo
//			}
		}catch(Exception ex){
			//TODO: loggear
			retorno = false
		}
			
		retorno
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
