package com.deukin

/**
 * Representa un espacio fisico (aula, laboratorio, etc)
 * @author Ale Mobile
 * @since 19/12/2013
 */
class EspacioFisico {
	Integer numero
	String ubicacion
	String observaciones
	
    static constraints = {
		numero(unique:true)
		ubicacion(maxSize:200)
		observaciones(nullable:true)
    }
	
	String toString(){
		String texto = ''
		
		texto = numero + ' - '+ ubicacion
		texto 
	}
}
