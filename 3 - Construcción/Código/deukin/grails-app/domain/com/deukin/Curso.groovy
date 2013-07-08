package com.deukin

/**
 * Representa un Curso especifico para una materia x cronograma y turno de un año x.
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class Curso {

	//Tengo dudas si el belongsTo se puede aplicar a 2 al mismo tiempo.
	static belongsTo = [materia:Materia, cronogramaCarrera:CronogramaCarrera]
	static hasMany = [docentes:Docente, recursosFijos:Recurso]
	Turno turno
	EspacioFisico espacioFisico
	
	
    static constraints = {
    }
}
