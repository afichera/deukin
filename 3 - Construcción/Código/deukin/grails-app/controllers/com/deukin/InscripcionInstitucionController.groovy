package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

class InscripcionInstitucionController {

	def inscripcionInstitucionService
	def correoElectronicoService
	def springSecurityService
	def usuarioService

	InscripcionInstitucion inscripcion = new InscripcionInstitucion()
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
	def indexAdmin() {
		redirect(action: "list", params: params)
	}
	
	def index() {
		redirect(action: "pasos")
	}
	
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
	def list(Integer max) {
		//aca hay que ver, si es un Admin debo traer todo, si es Administrativo solo lo pendiente.
		def authorities =  springSecurityService.principal.authorities
		def listaInscripciones
		def cantidad = 0
		params.max = Math.min(max ?: 10, 100)
		
		if(usuarioService.poseeElRol(authorities, 'ROLE_ADMINISTRADOR_SISTEMA')){
			listaInscripciones = InscripcionInstitucion.list(params)			
		}else{		
			listaInscripciones = InscripcionInstitucion.findAllByEstadoInscripcionInstitucion(EstadoInscripcionInstitucion.PENDIENTE_CONFIRMACION_PRESENCIAL, params) 
		}
		
		if(listaInscripciones!=null && !listaInscripciones.isEmpty()){
			cantidad = listaInscripciones.size()
		}		
		[inscripcionInstitucionInstanceList: listaInscripciones, inscripcionInstitucionInstanceTotal: cantidad]
	}
	
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
	def confirmarInscripcion(Long id){
		def inscripcionInstitucionInstance = InscripcionInstitucion.get(id)

		def persona
		if(!inscripcionInstitucionInstance){
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				id
			])
			redirect(action: "list")
			return
		}
		if(!inscripcionInstitucionInstance.tipoInscripcionInstitucion){
			inscripcionInstitucionInstance.tipoInscripcionInstitucion = TipoInscripcionInstitucion.ALUMNO
		}
		try{
			persona = inscripcionInstitucionService.confirmarInscripcion(inscripcionInstitucionInstance)
			correoElectronicoService.enviarMailActivacionPersona(persona)
			flash.message = message(code: 'inscripcionInstitucion.approved.message', args: [
				message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
				inscripcionInstitucionInstance.id
			])
			redirect(action: "list")
			return
		}catch(Exception ex){
			flash.message = ex.getCause()?.getMessage()			
			redirect(action: "list")
			return
		}
		
		
	}
	
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
	def create() {
		[inscripcionInstitucionInstance: new InscripcionInstitucion(params)]
	}
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
	def save() {
		def inscripcionInstitucionInstance = new InscripcionInstitucion(params)
		if (!inscripcionInstitucionInstance.save(flush: true)) {
			render(view: "create", model: [inscripcionInstitucionInstance: inscripcionInstitucionInstance])
			return
		}

		flash.message = message(code: 'inscripcion.created.message', args: [
			message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
			inscripcionInstitucionInstance.id
		])
		redirect(action: "show", id: inscripcionInstitucionInstance.id)
	}
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
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
		if(!inscripcionInstitucionInstance.tipoInscripcionInstitucion){
			inscripcionInstitucionInstance.tipoInscripcionInstitucion = TipoInscripcionInstitucion.ALUMNO
		}

		[inscripcionInstitucionInstance: inscripcionInstitucionInstance]
	}
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
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
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ADMINISTRATIVO'])
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
		String validacionNumeros = inscripcionInstitucionService.validaNumeros(params)
		if (validacionNumeros!="")
		
		{
			inscripcionInstitucionInstance.clearErrors()
			inscripcionInstitucionInstance.errors.reject(message(code: 'materia.invalid.numeros', args:[validacionNumeros]))
			render(view: "edit", model: [inscripcionInstitucionInstance: inscripcionInstitucionInstance])
			return
		}
		inscripcionInstitucionInstance.properties = params

		if (!inscripcionInstitucionInstance.save(flush: true)) {
			render(view: "edit", model: [inscripcionInstitucionInstance: inscripcionInstitucionInstance])
			return
		}

		flash.message = message(code: 'inscripcion.updated.message', args: [
			message(code: 'inscripcionInstitucion.label', default: 'InscripcionInstitucion'),
			inscripcionInstitucionInstance.id
		])
		redirect(action: "show", id: inscripcionInstitucionInstance.id)
	}
	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
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
			flash.message = message(code: 'inscripcion.deleted.message', args: [
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
				
				flow.inscripcion.tipoDocumento = params.tipoDocumento
				flow.inscripcion.usuarioRegistro.username = params.usuarioRegistro.username
				flow.inscripcion.usuarioRegistro.password = params.usuarioRegistro.password
				flow.inscripcion.usuarioRegistro.password2 = params.usuarioRegistro.password2

				if (!params.documentoNumero.isInteger())
				{
					flow.inscripcion.clearErrors()
					flow.inscripcion.errors.rejectValue("documentoNumero", "inscripcionInstitucion.documentoNumero.invalid.numero")
					return error()
				}
				
				flow.inscripcion.documentoNumero = new Long(params.documentoNumero)

								
				!flow.inscripcion.usuarioRegistro.validate() ? error() : success()
				
				if(!flow.inscripcion.usuarioRegistro.validate()){					
					return error()
				}

			
			}.to "datosContacto"
			
		}

		datosContacto {
			on("siguiente"){
				flow.inscripcion.calle = params.calle				
				flow.inscripcion.localidad = params.localidad				
				flow.inscripcion.observaciones = params.observaciones				
				flow.inscripcion.tipoTelefono = params.tipoTelefono
				flow.inscripcion.telefonoNumero = params.telefonoNumero
				
				if (!params.calleNumero.isInteger())
				{
					flow.inscripcion.clearErrors()
					flow.inscripcion.errors.rejectValue("calleNumero", "inscripcionInstitucion.calleNumero.invalid.numero")
					return error()
				}
				flow.inscripcion.calleNumero = new Integer(params.calleNumero)
				if (!params.codigoPostal.isInteger())
				{
					flow.inscripcion.clearErrors()
					flow.inscripcion.errors.rejectValue("codigoPostal", "inscripcionInstitucion.codigoPostal.invalid.numero")
					return error()
				}
				if (params.codigoPostal.toInteger()>9999||params.codigoPostal.toInteger()<1000)
				{
					flow.inscripcion.clearErrors()
					flow.inscripcion.errors.rejectValue("codigoPostal", "inscripcionInstitucion.codigoPostal.invalid.rango")
					return error()
				}
				flow.inscripcion.codigoPostal = new Integer(params.codigoPostal)
				
				
			}.to "inscribir"
			on("anterior"){
				flow.inscripcion.calle = params.calle
				flow.inscripcion.localidad = params.localidad
				flow.inscripcion.observaciones = params.observaciones
				flow.inscripcion.tipoTelefono = params.tipoTelefono
				flow.inscripcion.telefonoNumero = params.telefonoNumero
				
				if (params.calleNumero.isInteger())
				flow.inscripcion.calleNumero = new Integer(params.calleNumero)
				if (params.codigoPostal.isInteger())
				flow.inscripcion.codigoPostal = new Integer(params.codigoPostal)
				
			}.to "datosMinimos"
		}

		inscribir {

			action {

				def inscripcion = flow.inscripcion
				try{
					inscripcion = inscripcionInstitucionService.inscribir(inscripcion)
				}catch(Exception e){
					flash.message = e.getCause()?.getMessage()
					return errorInscripcion()
				}
				

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

		errorInscripcion(){
			on("volver").to("datosMinimos")
			
		}
		finInscripcion()
	}
}
