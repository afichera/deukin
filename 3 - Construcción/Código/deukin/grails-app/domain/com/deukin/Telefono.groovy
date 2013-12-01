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
		numero(maxLength:20)
    }
	
	String toString() {
		tipoTelefono+': '+numero
	}
}
