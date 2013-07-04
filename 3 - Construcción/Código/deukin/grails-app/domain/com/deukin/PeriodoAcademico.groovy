package com.deukin

import gorm.AuditStamp

/**
 * Representa una unidad de tiempo de cursada ej: Cuatrimestral, BiMestral, Etc.
 * @author Ale Mobile
 *
 */
@AuditStamp
class PeriodoAcademico {

	TipoPeriodoAcademico tipoPeriodoAcademico
	Integer cantidadSemanas	
	Date fechaInicio
	Date fechaFin
	////TODO: Falta agregar lo que tienen que ver con las fechas de inscripcion/etc de las cuatrimestrales/anuales
	static belongsTo = [CicloLectivo]
	
    static constraints = {
    }
}
