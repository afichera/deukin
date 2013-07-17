package com.deukin

import org.jfree.data.time.Hour

/**
 * Representa un Evento "Curso Libre" del cual se quiera 
 * @author Ale Mobile
 *
 */
class Evento {
	
	String titulo
	String descripcion
	Integer cupoMaximo
	Date fechaInicio
	Date fechaFin
	EspacioFisico espacioFisico
	Hour horaInicio
	Hour horaFin
	
	static hasMany = [alumnos:Alumno, docentes:Docente]
    
	static constraints = {
		titulo(unique:['fechaInicio','espacioFisico'], maxLength:200)
		descripcion(nullable:true)
				
    }
}
