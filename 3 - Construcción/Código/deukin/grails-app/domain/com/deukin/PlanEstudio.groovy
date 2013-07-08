package com.deukin


/**
 * Representa un plan de estudio para una {@link Carrera}
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class PlanEstudio {

	//La cantidad de Hs del plan es calculada por las materias.
	Integer cantidadPeriodosAcademicos
	
	//Las validaciones son 1) que exista una correlativa cargada, y luego que ademas valide si esta en un cuatri previo.	
	static hasMany = [asignacionesPeriodosMaterias:AsignacionPeriodoMateria]
	//tiene que validar que el periodo no este lleno.
	
    static constraints = {
    }
}
