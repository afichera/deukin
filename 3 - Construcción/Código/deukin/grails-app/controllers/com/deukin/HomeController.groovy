package com.deukin

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ALUMNO','ROLE_DOCENTE','ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_ADMINISTRADOR_SISTEMA'])
class HomeController {
	
	def springSecurityService
	
	def go (){
		def authorities =  springSecurityService.principal.authorities
		int tipoUsuario = 0
		for (auto in authorities){
			if(auto.role.equals('ROLE_ALUMNO') ){
				if(tipoUsuario < 1){
					tipoUsuario = 1
				}
				
			}
			if(auto.role.equals('ROLE_DOCENTE') ){				
				if(tipoUsuario<2){
					tipoUsuario = 2
				}
			}
			if(auto.role.equals('ROLE_COORDINADOR') ){				
				if(tipoUsuario <3){
					tipoUsuario = 3
				}
			}
			if(auto.role.equals('ROLE_ADMINISTRATIVO') ){
				if(tipoUsuario <4){
					tipoUsuario = 4
				}
			}
			if(auto.role.equals('ROLE_ADMINISTRADOR_SISTEMA') ){
				if(tipoUsuario <5){
					tipoUsuario = 5
				}
			}
		}
		
		switch (tipoUsuario) {
		case 1:
			redirect(controller: 'homeAlumno', action: 'index')
			break;
		case 2:
			redirect(controller: 'homeDocente', action: 'index')
			break;		
		case 3:
			redirect(controller: 'homeCoordinador', action: 'index')
			break;
		case 4:
			redirect(controller: 'homeAdministrativo', action: 'index')
			break;
		case 5:
			redirect(controller: 'homeAdministradorSistema', action: 'index')
			break;
		
		}
		
		
	}

}

