package com.deukin

import gorm.AuditStamp
/**
 * Representa un ciclo de clases, que puede ser cuatrimestral o anual dependiendo su configuracion
 * @author Ale Mobile
 *
 */
@AuditStamp
class CicloLectivo {

	Date fechaInicio
	Date fechaFin
	TipoCicloLectivo tipoCicloLectivo
	
    static constraints = {
		
    }
}
