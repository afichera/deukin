package com.deukin
import grails.plugins.springsecurity.Secured

@Secured('ROLE_DOCENTE')
class HomeDocenteController {
	
	def springSecurityService
	def usuarioService
	
    def index() { }
	
	def misDatos(){		
		def usuario = usuarioService.obtenerUsuario(springSecurityService.principal)
		if(usuario){
			def docente = Docente.findByUsuario(usuario)
			if(docente){
				redirect(controller: "docente", action: "show", id: docente.id)
				return
			}
		}
	}
}
