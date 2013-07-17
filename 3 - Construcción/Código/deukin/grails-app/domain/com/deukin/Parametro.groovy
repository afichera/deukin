package com.deukin
/**
 * Representa un parametro de Configuracion del sistema.
 * @author Ale Mobile
 *
 */
class Parametro {
	String codigo
	String valor
	
    static constraints = {
		codigo (unique:true, maxLength:20)
		valor (maxLength:200)
		
    }
}
