package com.deukin

/**
 * Representa una Carrera de la Institucion
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class Carrera {
	
	String titulo	
	//Ver que hacer con la duracion
	String condicionIngreso
	ModalidadAsistencia modalidadAsistencia
	
	//Los objetivos pueden ser varios. Los planes tambien, solo que uno será el Vigente
	static hasMany = [objetivos:TextoLibre, planesEstudio:PlanEstudio]
	TextoLibre fundamentacion	
	TextoLibre perfilDelGraduado
	TextoLibre descripcion	
	
	
    static constraints = {
		
    }
}
