package com.deukin

class InscripcionCarrera {
	
	Persona persona
	Carrera carrera
	Date fechaInscripcion
	EstadoInscripcionCarrera estadoInscripcionCarrera

    static constraints = {
		persona(unique:['carrera'])
    }
}
