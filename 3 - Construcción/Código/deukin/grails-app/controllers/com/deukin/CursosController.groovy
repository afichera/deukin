package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
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
		params.max = Math.min(max ?: 10, 100)
		[configuracionCursoDiaInstanceList: ConfiguracionCursoDia.list(params), configuracionCursoDiaInstanceTotal: ConfiguracionCursoDia.count()]
	}
	
	
}
