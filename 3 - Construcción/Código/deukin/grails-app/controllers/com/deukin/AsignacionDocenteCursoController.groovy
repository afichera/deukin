package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class AsignacionDocenteCursoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def docenteService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [asignacionDocenteCursoInstanceList: AsignacionDocenteCurso.list(params), asignacionDocenteCursoInstanceTotal: AsignacionDocenteCurso.count()]
    }

    def create() {
        [asignacionDocenteCursoInstance: new AsignacionDocenteCurso(params)]
    }

    def save() {
        def asignacionDocenteCursoInstance = new AsignacionDocenteCurso(params)
        if (!asignacionDocenteCursoInstance.save(flush: true)) {
            render( view: "create", model: [asignacionDocenteCursoInstance: asignacionDocenteCursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), asignacionDocenteCursoInstance.id])
        redirect(controller:"cursos",action: "show", id: asignacionDocenteCursoInstance.configuracionCursoDia.curso.id)
    }

    def show(Long id) {
        def asignacionDocenteCursoInstance = AsignacionDocenteCurso.get(id)
        if (!asignacionDocenteCursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), id])
            redirect(action: "list")
            return
        }

        [asignacionDocenteCursoInstance: asignacionDocenteCursoInstance]
    }

    def edit(Long id) {
        def asignacionDocenteCursoInstance = AsignacionDocenteCurso.get(id)
        if (!asignacionDocenteCursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), id])
            redirect(action: "list")
            return
        }

        [asignacionDocenteCursoInstance: asignacionDocenteCursoInstance]
    }

    def update(Long id, Long version) {
        def asignacionDocenteCursoInstance = AsignacionDocenteCurso.get(id)
        if (!asignacionDocenteCursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (asignacionDocenteCursoInstance.version > version) {
                asignacionDocenteCursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso')] as Object[],
                          "Another user has updated this AsignacionDocenteCurso while you were editing")
                render(view: "edit", model: [asignacionDocenteCursoInstance: asignacionDocenteCursoInstance])
                return
            }
        }

        asignacionDocenteCursoInstance.properties = params

        if (!asignacionDocenteCursoInstance.save(flush: true)) {
            render(view: "edit", model: [asignacionDocenteCursoInstance: asignacionDocenteCursoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), asignacionDocenteCursoInstance.id])
        redirect(controller:"cursos",action: "show", id: asignacionDocenteCursoInstance.configuracionCursoDia.curso.id)
    }

    def delete(Long id) {
        def asignacionDocenteCursoInstance = AsignacionDocenteCurso.get(id)
		def idRegreso = asignacionDocenteCursoInstance.configuracionCursoDia.curso.id
        if (!asignacionDocenteCursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), id])
            redirect(action: "list")
            return
        }

        try {
            asignacionDocenteCursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), id])
            redirect(controller:"cursos",action: "show", id:idRegreso)
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asignacionDocenteCurso.label', default: 'AsignacionDocenteCurso'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def searchDocentesAJAX = {		
		def queryRegex = "${params.query}"
		def docentes = docenteService.obtenerDocentesLikeQueryRegexInNombreOrApellidoOrDocumentoNumero(queryRegex) 
		
		render(contentType: "text/xml") {
			results() {
				docentes.each { docente ->
					result(){
						name(docente.nombre + ' - ' +docente.apellido + ' - ' +docente.documento.tipoDocumento.name+' - '+docente.documento.numeroAsText())
						id(docente.id)
					}
				}
			}
		}
	}

}
