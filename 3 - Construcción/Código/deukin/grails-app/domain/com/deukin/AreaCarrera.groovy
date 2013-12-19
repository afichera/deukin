package com.deukin
/**
 * Representa el area a la cual corresponde una carrera.
 * @author Ale Mobile
 * @since 19/12/2013
 */
class AreaCarrera {

	def nombre	
	AreaCarrera areaMadre	
	
    static constraints = {
		nombre blank:false, maxSize:100
		areaMadre nullable:true
    }
}
