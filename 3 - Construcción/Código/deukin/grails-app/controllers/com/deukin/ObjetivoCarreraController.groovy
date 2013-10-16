package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class ObjetivoCarreraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [objetivoCarreraInstanceList: ObjetivoCarrera.list(params), objetivoCarreraInstanceTotal: ObjetivoCarrera.count()]
    }

    def create() {
        [objetivoCarreraInstance: new ObjetivoCarrera(params)]
    }

    def save() {
        def objetivoCarreraInstance = new ObjetivoCarrera(params)
        if (!objetivoCarreraInstance.save(flush: true)) {
            render(view: "create", model: [objetivoCarreraInstance: objetivoCarreraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), objetivoCarreraInstance.id])
        redirect(action: "show", id: objetivoCarreraInstance.id)
    }

    def show(Long id) {
        def objetivoCarreraInstance = ObjetivoCarrera.get(id)
        if (!objetivoCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), id])
            redirect(action: "list")
            return
        }

        [objetivoCarreraInstance: objetivoCarreraInstance]
    }

    def edit(Long id) {
        def objetivoCarreraInstance = ObjetivoCarrera.get(id)
        if (!objetivoCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), id])
            redirect(action: "list")
            return
        }

        [objetivoCarreraInstance: objetivoCarreraInstance]
    }

    def update(Long id, Long version) {
        def objetivoCarreraInstance = ObjetivoCarrera.get(id)
        if (!objetivoCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (objetivoCarreraInstance.version > version) {
                objetivoCarreraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera')] as Object[],
                          "Another user has updated this ObjetivoCarrera while you were editing")
                render(view: "edit", model: [objetivoCarreraInstance: objetivoCarreraInstance])
                return
            }
        }

        objetivoCarreraInstance.properties = params

        if (!objetivoCarreraInstance.save(flush: true)) {
            render(view: "edit", model: [objetivoCarreraInstance: objetivoCarreraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), objetivoCarreraInstance.id])
        redirect(action: "show", id: objetivoCarreraInstance.id)
    }

    def delete(Long id) {
        def objetivoCarreraInstance = ObjetivoCarrera.get(id)
        if (!objetivoCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), id])
            redirect(action: "list")
            return
        }

        try {
            objetivoCarreraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera'), id])
            redirect(action: "show", id: id)
        }
    }
}
