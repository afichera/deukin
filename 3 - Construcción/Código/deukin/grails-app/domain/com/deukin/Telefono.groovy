package com.deukin



/**
 * 
 * @author Ale Mobile
 *
 */
class Telefono {
	
	String numero
	TipoTelefono tipoTelefono
	static belongsTo = [contacto:Contacto]
    static constraints = {
		numero blank:false, maxSize:20
    }
	
	String toString() {
		String texto = ''
		texto = tipoTelefono.toString() + ': ' + numero
		texto
	}
}
