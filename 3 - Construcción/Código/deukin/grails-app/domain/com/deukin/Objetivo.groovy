package com.deukin
/**
 * Creada para persistir una Lista de Objetivos asociado a una Materia
 * @author Ale Mobile
 *
 */
class Objetivo {
	String descripcion
	static belongsTo = [materia:Materia]
    static constraints = {
		descripcion blank:false
    }
	
	String toString(){
		descripcion maxSize:200, blank:false
	}
}
