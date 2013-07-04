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
	//TODO: Hacer Clase Autoridad para remplazar por persona con el cargo
	static hasMany = [carreras:Carrera, autoridades:Persona]
	static belongsTo = [institucion:Institucion]	
	
    static constraints = {
    }
}
