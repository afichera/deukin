package com.deukin.exceptions

/**
 * Representa una excepción propia de la Logica de negocio del sistema.
 * @author Ale Mobile
 * @since 19/12/2013
 */
class BusinessException extends Exception{
	
	def mensajeError
	public BusinessException(String msg){
		super(msg)
		mensajeError  = msg
	}
	
    static constraints = {
    }
}
