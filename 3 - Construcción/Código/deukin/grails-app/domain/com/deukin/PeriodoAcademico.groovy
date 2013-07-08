package com.deukin

/**
 * Representa una unidad de tiempo de cursada ej: Cuatrimestral, BiMestral, Etc.
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class PeriodoAcademico {

	TipoPeriodoAcademico tipoPeriodoAcademico
	Integer cantidadSemanas	
	Date fechaInicioPeriodo
	Date fechaFinPeriodo
	Date fechaInicioInscripcion
	Date fechaFinInscripcion
	
	static belongsTo = [CicloLectivo]
	
    static constraints = {
    }
}
