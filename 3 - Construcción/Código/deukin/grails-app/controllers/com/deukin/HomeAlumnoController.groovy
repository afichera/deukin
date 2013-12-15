package com.deukin
import grails.plugins.springsecurity.Secured

@Secured('ROLE_ALUMNO')
class HomeAlumnoController {
	def springSecurityService
	def usuarioService
	
    def index() { }
	
	def misDatos(){
		def usuario = usuarioService.obtenerUsuario(springSecurityService.principal)
		if(usuario){
			def alumno = Alumno.findByUsuario(usuario)
			if(alumno){
				redirect(controller: "alumno", action: "show", id: alumno.id)
				return
			}
		}
	}
	
}
