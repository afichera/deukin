package com.deukin

import grails.plugins.springsecurity.Secured
@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_DOCENTE', 'ROLE_ADMINISTRADOR_SISTEMA'])

class CursosController {
	def materiaService
	def springSecurityService
	def configuracionCursoDiaService
	def subListaService
	
	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def index() {
		redirect(action: "list", params: params)
	}


	def searchMateriasCoordinador =  {
		def queryRegex = "${params.query}"
		def authorities =  springSecurityService.principal.authorities
		def usuario = springSecurityService.principal
		def materias = materiaService.obtenerMateriasDeCoordinadorLikeQueryRegex(authorities, usuario, queryRegex)

		render(contentType: "text/xml") {
			results() {
				materias.each { materia ->
					result(){
						name(materia.codigo.toString() + ' - '+ materia.nombre)
						id(materia.id)
					}
				}
			}
		}
	}

	def create() {
		[cursoInstance: new Curso(params),configuracionCursoDiaInstance: new ConfiguracionCursoDia(params)]
	}

	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def planEstudioId = null
		def cicloLectivoId = null

		if(params.planEstudioId){
			if(params.planEstudioId!="undefined"){
				planEstudioId = new Long(params.planEstudioId)
			}
		}
		if(params.cicloLectivoId){
			if(params.cicloLectivoId!="undefined"){
				cicloLectivoId = new Long(params.cicloLectivoId)
			}			
		}
		if(planEstudioId || cicloLectivoId){
			def configuraciones = configuracionCursoDiaService.obtenerByPlanEstudioIdAndCicloLectivoId(planEstudioId, cicloLectivoId)
			def subList = subListaService.getSubList(configuraciones, params)
			[configuracionCursoDiaInstanceList: subList, configuracionCursoDiaInstanceTotal: configuraciones.size()]
		}else{
			def configuraciones = ConfiguracionCursoDia.executeQuery("select c from ConfiguracionCursoDia as c order by c.curso.materia.periodo.anio, curso.materia.periodo.cuatrimestre, curso.codigo asc")
			def subList = subListaService.getSubList(configuraciones, params)
			[configuracionCursoDiaInstanceList: subList, configuracionCursoDiaInstanceTotal: configuraciones.size()]
		}
	}


	def save() {

		def materiaInstance = Materia.findById(params.materia.id)
		def planEstudioInstance = materiaInstance.planEstudio
		def cicloLectivoInstance = CicloLectivo.findById(params.cicloLectivo.id)

		def cronogramaCarreraInstance = CronogramaCarrera.findByCicloLectivoAndPlanEstudio(cicloLectivoInstance,planEstudioInstance)

		params.cronogramaCarrera = cronogramaCarreraInstance



		def cursoInstance = new Curso(params)
		if (!cursoInstance.save(flush: true)) {
			render(view: "create", model: [cursoInstance: cursoInstance])
			return
		}

		params.curso = cursoInstance

		def configuracionCursoDiaInstance = new ConfiguracionCursoDia(params)
		if (!configuracionCursoDiaInstance.save(flush: true)) {
			render(view: "create", model: [configuracionCursoDiaInstance: configuracionCursoDiaInstance])
			return
		}


		flash.message = message(code: 'default.created.message', args: [
			message(code: 'curso.label', default: 'Curso'),
			cursoInstance.id
		])
		redirect(action: "show", id: cursoInstance.id)
	}



	def update(Long id, Long version) {
		def materiaInstance = Materia.findById(params.materia.id)
		def planEstudioInstance = materiaInstance.planEstudio
		def cicloLectivoInstance = CicloLectivo.findById(params.cicloLectivo.id)

		def cronogramaCarreraInstance = CronogramaCarrera.findByCicloLectivoAndPlanEstudio(cicloLectivoInstance,planEstudioInstance)

		params.cronogramaCarrera = cronogramaCarreraInstance
		def cursoInstance = Curso.get(id)
		if (!cursoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'curso.label', default: 'Curso'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (cursoInstance.version > version) {
				cursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'curso.label', default: 'Curso')] as Object[],
						"Another user has updated this Curso while you were editing")
				render(view: "edit", model: [cursoInstance: cursoInstance])
				return
			}
		}

		cursoInstance.properties = params

		if (!cursoInstance.save(flush: true)) {
			render(view: "edit", model: [cursoInstance: cursoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'cursos.label', default: 'Curso'),
			cursoInstance.id
		])
		redirect(action: "show", id: cursoInstance.id)
	}



	def show(Long id) {
		def cursoInstance = Curso.get(id)
		if (!cursoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'curso.label', default: 'Curso'),
				id
			])
			redirect(action: "list")
			return
		}

		[cursoInstance: cursoInstance]
	}

	def edit(Long id) {
		def cursoInstance = Curso.get(id)
		if (!cursoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'cursos.label', default: 'Cursos'),
				id
			])
			redirect(action: "list")
			return
		}

		[cursoInstance: cursoInstance]
	}
}
