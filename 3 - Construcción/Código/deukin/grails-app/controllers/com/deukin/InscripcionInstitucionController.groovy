package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

class InscripcionInstitucionController {

	def inscripcionInstitucionService
	def correoElectronicoService
	InscripcionInstitucion inscripcion = new InscripcionInstitucion()
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
	def indexAdmin() {
		redirect(action: "list", params: params)
	}
	
	def index() {
		redirect(action: "pasos")
	}
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[inscripcionInstitucionInstanceList: InscripcionInstitucion.list(params), inscripcionInstitucionInstanceTotal: InscripcionInstitucion.count()]
	}

	def create() {
		[inscripcionInstitucionInstance: new InscripcionInstitucion(params)]
	}

	def save() {
		def inscripcionInstitucionInstance = new InscripcionInstitucion(params)
		if (!inscripcionInstitucionInstance.save(flush: true)) {
			render(view: "create", model: [inscripcionInstitucionInstance: inscripcionInstitucionInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
			inscripcionInstitucionInstance.id
		])
		redirect(action: "show", id: inscripcionInstitucionInstance.id)
	}

	def show(Long id) {
		def inscripcionInstitucionInstance = InscripcionInstitucion.get(id)
		if (!inscripcionInstitucionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "list")
			return
		}

		[inscripcionInstitucionInstance: inscripcionInstitucionInstance]
	}

	def edit(Long id) {
		def inscripcionInstitucionInstance = InscripcionInstitucion.get(id)
		if (!inscripcionInstitucionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "list")
			return
		}

		[inscripcionInstitucionInstance: inscripcionInstitucionInstance]
	}

	def update(Long id, Long version) {
		def inscripcionInstitucionInstance = InscripcionInstitucion.get(id)
		if (!inscripcionInstitucionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (inscripcionInstitucionInstance.version > version) {
				inscripcionInstitucionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion')] as Object[],
						"Another user has updated this InscripcionInstitucion while you were editing")
				render(view: "edit", model: [inscripcionInstitucionInstance: inscripcionInstitucionInstance])
				return
			}
		}

		inscripcionInstitucionInstance.properties = params

		if (!inscripcionInstitucionInstance.save(flush: true)) {
			render(view: "edit", model: [inscripcionInstitucionInstance: inscripcionInstitucionInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
			inscripcionInstitucionInstance.id
		])
		redirect(action: "show", id: inscripcionInstitucionInstance.id)
	}

	def delete(Long id) {
		def inscripcionInstitucionInstance = InscripcionInstitucion.get(id)
		if (!inscripcionInstitucionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			inscripcionInstitucionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "show", id: id)
		}
	}


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
