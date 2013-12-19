package com.deukin

import java.util.Date

/**
 * Representa una experiencia laboral
 * @author Ale Mobile
 * @since 19/12/2013
 */
class ExperienciaLaboral {
	
	String cargo
	String empresa
	Date fechaIngreso
	Date fechaEgreso
	String detalle

    static constraints = {
		cargo maxSize:200
		empresa maxSize:200
		detalle maxSize:5000
		detalle nullable:true
    }
}
