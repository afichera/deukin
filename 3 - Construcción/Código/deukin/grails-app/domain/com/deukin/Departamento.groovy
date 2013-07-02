package com.deukin

import gorm.AuditStamp

/**
 * Representa a un Departamento dentro de la Insitucion
 * @author Ale Mobile
 *
 */
@AuditStamp
class Departamento {
	
	String nombre
	String vision
	String mision
	Contacto contacto
	
	static hasMany = [carreras:Carrera, autoridades:Persona]
	static belongsTo = [institucion:Institucion]	
	
    static constraints = {
    }
}
