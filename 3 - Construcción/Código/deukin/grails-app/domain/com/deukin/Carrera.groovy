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
	Persona coordinador
	
	//Los objetivos pueden ser varios. Los planes tambien, solo que uno será el Vigente
	static hasMany = [objetivos:String, planesEstudio:PlanEstudio, materias:Materia]
	String fundamentacion	
	String perfilDelGraduado
	String descripcion	
		
    static constraints = {
		titulo (unique:true, maxSize:200)	
		planesEstudio nullable:true
		fundamentacion nullable:true
		perfilDelGraduado nullable:true
		descripcion nullable:true	
		coordinador nullable:true 	
    }
	
	String toString(){
		titulo
	}
}
