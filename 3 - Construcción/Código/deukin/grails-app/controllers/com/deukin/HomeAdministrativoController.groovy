package com.deukin
import grails.plugins.springsecurity.Secured

@Secured('ROLE_ADMINISTRATIVO')
class HomeAdministrativoController {

    def index() { }
}
