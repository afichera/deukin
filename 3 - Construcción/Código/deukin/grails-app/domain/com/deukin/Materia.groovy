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
	//Las equivalencias son las que equivalen a esta materia, las coorrelativas son las predecesoras.
	static hasMany = [objetivosGenerales:Objetivo, objetivosEspecificos:ObjetivoEspecifico, tiposRecurso:TipoRecurso]
	static belongsTo = [carrera:Carrera]
//	materiasCorrelativas:Materia, materiasEquivalentes:Materia
//	predecesoraCorrelatividad:Materia, predecesoraEquivalente:Materia,
//	static mappedBy = [materiasCorrelativas: 'predecesoraCorrelatividad', materiasEquivalentes: 'predecesoraEquivalente']
	
	static constraints = {
		codigo(unique:true, maxLength:10)
		nombre maxLength:200
		bibliografia nullable:true
//		predecesoraCorrelatividad(nullable:true)
//		predecesoraEquivalente(nullable:true)
	}
}
