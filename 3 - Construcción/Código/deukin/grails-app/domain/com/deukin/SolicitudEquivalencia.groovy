package com.deukin


/**
 * Representa una Solicitud de {@link Equivalencia} no implicita de la carrera.
 * @author Ale Mobile
 * @since 19/12/2013
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
