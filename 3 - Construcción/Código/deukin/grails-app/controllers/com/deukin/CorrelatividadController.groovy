package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_COORDINADOR'])
class CorrelatividadController {
	def springSecurityService
	def materiaService
	def correlatividadService
	def subListaService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def authorities =  springSecurityService.principal.authorities
		def usuario = springSecurityService.principal
		def materias = materiaService.obtenerMateriasDeCoordinador(authorities, usuario)
		def correlatividadesFiltradas = Correlatividad.findAllByMateriaPrincipalInList(materias)
		def subLista = subListaService.getSubList(correlatividadesFiltradas, params)

		[correlatividadInstanceList: subLista, correlatividadInstanceTotal: correlatividadesFiltradas.size()]
	}

	def searchMateriasCoordinador =  {
		def queryRegex = "${params.query}"
		def authorities =  springSecurityService.principal.authorities
		def usuario = springSecurityService.principal
		def materias = materiaService.obtenerMateriasDeCoordinadorLikeQueryRegex(authorities, usuario, queryRegex)

		render(contentType: "text/xml") {
			results() {
				materias.each { materia ->
					result(){
						name(materia.toString())
						id(materia.id)
					}
				}
			}
		}
	}

	def create() {
		[correlatividadInstance: new Correlatividad(params)]
	}

	def save() {
		def correlatividadInstance = new Correlatividad(params)
		def esValida
		try{
			esValida = correlatividadService.validarCorrelatividad(correlatividadInstance)
			if(esValida){
				if (!correlatividadInstance.save(flush: true)) {
					render(view: "create", model: [correlatividadInstance: correlatividadInstance])
					return
				}
				flash.message = message(code: 'correlatividad.created.message', args: [
					message(code: 'correlatividad.label', default: 'Correlatividad'),
					correlatividadInstance.id
				])

				if (params.vieneDeMateria=="true") {

					redirect(controller: "materia", action: "show", id: params.materiaPrincipal.id)
				}
				else {
					redirect(action: "show", id: correlatividadInstance.id)
				}
			}
		}catch(Exception ex){
			String eMessage = ex.getCause()?.getMessage()
			flash.message = eMessage
			render(view: "create", model: [correlatividadInstance: correlatividadInstance])
		}
	}

	def show(Long id) {
		def correlatividadInstance = Correlatividad.get(id)
		if (!correlatividadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'correlatividad.label', default: 'Correlatividad'),
				id
			])
			redirect(action: "list")
			return
		}

		[correlatividadInstance: correlatividadInstance]
	}

	def edit(Long id) {
		def correlatividadInstance = Correlatividad.get(id)
		if (!correlatividadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'correlatividad.label', default: 'Correlatividad'),
				id
			])
			redirect(action: "list")
			return
		}

		[correlatividadInstance: correlatividadInstance]
	}

	def update(Long id, Long version) {
		def correlatividadInstance = Correlatividad.get(id)
		def esValida
		if (!correlatividadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'correlatividad.label', default: 'Correlatividad'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (correlatividadInstance.version > version) {
				correlatividadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'correlatividad.label', default: 'Correlatividad')] as Object[],
						"Another user has updated this Correlatividad while you were editing")
				render(view: "edit", model: [correlatividadInstance: correlatividadInstance])
				return
			}
		}

		correlatividadInstance.properties = params
		try{
			esValida = correlatividadService.validarCorrelatividad(correlatividadInstance)
			if(esValida){
				if (!correlatividadInstance.save(flush: true)) {
					render(view: "edit", model: [correlatividadInstance: correlatividadInstance])
					return
				}
			}

		}catch(Exception ex){
			String eMessage = ex.getCause()?.getMessage()
			flash.message = eMessage
			render(view: "edit", model: [correlatividadInstance: correlatividadInstance])
		}


		flash.message = message(code: 'correlatividad.updated.message', args: [
			message(code: 'correlatividad.label', default: 'Correlatividad'),
			correlatividadInstance.id
		])
		redirect(action: "show", id: correlatividadInstance.id)
	}

	def delete(Long id) {
		def correlatividadInstance = Correlatividad.get(id)
		if (!correlatividadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'correlatividad.label', default: 'Correlatividad'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			correlatividadInstance.delete(flush: true)
			flash.message = message(code: 'correlatividad.deleted.message', args: [
				message(code: 'correlatividad.label', default: 'Correlatividad'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'correlatividad.label', default: 'Correlatividad'),
				id
			])
			redirect(action: "show", id: id)
		}
	}
}
