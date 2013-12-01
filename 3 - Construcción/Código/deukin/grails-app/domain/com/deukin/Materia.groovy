package com.deukin



/**
 * Representa una Materia de la {@link Institucion}
 * @author Ale Mobile
 *
 */
class Materia {

	Integer codigo
	String nombre
	Integer cantidadUnidadesHorarias //es un parametro que indica el tiempo minimo indivisible de una materia y lo multiplica por esto para la carga horaria.
	Integer cupoMinimoAlumnos
	Integer cupoMaximoAlumnos
	String bibliografia
	String contenidoMinimo
	Integer cantidadDocentesRequeridos
	PeriodoDedicacion periodo
	//Las equivalencias son las que equivalen a esta materia, las coorrelativas son las predecesoras.
	static hasMany = [objetivosGenerales:Objetivo, objetivosEspecificos:ObjetivoEspecifico, tiposRecurso:TipoRecurso]
	static belongsTo =[planEstudio:PlanEstudio]
	
	static constraints = {
		codigo(unique:true, maxSize:10)
		nombre maxSize:200
		bibliografia nullable:true
	}
	
	String toString(){
		codigo + ' - '+ nombre
	}
	

}
