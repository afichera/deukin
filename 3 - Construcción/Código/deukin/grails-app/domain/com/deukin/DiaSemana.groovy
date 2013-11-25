package com.deukin

enum DiaSemana implements Serializable{
	LUNES ('LUNES'),
	MARTES ('MARTES'),
	MIERCOLES ('MIERCOLES'),
	JUEVES ('JUEVES'),
	VIERNES ('VIERNES'),
	SABADO ('SABADO'),
	DOMINGO ('DOMINGO')
	
	String name


	DiaSemana(String name){
		this.name = name
	}
	static list(){
		[
			LUNES,
			MARTES,
			MIERCOLES,
			JUEVES,
			VIERNES,
			SABADO,
			DOMINGO
		]
	}
	public String toString(){
		return name
	}
	

}
