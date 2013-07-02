package com.deukin

import gorm.AuditStamp

@AuditStamp
class Calificacion {
	
	Integer primerParcial
	Integer segundoParcial
	Integer notaFinal
    
	static constraints = {
    }
}
