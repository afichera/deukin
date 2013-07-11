package com.deukin

/**
 * Representa una Carrera de la Institucion
 * @author Ale Mobile
 *
 */
class Carrera {
	
	String titulo		
	String condicionIngreso
	ModalidadAsistencia modalidadAsistencia
	
	//Los objetivos pueden ser varios. Los planes tambien, solo que uno será el Vigente
	static hasMany = [objetivos:TextoLibre, planesEstudio:PlanEstudio]
	TextoLibre fundamentacion	
	TextoLibre perfilDelGraduado
	TextoLibre descripcion	
		
    static constraints = {
		titulo (unique:true, maxSize:200)		 	
    }
}
