package com.deukin
/**
 * Representa una Inscripción a una {@link Carrera}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class InscripcionCarrera {
	
	Persona persona
	Carrera carrera
	Date fechaInscripcion
	EstadoInscripcionCarrera estadoInscripcionCarrera

    static constraints = {
		persona(unique:['carrera'])
    }
}
