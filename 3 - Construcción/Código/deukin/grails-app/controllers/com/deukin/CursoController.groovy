package com.deukin

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_DOCENTE'])
class CursoController {

    static scaffold=true
}
