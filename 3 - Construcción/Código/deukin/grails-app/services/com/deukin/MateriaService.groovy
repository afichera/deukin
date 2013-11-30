package com.deukin



class MateriaService {

	
	def serviceMethod() {
	}

	def obtenerMateriasCandidatasPredecesorasByQueryRegexAndMateriaPrincipal(def queryRegex, Materia materiaPrincipal){
		def planEstudio = materiaPrincipal.planEstudio
		def materiasDelPlan = Materia.findByPlanEstudio(planEstudio)		
		def materiasMostrar = []			
		def esCodigo = queryRegex.isInteger()
		def codigoNumero
		if(esCodigo){
			codigoNumero = new Integer(queryRegex)
		}

		for (materia in materiasDelPlan) {
			if(esCodigo){
				if((materia.nombre.contains(queryRegex) || 
					(materia.codigo.intValue() == codigoNumero.intValue()))
					 && materia.id != materiaPrincipal.id){
					 materiasMostrar.add(materia)
				}
			}else{
				if(materia.nombre.contains(queryRegex) && materia.id != materiaPrincipal.id){
					materiasMostrar.add(materia)
				}
			}
		}
		materiasMostrar
	}


	public obtenerMateriasDeCoordinador(def authorities, def usuario) {
		def filtrarPlan = false
		def materias
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarPlan = true
			}
		}
		
		if(filtrarPlan){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def coordinador = Coordinador.findByUsuario(usuarioDeukin)						
			def planes = coordinador.carrera.planesEstudio// Carrera.findAllByCoordinadorOrCoordinadoresOperativos(persona, persona).planesEstudio
						
			materias = Materia.findAllByPlanEstudioInList(planes)
		}else{
			materias = Materia.list()
		}
	}
	
	public obtenerMateriasDeCoordinadorLikeQueryRegex(def authorities, def usuario, def queryRegex) {
		def filtrarPlan = false
		def materias
		def materiasResultantes = []
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarPlan = true
			}
		}
		if(filtrarPlan){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def coordinador = Coordinador.findByUsuario(usuarioDeukin)
			
			def planes = coordinador.carrera.planesEstudio
//			def planes = Carrera.findAllByCoordinadorOrCoordinadoresOperativos(persona, persona).planesEstudio
			materias = Materia.findAllByPlanEstudioInList(planes)						
		}else{		
			materias = Materia.list()			
		}
		
		for (materia in materias) {
			if(materia.nombre.toUpperCase().contains(queryRegex.toUpperCase()) || materia.codigo.toString().toUpperCase().contains(queryRegex.toUpperCase())){
				materiasResultantes.add(materia)
			}
		}
		materiasResultantes
	}
	
	def obtenerMateriasLikeQueryRegex(def queryRegex){
		def materias		
		def materiasResultantes = []
		materias = Materia.list()
		for (materia in materias) {
			if(materia.nombre.toUpperCase().contains(queryRegex.toUpperCase()) || materia.codigo.toString().toUpperCase().contains(queryRegex.toUpperCase())){
				materiasResultantes.add(materia)
			}
		}
		materiasResultantes
		
	}
	
	def obtenerEquivalentes(Materia materiaPrincipal) {
		def equivalencias = Equivalencia.findAllByMateriaPrincipal(materiaPrincipal,materiaPrincipal)
		def materiasequivalentes = []
		for (equivalenciaInstance in equivalencias)
		{
			materiasequivalentes.add(equivalenciaInstance.materiaEquivalente)
		}
		materiasequivalentes

	}
	
	def obtenerPredecesoras(Materia materiaPrincipal) {
		def correlatividades = Correlatividad.findAllByMateriaPrincipal(materiaPrincipal)
		def predecesoras = []
		for (correlatividadInstance in correlatividades)
		{
			predecesoras.add(correlatividadInstance.materiaPredecesora)
		}
		predecesoras
	}

}
