package com.deukin

class Documento {
	
	Long numero
	TipoDocumento tipoDocumento

    static constraints = {
		numero(unique:['tipoDocumento'])
    }
}
