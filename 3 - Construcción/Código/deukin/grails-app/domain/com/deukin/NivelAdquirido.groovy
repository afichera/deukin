package com.deukin

import gorm.AuditStamp

/**
 * Representa los niveles adquiridos para las aptitudes.
 * Ej: Sr. Ssr. Junior, etc
 * @author Ale Mobile
 *
 */
@AuditStamp
class NivelAdquirido {
	String codigo
	String descripcion
	
    static constraints = {
		unique[codigo]
		
    }
}
