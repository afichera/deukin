

package com.deukin

/**
 * Representa los Servicios expuestos de Carrera
 * @author Ale Mobile
 *
 */
class CarreraService {

	def usuarioService
	
	/**
	 * Devuelve la lista de carreras a mostrar basandose en el usuario y rol logueado
	 * @param authorities
	 * @param usuario
	 * @return
	 */
	def listaCarrerasMostrar(String authorities, usuario){
		def filtrarCarrera = false
		def materias
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarCarrera = true
			}
		}
		if(filtrarCarrera){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def carrera = Coordinador.findByUsuario(usuarioDeukin).carrera			
			
			
		}else{
			def carreras = Carrera.all			
		}
	}
	
	/**
	 * Servicio que busca las carreras del Coordinador y que contengan el texto recibido
	 * @param queryRegex
	 * @param usuarioLogueado
	 * @return
	 */
	def findCarrerasLikeParamasAndCoordinadorUser(queryRegex, usuarioLogueado){		
		def authorities =  usuarioLogueado.authorities
		def usuarioDeukin = usuarioService.obtenerUsuario(usuarioLogueado)
		def filtrarCarreras = usuarioService.poseeElRol(authorities, 'ROLE_COORDINADOR')
		def carreras = []
		if(filtrarCarreras){
			def carrera = Coordinador.findByUsuario(usuarioDeukin).carrera
			
			carreras.add(carrera)
		}else{
			carreras = Carrera.findAll { carrera -> titulo =~ queryRegex }
		}
		carreras
	}
	
	/**
	 * Servicio que devuelve la lista de carreras que contengan el parámetro recibido
	 * @param queryRegex
	 * @return
	 */
	def obtenerCoordinadoresLikeQueryRegex(def queryRegex){
		def coordinadores
		def coordinadoresFiltro = []
		def usuariosRol = []
		usuariosRol = usuarioService.obtenerUsuariosPorRol('ROLE_COORDINADOR')		
		coordinadores = Coordinador.findAllByUsuarioInList(usuariosRol)		
		for (coordinador in coordinadores) {
			if(coordinador.toString().toUpperCase().contains(queryRegex.toUpperCase())){
				coordinadoresFiltro.add(coordinador)
			}
		}
		coordinadoresFiltro
		
	}

	/**
	 * Servicio que devuelve las Correlatividades según la carrera
	 * @param carrera
	 * @return
	 */
	def obtenerCorrelatividades(Carrera carrera) {
		def correlatividadesTodas = Correlatividad.findAll()
		def correlatividades = []
		for (correlatividadInstance in correlatividadesTodas) {
			if (correlatividadInstance.materiaPrincipal.planEstudio.carrera==carrera) {
				correlatividades.add(correlatividadInstance)
			}
			
		}
		correlatividades
	}
	
	
}
