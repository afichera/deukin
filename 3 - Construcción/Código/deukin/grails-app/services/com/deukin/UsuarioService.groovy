package com.deukin

import com.deukin.exceptions.BusinessException

/**
 * Representa los servicios expuestos para un {@link Usuario}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class UsuarioService {

	def springSecurityService
	
	/**
	 * Crea un {@link Usuario} segun los parametros de entrada.
	 * @param username
	 * @param password
	 * @param role
	 * @return
	 */
	Usuario crear (String username, String password, String role){
		def rol = Rol.findByAuthority(role)
		if(rol==null){
			throw new BusinessException('Rol Inexistente')
		}
		Usuario usuario = new Usuario(username: username, password: password, enabled: true)
		usuario = usuario.save()
		try{
			UsuarioRol.create(usuario, rol)
			log.info 'Se creo el usuario: '+username			
		}catch(Exception e){
			log.error 'Ocurrió un error al intentar crear el usuario. Detalle: '+e.getCause()?.getMessage()
			throw new BusinessException('Ocurrió un error al intentar crear el usuario. Detalle: '+e.getCause()?.getMessage())		
		}
		
		usuario
	}
	
	/**
	 * Obtiene un {@link Usuario} segun de un usuario logueado del contexto de la session de Spring Security
	 * @param usuarioLogueado
	 * @return
	 */
	def obtenerUsuario(def usuarioLogueado) {
		def username = usuarioLogueado?.getUsername()
		def usuarioDeukin = Usuario.findByUsername(username)
		usuarioDeukin
	}
	
	
	/**
	 * Devuelve un {@link Usuario} segun su usermane
	 * @param userName
	 * @return
	 */
	def obtenerUsuarioByUserName(def userName) {		
		def usuarioDeukin = Usuario.findByUsername(userName)
		usuarioDeukin
	}
	
	/**
	 * Devuelve un booleano que indica si posee el rol
	 * @param authorities
	 * @param rolBuscado
	 * @return
	 */
	def poseeElRol(def authorities, def rolBuscado){
		def flag = false
		for (auto in authorities){
			if(auto.role.equals(rolBuscado) ){
				flag = true
			}
		}
		flag
	}
	
	/**
	 * Obtiene una llista de {@link Usuario} segun el nombre del rol recibido
	 * @param rolBuscado
	 * @return
	 */
	def obtenerUsuariosPorRol(def rolBuscado){
		def usuarios = []
		def rol = Rol.findByAuthority(rolBuscado)
		if(!rol){
			throw new BusinessException('El rol '+rolBuscado+ 'no existe en el sistema. Contactese con el administrador.')
		}
		usuarios = UsuarioRol.findAllByRol(rol).usuario
		usuarios
		
	}
	
	
	/**
	 * Devuelve un booleano que indica si el id recibido corresponde al {@link Usuario} 
	 * logueado en el sistema. 
	 * @param id
	 * @return
	 */
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
	
	/**
	 * Obtiene una lista de {@link Usuario} segun texto recibido.
	 * @param queryRegex
	 * @return
	 */
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
