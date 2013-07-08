package com.deukin

/**
 * Representa el Curriculum de una Persona
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class Curriculum {
	
	String titulo
	static belongsTo = [persona:Persona]
	static hasMany = [educaciones:EducacionAdquirida, experiencias:ExperienciaLaboral, aptitudes:Aptitud]
    
	static constraints = {
		
    }
}
