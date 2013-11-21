package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
class TipoRecursoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoRecursoInstanceList: TipoRecurso.list(params), tipoRecursoInstanceTotal: TipoRecurso.count()]
    }

    def create() {
        [tipoRecursoInstance: new TipoRecurso(params)]
    }

    def save() {
        def tipoRecursoInstance = new TipoRecurso(params)
        if (!tipoRecursoInstance.save(flush: true)) {
            render(view: "create", model: [tipoRecursoInstance: tipoRecursoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), tipoRecursoInstance.id])
        redirect(action: "show", id: tipoRecursoInstance.id)
    }

    def show(Long id) {
        def tipoRecursoInstance = TipoRecurso.get(id)
        if (!tipoRecursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), id])
            redirect(action: "list")
            return
        }

        [tipoRecursoInstance: tipoRecursoInstance]
    }

    def edit(Long id) {
        def tipoRecursoInstance = TipoRecurso.get(id)
        if (!tipoRecursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), id])
            redirect(action: "list")
            return
        }

        [tipoRecursoInstance: tipoRecursoInstance]
    }

    def update(Long id, Long version) {
        def tipoRecursoInstance = TipoRecurso.get(id)
        if (!tipoRecursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoRecursoInstance.version > version) {
                tipoRecursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoRecurso.label', default: 'TipoRecurso')] as Object[],
                          "Another user has updated this TipoRecurso while you were editing")
                render(view: "edit", model: [tipoRecursoInstance: tipoRecursoInstance])
                return
            }
        }

        tipoRecursoInstance.properties = params

        if (!tipoRecursoInstance.save(flush: true)) {
            render(view: "edit", model: [tipoRecursoInstance: tipoRecursoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), tipoRecursoInstance.id])
        redirect(action: "show", id: tipoRecursoInstance.id)
    }

    def delete(Long id) {
        def tipoRecursoInstance = TipoRecurso.get(id)
        if (!tipoRecursoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoRecursoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoRecurso.label', default: 'TipoRecurso'), id])
            redirect(action: "show", id: id)
        }
    }
}
