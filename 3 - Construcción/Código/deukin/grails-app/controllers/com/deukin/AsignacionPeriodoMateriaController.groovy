package com.deukin

import org.springframework.dao.DataIntegrityViolationException

class AsignacionPeriodoMateriaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [asignacionPeriodoMateriaInstanceList: AsignacionPeriodoMateria.list(params), asignacionPeriodoMateriaInstanceTotal: AsignacionPeriodoMateria.count()]
    }

    def create() {
        [asignacionPeriodoMateriaInstance: new AsignacionPeriodoMateria(params)]
    }

    def save() {
        def asignacionPeriodoMateriaInstance = new AsignacionPeriodoMateria(params)
        if (!asignacionPeriodoMateriaInstance.save(flush: true)) {
            render(view: "create", model: [asignacionPeriodoMateriaInstance: asignacionPeriodoMateriaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), asignacionPeriodoMateriaInstance.id])
        redirect(action: "show", id: asignacionPeriodoMateriaInstance.id)
    }

    def show(Long id) {
        def asignacionPeriodoMateriaInstance = AsignacionPeriodoMateria.get(id)
        if (!asignacionPeriodoMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), id])
            redirect(action: "list")
            return
        }

        [asignacionPeriodoMateriaInstance: asignacionPeriodoMateriaInstance]
    }

    def edit(Long id) {
        def asignacionPeriodoMateriaInstance = AsignacionPeriodoMateria.get(id)
        if (!asignacionPeriodoMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), id])
            redirect(action: "list")
            return
        }

        [asignacionPeriodoMateriaInstance: asignacionPeriodoMateriaInstance]
    }

    def update(Long id, Long version) {
        def asignacionPeriodoMateriaInstance = AsignacionPeriodoMateria.get(id)
        if (!asignacionPeriodoMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (asignacionPeriodoMateriaInstance.version > version) {
                asignacionPeriodoMateriaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria')] as Object[],
                          "Another user has updated this AsignacionPeriodoMateria while you were editing")
                render(view: "edit", model: [asignacionPeriodoMateriaInstance: asignacionPeriodoMateriaInstance])
                return
            }
        }

        asignacionPeriodoMateriaInstance.properties = params

        if (!asignacionPeriodoMateriaInstance.save(flush: true)) {
            render(view: "edit", model: [asignacionPeriodoMateriaInstance: asignacionPeriodoMateriaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), asignacionPeriodoMateriaInstance.id])
        redirect(action: "show", id: asignacionPeriodoMateriaInstance.id)
    }

    def delete(Long id) {
        def asignacionPeriodoMateriaInstance = AsignacionPeriodoMateria.get(id)
        if (!asignacionPeriodoMateriaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), id])
            redirect(action: "list")
            return
        }

        try {
            asignacionPeriodoMateriaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asignacionPeriodoMateria.label', default: 'AsignacionPeriodoMateria'), id])
            redirect(action: "show", id: id)
        }
    }
}
