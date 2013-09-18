package com.deukin
/**
 * Representa una configuración entre Materia principal y las predecesoras coorrelativas.
 * @author Ale Mobile
 *
 */
class Correlatividad {
	Materia materia
	static hasMany = [predecesoras:Materia]
    static constraints = {
		materia (unique:true, nullable:false)
    }
}
