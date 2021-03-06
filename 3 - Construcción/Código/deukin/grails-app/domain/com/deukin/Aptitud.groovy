package com.deukin


/**
 * Representa una aptitud de una persona. Ej: Curso Redes, Java, .Net
 * @author Ale Mobile
 *
 */
class Aptitud {
	
	String titulo
	String descripcion
    NivelAdquirido nivelAdquirido
	
	static constraints = {
    	titulo (unique: true, maxSize:100)
		descripcion nullable:true
	}
}
