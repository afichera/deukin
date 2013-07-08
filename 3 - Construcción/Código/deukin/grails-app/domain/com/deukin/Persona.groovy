package com.deukin

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
	Curriculum curriculum
	Usuario usuario

    static constraints = {
    }
}
