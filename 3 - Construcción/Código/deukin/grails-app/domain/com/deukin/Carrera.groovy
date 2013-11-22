package com.deukin
/**
 * Representa una Carrera de la Institucion
 * @author Ale Mobile
 *
 */
class Carrera implements Serializable {
	
	
	String titulo		
	String condicionIngreso
	ModalidadAsistencia modalidadAsistencia
	
	String fundamentacion	
	String perfilDelGraduado
	String descripcion
	EstadoDeCreacion estado
	//Los objetivos pueden ser varios. Los planes tambien, solo que uno será el Vigente
	static hasMany = [objetivos:ObjetivoCarrera, planesEstudio:PlanEstudio, materias:Materia, coordinadores:Coordinador]
	
	
		
    static constraints = {
		titulo unique:true, maxSize:200, blank:false
		condicionIngreso nullable:true, blank:true
		planesEstudio nullable:true
		coordinadores nullable:true
		objetivos nullable:true
		fundamentacion nullable:true
		perfilDelGraduado nullable:true
		descripcion nullable:true
		
		
	
		
		estado  validator:{val, obj ->
			
					if (val==EstadoDeCreacion.BORRADOR||val==EstadoDeCreacion.SIN_OFERTAR) {
									true
								 }
					else {
						if (obj.properties['condicionIngreso']&&obj.properties['planesEstudio']&&obj.properties['fundamentacion']&&obj.properties['perfilDelGraduado']&&obj.properties['descripcion']&&obj.properties['objetivos']&&obj.properties['coordinador'])
						true
						else
					false
					}	 }
	}
	
	
	
	String toString(){
		titulo
	}
}	
