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
	
	
	String fundamentacion	
	String perfilDelGraduado
	String descripcion
	EstadoDeCreacion estado
	//Los objetivos pueden ser varios. Los planes tambien, solo que uno será el Vigente
	static hasMany = [objetivos:String, planesEstudio:PlanEstudio, materias:Materia]
	
	
		
    static constraints = {
		titulo unique:true, maxSize:200, blank:false
		condicionIngreso nullable:true, blank:true
		planesEstudio nullable:true
		objetivos nullable:true
		fundamentacion nullable:true
		perfilDelGraduado nullable:true
		descripcion nullable:true
		coordinador nullable:true
		estado blank:false
		
		
//		validator:{val, obj ->
//			def estado = obj.properties['objetivos']
//					if (estado==EstadoDeCreacion.BORRADOR) {
//									true
//									 }
//					else {
//						if (val)
//						true
//						else
//						false
//					}	 }
	}
	String toString(){
		titulo
	}
	
}
