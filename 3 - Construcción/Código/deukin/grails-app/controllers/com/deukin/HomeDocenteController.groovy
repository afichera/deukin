package com.deukin
import grails.plugins.springsecurity.Secured;

@Secured('ROLE_DOCENTE')
class HomeDocenteController {

    def index() { }
}
