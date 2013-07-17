package com.deukin

class Autoridad {
	
	Persona persona
	String cargo
	
    static constraints = {
		persona(unique:true)
		cargo(maxLength:100)
    }
}
