package com.deukin


/**
 * Representa un plan de estudio para una {@link Carrera}
 * @author Ale Mobile
 *
 */
class PlanEstudio {

	String identificacion
	//La cantidad de Hs del plan es calculada por las materias.
	Integer cantidadPeriodosAcademicos
	EstadoDeCreacion estado
	//Las validaciones son 1) que exista una correlativa cargada, y luego que ademas valide si esta en un cuatri previo.	
	static hasMany = [materias:Materia]
	//tiene que validar que el periodo no este lleno.
	static belongsTo = [carrera : Carrera]

    static constraints = {
		 identificacion unique:true, nullable:false, blank:false, maxSize:50
		 cantidadPeriodosAcademicos (nullable:true, min:1, max:20,maxSize:2) 
		 materias nullable:true
		 
		
    }
	
	String toString(){
		identificacion  + '- '+ carrera
	}
	
	String toStringAutocomplete(){
		identificacion  + ' - '+ carrera?.titulo
	}
	
}
