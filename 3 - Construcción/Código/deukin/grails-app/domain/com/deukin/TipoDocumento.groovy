package com.deukin

enum TipoDocumento {
	DNI ('DNI'),
	CI ('CI'),
	CUIL ('CUIL'),
	CUIT ('CUIT'),
	LC ('LC'),
	LE ('LE')
	
	String name


	TipoDocumento(String name){
		this.name = name
	}
	static list(){
		[
			DNI,
			CI,
			CUIL,
			CUIT,
			LC,
			LE
		]
	}
	public String toString(){
		return name
	}
}
