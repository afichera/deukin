package com.deukin

class Coordinador extends Persona {
	
	Boolean coordinadorGeneral
	Carrera carrera
    static constraints = {
		 carrera nullable:true
    }
}
