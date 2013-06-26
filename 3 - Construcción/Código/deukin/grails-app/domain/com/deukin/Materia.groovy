package com.deukin

import gorm.AuditStamp;

/**
 * Representa una Materia de la {@link Institucion}
 * @author Ale Mobile
 *
 */
@AuditStamp
class Materia {

	Integer codigo
	String nombre
	Integer cargaHoraria
	//Integer cupoMaximoAlumnos No estoy seguro que esta condición la de una Materia, creo que es de Curso pero en la propuesta aparece así.
	TextoLibre contenidoMinimo
	Integer cantidadDocentesRequeridos
	//Tenemos que definir si las coorrelatividades y equivalencias son una coleccion de Materia o ibamos a crear otra cosa que las agrupe.
	static hasMany = [objetivosGenerales:TextoLibre, objetivosEspecificos:TextoLibre, recursos:Recurso]
	TextoLibre bibliografia

	static constraints = {
	}
}
