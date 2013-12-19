package com.deukin

/**
 * Representa el domicilio de {@link Contacto} de una {@link Persona}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class Domicilio {
	
	String calle
	Integer numero
	String localidad
	Integer codigoPostal
	String observaciones
	
	static belongsTo = [contacto:Contacto]
	
    static constraints = {
		calle maxSize:100, blank:false
		localidad maxSize:100, blank:false
		codigoPostal min:1000, max:9999 
		observaciones(nullable:true)
    }
	
	String toString() {
		String muestraObservaciones = ''
		if (observaciones != null)
		{
			muestraObservaciones = ' (' + observaciones + ')'
		}
		calle + ' ' + numero + ', ' + localidad + muestraObservaciones + ' CP: '+codigoPostal 
	}
}
