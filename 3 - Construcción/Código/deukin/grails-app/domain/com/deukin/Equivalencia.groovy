package com.deukin
/**
 * Representa una configuración de Equivalencia entre {@link Materia}
 * La colección representa las que equivalen a la Instancia.
 * @author Ale Mobile
 *
 */
class Equivalencia {

	Materia materia
	static hasMany = [equivalentes:Materia]
	
    static constraints = {
		materia(unique:true, nullable:true)
    }
}
