

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
	

	
	
}
