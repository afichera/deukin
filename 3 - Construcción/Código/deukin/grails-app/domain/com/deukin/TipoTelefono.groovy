package com.deukin

enum TipoTelefono {
	MOVIL ('MOVIL'),
	CASA ('CASA'),
	TRABAJO ('TRABAJO')

	String name


	TipoTelefono(String name){
		this.name = name
	}
	static list(){
		[
			MOVIL,
			CASA,
			TRABAJO
		]
	}
	public String toString(){
		return name
	}
}
