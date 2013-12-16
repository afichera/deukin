package com.deukin

import grails.plugins.springsecurity.Secured

import org.springframework.dao.DataIntegrityViolationException

import com.deukin.exceptions.BusinessException

@Secured(['ROLE_ADMINISTRADOR_SISTEMA', 'ROLE_ALUMNO', 'ROLE_ADMINISTRATIVO', 'ROLE_DOCENTE', 'ROLE_COORDINADOR'])
class AlumnoController {

	def springSecurityService
	def usuarioService
	def alumnoService
	def personaService
	def subListaService

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
			listaAlumnos = Alumno.list(params)			
		}else if(usuarioService.poseeElRol(authorities, 'ROLE_DOCENTE')){
			listaAlumnos = Alumno.list(params)
		}

		if(listaAlumnos !=null && !listaAlumnos.isEmpty()){
			cantidad = listaAlumnos.size()
		}
		def subLista = subListaService.getSubList(listaAlumnos, params)

		[alumnoInstanceList: subLista, alumnoInstanceTotal: cantidad]
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
		
		def authorities =  springSecurityService.principal.authorities				
		def permiteVisualizar = true
		if(usuarioService.poseeElRol(authorities, 'ROLE_ALUMNO')){
			permiteVisualizar = usuarioService.esElUsuarioLogueado(id)		
		}
		
		if(!permiteVisualizar){
			render(view: "/noAutorizado" )
			return
		}		

		[alumnoInstance: alumnoInstance]
	}
	
	@Secured([
		'ROLE_ADMINISTRADOR_SISTEMA',
		'ROLE_ADMINISTRATIVO',
		'ROLE_ALUMNO',
	])
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
		
		def authorities =  springSecurityService.principal.authorities
		def permiteEditar = true
		if(usuarioService.poseeElRol(authorities, 'ROLE_ALUMNO')){
			permiteEditar = usuarioService.esElUsuarioLogueado(id)
		}
		
		if(!permiteEditar){
			flash.message = message(code: 'permisoEdicion.denegado', args: [message(code: 'alumno.label', default: 'Alumno'), id])
			redirect(action: "show", id: alumnoInstance.id)
			return
		}

		[alumnoInstance: alumnoInstance]
	}

	def update(Long id, Long version) {
		def alumnoInstance = Alumno.get(id)
		def documentoAux
		def alumnosAux = []
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


		
		def esAdministrador = usuarioService.poseeElRol(springSecurityService.principal.authorities,'ROLE_ADMINISTRADOR_SISTEMA')
		if(esAdministrador){
			//Tengo que buscar que no exista otro alumno con el mismo Doc y tipo
			documentoAux = alumnoInstance.documento
			if(documentoAux){
				alumnosAux = Alumno.findAllByDocumento(documentoAux)
				if(alumnosAux!=null && alumnosAux.size()>1){
					throw new BusinessException('El tipo y numero de documento ya existe en nuestro sistema.')
				}
				
			}
		
		}

		String validacionNumeros = alumnoService.validaNumeros(params)
		if (validacionNumeros!="")
		
		{
			alumnoInstance.clearErrors()
			alumnoInstance.errors.reject(message(code: 'materia.invalid.numeros', args:[validacionNumeros]))
			render(view: "edit", model: [alumnoInstance: alumnoInstance])
			return
		}
		
		def fileInstance = alumnoInstance.fotoPerfil
		def uploadedFile = request.getFile('fotoPerfil')
		
		if (uploadedFile.empty){
			alumnoInstance.properties = params
			alumnoInstance.fotoPerfil = fileInstance
		}else{
			alumnoInstance.properties = params
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
				alumnoInstance.toString()
			])
			redirect(action: "show", id: id)
		}
	}

}
