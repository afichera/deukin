package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class CronogramaCarreraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cronogramaCarreraInstanceList: CronogramaCarrera.list(params), cronogramaCarreraInstanceTotal: CronogramaCarrera.count()]
    }

    def create() {
        [cronogramaCarreraInstance: new CronogramaCarrera(params)]
    }

    def save() {
        def cronogramaCarreraInstance = new CronogramaCarrera(params)
        if (!cronogramaCarreraInstance.save(flush: true)) {
            render(view: "create", model: [cronogramaCarreraInstance: cronogramaCarreraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), cronogramaCarreraInstance.id])
        redirect(action: "show", id: cronogramaCarreraInstance.id)
    }

    def show(Long id) {
        def cronogramaCarreraInstance = CronogramaCarrera.get(id)
        if (!cronogramaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), id])
            redirect(action: "list")
            return
        }

        [cronogramaCarreraInstance: cronogramaCarreraInstance]
    }

    def edit(Long id) {
        def cronogramaCarreraInstance = CronogramaCarrera.get(id)
        if (!cronogramaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), id])
            redirect(action: "list")
            return
        }

        [cronogramaCarreraInstance: cronogramaCarreraInstance]
    }

    def update(Long id, Long version) {
        def cronogramaCarreraInstance = CronogramaCarrera.get(id)
        if (!cronogramaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cronogramaCarreraInstance.version > version) {
                cronogramaCarreraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera')] as Object[],
                          "Another user has updated this CronogramaCarrera while you were editing")
                render(view: "edit", model: [cronogramaCarreraInstance: cronogramaCarreraInstance])
                return
            }
        }

        cronogramaCarreraInstance.properties = params

        if (!cronogramaCarreraInstance.save(flush: true)) {
            render(view: "edit", model: [cronogramaCarreraInstance: cronogramaCarreraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), cronogramaCarreraInstance.id])
        redirect(action: "show", id: cronogramaCarreraInstance.id)
    }

    def delete(Long id) {
        def cronogramaCarreraInstance = CronogramaCarrera.get(id)
        if (!cronogramaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), id])
            redirect(action: "list")
            return
        }

        try {
            cronogramaCarreraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cronogramaCarrera.label', default: 'CronogramaCarrera'), id])
            redirect(action: "show", id: id)
        }
    }
}
