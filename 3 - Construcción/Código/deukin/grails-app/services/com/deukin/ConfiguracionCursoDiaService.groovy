package com.deukin


class ConfiguracionCursoDiaService {


	def obtenerHorasCursoDia(ConfiguracionCursoDia configuracionCursoDia){
		configuracionCursoDia.getSumaHoras()
	}


	def obtenerByPlanEstudioIdAndCicloLectivoId(Long planEstudioId, Long cicloLectivoId){
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
			configuracionesCursoDia = ConfiguracionCursoDia.executeQuery("select c from ConfiguracionCursoDia as c where c.curso in (:list) order by c.curso.materia.periodo.anio, curso.materia.periodo.cuatrimestre,curso.materia.codigo, curso.codigo asc",
				[list: cursos])
			
		}

		configuracionesCursoDia
	}

}
