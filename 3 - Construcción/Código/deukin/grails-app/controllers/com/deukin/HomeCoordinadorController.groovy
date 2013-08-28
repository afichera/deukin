package com.deukin
import grails.plugins.springsecurity.Secured;

@Secured('ROLE_COORDINADOR')
class HomeCoordinadorController {

    def index() { }
}
