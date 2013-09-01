package com.deukin
import grails.plugins.springsecurity.Secured
@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO'])

class AlumnoController {

	static scaffold=true
}
