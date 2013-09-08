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
	static hasMany = [objetivos:String, planesEstudio:PlanEstudio]
	String fundamentacion	
	String perfilDelGraduado
	String descripcion	
		
    static constraints = {
		titulo (unique:true, maxSize:200)	
		planesEstudio nullable:true
		fundamentacion nullable:true
		perfilDelGraduado nullable:true
		descripcion nullable:true	
		 	
    }
}
