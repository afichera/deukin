package com.deukin

import grails.persistence.Entity;

/**
 * Representa una Persona
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
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
