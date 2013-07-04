package com.deukin

import gorm.AuditStamp
/**
 * Representa un ciclo de clases.
 * @author Ale Mobile
 *
 */
@AuditStamp
class CicloLectivo {

	String codigo
	Date fechaInicio
	Date fechaFin
	static hasMany = [periodosAcademicos:PeriodoAcademico]
		
    static constraints = {
		
    }
}
