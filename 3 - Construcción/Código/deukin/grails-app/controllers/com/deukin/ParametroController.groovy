package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class ParametroController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [parametroInstanceList: Parametro.list(params), parametroInstanceTotal: Parametro.count()]
    }

    def create() {
        [parametroInstance: new Parametro(params)]
    }

    def save() {
        def parametroInstance = new Parametro(params)
        if (!parametroInstance.save(flush: true)) {
            render(view: "create", model: [parametroInstance: parametroInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'parametro.label', default: 'Parametro'), parametroInstance.id])
        redirect(action: "show", id: parametroInstance.id)
    }

    def show(Long id) {
        def parametroInstance = Parametro.get(id)
        if (!parametroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), id])
            redirect(action: "list")
            return
        }

        [parametroInstance: parametroInstance]
    }

    def edit(Long id) {
        def parametroInstance = Parametro.get(id)
        if (!parametroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), id])
            redirect(action: "list")
            return
        }

        [parametroInstance: parametroInstance]
    }

    def update(Long id, Long version) {
        def parametroInstance = Parametro.get(id)
        if (!parametroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (parametroInstance.version > version) {
                parametroInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'parametro.label', default: 'Parametro')] as Object[],
                          "Another user has updated this Parametro while you were editing")
                render(view: "edit", model: [parametroInstance: parametroInstance])
                return
            }
        }

        parametroInstance.properties = params

        if (!parametroInstance.save(flush: true)) {
            render(view: "edit", model: [parametroInstance: parametroInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'parametro.label', default: 'Parametro'), parametroInstance.id])
        redirect(action: "show", id: parametroInstance.id)
    }

    def delete(Long id) {
        def parametroInstance = Parametro.get(id)
        if (!parametroInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'parametro.label', default: 'Parametro'), id])
            redirect(action: "list")
            return
        }

        try {
            parametroInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'parametro.label', default: 'Parametro'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'parametro.label', default: 'Parametro'), id])
            redirect(action: "show", id: id)
        }
    }
}
