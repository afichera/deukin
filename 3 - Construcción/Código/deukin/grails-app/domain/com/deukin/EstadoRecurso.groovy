package com.deukin
/**
 * 
 * @author Ale Mobile
 * Representa el estado de los recursos.
 */
enum EstadoRecurso {
	BUENO ('BUENO'),
	REGULAR ('REGULAR'),
	MALO ('MALO'),
	INUTILIZABLE ('INUTILIZABLE')

	String name


	EstadoRecurso(String name){
		this.name = name
	}
	static list(){
		[
			BUENO,
			REGULAR,
			MALO,
			INUTILIZABLE
		]
	}
	public String toString(){
		return name
	}
}
