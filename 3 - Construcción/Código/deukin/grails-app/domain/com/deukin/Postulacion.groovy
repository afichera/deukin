package com.deukin
/**
 * Representa un Postulante ( {@link Persona}) que pretende ser {@link Docente} 
 * para una {@link Materia} 
 * @author Ale Mobile
 *
 */
class Postulacion {

	static belongsTo = [persona:Persona, materia:Materia]	
	String observaciones
	EstadoPostulacion estadoPostulacion

    static constraints = {
		persona(unique:['materia'])
		observaciones nullable:true		  
    }
}
