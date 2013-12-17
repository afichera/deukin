package com.deukin

class ObjetivoEspecifico {
	String descripcion
	static belongsTo = [materia:Materia]
    static constraints = {
		descripcion maxSize:200, blank:false
    }
	
	String toString(){
		descripcion 
	}
}
