package com.deukin

/**
 * Representa una calificacion para un {@link Alumno} 
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class Calificacion {
	
	Integer primerParcial
	Integer segundoParcial
	Integer notaFinal
	
	static constraints = {
    }
}
