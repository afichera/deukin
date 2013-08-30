package com.deukin

/**
 * 
 * @author Ale Mobile
 *
 */
class Telefono {
	
	String numero
	TipoTelefono tipoTelefono
	static belongsTo = Contacto
    static constraints = {
		numero(maxLength:20)
    }
}
