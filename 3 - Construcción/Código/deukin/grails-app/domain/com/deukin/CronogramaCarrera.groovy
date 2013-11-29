package com.deukin


/**
 * Representa un Cronograma para Una {@link Carrera} y un {@link CicloLectivo}
 * @author Ale Mobile
 *
 */
class CronogramaCarrera {

	static hasMany = [cursos:Curso]
	static belongsTo = [planEstudio:PlanEstudio]
	CicloLectivo cicloLectivo
	
	static constraints = {
		cicloLectivo(unique:['planEstudio'])
	}

}
