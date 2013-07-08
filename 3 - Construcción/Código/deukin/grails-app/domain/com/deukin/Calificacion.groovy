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
	//TODO Falta ver el tema de los estados de aprobacion y donde mierda engancharlo. No es de esta clase
    
	static constraints = {
    }
}
