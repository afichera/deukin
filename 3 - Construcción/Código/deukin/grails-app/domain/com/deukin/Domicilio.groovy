package com.deukin

import gorm.AuditStamp

@gorm.AuditStamp
class Domicilio {
	
	String calle
	Integer numero
	String localidad
	Integer codigoPostal
	String observaciones
	
	
    static constraints = {
    }
}
