package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO'])
class MateriaController {
	
	def springSecurityService
	def materiaService
	def carreraService
	def usuarioService
	def planEstudioService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def searchCarrerasAutocomplete = {
		def usuarioLogueado = springSecurityService.principal
		def queryRegex = "%${params.query}%"
		def carreras = carreraService.findCarrerasLikeParamasAndCoordinadorUser(queryRegex, usuarioLogueado)

		render(contentType: "text/xml") {
			results() {
				carreras.each { carrera ->
					result(){
						name(carrera.titulo)						
						id(carrera.id)
					}
				}
			}
		}

				
	}

	def searchPlanesEstudioAJAX = {
		def usuarioLogueado = springSecurityService.principal
		def queryRegex = "%${params.query}%"
		def planesEstudio = planEstudioService.getPlanesEstudioLikeParamsAndCoordinadorUser(queryRegex,

usuarioLogueado)
		
		render(contentType: "text/xml") {
			results() {
				planesEstudio.each { plan ->
					result(){
						name(plan.identificacion)
						id(plan)
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
		def materias = materiaService.obtenerMateriasDeCoordinador(authorities, params, max, usuario)
		[materiaInstanceList:materias, materiaInstanceTotal: materias.size()]
	}


	def create() {
		[materiaInstance: new Materia(params)]
	}
	
	def listaCarrerasMostrar(){
		def authorities =  springSecurityService.principal.authorities
		def usuario = springSecurityService.principal
		carreraService.listaCarrerasMostrar(authorities, usuario)
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
		
		def equivalencias = Equivalencia.list(fetch: [materiaPrincipal: materiaInstance])

		[materiaInstance: materiaInstance, equivalencias:equivalencias]
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
