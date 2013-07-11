package com.deukin

/**
 * Representa el Curriculum de una Persona
 * @author Ale Mobile
 *
 */
class Curriculum {
	
	String titulo
	static hasMany = [educaciones:EducacionAdquirida, experiencias:ExperienciaLaboral, aptitudes:Aptitud]
    
	static constraints = {
		titulo(maxSize:200)		
    }
}
