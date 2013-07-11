package com.deukin

enum EstadoCurso {
	
	ABIERTO ('ABIERTO'),
	CERRADO ('CERRADO'),


	String name


	EstadoCurso(String name){
		this.name = name
	}
	static list(){
		[
			ABIERTO,
			CERRADO
		
		]
	}
	
	public String toString(){
		return name
	}
	

    static constraints = {
    }
}
