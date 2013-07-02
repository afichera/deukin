package com.deukin

import gorm.AuditStamp

/**
 * Representa una aptitud de una persona. Ej: Curso Redes, Java, .Net
 * @author Ale Mobile
 *
 */
@AuditStamp
class Aptitud {
	
	String titulo
	String descripcion
    NivelAdquirido nivelAdquirido
	
	static constraints = {
    	unique[titulo]
	}
}
