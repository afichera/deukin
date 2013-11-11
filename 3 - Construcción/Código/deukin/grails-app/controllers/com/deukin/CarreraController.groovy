package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

//@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO'])
class CarreraController {
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
		def index() {
			redirect(action: "list", params: params)
		}
	
		def list(Integer max) {
			params.max = Math.min(max ?: 10, 100)
			[carreraInstanceList: Carrera.list(params), carreraInstanceTotal: Carrera.count()]
		}
	
		def create() {
			[carreraInstance: new Carrera(params)]
		}
	
		def save() {
			def carreraInstance = new Carrera(params)
			if (!carreraInstance.save(flush: true)) {
				render(view: "create", model: [carreraInstance: carreraInstance])
				return
			}
	
			flash.message = message(code: 'default.created.message', args: [message(code: 'carrera.label', default: 'Carrera'), carreraInstance.id])
			redirect(action: "show", id: carreraInstance.id)
		}
		
		def saveNew() {
			def planEstudioInstance = new  PlanEstudio(identificador:params.nombrePlanDeEstudio,estado: EstadoDeCreacion.BORRADOR)
			
			def carreraInstance = new Carrera(titulo: params.titulo, descripcion:null, condicionIngreso: null, modalidadAsistencia: params.modalidadAsistencia, coordinador: null, estado: EstadoDeCreacion.BORRADOR)
								.addToPlanesEstudio(planEstudioInstance)
			if (!carreraInstance.save(flush: true)) {
				render(view: "create", model: [carreraInstance: carreraInstance])
				return
			}
	
			flash.message = message(code: 'default.created.message', args: [message(code: 'carrera.label', default: 'Carrera'), carreraInstance.id])
			redirect(action: "show", id: carreraInstance.id)
		}
	
	
		def show(Long id) {
			def carreraInstance = Carrera.get(id)
			if (!carreraInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrera.label', default: 'Carrera'), id])
				redirect(action: "list")
				return
			}
	
			[carreraInstance: carreraInstance]
		}
	
		def edit(Long id) {
			def carreraInstance = Carrera.get(id)
			if (!carreraInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrera.label', default: 'Carrera'), id])
				redirect(action: "list")
				return
			}
	
			[carreraInstance: carreraInstance]
		}
	
		def update(Long id, Long version) {
			def carreraInstance = Carrera.get(id)
			if (!carreraInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrera.label', default: 'Carrera'), id])
				redirect(action: "list")
				return
			}
	
			if (version != null) {
				if (carreraInstance.version > version) {
					carreraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
							  [message(code: 'carrera.label', default: 'Carrera')] as Object[],
							  "Another user has updated this Carrera while you were editing")
					render(view: "edit", model: [carreraInstance: carreraInstance])
					return
				}
			}
	
			carreraInstance.properties = params
	
			if (!carreraInstance.save(flush: true)) {
				render(view: "edit", model: [carreraInstance: carreraInstance])
				return
			}
	
			flash.message = message(code: 'default.updated.message', args: [message(code: 'carrera.label', default: 'Carrera'), carreraInstance.id])
			redirect(action: "show", id: carreraInstance.id)
		}
	
		def delete(Long id) {
			def carreraInstance = Carrera.get(id)
			if (!carreraInstance) {
				flash.message = message(code: 'default.not.found.message', args: [message(code: 'carrera.label', default: 'Carrera'), id])
				redirect(action: "list")
				return
			}
	
			try {
				carreraInstance.delete(flush: true)
				flash.message = message(code: 'default.deleted.message', args: [message(code: 'carrera.label', default: 'Carrera'), id])
				redirect(action: "list")
			}
			catch (DataIntegrityViolationException e) {
				flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'carrera.label', default: 'Carrera'), id])
				redirect(action: "show", id: id)
			}

}
		
		def searchCoordinadorCoordinador =  {
			def queryRegex = "${params.query}"
			def authorities =  springSecurityService.principal.authorities
			def usuario = springSecurityService.principal
			def coordinadores = carreraService.obtenerCoordinadorLikeQueryRegex(authorities, usuario, queryRegex)
			
			render(contentType: "text/xml") {
				results() {
					personas.each { persona ->
						result(){
							name(persona.toString())
							id(persona.id)
						}
					}
				}
			}
	
		}
}
