package com.deukin

/**
 * Representa un ciclo de clases.
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class CicloLectivo {

	String codigo
	Date fechaInicio
	Date fechaFin
	static hasMany = [periodosAcademicos:PeriodoAcademico]
		
    static constraints = {
		
    }
}
