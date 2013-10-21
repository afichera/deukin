package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class ObjetivoEspecificoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [objetivoEspecificoInstanceList: ObjetivoEspecifico.list(params), objetivoEspecificoInstanceTotal: ObjetivoEspecifico.count()]
    }

    def create() {
        [objetivoEspecificoInstance: new ObjetivoEspecifico(params)]
    }

    def save() {
        def objetivoEspecificoInstance = new ObjetivoEspecifico(params)
        if (!objetivoEspecificoInstance.save(flush: true)) {
            render(view: "create", model: [objetivoEspecificoInstance: objetivoEspecificoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), objetivoEspecificoInstance.id])
        redirect(controller:"materia", action: "show", id: objetivoEspecificoInstance.materia.id)
    }

    def show(Long id) {
        def objetivoEspecificoInstance = ObjetivoEspecifico.get(id)
        if (!objetivoEspecificoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), id])
            redirect(action: "list")
            return
        }

        [objetivoEspecificoInstance: objetivoEspecificoInstance]
    }

    def edit(Long id) {
        def objetivoEspecificoInstance = ObjetivoEspecifico.get(id)
        if (!objetivoEspecificoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), id])
            redirect(action: "list")
            return
        }

        [objetivoEspecificoInstance: objetivoEspecificoInstance]
    }

    def update(Long id, Long version) {
        def objetivoEspecificoInstance = ObjetivoEspecifico.get(id)
        if (!objetivoEspecificoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (objetivoEspecificoInstance.version > version) {
                objetivoEspecificoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico')] as Object[],
                          "Another user has updated this ObjetivoEspecifico while you were editing")
                render(view: "edit", model: [objetivoEspecificoInstance: objetivoEspecificoInstance])
                return
            }
        }

        objetivoEspecificoInstance.properties = params

        if (!objetivoEspecificoInstance.save(flush: true)) {
            render(view: "edit", model: [objetivoEspecificoInstance: objetivoEspecificoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), objetivoEspecificoInstance.id])
        redirect(controller:"materia", action: "show", id: objetivoEspecificoInstance.materia.id)
    }

    def delete(Long id) {
        def objetivoEspecificoInstance = ObjetivoEspecifico.get(id)
        if (!objetivoEspecificoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), id])
            redirect(action: "list")
            return
        }

        try {
            objetivoEspecificoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico'), id])
            redirect(action: "show", id: id)
        }
    }
}
