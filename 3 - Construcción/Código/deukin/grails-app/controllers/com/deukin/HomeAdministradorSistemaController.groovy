package com.deukin
import grails.plugins.springsecurity.Secured;

@Secured('ROLE_ADMINISTRADOR_SISTEMA')
class HomeAdministradorSistemaController {

    def index() { }
}
