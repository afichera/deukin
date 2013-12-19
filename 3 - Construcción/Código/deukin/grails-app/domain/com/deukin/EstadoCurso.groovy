package com.deukin
/**
 * Representa el estado de un Curso
 * @author Ale Mobile
 * @since 19/12/2013
 */
enum EstadoCurso {
	
	ABIERTO ('ABIERTO'),
	CERRADO ('CERRADO'),


	String name


	EstadoCurso(String name){
		this.name = name
	}
	static list(){
		[
			ABIERTO,
			CERRADO
		
		]
	}
	
	public String toString(){
		return name
	}
	

    static constraints = {
    }
}
