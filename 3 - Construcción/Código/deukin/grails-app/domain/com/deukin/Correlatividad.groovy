package com.deukin
/**
 * Representa una configuración entre Materia principal y las predecesoras coorrelativas.
 * @author Ale Mobile
 *
 */
class Correlatividad {
	Materia materiaPrincipal
	Materia materiaPredecesora
    static constraints = {
		materiaPrincipal(unique:['materiaPredecesora'],nullable:false) 
	
    }
}
