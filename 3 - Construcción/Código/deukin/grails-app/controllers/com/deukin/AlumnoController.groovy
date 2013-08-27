package com.deukin
import grails.plugins.springsecurity.Secured
@Secured(['ROLE_COORDINADOR'])

class AlumnoController {

	static scaffold=true
}
