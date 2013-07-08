package com.deukin

/**
 * Representa un estudio/curso realizado por una @Persona, y 
 * forma parte de un {@link Curriculum}
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class EducacionAdquirida {

	String titulo
	Date fecha
	String descripcion
	
    static constraints = {
    }
}
