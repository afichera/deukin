package com.deukin
/**
 * Representa un Nombramiento de docente
 * @author Ale Mobile
 *
 */
class Nombramiento {
	
	Date fecha
	String cargo 
	String observaciones
	static belongsTo = [docente:Docente]
	//TODO: Ver que otros atributos van.
	
    static constraints = {
		cargo maxLength:100
    }
}
