package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured('ROLE_ADMINISTRADOR_SISTEMA')
class EspacioFisicoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [espacioFisicoInstanceList: EspacioFisico.list(params), espacioFisicoInstanceTotal: EspacioFisico.count()]
    }

    def create() {
        [espacioFisicoInstance: new EspacioFisico(params)]
    }

    def save() {
        def espacioFisicoInstance = new EspacioFisico(params)
        if (!espacioFisicoInstance.save(flush: true)) {
            render(view: "create", model: [espacioFisicoInstance: espacioFisicoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), espacioFisicoInstance.id])
        redirect(action: "show", id: espacioFisicoInstance.id)
    }

    def show(Long id) {
        def espacioFisicoInstance = EspacioFisico.get(id)
        if (!espacioFisicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), id])
            redirect(action: "list")
            return
        }

        [espacioFisicoInstance: espacioFisicoInstance]
    }

    def edit(Long id) {
        def espacioFisicoInstance = EspacioFisico.get(id)
        if (!espacioFisicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), id])
            redirect(action: "list")
            return
        }

        [espacioFisicoInstance: espacioFisicoInstance]
    }

    def update(Long id, Long version) {
        def espacioFisicoInstance = EspacioFisico.get(id)
        if (!espacioFisicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (espacioFisicoInstance.version > version) {
                espacioFisicoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'espacioFisico.label', default: 'EspacioFisico')] as Object[],
                          "Another user has updated this EspacioFisico while you were editing")
                render(view: "edit", model: [espacioFisicoInstance: espacioFisicoInstance])
                return
            }
        }

        espacioFisicoInstance.properties = params

        if (!espacioFisicoInstance.save(flush: true)) {
            render(view: "edit", model: [espacioFisicoInstance: espacioFisicoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), espacioFisicoInstance.id])
        redirect(action: "show", id: espacioFisicoInstance.id)
    }

    def delete(Long id) {
        def espacioFisicoInstance = EspacioFisico.get(id)
        if (!espacioFisicoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), id])
            redirect(action: "list")
            return
        }

        try {
            espacioFisicoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'espacioFisico.label', default: 'EspacioFisico'), espacioFisicoInstance.toString()])
            redirect(action: "show", id: id)
        }
    }
}
