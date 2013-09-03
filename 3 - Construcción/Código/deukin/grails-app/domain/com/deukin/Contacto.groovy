package com.deukin

/**
 * Representa los Datos de Contacto de una Persona, etc.
 * @author Ale Mobile
 *
 */
class Contacto {
	
	Domicilio domicilio
	static hasMany = [telefonos:Telefono]
	static belongsTo = [Persona, Departamento]
    static constraints = {
    }
}
