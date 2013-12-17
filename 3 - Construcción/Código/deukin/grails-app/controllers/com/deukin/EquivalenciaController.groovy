package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_COORDINADOR'])
class EquivalenciaController {
	def springSecurityService
	def equivalenciaService
	def materiaService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [equivalenciaInstanceList: Equivalencia.list(params), equivalenciaInstanceTotal: Equivalencia.count()]
    }

    def create() {
        [equivalenciaInstance: new Equivalencia(params)]
    }

    def save() {
        def equivalenciaInstance = new Equivalencia(params)
		try{
			equivalenciaService.validar(equivalenciaInstance)
			if (!equivalenciaInstance.save(flush: true)) {
				render(view: "create", model: [equivalenciaInstance: equivalenciaInstance])
				return
			}
		}catch(Exception e){
			String eMessage = ex.getCause()?.getMessage()
			flash.message = eMessage
			render(view: "create", model: [correlatividadInstance: correlatividadInstance])
		}
		
        flash.message = message(code: 'default.created.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), equivalenciaInstance.id])
        
		if (params.vieneDeMateria=="true") {
			
			redirect(controller: "materia", action: "show", id: params.materiaPrincipal.id)
		}
		else {
		
		
		redirect(action: "show", id: equivalenciaInstance.id)
		}
    }

    def show(Long id) {
        def equivalenciaInstance = Equivalencia.get(id)
        if (!equivalenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), id])
            redirect(action: "list")
            return
        }

        [equivalenciaInstance: equivalenciaInstance]
    }

    def edit(Long id) {
        def equivalenciaInstance = Equivalencia.get(id)
        if (!equivalenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), id])
            redirect(action: "list")
            return
        }

        [equivalenciaInstance: equivalenciaInstance]
    }

    def update(Long id, Long version) {
        def equivalenciaInstance = Equivalencia.get(id)
        if (!equivalenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (equivalenciaInstance.version > version) {
                equivalenciaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'equivalencia.label', default: 'Equivalencia')] as Object[],
                          "Another user has updated this Equivalencia while you were editing")
                render(view: "edit", model: [equivalenciaInstance: equivalenciaInstance])
                return
            }
        }

        equivalenciaInstance.properties = params

		try{
			equivalenciaService.validar(equivalenciaInstance)
			if (!equivalenciaInstance.save(flush: true)) {
            	render(view: "edit", model: [equivalenciaInstance: equivalenciaInstance])
            	return
        	}
		}catch(Exception e){
			String eMessage = ex.getCause()?.getMessage()
			flash.message = eMessage
			render(view: "edit", model: [correlatividadInstance: correlatividadInstance])
		}
		
        flash.message = message(code: 'default.updated.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), equivalenciaInstance.id])
        redirect(action: "show", id: equivalenciaInstance.id)
    }

    def delete(Long id) {
        def equivalenciaInstance = Equivalencia.get(id)
        if (!equivalenciaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), id])
            redirect(action: "list")
            return
        }

        try {
            equivalenciaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'equivalencia.label', default: 'Equivalencia'), id])
            redirect(action: "show", id: id)
        }
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
						name(materia?.toString())
						id(materia.id)
					}
				}
			}
		}

	}
	
	def searchMaterias=  {
		def queryRegex = "${params.query}"
		def materias = materiaService.obtenerMateriasLikeQueryRegex(queryRegex)
		
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

}
