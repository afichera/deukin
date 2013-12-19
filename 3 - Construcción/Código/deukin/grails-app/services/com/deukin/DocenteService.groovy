package com.deukin

import com.deukin.exceptions.BusinessException



/**
 * Representa los servicios Expuestos para {@link Docente}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class DocenteService {

	def configuracionCursoDiaService
	/**
	 * Obtiene una lista de {@link Docente} tales que cumplan en nombre, apellido o nro de documento con el
	 * query recibido por parámetro
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
	
	/**
	 * Obtiene la cantidad de Horas que tiene ocupadas un {@link Docente} para un {@link CronogramaCarrera}
	 * @param docenteId
	 * @param cronogramaId
	 * @return
	 */
	public Float obtenerHorasByDocenteIdAndCronogramaCarreraId(def docenteId, def cronogramaId){
		def docente = Docente.get(docenteId)
		def cronograma = CronogramaCarrera.get(cronogramaId)
		def aux = 0
		Float resultado = 0

		if(!docente){
			throw new BusinessException('No se encontró docente con id: '+docenteId)
		}

		if(!cronograma){
			throw new BusinessException('No se encontró cronograma de carrera con id: '+cronogramaId)
		}

		def cursosDelCronograma = Curso.findAllByCronogramaCarrera(cronograma)
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

	/**
	 * Obtiene la cantidad de horas que tiene un {@link Docente} para un {@link CicloLectivo}
	 * @param docenteId
	 * @return
	 */
	public Float obtenerHorasByDocenteIdInCicloLectivoActual(def docenteId){
		def fechaActual = new Date()
		Calendar calendario = new GregorianCalendar()
		calendario.setTime(fechaActual)
				
		Date fechaInicioCiclo1 = Date.parse("dd/MM/yyyy", "01/01/"+calendario.get(Calendar.YEAR).toString())
		Date fechaFinCiclo1 = Date.parse("dd/MM/yyyy", "31/12/"+calendario.get(Calendar.YEAR).toString())
		def ciclosLectivos = CicloLectivo.findAllByFechaFinGreaterThanAndFechaInicioLessThan(fechaInicioCiclo1, fechaFinCiclo1)// (new Date(), new Date())
		def resultado = 0
		def cronogramas = []
		//Debería ser solo uno pero por las dudas
		for(cicloLectivo in ciclosLectivos){
			cronogramas = CronogramaCarrera.findAllByCicloLectivo(cicloLectivo)
			for(cronograma in cronogramas){
				resultado += this.obtenerHorasByDocenteIdAndCronogramaCarreraId(docenteId, cronograma.id)
			}
		}
		resultado
	}
	
	/**
	 * Servicio que valida campos numericos del {@link Domicilio} de un {@link Docente}
	 * @param params
	 * @return
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
