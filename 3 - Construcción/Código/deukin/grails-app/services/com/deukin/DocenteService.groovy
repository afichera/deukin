package com.deukin

import com.deukin.exceptions.BusinessException
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

class DocenteService {

	def configuracionCursoDiaService
	/**
	 * Obtiene los docentes tales que cumplan en nombre, apellido o nro de documento con el query
	 * @param queryRegex
	 * @return
	 */
	def obtenerDocentesLikeQueryRegexInNombreOrApellidoOrDocumentoNumero(def queryRegex){
		def docentes
		def docentesResultantes = []
		docentes = Docente.list()
		for (docente in docentes) {
			if(docente.nombre.toUpperCase().contains(queryRegex.toUpperCase())
			|| docente.apellido.toString().toUpperCase().contains(queryRegex.toUpperCase())
			|| docente.documento.numeroAsText().toUpperCase().contains(queryRegex.toUpperCase())){
				docentesResultantes.add(docente)
			}
		}
		docentesResultantes
	}

	public Float obtenerHorasByDocenteIdAndCronogramaCarreraId(def docenteId, def cronogramaId){
		def docente = Docente.get(docenteId)
		def cronograma = CronogramaCarrera.get(cronogramaId)
		def aux = 0
		Float resultado = 0

		if(!docente){
			throw new BusinessException("No se encontró docente con id: "+docenteId)
		}

		if(!cronograma){
			throw new BusinessException("No se encontró cronograma de carrera con id: "+cronogramaId)
		}

		def cursosDelCronograma = Curso.findAllByCronogramaCarrera(cronogramaCarrera)
		def configuracionesCursoDia = []
		def asignacionesDocente = []
		for (curso in cursosDelCronograma) {
			configuracionesCursoDia = curso.configuracionesCursoDia
			for(configuracionCursoDia in configuracionesCursoDia){
				asignacionesDocente = configuracionCursoDia.asignacionesDocenteCurso
				for(asignacionDocente in asignacionesDocente){
					if(asignacionDocente.docente.equals(docente)){
						aux = configuracionCursoDiaService.obtenerHorasCursoDia(configuracionCursoDia)
						resultado += Float.parseFloat(asignacionDocente.tipoPorcentajeAsignacion.name) * aux
					}
				}
			}
		}
		resultado
	}

	public Float obtenerHorasByDocenteIdInCicloLectivoActual(def docenteId){
		def ciclosLectivos = CicloLectivo.findAllWhere(fechaInicio >= new Date() && fechaFin <=new Date())
		def resultado = 0
		def cronogramas = []
		//Debería ser solo uno pero por las dudas
		for(cicloLectivo in ciclosLectivos){
			cronogramas = CronogramaCarrera.findAllByCicloLectivo(cicloLectivo)
			for(cronograma in cronogramas){
				resultado += this.obtenerHorasByDocenteIdAndCronogramaCarreraId(docenteId, cronograma.id)
			}
		}
	}

}
