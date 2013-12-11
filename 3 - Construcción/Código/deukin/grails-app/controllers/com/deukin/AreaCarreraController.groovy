package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_COORDINADOR', 'ROLE_ADMINISTRADOR_SISTEMA'])
class AreaCarreraController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [areaCarreraInstanceList: AreaCarrera.list(params), areaCarreraInstanceTotal: AreaCarrera.count()]
    }

    def create() {
        [areaCarreraInstance: new AreaCarrera(params)]
    }

    def save() {
        def areaCarreraInstance = new AreaCarrera(params)
        if (!areaCarreraInstance.save(flush: true)) {
            render(view: "create", model: [areaCarreraInstance: areaCarreraInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), areaCarreraInstance.id])
        redirect(action: "show", id: areaCarreraInstance.id)
    }

    def show(Long id) {
        def areaCarreraInstance = AreaCarrera.get(id)
        if (!areaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), id])
            redirect(action: "list")
            return
        }

        [areaCarreraInstance: areaCarreraInstance]
    }

    def edit(Long id) {
        def areaCarreraInstance = AreaCarrera.get(id)
        if (!areaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), id])
            redirect(action: "list")
            return
        }

        [areaCarreraInstance: areaCarreraInstance]
    }

    def update(Long id, Long version) {
        def areaCarreraInstance = AreaCarrera.get(id)
        if (!areaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (areaCarreraInstance.version > version) {
                areaCarreraInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'areaCarrera.label', default: 'AreaCarrera')] as Object[],
                          "Another user has updated this AreaCarrera while you were editing")
                render(view: "edit", model: [areaCarreraInstance: areaCarreraInstance])
                return
            }
        }

        areaCarreraInstance.properties = params

        if (!areaCarreraInstance.save(flush: true)) {
            render(view: "edit", model: [areaCarreraInstance: areaCarreraInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), areaCarreraInstance.id])
        redirect(action: "show", id: areaCarreraInstance.id)
    }

    def delete(Long id) {
        def areaCarreraInstance = AreaCarrera.get(id)
        if (!areaCarreraInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), id])
            redirect(action: "list")
            return
        }

        try {
            areaCarreraInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'areaCarrera.label', default: 'AreaCarrera'), areaCarreraInstance.nombre])
            redirect(action: "show", id: id)
        }
    }
}
