package com.deukin
/**
 * Representa la Inscripcion de una Persona a la Institución.
 * @author Ale Mobile
 *
 */
class InscripcionInstitucion {
	
	Persona persona
	Date fechaInscripcion
	EstadoInscripcionInstitucion estadoInscripcionInstitucion	

    static constraints = {
		persona unique:true
    }
}
