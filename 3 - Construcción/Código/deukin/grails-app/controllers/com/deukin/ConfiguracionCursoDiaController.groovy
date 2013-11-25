package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_DOCENTE', 'ROLE_ADMINISTRADOR_SISTEMA'])
class ConfiguracionCursoDiaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [configuracionCursoDiaInstanceList: ConfiguracionCursoDia.list(params), configuracionCursoDiaInstanceTotal: ConfiguracionCursoDia.count()]
    }

    def create() {
        [configuracionCursoDiaInstance: new ConfiguracionCursoDia(params)]
    }

    def save() {
        def configuracionCursoDiaInstance = new ConfiguracionCursoDia(params)
        if (!configuracionCursoDiaInstance.save(flush: true)) {
            render(view: "create", model: [configuracionCursoDiaInstance: configuracionCursoDiaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), configuracionCursoDiaInstance.id])
        redirect(action: "show", id: configuracionCursoDiaInstance.id)
    }

    def show(Long id) {
        def configuracionCursoDiaInstance = ConfiguracionCursoDia.get(id)
        if (!configuracionCursoDiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), id])
            redirect(action: "list")
            return
        }

        [configuracionCursoDiaInstance: configuracionCursoDiaInstance]
    }

    def edit(Long id) {
        def configuracionCursoDiaInstance = ConfiguracionCursoDia.get(id)
        if (!configuracionCursoDiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), id])
            redirect(action: "list")
            return
        }

        [configuracionCursoDiaInstance: configuracionCursoDiaInstance]
    }

    def update(Long id, Long version) {
        def configuracionCursoDiaInstance = ConfiguracionCursoDia.get(id)
        if (!configuracionCursoDiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (configuracionCursoDiaInstance.version > version) {
                configuracionCursoDiaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia')] as Object[],
                          "Another user has updated this ConfiguracionCursoDia while you were editing")
                render(view: "edit", model: [configuracionCursoDiaInstance: configuracionCursoDiaInstance])
                return
            }
        }

        configuracionCursoDiaInstance.properties = params

        if (!configuracionCursoDiaInstance.save(flush: true)) {
            render(view: "edit", model: [configuracionCursoDiaInstance: configuracionCursoDiaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), configuracionCursoDiaInstance.id])
        redirect(action: "show", id: configuracionCursoDiaInstance.id)
    }

    def delete(Long id) {
        def configuracionCursoDiaInstance = ConfiguracionCursoDia.get(id)
        if (!configuracionCursoDiaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), id])
            redirect(action: "list")
            return
        }

        try {
            configuracionCursoDiaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia'), id])
            redirect(action: "show", id: id)
        }
    }
}
