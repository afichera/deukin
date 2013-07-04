package com.deukin

import gorm.AuditStamp;

/**
 * Representa un plan de estudio para una {@link Carrera}
 * @author Ale Mobile
 *
 */
@AuditStamp
class PlanEstudio {

	//TODO:Ver si la carga Horaria es algo calculado, ver si hay que cambiar el requerimiento.
	Integer cargaHoraria
	
    static constraints = {
    }
}
