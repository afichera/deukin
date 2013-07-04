package com.deukin

import gorm.AuditStamp
/**
 * Representa un estudio/curso realizado por una @Persona, y 
 * forma parte de un {@link Curriculum}
 * @author Ale Mobile
 *
 */
@AuditStamp
class EducacionAdquirida {

	String titulo
	Date fecha
	String descripcion
	
    static constraints = {
    }
}
