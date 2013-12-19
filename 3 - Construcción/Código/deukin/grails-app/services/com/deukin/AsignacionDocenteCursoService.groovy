package com.deukin

/**
 * Representa los Servicios expuestos de {@link AsignacionDocenteCurso}
 * @author Ale Mobile
 * @since 19/12/2013
 *
 */
class AsignacionDocenteCursoService {

	/**
	 * Busca y devuelve una lista de {@link AsignacionDocenteCurso} de un docente dado ordenado por periodo académico descendente
	 * @param docente
	 * @return
	 */
	def getAsignacionesDocenteCursoByDocenteOrderByPeriodoAcademico(def docente){
		def asignaciones = AsignacionDocenteCurso.findAllByDocente(docente, [order:'configuracionCursoDia.curso.periodoAcademico.fechaInicioPeriodo', order:'desc'])
		asignaciones
	}
}
