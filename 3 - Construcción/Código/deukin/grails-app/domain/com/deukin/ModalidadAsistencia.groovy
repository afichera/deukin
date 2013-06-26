package com.deukin
/**
 * Representa las diferentes modalidades de Asistencia a una {@link Carrera}
 * @author Ale Mobile
 *
 */
public enum ModalidadAsistencia {
	PRESENCIAL ('PRESENCIAL'),
	SEMI_PRESENCIAL ('SEMI-PRESENCIAL'),
	A_DISTANCIA ('A DISTANCIA')

	String name

	ModalidadAsistencia(String name){
		this.name = name
	}
	static list(){
		[
			PRESENCIAL,
			SEMI_PRESENCIAL,
			A_DISTANCIA
		]
	}
	public String toString(){
		return name
	}
}
