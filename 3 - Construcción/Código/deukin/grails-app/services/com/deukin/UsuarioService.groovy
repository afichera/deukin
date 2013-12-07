package com.deukin

import org.apache.commons.lang.exception.ExceptionUtils

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
		try{
			UsuarioRol.create(usuario, rol)
			log.info "Se creo el usuario: $username"			
		}catch(Exception e){
			log.error 'Ocurrió un error al intentar crear el usuario. Detalle: '+ExceptionUtils.getRootCauseStackTrace(e)
			throw new BusinessException("Ocurrió un error al intentar crear el usuario. Detalle: "+ExceptionUtils.getRootCauseMessage(e))		
		}
		
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
	
	def obtenerUsuariosLikeQueryRegex(def queryRegex){
		def usuarios
		def usuariosResultantes = []
		usuarios = Usuario.list()
		for (usuario in usuarios) {
			if(usuario.username.toUpperCase().contains(queryRegex.toUpperCase())){
				usuariosResultantes.add(usuario)
			}
		}
		usuariosResultantes
	}
}
