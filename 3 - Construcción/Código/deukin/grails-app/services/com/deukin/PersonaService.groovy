package com.deukin
/**
 * Representa los servicios expuestos de {@link Persona}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class PersonaService {

	def usuarioService

	/**
	 * Busca y devuelve la persona asociada al {@link Usuario} recibido por parametro.
	 * @param usuarioLogueado
	 * @return
	 */
 	def findByUser(def usuarioLogueado){
		 def usuario = usuarioService.obtenerUsuario(usuarioLogueado)
		 def persona
		 if(usuario){
			 persona = Persona.findByUsuario(usuario)
		 }
		 persona
	}
}
