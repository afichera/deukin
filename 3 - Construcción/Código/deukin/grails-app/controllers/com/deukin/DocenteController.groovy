package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_DOCENTE', 'ROLE_COORDINADOR', 'ROLE_ADMINISTRATIVO'])
class DocenteController {

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def springSecurityService
	def usuarioService
	def subListaService
	def docenteService
	def asignacionDocenteCursoService
	def uploadService
	
	def okContentTypesPhoto = [
		'image/png',
		'image/jpeg',
		'image/jpg'
	]


	def index() {
		redirect(action: "list", params: params)
	}

	@Secured([
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ADMINISTRATIVO',
		'ROLE_COORDINADOR'
	])
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def docentes = Docente.all
		def subLista = subListaService.getSubList(docentes, params)
		[docenteInstanceList: subLista, docenteInstanceTotal: docentes.size()]
	}

	def create() {
		[docenteInstance: new Docente(params)]
	}

	def save() {
		def docenteInstance = new Docente(params)
		if (!docenteInstance.save(flush: true)) {
			render(view: "create", model: [docenteInstance: docenteInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'docente.label', default: 'Docente'),
			docenteInstance.toString()
		])
		redirect(action: "show", id: docenteInstance.id)
	}

	def show(Long id) {
		def docenteInstance = Docente.get(id)
		if (!docenteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'docente.label', default: 'Docente'),
				id
			])
			redirect(action: "list")
			return
		}
		def asignaciones = asignacionDocenteCursoService.getAsignacionesDocenteCursoByDocenteOrderByPeriodoAcademico(docenteInstance)
		[docenteInstance: docenteInstance, asignacionDocenteCursoInstanceList:asignaciones]
	}

	@Secured([
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ADMINISTRATIVO',
		'ROLE_DOCENTE'
	])
	def edit(Long id) {
		def docenteInstance = Docente.get(id)
		if (!docenteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'docente.label', default: 'Docente'),
				id
			])
			redirect(action: "list")
			return
		}

		def tienePersmisoEdicion = true

		if(usuarioService.poseeElRol(springSecurityService.principal.authorities, 'ROLE_DOCENTE')){
			tienePersmisoEdicion = usuarioService.esElUsuarioLogueado(id)
		}

		if(!tienePersmisoEdicion){
			flash.message = message(code: 'permisoEdicion.denegado', args: [
				message(code: 'docente.label', default: 'Docente'),
				id
			])
			redirect(action: "show", id: docenteInstance.id)
			return
		}

		[docenteInstance: docenteInstance]
	}

	def update(Long id, Long version) {
		def docenteInstance = Docente.get(id)
		if (!docenteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'docente.label', default: 'Docente'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (docenteInstance.version > version) {
				docenteInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'docente.label', default: 'Docente')] as Object[],
						"Another user has updated this Docente while you were editing")
				render(view: "edit", model: [docenteInstance: docenteInstance])
				return
			}
		}
		String validacionNumeros = docenteService.validaNumeros(params)
		if (validacionNumeros!="") {
			docenteInstance.clearErrors()
			docenteInstance.errors.reject(message(code: 'materia.invalid.numeros', args:[validacionNumeros]))
			render(view: "edit", model: [docenteInstance: docenteInstance])
			return
		}

		def fileInstance = docenteInstance.fotoPerfil
		def uploadedFile = request.getFile('fotoPerfil')

		if (uploadedFile.empty){
			docenteInstance.properties = params
			docenteInstance.fotoPerfil = fileInstance
		}else{
			try{
				uploadService.validateImageFileFormat(uploadedFile.originalFilename)
			}catch(Exception e){
				flash.message = e.getCause()?.getMessage()
				render(view: "edit", model: [docenteInstance: docenteInstance])
				return
			}

			docenteInstance.properties = params
		}




		if (!docenteInstance.save(flush: true)) {
			render(view: "edit", model: [docenteInstance: docenteInstance])
			return
		}

		flash.message = message(code: 'docente.updated.message', args: [docenteInstance.toString()])
		redirect(action: "show", id: docenteInstance.id)
	}

	def delete(Long id) {
		def docenteInstance = Docente.get(id)
		if (!docenteInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'docente.label', default: 'Docente'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			docenteInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'docente.label', default: 'Docente'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'docente.label', default: 'Docente'),
				docenteInstance.toString()
			])
			redirect(action: "show", id: id)
		}
	}
}
