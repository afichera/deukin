package com.deukin
/**
 * Representa una relacion de {@link PeriodoAcademico} con un {@link PlanEstudio} y una {@link Materia} dada.
 * @author Ale Mobile
 *
 */
class AsignacionPeriodoMateria {

	Materia materia
	PeriodoDedicacion periodo
	static belongsTo = [planEstudio:PlanEstudio]

	static constraints = {
		//TODO:La unicidad son materia, periodo, planEstudio
		materia(unique:['periodo', 'planEstudio'])
	}
}
