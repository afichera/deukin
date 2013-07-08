package com.deukin

@gorm.AuditStamp
class Telefono {
	
	String numero
	TipoTelefono tipoTelefono
    static constraints = {
    }
}
