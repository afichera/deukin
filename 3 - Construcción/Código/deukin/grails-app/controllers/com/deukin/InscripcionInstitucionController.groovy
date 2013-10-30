package com.deukin

class InscripcionInstitucionController {

	def inscripcionInstitucionService
	def correoElectronicoService 

	static scaffold = true

	def index() {
		redirect(action: "pasos")
	}

	InscripcionInstitucion inscripcion = new InscripcionInstitucion()
	def pasosFlow = {

		enter {
			action {
				InscripcionInstitucion flow.inscripcion = new InscripcionInstitucion()
				flow.inscripcion.usuarioRegistro = new UsuarioRegistro()
				[inscripcion: flow.inscripcion]
			}
			on("success").to("datosMinimos")
			on(Exception).to("errorInscripcion")
		}


		datosMinimos {
			on("siguiente"){
				flow.inscripcion.nombre = params.nombre
				flow.inscripcion.apellido = params.apellido
				flow.inscripcion.fechaNacimiento = params.fechaNacimiento
				flow.inscripcion.sexo = params.sexo
				flow.inscripcion.documentoNumero = new Long(params.documentoNumero)
				flow.inscripcion.tipoDocumento = params.tipoDocumento


				flow.inscripcion.usuarioRegistro.username = params.usuarioRegistro.username
				flow.inscripcion.usuarioRegistro.password = params.usuarioRegistro.password
				flow.inscripcion.usuarioRegistro.password2 = params.usuarioRegistro.password2
			}.to "datosContacto"
		}

		chequearVacante {

			action {

				if (cursoService.hayVacante(Calendar.instance.get(Calendar.YEAR),flow.alumno.obtenerEdad()))
					return hayVacante()
				else
					return espera()
			}

			on("hayVacante").to("datosPadres")
			on("espera").to("inscribir")
		}


		datosContacto {
			on("siguiente"){
				flow.inscripcion.calle = params.calle
				flow.inscripcion.calleNumero = new Integer(params.calleNumero)
				flow.inscripcion.localidad = params.localidad
				flow.inscripcion.codigoPostal = new Integer(params.codigoPostal)
				flow.inscripcion.observaciones = params.observaciones
				flow.inscripcion.telefonoNumero = params.telefonoNumero
				flow.inscripcion.tipoTelefono = params.tipoTelefono
			}.to "inscribir"
			on("anterior").to "datosMinimos"
		}

		inscribir {

			action {

				def inscripcion = flow.inscripcion

				inscripcion = inscripcionInstitucionService.inscribir(inscripcion)

				if (inscripcion.estadoInscripcionInstitucion.equals(EstadoInscripcionInstitucion.PENDIENTE_CONFIRMACION_PRESENCIAL)){
					correoElectronicoService.enviarMailBienvenida(inscripcion)
						return success()
				}else{
					return errorInscripcion()
				}
			}

			on("success").to("finInscripcion")			
			on("errorInscripcion").to("errorInscripcion")
		}

		errorInscripcion()
		finInscripcion()
	}
}
