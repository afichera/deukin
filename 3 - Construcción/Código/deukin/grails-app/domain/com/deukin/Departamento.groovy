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

	static hasMany = [carreras:Carrera, autoridades:Autoridad]
	static belongsTo = [institucionEducativa:InstitucionEducativa]	
	
    static constraints = {
    }
}
