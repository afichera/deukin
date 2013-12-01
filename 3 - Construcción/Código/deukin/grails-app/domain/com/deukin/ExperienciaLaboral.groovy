package com.deukin

import java.util.Date

/**
 * 
 * @author Ale Mobile
 *
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
