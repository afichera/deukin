package com.deukin
/**
 * Representa un tipo de durabilidad de la {@link Materia} 
 * @author Ale Mobile
 *
 */
enum TipoCicloLectivo {
	CUATRIMESTRAL ('CUATRIMESTRAL'),
	ANUAL ('ANUAL')
	
	String name


	TipoCicloLectivo(String name){
		this.name = name
	}
	static list(){
		[
			CUATRIMESTRAL,
			ANUAL
		]
	}
	public String toString(){
		return name
	}
}
