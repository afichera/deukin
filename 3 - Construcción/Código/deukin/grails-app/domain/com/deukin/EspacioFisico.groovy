package com.deukin

/**
 * 
 * @author Ale Mobile
 *
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
