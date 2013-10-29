package com.deukin

class EMailService {

    def serviceMethod() {

    }
	
	
	def enviarMailBienvenida(InscripcionInstitucion inscripcion){
		def retorno = true
		try{
			def cuerpo = '<h1><b> Bienvenido a Deukin ' + inscripcion.nombre +' '+ inscripcion.apellido +'!</b></h1><br/><br/>'
			cuerpo += 'A trav&eacute;s de nuestro sistema ud podr&aacute; contar&aacute con toda la informaci&oacuten relacionada con ' + inscripcion.alumno.nombre +'<br/>'
			cuerpo += 'Recuerde que para completar la inscripci&oacute;n debe asistir a nuestra instituci&oacute;n. <br/>'			
			cuerpo += 'Muchas gracias por elegirnos.<br/>'
			cuerpo += 'Saludos Cordiales.<br/>'
			cuerpo += 'Deukin <br/>'
			cuerpo += 'Contacto: deukin.contacto@gmail.com <br/>'
			
			asyncMailService.sendMail{
				// Mail parameters
				to inscripcion.usuarioRegistro.username
				subject "Bienvenido a Deukin"
				html cuerpo
//				attachBytes 'test.txt', 'text/plain', byteBuffer;
				// Additional asynchronous parameters (optional)
				beginDate new Date(System.currentTimeMillis()+60000)    // Starts after one minute, default current date
				endDate new Date(System.currentTimeMillis()+3600000)   // Must be sent in one hour, default infinity
				maxAttemptsCount 5   // Max 3 attempts to send, default 1
				attemptInterval 300000    // Minimum five minutes between attempts, default 300000 ms
				delete true    // Marks message for delete after sent
				immediate true    // Run send job after the message was created
				priority 10   // If priority is greater then message will be sent faster
			}
//			
//			mailService.sendMail {
//				to inscripcion.usuarioRegistro.username
//				subject "Bienvenido a Deukin"
//				html cuerpo
//			}
		}catch(Exception ex){
			//TODO: loggear
			retorno = false
		}
			
		retorno
	}

}
