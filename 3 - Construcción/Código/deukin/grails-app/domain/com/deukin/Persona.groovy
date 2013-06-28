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
	Domicilio domicilio
	Curriculum curriculum
	static hasMany = [telefonos:Telefono]

    static constraints = {
    }
}
