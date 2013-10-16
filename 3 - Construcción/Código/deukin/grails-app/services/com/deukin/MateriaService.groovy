package com.deukin

import javassist.bytecode.stackmap.BasicBlock.Catch;


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


	public obtenerMateriasDeCoordinador(def authorities, def params, def max, def usuario) {
		def filtrarCarrera = false
		def materias
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarCarrera = true
			}
		}
		params.max = Math.min(max ?: 10, 100)
		if(filtrarCarrera){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def carreras = Carrera.findAllByCoordinador(persona)			
			materias = Materia.findAllByCarreraInList(carreras)
		}else{
			materias = Materia.list(params)
		}
	}
	
	public obtenerMateriasDeCoordinadorLikeQueryRegex(def authorities, def usuario, def queryRegex) {
		def filtrarCarrera = false
		def materias
		def materiasResultantes = []
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarCarrera = true
			}
		}
		if(filtrarCarrera){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def carreras = Carrera.findAllByCoordinador(persona)
			materias = Materia.findAllByCarreraInList(carreras)						
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

}
