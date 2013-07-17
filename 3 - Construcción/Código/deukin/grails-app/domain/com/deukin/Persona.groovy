package com.deukin


/**
 * Representa una Persona
 * @author Ale Mobile
 *
 */
class Persona {
	
	String nombre
	String apellido
	Documento documento
	Contacto contacto	
	static hasMany = [curriculums:Curriculum, curriculumsAdjuntos:CurriculumAdjunto]
	Usuario usuario
	FotoPerfil fotoPerfil

    static constraints = {
		usuario nullable: true
		documento unique:true
		fotoPerfil nullable:true
    }
	
	static mapping = {
		tablePerHierarchy false
	}
}
