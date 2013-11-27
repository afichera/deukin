package com.deukin


/**
 * Representa un Curso especifico para una materia x cronograma y turno de un año x.
 * @author Ale Mobile
 *
 */
class Curso {

	//Tengo dudas si el belongsTo se puede aplicar a 2 al mismo tiempo.
	String codigo
	static belongsTo = [materia:Materia, cronogramaCarrera:CronogramaCarrera]		
	static hasMany = [configuracionesCursoDia:ConfiguracionCursoDia]
	Turno turno
	EstadoCurso estadoCurso
	PeriodoAcademico periodoAcademico
	
    static constraints = {
		codigo(unique:['cronogramaCarrera', 'materia', 'turno'], maxSize:20)
    }
	
}
