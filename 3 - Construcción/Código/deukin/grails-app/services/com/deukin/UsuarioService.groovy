package com.deukin

class UsuarioService {

    def serviceMethod() {

    }
	
	def obtenerUsuario(def usuarioLogueado) {
		def username = usuarioLogueado?.getUsername()
		def usuarioDeukin = Usuario.findByUsername(username)
		usuarioDeukin
	}
	
	def poseeElRol(def authorities, def rolBuscado){
		def flag = false
		for (auto in authorities){
			if(auto.role.equals(rolBuscado) ){
				flag = true
			}
		}
		flag
	}

}
