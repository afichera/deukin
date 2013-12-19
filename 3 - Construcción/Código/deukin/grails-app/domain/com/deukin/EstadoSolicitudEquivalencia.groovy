package com.deukin

/**
 * Representa un estado de solicitud de equivalencias.
 * @author Ale Mobile
 * @since 19/12/2013
 */
enum EstadoSolicitudEquivalencia {
	SOLICITADO ('SOLICITADO'),
	VERIFICADO_ADMIN ('VERIFICADO_ADMIN'),
	VERIFICADO_DOCENTE ('VERIFICADO_DOCENTE'),
	APROBADO ('APROBADO'),
	RECHAZADO ('RECHAZADO')
	
	String name


	EstadoSolicitudEquivalencia(String name){
		this.name = name
	}
	static list(){
		[
			SOLICITADO,			
			VERIFICADO_ADMIN,
			VERIFICADO_DOCENTE,
			APROBADO,
			RECHAZADO
		]
	}
	public String toString(){
		return name
	}

}
