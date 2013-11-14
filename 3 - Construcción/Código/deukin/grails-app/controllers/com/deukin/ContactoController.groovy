package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured('IS_AUTHENTICATED_REMEMBERED')
class ContactoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [contactoInstanceList: Contacto.list(params), contactoInstanceTotal: Contacto.count()]
    }

    def create() {
        [contactoInstance: new Contacto(params)]
    }

    def save() {
        def contactoInstance = new Contacto(params)
        if (!contactoInstance.save(flush: true)) {
            render(view: "create", model: [contactoInstance: contactoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'contacto.label', default: 'Contacto'), contactoInstance.id])
        redirect(action: "show", id: contactoInstance.id)
    }

    def show(Long id) {
        def contactoInstance = Contacto.get(id)
        if (!contactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
            redirect(action: "list")
            return
        }

        [contactoInstance: contactoInstance]
    }

    def edit(Long id) {
        def contactoInstance = Contacto.get(id)
        if (!contactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
            redirect(action: "list")
            return
        }

        [contactoInstance: contactoInstance]
    }

    def update(Long id, Long version) {
        def contactoInstance = Contacto.get(id)
        if (!contactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (contactoInstance.version > version) {
                contactoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'contacto.label', default: 'Contacto')] as Object[],
                          "Another user has updated this Contacto while you were editing")
                render(view: "edit", model: [contactoInstance: contactoInstance])
                return
            }
        }

        contactoInstance.properties = params

        if (!contactoInstance.save(flush: true)) {
            render(view: "edit", model: [contactoInstance: contactoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'contacto.label', default: 'Contacto'), contactoInstance.id])
        redirect(action: "show", id: contactoInstance.id)
    }

    def delete(Long id) {
        def contactoInstance = Contacto.get(id)
        if (!contactoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
            redirect(action: "list")
            return
        }

        try {
            contactoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'contacto.label', default: 'Contacto'), id])
            redirect(action: "show", id: id)
        }
    }
}
