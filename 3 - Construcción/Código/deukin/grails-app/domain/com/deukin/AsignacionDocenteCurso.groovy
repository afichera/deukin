package com.deukin

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
