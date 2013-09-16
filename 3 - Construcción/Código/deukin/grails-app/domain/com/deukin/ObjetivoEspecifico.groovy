package com.deukin

class ObjetivoEspecifico {
	String descripcion
	static belongsTo = [materia:Materia]
    static constraints = {
		descripcion nullable:false
    }
}
