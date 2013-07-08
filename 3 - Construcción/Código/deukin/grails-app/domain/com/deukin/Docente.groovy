package com.deukin

@gorm.AuditStamp
class Docente extends Persona {
	
	Curriculum curriculumDocente
	
    static constraints = {
    }
}
