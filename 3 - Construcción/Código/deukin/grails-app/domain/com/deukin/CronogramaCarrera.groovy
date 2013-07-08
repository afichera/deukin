package com.deukin

/**
 * Representa un Cronograma para Una {@link Carrera} y un {@link CicloLectivo}
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class CronogramaCarrera {

	static hasMany = [cursos:Curso, periodosAcademicos:PeriodoAcademico]
	static belongsTo = [planEstudio:PlanEstudio]
	CicloLectivo cicloLectivo
	
	static constraints = {
	}
}
