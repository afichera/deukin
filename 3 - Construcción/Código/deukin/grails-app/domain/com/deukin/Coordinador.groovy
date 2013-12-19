package com.deukin
/**
 * Representa un Coordinador de una carrera
 * @author Ale Mobile
 * @since 19/12/2013
 */
class Coordinador extends Persona {
	
	Boolean coordinadorGeneral
	Carrera carrera
    static constraints = {
		 carrera nullable:true
    }
}
