package com.deukin

class PersonaService {

	def usuarioService
	
    def serviceMethod() {

    }
	
 	def findByUser(def usuarioLogueado){
		 def usuario = usuarioService.obtenerUsuario(usuarioLogueado)
		 def persona
		 if(usuario){
			 persona = Persona.findByUsuario(usuario)
		 }
		 persona
	}
}
