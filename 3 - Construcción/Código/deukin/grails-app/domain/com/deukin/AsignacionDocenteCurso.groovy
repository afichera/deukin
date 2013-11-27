package com.deukin

class AsignacionDocenteCurso {

	Docente docente
	TipoPorcentajeAsignacion tipoPorcentajeAsignacion
	static belongsTo = [configuracionCursoDia:ConfiguracionCursoDia]
    static constraints = {
		
    }
}
