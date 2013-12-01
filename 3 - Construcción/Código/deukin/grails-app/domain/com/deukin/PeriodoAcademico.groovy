package com.deukin


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
	
	String toString() {
		fechaInicioPeriodo.getDateString()  +' - '+ fechaFinPeriodo.getDateString() 
	}
	
	
}
