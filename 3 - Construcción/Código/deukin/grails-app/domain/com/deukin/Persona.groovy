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
	byte[] fotoPerfil

    static constraints = {
		usuario nullable: true
		documento unique:true
		// Limita a 2MB la foto
		fotoPerfil maxSize: 1024 * 1024 * 2, nullable:true
    }
	String toString(){
		apellido + ', ' + nombre
		}
	static mapping = {
		tablePerHierarchy false
	}
	
	
}
