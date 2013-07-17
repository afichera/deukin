package com.deukin

import org.jfree.data.time.Hour
/**
 * 
 * @author Ale Mobile
 *
 */
class Turno {
	
	String codigo
	Hour horaSemanaDesde
	Hour horaSemanaHasta
	Hour horaSabadoDesde
	Hour horaSabadoHasta	
	
    static constraints = {
		codigo(unique:true, maxLength:20)
    }
}
