package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;
@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_DOCENTE', 'ROLE_ADMINISTRADOR_SISTEMA'])

class CursosController {
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def index() {
		redirect(action: "list", params: params)
	}
	
	def create() {
		[cursoInstance: new Curso(params),configuracionCursoDiaInstance: new ConfiguracionCursoDia(params)]
	}
	
	def list(Integer max) {
		
		
		if (!params.planEstudio||!params.cicloLectivo)
		{params.max =10}
		else if (params.planEstudio.id!="undefined"&&params.cicloLectivo.id!="undefined")
		{params.max =10}
		
		[configuracionCursoDiaInstanceList: ConfiguracionCursoDia.list(params), configuracionCursoDiaInstanceTotal: ConfiguracionCursoDia.count()]
	}

	
	def save() {
		def cursoInstance = new Curso(params)
		if (!cursoInstance.save(flush: true)) {
			render(view: "create", model: [cursoInstance: cursoInstance])
			return
		}
		
		params.curso = cursoInstance
		
		def configuracionCursoDiaInstance = new ConfiguracionCursoDia(params)
		if (!configuracionCursoDiaInstance.save(flush: true)) {
			render(view: "create", model: [configuracionCursoDiaInstance: configuracionCursoDiaInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])
		redirect(action: "show", id: cursoInstance.id)
	}
	
	
	def show(Long id) {
		def cursoInstance = Curso.get(id)
		if (!cursoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), id])
			redirect(action: "list")
			return
		}

		[cursoInstance: cursoInstance]
	}

}
