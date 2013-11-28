package com.deukin

enum TipoPorcentajeAsignacion{
	ASIGNADO_AL_100 ('1'),
	ASIGNADO_AL_50 ('0.5')
	
	String name


	TipoPorcentajeAsignacion(String name){
		this.name = name
	}
	static list(){
		[
			ASIGNADO_AL_100,
			ASIGNADO_AL_50
		]
	}
	public String toString(){
		return name
	}
}
