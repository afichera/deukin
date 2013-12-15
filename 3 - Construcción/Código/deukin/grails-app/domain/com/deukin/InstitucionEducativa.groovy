package com.deukin

/**
 * 
 * @author Ale Mobile
 *
 */
class InstitucionEducativa {
	
	String nombre	
	static hasMany = [departamentos:Departamento, autoridades:Autoridad]
	Contacto contacto
    static constraints = {
		nombre(unique:true, maxSize:200)		
    }
}
