package com.deukin

/**
 * Representa a un tipo de recurso, ej: Proyector, Silla, etc
 * @author Ale Mobile
 *
 */
class TipoRecurso {
	
	String descripcion
	
    static constraints = {
		descripcion nullable:false, unique:true 
    }
}
