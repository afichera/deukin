package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_DOCENTE','ROLE_ALUMNO','ROLE_ADMINISTRADOR_SISTEMA' ])
class CurriculumAdjuntoController {

	static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

	def index() {
		redirect(action: "list", params: params)
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		[curriculumAdjuntoInstanceList: CurriculumAdjunto.list(params), curriculumAdjuntoInstanceTotal: CurriculumAdjunto.count()]
	}

	def create() {
		Persona persona = Persona.get(params.persona.id)
		def curriculumAdjunto = new CurriculumAdjunto()
		curriculumAdjunto.persona = persona
		[curriculumAdjuntoInstance: curriculumAdjunto]
	}



	def save() {
		def curriculumAdjuntoInstance = new CurriculumAdjunto(params)
		def file = params.archivo
		curriculumAdjuntoInstance.archivo = file.getBytes()
		curriculumAdjuntoInstance.nombreArchivo = file.originalFilename
		curriculumAdjuntoInstance.tipoArchivo = file.contentType

		if (!curriculumAdjuntoInstance.save(flush: true)) {
			render(view: "create", model: [curriculumAdjuntoInstance: curriculumAdjuntoInstance])
			return
		}

		flash.message = message(code: 'default.adjuntado.message', args: [
			message(code: 'curriculumAdjunto.created.message', default: 'Curriculum Adjunto'),
			curriculumAdjuntoInstance.nombreArchivo
		])
		if(curriculumAdjuntoInstance.persona instanceof Alumno){
			redirect(controller:"alumno", action: "show", id: curriculumAdjuntoInstance.persona.id)
		}
		if(curriculumAdjuntoInstance.persona instanceof Docente){
			redirect(controller:"docente", action: "show", id: curriculumAdjuntoInstance.persona.id)
		}
	}

	def showArchivo() {
		def curriculumAdjuntoInstance = CurriculumAdjunto.get(params.id)
		def file = curriculumAdjuntoInstance.nombreArchivo
		response.setHeader("Content-disposition", "attachment;filename=${file}")
		response.outputStream << curriculumAdjuntoInstance.archivo
		response.outputStream.flush()
	}

	def show(Long id) {
		def curriculumAdjuntoInstance = CurriculumAdjunto.get(id)
		if (!curriculumAdjuntoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto'),
				id
			])
			redirect(action: "list")
			return
		}

		[curriculumAdjuntoInstance: curriculumAdjuntoInstance]
	}

	def edit(Long id) {
		def curriculumAdjuntoInstance = CurriculumAdjunto.get(id)
		if (!curriculumAdjuntoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto'),
				id
			])
			redirect(action: "list")
			return
		}

		[curriculumAdjuntoInstance: curriculumAdjuntoInstance]
	}

	def update(Long id, Long version) {
		def curriculumAdjuntoInstance = CurriculumAdjunto.get(id)
		if (!curriculumAdjuntoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (curriculumAdjuntoInstance.version > version) {
				curriculumAdjuntoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')] as Object[],
						"Another user has updated this CurriculumAdjunto while you were editing")
				render(view: "edit", model: [curriculumAdjuntoInstance: curriculumAdjuntoInstance])
				return
			}
		}

		curriculumAdjuntoInstance.properties = params

		if (!curriculumAdjuntoInstance.save(flush: true)) {
			render(view: "edit", model: [curriculumAdjuntoInstance: curriculumAdjuntoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto'),
			curriculumAdjuntoInstance.id
		])
		redirect(controller:"alumno", action: "show", id: curriculumAdjuntoInstance.id)
	}

	def delete(Long id) {
		def curriculumAdjuntoInstance = CurriculumAdjunto.get(id)
		def persona = Persona.get(params.persona.id)
		def origen 
		def nombreArchivo
		
		if (!curriculumAdjuntoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto'),
				id
			])
			redirect(action: "list")
			return
		}
		
		nombreArchivo = curriculumAdjuntoInstance.nombreArchivo
		
		if(persona instanceof Docente){
			origen = "docente"
		}else if(persona instanceof Alumno){
			origen = "alumno"
		}
		
		try {
			curriculumAdjuntoInstance.delete(flush: true)

			
		}catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto'),
				id
			])
			redirect(controller: origen , action: "show", id: persona.id)
		}
		
		flash.message = message(code: 'curriculumAdjunto.deleted.message')
		redirect(controller: origen , action: "show", id: persona.id)		
	}
}
