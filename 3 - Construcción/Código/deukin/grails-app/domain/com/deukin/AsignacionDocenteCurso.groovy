package com.deukin

/**
 * Representa la asignación de un docente a un curso, esto permite asignarlo total o parcialmente
 * @author Ale Mobile
 * @since 19/12/2013
 */
class AsignacionDocenteCurso {

	Docente docente
	TipoPorcentajeAsignacion tipoPorcentajeAsignacion
	static belongsTo = [configuracionCursoDia:ConfiguracionCursoDia]
	static transients = ['cantidadHorasAsignacion']
    static constraints = {
		docente(unique:['configuracionCursoDia'])
    }
	
	def getCantidadHorasAsignacion(){
		def horasAsignacion = 0f
		if(configuracionCursoDia){
			horasAsignacion = Float.parseFloat(tipoPorcentajeAsignacion.name) * configuracionCursoDia.getSumaHoras()
		}
		horasAsignacion
	}
	
}
