package com.deukin

import org.springframework.transaction.annotation.Transactional

import com.deukin.exceptions.BusinessException


class InscripcionInstitucionService {

	def mailService
	def usuarioService
	
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
					try{
						inscripcion = inscripcion.save(failOnError:true)
						log.info 'Se realizó una nueva inscripción en el sistema. Id:'+inscripcion.id
						inscripcion
					}catch(Exception e){
						log.error 'Ocurrió un error al intentar guardar la inscripción en el sistema. Detalle: '+e
						throw new BusinessException('Ocurrió un error al guardar la inscripción. Haga clic en volver, los campos erróneos se resaltarán')
					}

				}else{
					throw new BusinessException('La dirección de email ingresada ya está en uso, por favor indique una nueva dirección de email.')
				}
			}else{
				throw new BusinessException('La dirección de email ingresada ya está en uso, por favor indique una nueva dirección de email.')
			}

		}else{
			throw new BusinessException('Ud ya se encuentra inscripto!')
		}		
	}

	@Transactional
	InscripcionInstitucion validarInscripcion(InscripcionInstitucion inscripcion){
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
	
				}else{
					throw new BusinessException('El nombre de usuario elegido ya está en uso, por favor indique un nuevo nombre de usuario.')
				}
			}else{
				throw new BusinessException('El nombre de usuario elegido ya está en uso, por favor indique un nuevo nombre de usuario.')
			}

		}else{
			throw new BusinessException('Ud ya se encuentra inscripto!')
		}
	}

		
	@Transactional
	def confirmarInscripcion(InscripcionInstitucion inscripcion){
		Documento documento = Documento.findByNumeroAndTipoDocumento(inscripcion.documentoNumero, inscripcion.tipoDocumento)
		Usuario usuario = Usuario.findByUsername(inscripcion.usuarioRegistro.username)
		def persona
		if(documento == null){
			if(usuario == null){
				try{
					documento = new Documento(numero: inscripcion.documentoNumero, tipoDocumento: inscripcion.tipoDocumento)
					Domicilio domicilio = new Domicilio(calle: inscripcion.calle, numero: inscripcion.calleNumero, localidad: inscripcion.localidad, observaciones: inscripcion.observaciones, codigoPostal: inscripcion.codigoPostal)
					Telefono telefono = new Telefono(numero: inscripcion.telefonoNumero, tipoTelefono: inscripcion.tipoTelefono)
					Contacto  contacto = new Contacto(domicilio: domicilio)
					contacto.telefonos = []
					contacto.telefonos.add(telefono)
					telefono.contacto = contacto
					if(inscripcion.tipoInscripcionInstitucion.equals(TipoInscripcionInstitucion.ALUMNO)){
						usuario = usuarioService.crear(inscripcion.usuarioRegistro.username, inscripcion.usuarioRegistro.password, "ROLE_ALUMNO")						
						persona = new Alumno(usuario:usuario, documento:documento, contacto:contacto, nombre:inscripcion.nombre, apellido: inscripcion.apellido).save(failOnError:true)

					}else if(inscripcion.tipoInscripcionInstitucion.equals(TipoInscripcionInstitucion.DOCENTE)){
						usuario = usuarioService.crear(inscripcion.usuarioRegistro.username, inscripcion.usuarioRegistro.password, "ROLE_DOCENTE")
						persona = new Docente(usuario:usuario, documento:documento, contacto:contacto, nombre:inscripcion.nombre, apellido: inscripcion.apellido).save(failOnError:true)

					}
					
					inscripcion.estadoInscripcionInstitucion = EstadoInscripcionInstitucion.CONFIRMADA
					inscripcion.save()					
					log.info 'Se realizó la activación del usuario ' +persona.apellido +' '+ persona.nombre + '.'
					persona
				}catch(Exception e){					
					log.error 'Falló al activar el usuario. Causa: '+e
					throw new BusinessException('No se pudo activar el registro del usuario.')
				}	

			}else{
				throw new BusinessException('El nombre de usuario: '+inscripcion.usuarioRegistro.username+', utilizado en la inscripción ya existe en nuestro sistema.')
			}			
		}else{
			throw new BusinessException('El documento '+documento.tipoDocumento.toString()+' '+documento.numero+' ya se encuentra activo en nuestro sistema.')
		}
		
	}
	
	def rechazarInscripcion(InscripcionInstitucion inscripcion){
		if(inscripcion.estadoInscripcionInstitucion == EstadoInscripcionInstitucion.PENDIENTE_CONFIRMACION_PRESENCIAL){
			inscripcion.estadoInscripcionInstitucion = EstadoInscripcionInstitucion.RECHAZADA
			inscripcion.fechaBaja = new Date()
			inscripcion.save(failOnError:true)			
			log.info 'Se rechazó la inscripción con id:' + inscripcion.id
		}else{
			throw new BusinessException('No se puede rechazar la inscripción porque tiene estado: '+inscripcion.estadoInscripcionInstitucion.toString()+'.')
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
