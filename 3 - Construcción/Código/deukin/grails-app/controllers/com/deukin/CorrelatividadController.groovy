package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_COORDINADOR'])
class CorrelatividadController {

	def materiaService
	def springSecurityService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	
    def index() {
        redirect(action: "list", params: params)
    }
	
	def searchMateriasAJAX = {
		def queryRegex = "%${params.query}%"		
		def materias = Materia.findAll { materia -> nombre =~ queryRegex }
		
		//Create XML response
		render(contentType: "text/xml") {
			results() {
				materias.each { materia ->
					result(){
						name(materia.codigo + ' - ' + materia.nombre)
						id(materia.id)
					}
				}
			}
		}
	}
	
	def searchMateriasPredecesorasAJAX = {
		def queryRegex = "%${params.query}%"		
		def idMateriaPrincipal = new Long(request.getParameter("MateriaPrincipalId"))
		 
		def materiaPrincipal = Materia.get(idMateriaPrincipal)
		def materias = materiaService.obtenerMateriasCandidatasPredecesorasByQueryRegexAndMateriaPrincipal(queryRegex, materiaPrincipal)
//		def carreras = materiaService.obtenerMateriasCandidatasPredecesorasByQueryRegexAndMateriaPrincipal
		
		//TODO: Eliminar de la lista la Materia Principal en la que estamos parados.
		
//		def materias = Materia.findAll { materia -> nombre =~ queryRegex }
		
		//Create XML response
		render(contentType: "text/xml") {
			results() {
				materias.each { materia ->
					result(){
						name(materia.codigo + ' - ' + materia.nombre)
						id(materia.id)
					}
				}
			}
		}
	}
	

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [correlatividadInstanceList: Correlatividad.list(params), correlatividadInstanceTotal: Correlatividad.count()]
    }

    def create() {
        [correlatividadInstance: new Correlatividad(params)]
    }

    def save() {
        def correlatividadInstance = new Correlatividad(params)
        if (!correlatividadInstance.save(flush: true)) {
            render(view: "create", model: [correlatividadInstance: correlatividadInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), correlatividadInstance.id])
        redirect(action: "show", id: correlatividadInstance.id)
    }

    def show(Long id) {
        def correlatividadInstance = Correlatividad.get(id)
        if (!correlatividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), id])
            redirect(action: "list")
            return
        }

        [correlatividadInstance: correlatividadInstance]
    }

    def edit(Long id) {
        def correlatividadInstance = Correlatividad.get(id)
        if (!correlatividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), id])
            redirect(action: "list")
            return
        }

        [correlatividadInstance: correlatividadInstance]
    }

    def update(Long id, Long version) {
        def correlatividadInstance = Correlatividad.get(id)
        if (!correlatividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (correlatividadInstance.version > version) {
                correlatividadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'correlatividad.label', default: 'Correlatividad')] as Object[],
                          "Another user has updated this Correlatividad while you were editing")
                render(view: "edit", model: [correlatividadInstance: correlatividadInstance])
                return
            }
        }

        correlatividadInstance.properties = params

        if (!correlatividadInstance.save(flush: true)) {
            render(view: "edit", model: [correlatividadInstance: correlatividadInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), correlatividadInstance.id])
        redirect(action: "show", id: correlatividadInstance.id)
    }

    def delete(Long id) {
        def correlatividadInstance = Correlatividad.get(id)
        if (!correlatividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), id])
            redirect(action: "list")
            return
        }

        try {
            correlatividadInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'correlatividad.label', default: 'Correlatividad'), id])
            redirect(action: "show", id: id)
        }
    }
}
