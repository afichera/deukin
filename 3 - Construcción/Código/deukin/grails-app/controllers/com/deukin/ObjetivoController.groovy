package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class ObjetivoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [objetivoInstanceList: Objetivo.list(params), objetivoInstanceTotal: Objetivo.count()]
    }

    def create() {
        [objetivoInstance: new Objetivo(params)]
    }

    def save() {
        def objetivoInstance = new Objetivo(params)
        if (!objetivoInstance.save(flush: true)) {
            render(view: "create", model: [objetivoInstance: objetivoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), objetivoInstance.id])
        redirect(controller:"materia", action: "show", id: objetivoInstance.materia.id)
    }

    def show(Long id) {
        def objetivoInstance = Objetivo.get(id)
        if (!objetivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
            redirect(action: "list")
            return
        }

        [objetivoInstance: objetivoInstance]
    }

    def edit(Long id) {
        def objetivoInstance = Objetivo.get(id)
        if (!objetivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
            redirect(action: "list")
            return
        }

        [objetivoInstance: objetivoInstance]
    }

    def update(Long id, Long version) {
        def objetivoInstance = Objetivo.get(id)
        if (!objetivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (objetivoInstance.version > version) {
                objetivoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'objetivo.label', default: 'Objetivo')] as Object[],
                          "Another user has updated this Objetivo while you were editing")
                render(view: "edit", model: [objetivoInstance: objetivoInstance])
                return
            }
        }

        objetivoInstance.properties = params

        if (!objetivoInstance.save(flush: true)) {
            render(view: "edit", model: [objetivoInstance: objetivoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), objetivoInstance.id])
        redirect(controller:"materia", action: "show", id: objetivoInstance.materia.id)
    }

    def delete(Long id) {
        def objetivoInstance = Objetivo.get(id)
        if (!objetivoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
            redirect(action: "list")
            return
        }

        try {
            objetivoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'objetivo.label', default: 'Objetivo'), id])
            redirect(action: "show", id: id)
        }
    }
}
