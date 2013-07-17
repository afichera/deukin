package com.deukin

import java.util.Date;

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
		cargo(maxLength:200)
		empresa(maxLength:200)
		detalle(nullable:true)
    }
}
