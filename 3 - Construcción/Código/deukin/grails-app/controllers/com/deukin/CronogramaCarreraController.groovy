package com.deukin

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO'])
class CronogramaCarreraController {

    static scaffold=true
}
