package com.deukin
/**
 * Representa una relacion de {@link PeriodoAcademico} con un {@link PlanEstudio} y una {@link Materia} dada.
 * @author Ale Mobile
 *
 */
class AsignacionPeriodoMateria {

	Materia materia
	PeriodoAcademico periodo
	static belongsTo = [planEsutdio:PlanEstudio]

	static constraints = {
		//La unicidad son materia, periodo, planEstudio
	}
}
