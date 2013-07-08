package com.deukin

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
