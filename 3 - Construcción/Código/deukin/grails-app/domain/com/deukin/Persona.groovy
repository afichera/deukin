package com.deukin


/**
 * Representa una Persona
 * @author Ale Mobile
 *
 */
class Persona {
	
	String nombre
	String apellido
	Documento documento
	Contacto contacto	
	static hasMany = [curriculums:Curriculum]
	Usuario usuario

    static constraints = {
		usuario nullable: true
		
    }
	
	static mapping = {
		tablePerHierarchy true
	}
}
