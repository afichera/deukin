package com.deukin

/**
 * Representa a un Departamento dentro de la Insitucion
 * @author Ale Mobile
 *
 */

class Departamento {
	
	String nombre
	String vision
	String mision
	Contacto contacto

	static hasMany = [carreras:Carrera, autoridades:Autoridad, docentes:Docente]
		
    static constraints = {
		nombre(unique:true, maxSize:200)
		mision(nullable:true, maxSize:5000)
		vision(nullable:true, maxSize:5000)
		contacto(nullable:true)
    }
	
	String toString(){
		nombre
	}
}
