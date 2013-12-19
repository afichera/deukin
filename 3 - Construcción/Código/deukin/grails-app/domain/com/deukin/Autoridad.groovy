package com.deukin

/**
 * Representa una autoridad de la institución
 * @author Ale Mobile
 * @since 19/12/2013
 */
class Autoridad {
	
	Persona persona
	String cargo
	
    static constraints = {
		persona(unique:true)
		cargo maxSize:100
    }
}
