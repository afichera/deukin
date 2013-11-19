package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_ADMINISTRATIVO', 'ROLE_DOCENTE', 'ROLE_COORDINADOR'])
class AlumnoController {

	def springSecurityService
	def usuarioService
	def alumnoService
	def personaService

	static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

	def index() {
		redirect(action: "list", params: params)
	}

	@Secured([
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ADMINISTRATIVO',
		'ROLE_DOCENTE',
		'ROLE_COORDINADOR'
	])
	def list(Integer max) {
		def authorities =  springSecurityService.principal.authorities
		def listaAlumnos
		def cantidad = 0

		params.max = Math.min(max ?: 10, 100)


		if(usuarioService.poseeElRol(authorities, 'ROLE_ADMINISTRADOR_SISTEMA')){
			listaAlumnos = Alumno.list(params)
		}else if(usuarioService.poseeElRol(authorities, 'ROLE_ADMINISTRATIVO')){
			listaAlumnos = Alumno.list(params)
		}else if(usuarioService.poseeElRol(authorities, 'ROLE_COORDINADOR')){
			def coordinador = personaService.findByUser(springSecurityService.principal)
			listaAlumnos = alumnoService.findAllAlumnosByCoordinadorACargo(coordinador, params)
		}else if(usuarioService.poseeElRol(authorities, 'ROLE_DOCENTE')){
			def docente = personaService.findByUser(springSecurityService.principal)
			listaAlumnos = alumnoService.findAllAlumnosByDocente(docente, params)
		}

		if(listaAlumnos !=null && !listaAlumnos.isEmpty()){
			cantidad = listaAlumnos.size()
		}

		[alumnoInstanceList: listaAlumnos, alumnoInstanceTotal: cantidad]
	}

	def create() {
		[alumnoInstance: new Alumno(params)]
	}

	def save() {
		def alumnoInstance = new Alumno(params)
		if (!alumnoInstance.save(flush: true)) {
			render(view: "create", model: [alumnoInstance: alumnoInstance])
			return
		}

		flash.message = message(code: 'default.created.message', args: [
			message(code: 'alumno.label', default: 'Alumno'),
			alumnoInstance.id
		])
		redirect(action: "show", id: alumnoInstance.id)
	}

	def show(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		[alumnoInstance: alumnoInstance]
	}

	def edit(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		[alumnoInstance: alumnoInstance]
	}

	def update(Long id, Long version) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		if (version != null) {
			if (alumnoInstance.version > version) {
				alumnoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
						[
							message(code: 'alumno.label', default: 'Alumno')] as Object[],
						"Another user has updated this Alumno while you were editing")
				render(view: "edit", model: [alumnoInstance: alumnoInstance])
				return
			}
		}

		def fotoPerfilAnterior = alumnoInstance.fotoPerfil

		alumnoInstance.properties = params

		//esto evita que se nulee la foto de perfil al actualizar si ya tenia.
		if(alumnoInstance.fotoPerfil == null){
			alumnoInstance.fotoPerfil = fotoPerfilAnterior
		}

		if (!alumnoInstance.save(flush: true)) {
			render(view: "edit", model: [alumnoInstance: alumnoInstance])
			return
		}

		flash.message = message(code: 'default.updated.message', args: [
			message(code: 'alumno.label', default: 'Alumno'),
			alumnoInstance.id
		])
		redirect(action: "show", id: alumnoInstance.id)
	}


	def eliminarFotoPerfil(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		alumnoInstance.fotoPerfil = null

		render(view: "edit", model: [alumnoInstance: alumnoInstance])
		return
	}


	def delete(Long id) {
		def alumnoInstance = Alumno.get(id)
		if (!alumnoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
			return
		}

		try {
			alumnoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "list")
		}
		catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [
				message(code: 'alumno.label', default: 'Alumno'),
				id
			])
			redirect(action: "show", id: id)
		}
	}

}
