package com.deukin

/**
 * Representa los servicios expuestos para {@link Alumno}
 * @author Ale Mobile
 * @since 19/12/2013
 *
 */
class AlumnoService {

	
	/**
	 * Devuelve una colección de {@link Alumno} que tiene a cargo un {@link Coordinador}
	 * @param coordinador
	 * @return
	 */
	def findAllAlumnosByCoordinadorACargo(def coordinador){
		def alumnos = []
		def carreras = Carrera.findAllByCoordinador(coordinador)
		def materias = Materia.findAllByCarreraInList(carreras)
		def cursos = Curso.findAllByMateriaInList(materias)
		def inscripcionesCurso = InscripcionCurso.findAllByCursoInList(cursos)
		alumnos = inscripcionesCurso.alumno
		alumnos
	}

	/**
	 * Busca y devuelve una lista de {@link Alumno} de un curso dado. 
	 * @param curso
	 * @return
	 */
	def findAllAlumnosByCurso(def curso){
		def alumnos = InscripcionCurso.findByCurso(curso).alumno
		alumnos
	}

	/**
	 * Busca y devuelve una lista de {@link Alumno} que tenga a cargo un {@link Docente} en la actualidad.
	 * @param docente
	 * @return
	 */
	def findAllAlumnosByDocente(def docente){
		def alumnos = []		
		if(docente){
			def cursos = InscripcionCurso.findAllByEstadoCursada(EstadoCursada.CURSANDO).cursos
			def cursosFiltrados = []
			def docentesCurso = []
			for (curso in cursos) {
				if(curso.docentes!=null && !curso.docentes.isEmpty()){
					docentesCurso = curso.docentes
					for(docenteAux in docentesCurso){
						if(docenteAux.equals(docente)){
							cursosFiltrados.add(curso)
						}
					}
				}
			}
			if(!cursosFiltrados.isEmpty()){
				def inscripcionesCurso = InscripcionCurso.findAllByCursoInListAndEstadoCursada(cursosFiltrados, EstadoCursada.CURSANDO)
				alumnos = inscripcionesCurso.alumno
			}

		}
		alumnos

	}
	
	/**
	 * Servicio que valida datos numéricos del {@link Domicilio}
	 * @param params
	 * @return Devuelve las propiedades erroneas
	 */
	public String validaNumeros (params)
	{
		String erroneas = ''
		
		if (!params.contacto.domicilio.numero.isInteger()&&params.contacto.domicilio.numero)
		erroneas = erroneas + '"Número", '
		
		if (!params.contacto.domicilio.codigoPostal.isInteger()&&params.contacto.domicilio.codigoPostal)
		erroneas = erroneas + '"Código Postal", '
	
		
		erroneas
	}
}
