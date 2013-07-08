package com.deukin

/**
 * Representa a un Departamento dentro de la Insitucion
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class Departamento {
	
	String nombre
	String vision
	String mision
	Contacto contacto
	//TODO: Hacer Clase Autoridad para remplazar por persona con el cargo
	static hasMany = [carreras:Carrera, autoridades:Persona]
	static belongsTo = [institucionEducativa:InstitucionEducativa]	
	
    static constraints = {
    }
}
