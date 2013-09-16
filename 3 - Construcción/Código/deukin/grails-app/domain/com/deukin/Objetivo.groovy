package com.deukin
/**
 * Creada para persistir una Lista de Objetivos asociado a una Materia
 * @author Ale Mobile
 *
 */
class Objetivo {
	String descripcion
	static belongsTo = [materia:Materia]
    static constraints = {
    }
}
