package com.deukin
/**
 * 
 * @author Ale Mobile
 * Representa el estado de los recursos.
 */
enum EstadoRecurso {
	NUEVO ('NUEVO'),
	BUENO ('BUENO'),
	REGULAR ('REGULAR'),
	MALO ('MALO'),
	EN_REPARACION ('EN REPARACION')

	String name


	EstadoRecurso(String name){
		this.name = name
	}
	static list(){
		[
			NUEVO,
			BUENO,
			REGULAR,
			MALO,
			EN_REPARACION
		]
	}
	public String toString(){
		return name
	}
}
