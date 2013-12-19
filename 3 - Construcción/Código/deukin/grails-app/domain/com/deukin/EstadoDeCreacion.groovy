package com.deukin
/**
 * Representa un estado de Creación
 * @author Ale Mobile
 * @since 19/12/2013
 */
enum EstadoDeCreacion {

	BORRADOR('Borrador'),
	OFERTADA('Ofertada'),
	SIN_OFERTAR ('Sin ofertar')
	
	String name

	EstadoDeCreacion(String name){
		this.name = name
	}
	static list(){
		[
			BORRADOR,
			OFERTADA,
			SIN_OFERTAR
		]
	}
	public String toString(){
		return name
	}
}
