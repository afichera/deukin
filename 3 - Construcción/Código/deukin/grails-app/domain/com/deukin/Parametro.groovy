package com.deukin
/**
 * Representa un parametro de Configuracion del sistema.
 * @author Ale Mobile
 *
 */
class Parametro {
	String codigo
	String valor
	TipoParametro tipoParametro
	
	static constraints = {
		codigo (unique:true, maxSize:20)
		valor (maxSize:200)
		
    }
}
