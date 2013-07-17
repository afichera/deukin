package com.deukin
/**
 * Representa los diferentes estados de una Postulacion
 * @author Ale Mobile
 *
 */
enum EstadoPostulacion {

	ACTIVA ('ACTIVA'),
	INACTIVA ('INACTIVA'),
	REALIZADA ('REALIZADA'),
	
	String name


	EstadoPostulacion(String name){
		this.name = name
	}
	static list(){
		[
			ACTIVA,
			INACTIVA,
			REALIZADA
		]
	}
	public String toString(){
		return name
	}
}
