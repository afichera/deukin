package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO'])
class MateriaController {
	
	def springSecurityService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def searchMateriasAJAX = {
		def queryRegex = "%${params.query}%"		
		def materias = Materia.findAll { materia -> nombre =~ queryRegex }
		//Create XML response
		render(contentType: "text/xml") {
			results() {
				materias.each { materia ->
					result(){
						name(materia.codigo + ' - ' + materia.nombre)
						id(materia.id)
					}
				}
			}
		}
	}
	
	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		def authorities =  springSecurityService.principal.authorities
		def usuario = springSecurityService.principal
		def filtrarCarrera = false
		def materias		
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarCarrera = true
			}
		}		
		params.max = Math.min(max ?: 10, 100)
		if(filtrarCarrera){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def carreras = Carrera.findAllByCoordinador(persona)
			materias = Materia.findAllByCarreraInList(carreras)
			[materiaInstanceList: materias, materiaInstanceTotal: materias.size()]
		}else{
			[materiaInstanceList: Materia.list(params), materiaInstanceTotal: Materia.count()]
		}
		
	}

	def create() {
		[materiaInstance: new Materia(params)]
	}

	def save() {
		def materiaInstance = new Materia(params)
		if (!materiaInstance.save(flush: true)) {
			render(view: "create", model: [materiaInstance: materiaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'materia.label', default: 'Materia'),
			materiaInstance.id
		])
		redirect(action: "show", id: materiaInstance.id)
	}

	def show(Long id) {
		def materiaInstance = Materia.get(id)
		if (!materiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'materia.label', default: 'Materia'),
				id
			])
			redirect(action: "list")
			return
		}

		[materiaInstance: materiaInstance]
	}

	def edit(Long id) {
		def materiaInstance = Materia.get(id)
		if (!materiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'materia.label', default: 'Materia'),
				id
			])
			redirect(action: "list")
			return
		}

		[materiaInstance: materiaInstance]
	}

	def update(Long id, Long version) {
		def materiaInstance = Materia.get(id)
		if (!materiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'materia.label', default: 'Materia'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (materiaInstance.version > version) {
				materiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'materia.label', default: 'Materia')] as Object[],
						"Another user has updated this Materia while you were editing")
				render(view: "edit", model: [materiaInstance: materiaInstance])
				return
			}
		}

		materiaInstance.properties = params

		if (!materiaInstance.save(flush: true)) {
			render(view: "edit", model: [materiaInstance: materiaInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'materia.label', default: 'Materia'),
			materiaInstance.id
		])
		redirect(action: "show", id: materiaInstance.id)
	}

	def delete(Long id) {
		def materiaInstance = Materia.get(id)
		if (!materiaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'materia.label', default: 'Materia'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			materiaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'materia.label', default: 'Materia'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'materia.label', default: 'Materia'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
