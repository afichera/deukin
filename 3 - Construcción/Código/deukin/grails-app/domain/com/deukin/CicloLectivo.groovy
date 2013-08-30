package com.deukin

import java.util.Date

/**
 * Representa un ciclo de clases.
 * @author Ale Mobile
 *
 */
class CicloLectivo {

	String codigo
	Date fechaInicio
	Date fechaFin
	static hasMany = [periodosAcademicos:PeriodoAcademico]
		
    static constraints = {
		codigo(maxSize:50, unique:true)
    }
}
