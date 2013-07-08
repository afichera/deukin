package com.deukin

class AsignacionPeriodoMateria {
	
	Materia materia
	PeriodoAcademico periodo
	static belongsTo = [planEsutdio:PlanEstudio]
	
    static constraints = {
		//La unicidad son materia, periodo, planEstudio
    }
}
