package com.deukin

import gorm.AuditStamp;

@AuditStamp
class ExperienciaLaboral {
	
	String cargo
	String empresa
	Date fechaIngreso
	Date fechaEgreso
	String detalle

    static constraints = {
		
    }
}
