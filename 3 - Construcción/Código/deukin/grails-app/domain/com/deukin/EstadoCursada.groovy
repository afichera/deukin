package com.deukin

/**
 * Representa los diferentes estados que puede tener una Cursada
 * @author Ale Mobile
 * @since 19/12/2013
 */
enum EstadoCursada {

	CURSANDO ('CURSANDO'),
	LIBRE ('LIBRE'),
	ADEUDA_FINAL ('ADEUDA_FINAL'),
	APROBADO ('APROBADO'),
	APLAZADO ('APLAZADO'),
	DESAPROBADO_FINAL1 ('DESAPROBADO_FINAL1'),
	DESAPROBADO_FINAL2 ('DESAPROBADO_FINAL2'),
	DESAPROBADO_FINAL3 ('DESAPROBADO_FINAL3'),
	EXPIRADO ('EXPIRADO')

	String name


	EstadoCursada(String name){
		this.name = name
	}
	static list(){
		[
			CURSANDO,
			LIBRE,
			ADEUDA_FINAL,
			APROBADO,
			APLAZADO,
			DESAPROBADO_FINAL1,
			DESAPROBADO_FINAL2,
			DESAPROBADO_FINAL3,
			EXPIRADO
		]
	}
	public String toString(){
		return name
	}
	static constraints = {
	}
}
