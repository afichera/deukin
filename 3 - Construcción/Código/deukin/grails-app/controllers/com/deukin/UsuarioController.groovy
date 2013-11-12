package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_ADMINISTRATIVO', 'ROLE_COORDINADOR', 'ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_DOCENTE'])
class UsuarioController {
	
	def springSecurityService
	def usuarioService
    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
    def index() {
        redirect(action: "list", params: params)
    }

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
    def create() {
        [usuarioInstance: new Usuario(params)]
    }

	
    def save() {
        def usuarioInstance = new Usuario(params)
        if (!usuarioInstance.save(flush: true)) {
            render(view: "create", model: [usuarioInstance: usuarioInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(action: "show", id: usuarioInstance.id)
    }

	@Secured(['ROLE_ADMINISTRATIVO', 'ROLE_COORDINADOR', 'ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_DOCENTE'])
    def show(Long id) {
		//TODO: Verificar que esté editando a sí mismo si no es ADMINISTRADOR DE SISTEMA
		def usuarioLogueado = usuarioService.obtenerUsuario(springSecurityService.principal)
		
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }
		
		if(!usuarioService.poseeElRol(springSecurityService.principal.authorities, 'ROLE_ADMINISTRADOR_SISTEMA')){
			if(usuarioLogueado != usuarioInstance){
				render(view: "/noAutorizado" )
			}
		}

        [usuarioInstance: usuarioInstance]
    }
	
	@Secured(['ROLE_ADMINISTRATIVO', 'ROLE_COORDINADOR', 'ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_DOCENTE'])	
    def edit(Long id) { 
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }
        [usuarioInstance: usuarioInstance]
    }

	@Secured(['ROLE_ADMINISTRATIVO', 'ROLE_COORDINADOR', 'ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_DOCENTE'])
    def update(Long id, Long version) {
        def usuarioInstance = Usuario.get(id)		
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }
		
		
		if(usuarioInstance)

        if (version != null) {
            if (usuarioInstance.version > version) {
                usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                render(view: "edit", model: [usuarioInstance: usuarioInstance])
                return
            }
        }

        usuarioInstance.properties = params

        if (!usuarioInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioInstance: usuarioInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
        redirect(action: "show", id: usuarioInstance.id)
    }

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
    def delete(Long id) {
        def usuarioInstance = Usuario.get(id)
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
            return
        }

        try {
            usuarioInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), id])
            redirect(action: "show", id: id)
        }
    }
}
