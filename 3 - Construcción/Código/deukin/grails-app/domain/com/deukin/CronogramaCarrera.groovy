package com.deukin

import gorm.AuditStamp

/**
 * Representa un Cronograma para Una {@link Carrera} y un {@link CicloLectivo}
 * @author Ale Mobile
 *
 */
@AuditStamp
class CronogramaCarrera {

	static hasMany = [cursos:Curso, periodosAcademicos:PeriodoAcademico]
	static belongsTo = [planEstudio:PlanEstudio]
	CicloLectivo cicloLectivo
	
	static constraints = {
	}
}
