package com.deukin

import org.springframework.dao.DataIntegrityViolationException

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default

class TelefonoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "GET"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [telefonoInstanceList: Telefono.list(params), telefonoInstanceTotal: Telefono.count()]
    }

    def create() {
        [telefonoInstance: new Telefono(params)]
    }

    def save() {
        def telefonoInstance = new Telefono(params)
        if (!telefonoInstance.save(flush: true)) {
            render(view: "create", model: [telefonoInstance: telefonoInstance])
            return
        }

		if(params.origen=='alumno') {
			def alumnoInstance = Alumno.findByContacto(telefonoInstance.contacto)
			
			flash.message = message(code: 'telefono.created.message')
			redirect(controller: "alumno", action: "show", id: alumnoInstance.id)
			
		}
		else 
		if(params.origen=='docente') {
			def docenteInstance = Docente.findByContacto(telefonoInstance.contacto)
			
			flash.message = message(code: 'telefono.created.message')
			redirect(controller: "docente", action: "show", id: docenteInstance.id)
			
		}
		else {
        flash.message = message(code: 'telefono.created.message', args: [message(code: 'telefono.label', default: 'Telefono'), telefonoInstance.id])
        redirect(action: "show", id: telefonoInstance.id)
		}
    }

    def show(Long id) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        [telefonoInstance: telefonoInstance]
    }

    def edit(Long id) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        [telefonoInstance: telefonoInstance]
    }

    def update(Long id, Long version) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (telefonoInstance.version > version) {
                telefonoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'telefono.label', default: 'Telefono')] as Object[],
                          "Another user has updated this Telefono while you were editing")
                render(view: "edit", model: [telefonoInstance: telefonoInstance])
                return
            }
        }

        telefonoInstance.properties = params

        if (!telefonoInstance.save(flush: true)) {
            render(view: "edit", model: [telefonoInstance: telefonoInstance])
            return
        }

        flash.message = message(code: 'telefono.updated.message', args: [message(code: 'telefono.label', default: 'Telefono'), telefonoInstance.id])
        redirect(action: "show", id: telefonoInstance.id)
    }

    def delete(Long id) {
        def telefonoInstance = Telefono.get(id)
        if (!telefonoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
            return
        }
		
		String origen =''
		
		if(params.origen) {
			origen = params.origen
		}
		
	def personaInstance = Persona.findByContacto(telefonoInstance.contacto)
		


        try {
			
            telefonoInstance.delete(flush: true)
			if(origen!='') {
				
				
				flash.message = message(code: 'telefono.deleted.message')
				redirect(controller: origen, action: "show", id: personaInstance.id)
				
			}
		
			else {
			flash.message = message(code: 'telefono.deleted.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "list")
			}
			
            
			
			
			
			
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'telefono.label', default: 'Telefono'), id])
            redirect(action: "show", id: id)
        }
    }
}
