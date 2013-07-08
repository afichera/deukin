package com.deukin

@gorm.AuditStamp
class InstitucionEducativa {
	
	String nombre	
	static hasMany = [departamentos:Departamento, autoridades:Autoridad]
	Contacto contacto
	//TODO: Ver que atributos faltarían
    static constraints = {
		
    }
}
