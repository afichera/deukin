package com.deukin

import java.util.Date

/**
 * Representa una unidad de tiempo de cursada ej: Cuatrimestral, BiMestral, Etc.
 * @author Ale Mobile
 *
 */
class PeriodoAcademico {

	TipoPeriodoAcademico tipoPeriodoAcademico
	Integer cantidadSemanas	
	Date fechaInicioPeriodo
	Date fechaFinPeriodo
	
	static belongsTo = [cicloLectivo:CicloLectivo]
	
    static constraints = {
		
    }
	
	
	
}
