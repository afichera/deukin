package com.deukin


@gorm.AuditStamp
class ExperienciaLaboral {
	
	String cargo
	String empresa
	Date fechaIngreso
	Date fechaEgreso
	String detalle

    static constraints = {
		
    }
}
