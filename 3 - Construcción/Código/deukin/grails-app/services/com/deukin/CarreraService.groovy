

package com.deukin


class CarreraService {

	def usuarioService
	
    def serviceMethod() {

    }
	
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
