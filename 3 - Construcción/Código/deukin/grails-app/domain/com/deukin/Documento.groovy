package com.deukin

@gorm.AuditStamp
class Documento {
	
	Long numero
	TipoDocumento tipoDocumento

    static constraints = {
    }
}
