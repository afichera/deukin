package com.deukin


/**
 * Representa los niveles adquiridos para las aptitudes.
 * Ej: Sr. Ssr. Junior, etc
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class NivelAdquirido {
	String codigo
	String descripcion
	
    static constraints = {
		codigo unique: true
		
    }
}
