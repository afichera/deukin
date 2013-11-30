package com.deukin

class AlumnoService {

	def serviceMethod() {
	}


	def findAllAlumnosByCoordinadorACargo(def coordinador){
		def alumnos = []
		def carreras = Carrera.findAllByCoordinador(coordinador)
		def materias = Materia.findAllByCarreraInList(carreras)
		def cursos = Curso.findAllByMateriaInList(materias)
		def inscripcionesCurso = InscripcionCurso.findAllByCursoInList(cursos)
		alumnos = inscripcionesCurso.alumno
		alumnos
	}


	def findAllAlumnosByCurso(def curso){
		def alumnos = InscripcionCurso.findByCurso(curso).alumno
		alumnos
	}

	def findAllAlumnosByDocente(def docente){
		def alumnos = []
		//		def cursos = Curso.executeQuery("select c from Curso c, CursoDocente cd where cd.docente=?", docente)
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
}
