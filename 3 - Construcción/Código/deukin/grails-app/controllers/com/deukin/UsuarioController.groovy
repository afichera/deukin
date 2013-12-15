package com.deukin



import grails.plugins.springsecurity.Secured
import groovy.text.SimpleTemplateEngine

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.springsecurity.ui.RegistrationCode
import org.springframework.dao.DataIntegrityViolationException
@Secured(['ROLE_ADMINISTRATIVO', 'ROLE_COORDINADOR', 'ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_DOCENTE'])
class UsuarioController {

	def springSecurityService
	def usuarioService
	def asynchronousMailService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
	def index() {
		redirect(action: "list", params: params)
	}

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
	def list(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		def roles = UsuarioRol.list()
		[usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count(),roles : roles]
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

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'usuario.label', default: 'Usuario'),
			usuarioInstance.id
		])
		redirect(action: "show", id: usuarioInstance.id)
	}

	@Secured([
		'ROLE_ADMINISTRATIVO',
		'ROLE_COORDINADOR',
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ALUMNO',
		'ROLE_DOCENTE'
	])
	def show(Long id) {
		//TODO: Verificar que esté editando a sí mismo si no es ADMINISTRADOR DE SISTEMA
		def usuarioLogueado = usuarioService.obtenerUsuario(springSecurityService.principal)

		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}

		if(!usuarioService.poseeElRol(springSecurityService.principal.authorities, 'ROLE_ADMINISTRADOR_SISTEMA')){
			if(usuarioLogueado != usuarioInstance){
				render(view: "/noAutorizado" )
			}
		}
		def roles = UsuarioRol.findAllByUsuario(usuarioInstance).rol
		[usuarioInstance: usuarioInstance, rolesInstanceList: roles]
	}

	@Secured([
		'ROLE_ADMINISTRATIVO',
		'ROLE_COORDINADOR',
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ALUMNO',
		'ROLE_DOCENTE'
	])
	def edit(Long id) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}
		[usuarioInstance: usuarioInstance]
	}

	@Secured([
		'ROLE_ADMINISTRATIVO',
		'ROLE_COORDINADOR',
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ALUMNO',
		'ROLE_DOCENTE'
	])
	def update(Long id, Long version) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}


		if(usuarioInstance)

			if (version != null) {
				if (usuarioInstance.version > version) {
					usuarioInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
							[
								message(code: 'usuario.label', default: 'Usuario')] as Object[],
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

		flash.message = message(code: 'usuario.updated.message', args: [
			message(code: 'usuario.label', default: 'Usuario'),
			usuarioInstance.username
		])
		redirect(action: "show", id: usuarioInstance.id)
	}

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
	def delete(Long id) {
		def usuarioInstance = Usuario.get(id)
		if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			usuarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'usuario.label', default: 'Usuario'),
				usuarioInstance?.username
			])
			redirect(action: "show", id: id)
		}
	}

	@Secured(['ROLE_ADMINISTRADOR_SISTEMA'])
	def resetearPassword(Long id){
		
		def user = Usuario.get(id)
		if (!user) {
			flash.error = message(code: 'spring.security.ui.forgotPassword.user.notFound')
			redirect action: 'show'
			return
		}

		def registrationCode = new RegistrationCode(username: user.username)
		registrationCode.save(flush: true)

		String url = generateLink('resetPassword', [t: registrationCode.token])

		def conf = SpringSecurityUtils.securityConfig
		def body = '''\
Hola $user.username,<br/>
<br/>
Usted (o alguien en su lugar) solicit&oacute; restear el password de su cuenta de Deukin.<br/>
<br/>
Si usted no lo ha solicitado, entonces simplemente ignore este email; no se realizar&aacute;n cambios.<br/>
<br/>
Si usted lo solicit&oacute;, haga clic <a href="$url">aqu&iacute;</a> para resetear su password.
'''
		if (body.contains('$')) {
			body = evaluate(body, [user: user, url: url])
		}
		asynchronousMailService.sendMail {
			to user.username
			subject conf.ui.forgotPassword.emailSubject
			html body.toString()
		}		
		flash.message = 'Se envió el mail para proseguir con el reseteo de password'		
		redirect(action: "show", id: id)		
	}

	protected String generateLink(String action, linkParams) {
		createLink(base: "$request.scheme://$request.serverName:$request.serverPort$request.contextPath",
		controller: 'login', action: action,
		params: linkParams)
	}

	protected String evaluate(s, binding) {
		new SimpleTemplateEngine().createTemplate(s).make(binding)
	}

}
