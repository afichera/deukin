package com.deukin


/**
 * 
 * @author Ale Mobile
 *
 */
class SolicitudEquivalencia {
	
	Alumno alumno
	Materia materiaSolicitada
	String universidadCursada
	String materiaCursada
	//TODO: Crear lista de archivos.
	EstadoSolicitudEquivalencia estadoSolicitudEquivalencia
	String comentario
	
    static constraints = {
		alumno(unique:['materiaSolicitada', 'materiaCursada'])
		comentario nullable:true
    }
}
