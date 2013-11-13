package com.deukin
/**
 * Representa a un Docente
 * @author Ale Mobile
 *
 */
class Docente extends Persona {
	
	Curriculum curriculumDocente
	static belongsTo = [departamento:Departamento]
	static hasMany = [nombramiento:Nombramiento]
	
    static constraints = {
		nombramiento nullable:true
		curriculumDocente nullable:true
    }
}
