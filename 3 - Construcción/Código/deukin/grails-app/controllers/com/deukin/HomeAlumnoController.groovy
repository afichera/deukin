package com.deukin
import grails.plugins.springsecurity.Secured

@Secured('ROLE_ALUMNO')
class HomeAlumnoController {

    def index() { }
}
