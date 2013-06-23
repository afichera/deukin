package com.deukin

import gorm.AuditStamp
/**
 * Representa un recurso en particular.
 * @author Ale Mobile
 *
 */
@AuditStamp
class Recurso {
	
	TipoRecurso tipoRecurso
    String codigo
	EstadoRecurso estadoRecurso
	
	static constraints = {
		tipoRecurso nullable:false
		estadoRecurso nullable:false 
		codigo(unique: ['tipoRecurso'])
		
    }
}
