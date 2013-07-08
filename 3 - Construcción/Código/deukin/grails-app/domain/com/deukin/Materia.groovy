package com.deukin


/**
 * Representa una Materia de la {@link Institucion}
 * @author Ale Mobile
 *
 */
@gorm.AuditStamp
class Materia {

	Integer codigo
	String nombre
	Integer cargaHoraria
	Integer cupoMinimoAlumnos
	Integer cupoMaximoAlumnos
	TextoLibre contenidoMinimo
	Integer cantidadDocentesRequeridos
	//TODO: Tenemos que definir si las coorrelatividades y equivalencias son una coleccion de Materia o ibamos a crear otra cosa que las agrupe.
	static hasMany = [objetivosGenerales:TextoLibre, objetivosEspecificos:TextoLibre, recursos:Recurso]
	TextoLibre bibliografia

	static constraints = {
	}
}
