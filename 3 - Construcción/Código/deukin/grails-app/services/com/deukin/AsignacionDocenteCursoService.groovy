package com.deukin

class AsignacionDocenteCursoService {

	def getAsignacionesDocenteCursoByDocenteOrderByPeriodoAcademico(def docente){		
		def asignaciones = AsignacionDocenteCurso.findAllByDocente(docente, [order:'configuracionCursoDia.curso.periodoAcademico.fechaInicioPeriodo', order:'desc'])
		asignaciones
	}
}
