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
	//TODO: Ver que atributos faltarían
    static constraints = {
		nombre(unique:true, maxSize:200)
		departamentos nullable:true
    }
}
