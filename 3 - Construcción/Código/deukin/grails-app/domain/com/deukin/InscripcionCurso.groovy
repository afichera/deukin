package com.deukin

import java.util.Date

/**
 * Representa una inscripcion a un Curso
 * @author Ale Mobile
 *
 */
class InscripcionCurso {
	
	Alumno alumno
	Curso curso
	Date fechaInscripcion
	EstadoCursada estadoCursada
	Calificacion calificacion

    static constraints = {
		curso(unique:['alumno'])
    }
}

