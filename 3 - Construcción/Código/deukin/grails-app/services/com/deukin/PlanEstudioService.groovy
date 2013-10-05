package com.deukin
/**
 * Representa los Servicios para Planes de Estudio.
 * @author Ale Mobile
 *
 */
class PlanEstudioService {

	def usuarioService
	
    def serviceMethod() {

    }
	
	def getPlanesEstudioLikeParamsAndCoordinadorUser(def texto, def userLogued){
		def authorities =  userLogued.authorities
		def usuarioDeukin = usuarioService.obtenerUsuario(userLogued)
		def filtrarPlanes = usuarioService.poseeElRol(authorities, 'ROLE_COORDINADOR')
		def carreras = []
		def planes = []
		if(filtrarPlanes){
			def persona = Persona.findByUsuario(usuarioDeukin)
			carreras = Carrera.findAllByCoordinadorAndTituloLike(persona, texto)
		}else{
			carreras = Carrera.findAll { carrera -> titulo =~ texto }
		}
		planes = PlanEstudio.findAllByCarreraInList(carreras)
	}	
}
