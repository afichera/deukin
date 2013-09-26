

package com.deukin

class CarreraService {

	def usuarioService
	
    def serviceMethod() {

    }
	
	def listaCarrerasMostrar(String authorities, usuario){
		def filtrarCarrera = false
		def materias
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarCarrera = true
			}
		}
		if(filtrarCarrera){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def carreras = Carrera.findAllByCoordinador(persona)
			
		}else{
			def carreras = Carrera.all			
		}
	}
	
	def getCarrerasLikeParamsAndCoordinadorUser(def texto, def userLogued){
		def authorities =  userLogued.authorities
		def usuarioDeukin = usuarioService.obtenerUsuario(userLogued)
		def filtrarCarreras = usuarioService.poseeElRol(authorities, 'ROLE_COORDINADOR')
		def carreras				
		if(filtrarCarreras){
			def persona = Persona.findByUsuario(usuarioDeukin)
			carreras = Carrera.findAllByCoordinadorAndTituloLike(persona, texto)
		}else{
			carreras = Carrera.findAll { carrera -> titulo =~ texto }
		}
		carreras
	}
	
	
}
