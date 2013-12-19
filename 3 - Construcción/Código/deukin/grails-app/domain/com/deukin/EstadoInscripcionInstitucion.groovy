package com.deukin
/**
 * Representa un estado en la inscripción a la institucion.
 * @author Ale Mobile
 * @since 19/12/2013
 */
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