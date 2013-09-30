package com.deukin

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
