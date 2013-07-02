package com.deukin

import gorm.AuditStamp

/**
 * Representa un Curso especifico para una materia x cronograma y turno.
 * @author Ale Mobile
 *
 */
@AuditStamp
class Curso {

	static belongsTo = [materia:Materia, cronogramaCarrera:CronogramaCarrera]
	static hasMany = [docentes:Docente, recursosFijos:Recurso]
	Turno turno
	EspacioFisico espacioFisico
	
	
    static constraints = {
    }
}
