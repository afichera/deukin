package com.deukin
/**
 * Representa la Foto de Perfil de una {@link Persona}
 * @author Ale Mobile
 *
 */
class FotoPerfil {
	
	byte[] archivo
	static belongsTo = [persona:Persona]

    static constraints = {
		// Limita a 2MB la foto
		archivo maxSize: 1024 * 1024 * 2
    }
}
