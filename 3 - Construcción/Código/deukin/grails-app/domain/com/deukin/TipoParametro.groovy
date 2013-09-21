package com.deukin

enum TipoParametro {
	TEXTO ('TEXTO'),
	NUMERO_ENTERO ('NUMERO ENTERO'),
	NUMERO_FLOTANTE ('NUMERO FLOTANTE'),
	NUMERO_DOUBLE ('NUMERO DOBLE PRECISION'),
	FECHA ('FECHA'),

	String name


	TipoParametro(String name){
		this.name = name
	}
	static list(){
		[
			TEXTO,
			NUMERO_ENTERO,
			NUMERO_FLOTANTE,
			NUMERO_DOUBLE,
			FECHA
		]
	}
	public String toString(){
		return name
	}
}
