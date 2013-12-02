package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
class UsuarioRolController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	def usuarioService
	
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [usuarioRolInstanceList: UsuarioRol.list(params), usuarioRolInstanceTotal: UsuarioRol.count()]
    }

    def create() {
		//Viene desde Usuario
		if(params.usuarioId){
			def usuarioId = new Long(params.usuarioId)
			def usuario = Usuario.get(usuarioId)
			def usuarioRol = new UsuarioRol()
			usuarioRol.usuario = usuario
			[usuarioRolInstance: usuarioRol, vieneDesdeUsuario:true]
		}else{
			[usuarioRolInstance: new UsuarioRol(params)]
		}
        
    }
	
	def createFromUser(Long id) {
		def usuario = Usuario.get(id)
		def usuarioRol = new UsuarioRol(params)
		usuarioRol.usuario = usuario		
		[usuarioRolInstance: usuarioRol]
	}

    def save() {
        def usuarioRolInstance = new UsuarioRol(params)
		def usuarioId

		if (!usuarioRolInstance.save(flush: true)) {
            render(view: "create", model: [usuarioRolInstance: usuarioRolInstance])
            return
        }

        flash.message = 'Asignación de Usuario/Rol creada correctamente'

         redirect(action: "list", params: params)
    }
	
    def show(Long id) {
		Long userId
		Long rolId
		def usuario		
		def rol
		def usuarioRolInstance
		if(params.userId){
			userId = new Long(params.userId)
		}
        if(params.rolId){
			rolId = new Long(params.rolId)
		}
		if(userId && rolId){
			usuario = Usuario.get(userId)
			rol = Rol.get(rolId)
			usuarioRolInstance = UsuarioRol.findByUsuarioAndRol(usuario, rol)
		}else{
			usuarioRolInstance = new UsuarioRol(params)
		}
		
		

        if (!usuarioRolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), id])
            redirect(action: "list")
            return
        }

        [usuarioRolInstance: usuarioRolInstance]
    }

    def edit(Long id) {
        def usuarioRolInstance = UsuarioRol.get(id)
        if (!usuarioRolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), id])
            redirect(action: "list")
            return
        }

        [usuarioRolInstance: usuarioRolInstance]
    }

    def update(Long id, Long version) {
        def usuarioRolInstance = UsuarioRol.get(id)
        if (!usuarioRolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (usuarioRolInstance.version > version) {
                usuarioRolInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'usuarioRol.label', default: 'UsuarioRol')] as Object[],
                          "Another user has updated this UsuarioRol while you were editing")
                render(view: "edit", model: [usuarioRolInstance: usuarioRolInstance])
                return
            }
        }

        usuarioRolInstance.properties = params

        if (!usuarioRolInstance.save(flush: true)) {
            render(view: "edit", model: [usuarioRolInstance: usuarioRolInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), usuarioRolInstance.id])
        redirect(action: "show", id: usuarioRolInstance.id)
    }

    def delete(Long id) {
        def usuarioRolInstance = UsuarioRol.get(id)
        if (!usuarioRolInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), id])
            redirect(action: "list")
            return
        }

        try {
            usuarioRolInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuarioRol.label', default: 'UsuarioRol'), id])
            redirect(action: "show", id: id)
        }
    }
	
	def searchUsuarios = {
		def queryRegex = "${params.query}"
		def usuarios = usuarioService.obtenerUsuariosLikeQueryRegex(queryRegex)

		render(contentType: "text/xml") {
			results() {
				usuarios.each { usuario ->
					result(){
						name(usuario.username)
						id(usuario.id)
					}
				}
			}
		}
	}

	
}
