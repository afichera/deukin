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
	
	def listaPlanesEstudioMostrar(String authorities, usuario){
		def filtrarPlanes = false
		def materias
		def planesMostrar = []
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarPlanes= true
			}
		}
		if(filtrarPlanes){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def carreras = Carrera.findAllByCoordinador(persona)
			planesMostrar = PlanEstudio.findAllByCarrerasInList(carreras)
			
		}else{
			planesMostrar = PlanEstudio.all
		}
		
	}
}
