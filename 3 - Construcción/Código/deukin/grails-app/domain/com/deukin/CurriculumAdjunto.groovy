package com.deukin
/**
 * Representa un Curriculum Adjunto de Una {@link Persona}.
 * @author Ale Mobile
 *
 */
class CurriculumAdjunto {
	byte[] archivo
	static belongsTo = [persona:Persona]

	static constraints = {
		// Limita a 2MB el Curriculum Adjunto
		archivo maxSize: 1024 * 1024 * 2
	}
	
	def nomberArchivo(){
		def nombreArchivo = '' 
		if(archivo){
			nombreArchivo = archivo.name
		}
		nombreArchivo
	}
}
