package com.deukin

/**
 * Representa un Rol que puede tener un {@link Usuario}
 * Los roles Posibles son: ROLE_ALUMNO, ROLE_DOCENTE, ROLE_COORDINADOR, ROLE_ADMINISTRATIVO, ROLE_ADMINISTRADOR_SISTEMA
 * @author Ale Mobile
 * @since 19/12/2013
 */
class Rol {

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
	
	String toString(){
		authority
	}
}
