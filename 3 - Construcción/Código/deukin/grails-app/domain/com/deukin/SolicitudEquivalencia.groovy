package com.deukin


@gorm.AuditStamp
class SolicitudEquivalencia {
	
	Materia materiaSolicitada
	String universidadCursada
	String materiaCursada
	//TODO: Crear lista de archivos.
	EstadoSolicitudEquivalencia estadoSolicitudEquivalencia
	String comentario
	
    static constraints = {
    }
}
