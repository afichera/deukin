package com.deukin

import com.deukin.exceptions.BusinessException

class UsuarioService {

    def serviceMethod() {

    }
	
	Usuario crear (String username, String password, String role){
		def rol = Rol.findByAuthority(role)
		if(rol==null){
			throw new BusinessException("Rol Inexistente")
		}
		Usuario usuario = new Usuario(username: username, password: password, enabled: true)
		usuario = usuario.save()
		UsuarioRol.create(usuario, rol)
		usuario
	}
	
	def obtenerUsuario(def usuarioLogueado) {
		def username = usuarioLogueado?.getUsername()
		def usuarioDeukin = Usuario.findByUsername(username)
		usuarioDeukin
	}
	
	def obtenerUsuarioByUserName(def userName) {		
		def usuarioDeukin = Usuario.findByUsername(userName)
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
