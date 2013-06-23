package com.deukin

import gorm.AuditStamp
/**
 * Representa a un tipo de recurso, ej: Proyector, Silla, etc
 * @author Ale Mobile
 *
 */
@AuditStamp
class TipoRecurso {
	
	String descripcion
	
    static constraints = {
		descripcion nullable:false, unique:true 
    }
}
