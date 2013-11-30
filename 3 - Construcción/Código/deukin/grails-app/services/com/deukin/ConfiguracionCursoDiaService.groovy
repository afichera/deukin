package com.deukin

import com.deukin.exceptions.BusinessException

class ConfiguracionCursoDiaService {


	def obtenerHorasCursoDia(ConfiguracionCursoDia configuracionCursoDia){
		configuracionCursoDia.getSumaHoras()
	}


	def obtenerByPlanEstudioIdAndCicloLectivoId(Long planEstudioId, Long cicloLectivoId, def params){
		def configuracionesCursoDia = []
		def planEstudio = null
		def cicloLectivo = null
		def cronogramaCarrera = null
		def cronogramas = []
		def cursos = []

		if(planEstudioId){
			planEstudio = PlanEstudio.get(planEstudioId)
		}
		if(cicloLectivoId){
			cicloLectivo = CicloLectivo.get(cicloLectivoId)
		}

		if(planEstudio && !cicloLectivo){
			cronogramas = CronogramaCarrera.findAllByPlanEstudio(planEstudio)
		}

		if(!planEstudio && cicloLectivo){
			cronogramas = CronogramaCarrera.findAllByCicloLectivo(cicloLectivo)
		}

		if(planEstudio && cicloLectivo){
			cronogramaCarrera = CronogramaCarrera.findByPlanEstudioAndCicloLectivo(planEstudio, cicloLectivo)
		}

		if(cronogramaCarrera){
			cursos = Curso.findAllByCronogramaCarrera(cronogramaCarrera)
		}else if(cronogramas){
			cursos = Curso.findAllByCronogramaCarreraInList(cronogramas)
		}

		if(cursos){
			configuracionesCursoDia = ConfiguracionCursoDia.findAllByCursoInList(cursos, [sort: 'curso.periodoAcademico.fechaInicioPeriodo', order:'asc'])
		}

		configuracionesCursoDia
	}

}
