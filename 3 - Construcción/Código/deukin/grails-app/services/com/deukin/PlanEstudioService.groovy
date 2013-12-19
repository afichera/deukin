package com.deukin


/**
 * Representa los Servicios para {@link PlanEstudio}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class PlanEstudioService {

	def usuarioService

	/**
	 * Obtiene una lista de {@link PlanEstudio} segun usuario coordinador logueado y texto recibido.
	 * @param texto
	 * @param userLogued
	 * @return
	 */
	def getPlanesEstudioLikeParamsAndCoordinadorUser(String texto, def userLogued){
		def authorities =  userLogued.authorities
		def usuarioDeukin = usuarioService.obtenerUsuario(userLogued)
		def filtrarPlanes = usuarioService.poseeElRol(authorities, 'ROLE_COORDINADOR')
		def carreras = []
		def filtrados
		def planes

		if(filtrarPlanes){
			def persona = Persona.findByUsuario(usuarioDeukin)
			def coordinador = Coordinador.findByUsuario(usuarioDeukin)
			def carreraCoordinador = coordinador?.carrera
			carreras.add(carreraCoordinador)
		}else{
			carreras = Carrera.all
		}
		if(carreras){
			planes = PlanEstudio.findAllByCarreraInList(carreras)
			filtrados = PlanEstudio.findAllByCarreraInList(carreras)
			Carrera carreraAux2
			
			for (planEstudio in planes) {
				carreraAux2 = planEstudio.carrera
				if(!(planEstudio.identificacion.toUpperCase().contains(texto.toUpperCase()))
				&& !(carreraAux2.titulo.toUpperCase().contains(texto.toUpperCase()))
				){
					filtrados.remove(PlanEstudio.get(planEstudio.id))
				}
			}
			filtrados
		}
		filtrados
		
	}
	
	/**
	 * Obtiene la lista de {@link Correlatividad} para un {@link PlanEstudio} recibido.
	 * @param planEstudio
	 * @return
	 */
	def obtenerCorrelatividades(PlanEstudio planEstudio) {
		def correlatividadesTodas = Correlatividad.findAll()
		def correlatividades = []
		for (correlatividadInstance in correlatividadesTodas) {
			if (correlatividadInstance.materiaPrincipal.planEstudio==planEstudio) {
				correlatividades.add(correlatividadInstance)
			}
			
		}
		correlatividades
	}
}
