package com.deukin

/**
 * Representa un Texto Libre, el mismo surge de la necesidad de no hacer tan pesado
 * El / los Objetos que lo contengan cuando no requieren su carga. 
 * Como ejemplo para una {@link Carrera} se puede guardar en un {@link TextoLibre} la fundamentacion
 * o bien un objetivo, etc.
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class TextoLibre {

	String descripcion
	
    static constraints = {
    }
}
