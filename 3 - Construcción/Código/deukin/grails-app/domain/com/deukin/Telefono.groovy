package com.deukin



/**
 * Representa un telefono perteneciente a un {@link Contacto}
 * @author Ale Mobile
 * @since 19/12/2013
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
