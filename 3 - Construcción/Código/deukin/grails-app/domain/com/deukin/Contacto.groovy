package com.deukin

import gorm.AuditStamp

/**
 * Representa los Datos de Contacto de una Persona, etc.
 * @author Ale Mobile
 *
 */
@AuditStamp
class Contacto {
	
	Domicilio domicilio
	static hasMany = [telefonos:Telefono]
	
    static constraints = {
    }
}
