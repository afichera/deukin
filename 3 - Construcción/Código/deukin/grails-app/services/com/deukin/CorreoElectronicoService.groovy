package com.deukin

class CorreoElectronicoService {

	def serviceMethod() {
	}

	def asynchronousMailService

	def enviarMailBienvenida(InscripcionInstitucion inscripcion){
		def retorno = true
		def institucionEducativaUnica = InstitucionEducativa.findByNombre('UNLAM')
		try{
			def cuerpo = '<h1><b> Bienvenido a Deukin ' + inscripcion.nombre +' '+ inscripcion.apellido +'!</b></h1><br/><br/>'
			cuerpo += 'A trav&eacute;s de nuestro sistema ud podr&aacute; contar con toda la informaci&oacute;n relacionada con sus estudios en '+institucionEducativaUnica?.nombre+'.<br/>'
			cuerpo += 'Recuerde que para completar la inscripci&oacute;n debe asistir a nuestra instituci&oacute;n. <br/>'
			cuerpo += 'Muchas gracias por elegirnos.<br/>'
			cuerpo += 'Saludos Cordiales.<br/>'
			cuerpo += 'Deukin <br/><br/><br/><br/>'
			cuerpo += institucionEducativaUnica?.contacto?.domicilio?.calle+' '+institucionEducativaUnica?.contacto?.domicilio?.numero?.toString()+'<br/>'
			cuerpo += institucionEducativaUnica?.contacto?.domicilio?.localidad+' '+institucionEducativaUnica?.contacto?.domicilio?.codigoPostal.toString()+'<br/>'
			cuerpo += 'deukin.contacto@gmail.com <br/>'

			asynchronousMailService.sendMail{
				// Mail parameters
				to inscripcion.usuarioRegistro.username
				subject "Bienvenido a Deukin"
				html cuerpo;
			}
		}catch(Exception ex){
			log.error("Falló el envío de mail de Bienvenida. Se intentará reenviar luego. Causa: "+ex.message)
			retorno = false
		}

		retorno
	}

	def enviarMailActivacionAlumno(Alumno alumno){
		def retorno = true
		def institucionEducativaUnica = InstitucionEducativa.findByNombre('UNLAM')
		try{
			def cuerpo = '<h2><b> Estimado ' + alumno.nombre+' '+ alumno.apellido+'</b></h2><br/>'
			cuerpo += 'Se proceso su Registro fue procesado correctamente y su cuenta de Deukin ha sido activada.<br/>'
			cuerpo += 'Recuerde que para acceder deberá ingresar a nuestro sistema con el nombre de usuario y password con el que se registr&oacute;. <br/>'
			cuerpo += 'Su nombre de usuario es: '+alumno.usuario.username+'.<br/>'
			cuerpo += 'Saludos Cordiales.<br/><br/><br/>'
			cuerpo += institucionEducativaUnica.nombre+'<br/>'
			cuerpo += institucionEducativaUnica?.contacto?.domicilio?.calle+' '+institucionEducativaUnica?.contacto?.domicilio?.numero?.toString()+'<br/>'
			cuerpo += institucionEducativaUnica?.contacto?.domicilio?.localidad+' '+institucionEducativaUnica?.contacto?.domicilio?.codigoPostal.toString()+'<br/>'
			cuerpo += 'deukin.contacto@gmail.com <br/>'

			asynchronousMailService.sendMail{
				// Mail parameters
				to alumno.usuario.username
				subject "Cuenta Activada "
				html cuerpo;
			}
		}catch(Exception ex){
			log.error("Falló el envío de mail de Activación de cuenta. Se intentará reenviar luego. Causa: "+ex.message)
			retorno = false
		}

		retorno
	}
}
