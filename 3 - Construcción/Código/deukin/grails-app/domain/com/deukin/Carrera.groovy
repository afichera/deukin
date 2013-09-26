package com.deukin

import com.sun.org.apache.bcel.internal.generic.RETURN;
import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

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
		titulo unique:true, maxSize:200,validator:{val, obj -> 
	def estado = obj.properties['estado'] 
			if (estado==EstadoDeCreacion.BORRADOR) { 
							true 
							 }
			else {
				if (val=='')
				false
				else
				true
			}	
	}
		
		planesEstudio nullable:true
		objetivos nullable:true
		fundamentacion nullable:true
		perfilDelGraduado nullable:true
		descripcion nullable:true	
		coordinador nullable:true 
		estado blank:false
	}
	String toString(){
		titulo
	}
	
}
