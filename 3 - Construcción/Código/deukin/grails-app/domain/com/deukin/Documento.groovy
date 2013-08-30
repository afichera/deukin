package com.deukin

class Documento {
	
	Long numero
	TipoDocumento tipoDocumento
	static belongsTo = Persona
    static constraints = {
		numero(unique:['tipoDocumento'])
    }
}
