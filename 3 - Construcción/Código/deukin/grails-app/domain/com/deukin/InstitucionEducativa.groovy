package com.deukin

/**
 * Representa a la institución educativa en la cual se utiliza el sistema
 * @author Ale Mobile
 * @since 19/12/2013
 */
class InstitucionEducativa {
	
	String nombre	
	static hasMany = [departamentos:Departamento, autoridades:Autoridad]
	Contacto contacto
    static constraints = {
		nombre(unique:true, maxSize:200)		
    }
}
