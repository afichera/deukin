package com.deukin

/**
 * Representa un estado de Inscripción en la carrera.
 * @author Ale Mobile
 * @since 19/12/2013
 */
enum EstadoInscripcionCarrera{
	CONFIRMADA('Confirmada'),
	PENDIENTE_CONFIRMACION_PRESENCIAL('Pendiente de Confirmación Presencial'),
	RECHAZADA ('Rechazada')
	String name

	EstadoInscripcionCarrera(String name){
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