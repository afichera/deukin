package com.deukin

import com.deukin.exceptions.BusinessException

class UsuarioService {

	def springSecurityService
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
	
	def obtenerUsuariosPorRol(def rolBuscado){
		def usuarios = []
		def rol = Rol.findByAuthority(rolBuscado)
		if(!rol){
			throw new BusinessException("El rol "+rolBuscado+" no existe en el sistema. Contactese con el administrador.")
		}
		usuarios = UsuarioRol.findAllByRol(rol).usuario
		usuarios
		
	}
	
	
	def esElUsuarioLogueado(Long id){
		def esElUsuarioLogueado = false
		def usuarioLogueado = obtenerUsuario(springSecurityService.principal)
		def persona = Persona.findByUsuario(usuarioLogueado)
		if(persona?.id == id){
			esElUsuarioLogueado = true
		}else{
			esElUsuarioLogueado = false
		}
		esElUsuarioLogueado
	}
}
