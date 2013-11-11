package com.deukin

class UsuarioRegistro implements Serializable{
	String username
	String password
	String password2

	static transients = ['password2']
	
	
    static constraints = {
		username blank: false, email:true, maxSize:50	
		password blank: false, validator:{password,obj ->
			def password2=obj.properties['password2']
			if (password2==null) return true
			password2==password ? true:['invalid.matchingPasswords']
			}
			
		password2 blank:false
		
    }
}
