package com.deukin
/**
 * Representa un Objetivo especifico para una {@link Materia}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class ObjetivoEspecifico {
	String descripcion
	static belongsTo = [materia:Materia]
    static constraints = {
		descripcion maxSize:200, blank:false
    }
	
	String toString(){
		descripcion 
	}
}
