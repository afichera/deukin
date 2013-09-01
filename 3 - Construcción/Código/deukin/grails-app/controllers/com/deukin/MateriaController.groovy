package com.deukin

import grails.plugins.springsecurity.Secured

@Secured(['ROLE_COORDINADOR','ROLE_ADMINISTRATIVO','ROLE_DOCENTE'])
class MateriaController {
	static scaffold=true
    
}
