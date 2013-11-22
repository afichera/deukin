package com.deukin

enum TipoInscripcionInstitucion {
	ALUMNO ('ALUMNO'),
	DOCENTE ('DOCENTE')
	
	String name


	TipoInscripcionInstitucion(String name){
		this.name = name
	}
	static list(){
		[
			ALUMNO,
			DOCENTE
		]
	}
	public String toString(){
		return name
	}
}
