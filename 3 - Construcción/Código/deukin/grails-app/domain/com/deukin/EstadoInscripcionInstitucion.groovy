package com.deukin

enum EstadoInscripcionInstitucion{
	CONFIRMADA('Confirmada'),
	PENDIENTE_CONFIRMACION_PRESENCIAL('Pendiente de Confirmación Presencial'),
	RECHAZADA ('Rechazada')
	String name

	EstadoInscripcionInstitucion(String name){
		this.name = name
	}
	static list(){
		[
			PENDIENTE_CONFIRMACION_PRESENCIAL,
			CONFIRMADA,
			RECHAZADA
		]
	}
	public String toString(){
		return name
	}
}