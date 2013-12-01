package com.deukin


/**
 * 
 * @author Ale Mobile
 *
 */
class Turno {
	
	String codigo
	Integer horaSemanaDesde
	Integer horaSemanaHasta
	Integer horaSabadoDesde
	Integer horaSabadoHasta	
	
    static constraints = {
		codigo(unique:true, maxSize:20)
    }
	
	String toString() {
	codigo	
	}
}
