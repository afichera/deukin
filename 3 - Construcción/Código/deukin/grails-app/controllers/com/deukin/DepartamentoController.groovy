package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
class DepartamentoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [departamentoInstanceList: Departamento.list(params), departamentoInstanceTotal: Departamento.count()]
    }

    def create() {
        [departamentoInstance: new Departamento(params)]
    }

    def save() {
        def departamentoInstance = new Departamento(params)
        if (!departamentoInstance.save(flush: true)) {
            render(view: "create", model: [departamentoInstance: departamentoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
        redirect(action: "show", id: departamentoInstance.id)
    }

    def show(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        [departamentoInstance: departamentoInstance]
    }

    def edit(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        [departamentoInstance: departamentoInstance]
    }

    def update(Long id, Long version) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (departamentoInstance.version > version) {
                departamentoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'departamento.label', default: 'Departamento')] as Object[],
                          "Otro usuario modificó el departamento mientras usted lo estaba editando.")
                render(view: "edit", model: [departamentoInstance: departamentoInstance])
                return
            }
        }

        departamentoInstance.properties = params

        if (!departamentoInstance.save(flush: true)) {
            render(view: "edit", model: [departamentoInstance: departamentoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.id])
        redirect(action: "show", id: departamentoInstance.id)
    }

    def delete(Long id) {
        def departamentoInstance = Departamento.get(id)
        if (!departamentoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
            return
        }

        try {
            departamentoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'departamento.label', default: 'Departamento'), departamentoInstance.toString()])
            redirect(action: "show", id: id)
        }
    }
}
