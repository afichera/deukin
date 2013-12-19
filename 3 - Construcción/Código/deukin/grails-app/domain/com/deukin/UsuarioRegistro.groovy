package com.deukin

/**
 * Representa un usuario temporal del registro al sistema.
 * Surge de la necesidad de no ensuciar la tabla de Usuario principal del sistema.
 * @author Ale Mobile
 * @since 19/12/2013
 */
class UsuarioRegistro implements Serializable{
	String username
	String password
	String password2

	static transients = ['password2']
	
	
    static constraints = {
		username blank: false, email:true, maxSize:50	
		password blank: false, maxSize:64, minSize:6,matches: "[0-9a-zA-Z]+", validator:{password,obj ->
			def password2=obj.properties['password2']
			if (password2==null) return true
			password2==password ? true:['invalid.matchingPasswords']
			}
			
		password2 blank:false
		
    }
	
	String toString(){
		username
	}
}
