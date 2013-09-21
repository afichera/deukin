package com.deukin

import java.util.Map;

class MateriaService {

    def serviceMethod() {

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
			[materiaInstanceList: materias, materiaInstanceTotal: materias.size()]
		}else{
			[materiaInstanceList: Materia.list(params), materiaInstanceTotal: Materia.count()]
		}
	}

}
