package com.deukin

class Autoridad {
	
	Persona persona
	String cargo
	static belongsTo = [Departamento, InstitucionEducativa]
	
    static constraints = {
		persona(unique:true)
		cargo maxSize:100
    }
}
