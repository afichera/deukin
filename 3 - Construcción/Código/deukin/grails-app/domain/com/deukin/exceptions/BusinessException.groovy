package com.deukin.exceptions


class BusinessException extends Exception{
	
	def mensajeError
	public BusinessException(String msg){
		super(msg)
		mensajeError  = msg
	}
	
    static constraints = {
    }
}
