package com.deukin

import grails.plugins.springsecurity.Secured

import net.sf.jasperreports.compilers.JavaScriptCompilerBase.Errors;

import org.springframework.dao.DataIntegrityViolationException


@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO'])
class PlanEstudioController {
	
	def springSecurityService
	def carreraService
	def planEstudioService



    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [planEstudioInstanceList: PlanEstudio.list(params), planEstudioInstanceTotal: PlanEstudio.count()]
    }

    def create() {
        [planEstudioInstance: new PlanEstudio(params)]
    }

    def save() {
        def planEstudioInstance = new PlanEstudio(params)
		
		if (!params.cantidadPeriodosAcademicos.isInteger()&&params.cantidadPeriodosAcademicos)
		{
			planEstudioInstance.clearErrors()
			planEstudioInstance.errors.rejectValue("cantidadPeriodosAcademicos", "planEstudio.cantidadPeriodosAcademicos.invalid.numero")
			render(view: "create", model: [planEstudioInstance: planEstudioInstance])
			return
		}
		
		
        if (!planEstudioInstance.save(flush: true)) {
            render(view: "create", model: [planEstudioInstance: planEstudioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), planEstudioInstance.id])
        redirect(action: "show", id: planEstudioInstance.id)
    }

    def show(Long id) {
        def planEstudioInstance = PlanEstudio.get(id)
        if (!planEstudioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), id])
            redirect(action: "list")
            return
        }
		def correlatividades = planEstudioService.obtenerCorrelatividades(planEstudioInstance)

        [planEstudioInstance: planEstudioInstance, correlatividades:correlatividades]
    }

    def edit(Long id) {
        def planEstudioInstance = PlanEstudio.get(id)
        if (!planEstudioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), id])
            redirect(action: "list")
            return
        }

        [planEstudioInstance: planEstudioInstance]
    }

    def update(Long id, Long version) {
        def planEstudioInstance = PlanEstudio.get(id)
        if (!planEstudioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (planEstudioInstance.version > version) {
                planEstudioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'planEstudio.label', default: 'PlanEstudio')] as Object[],
                          "Another user has updated this PlanEstudio while you were editing")
                render(view: "edit", model: [planEstudioInstance: planEstudioInstance])
                return
            }
        }

        planEstudioInstance.properties = params

        if (!planEstudioInstance.save(flush: true)) {
            render(view: "edit", model: [planEstudioInstance: planEstudioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), planEstudioInstance.id])
        redirect(action: "show", id: planEstudioInstance.id)
    }

    def delete(Long id) {
        def planEstudioInstance = PlanEstudio.get(id)
        if (!planEstudioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), id])
            redirect(action: "list")
            return
        }

        try {
            planEstudioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'planEstudio.label', default: 'PlanEstudio'), id])
            redirect(action: "show", id: id)
        }
    }
	
	
	def searchCarrerasAutocomplete = {
		def usuarioLogueado = springSecurityService.principal
		def queryRegex = "%${params.query}%"
		def carreras = carreraService.findCarrerasLikeParamasAndCoordinadorUser(queryRegex, usuarioLogueado)

		render(contentType: "text/xml") {
			results() {
				carreras.each { carrera ->
					result(){
						name(carrera.titulo)
						id(carrera.id)
					}
				}
			}
		}
	}
	
}
