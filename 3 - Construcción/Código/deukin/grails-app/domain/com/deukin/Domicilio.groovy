package com.deukin


class Domicilio {
	
	String calle
	Integer numero
	String localidad
	Integer codigoPostal
	String observaciones
	
	static belongsTo = [contacto:Contacto]
	
    static constraints = {
		calle maxSize:100, blank:false
		localidad maxSize:100, blank:false
		codigoPostal min:1000, max:9999 
		observaciones(nullable:true)
    }
	
	String toString() {
		calle + ' ' + numero + ', ' + localidad + ' (' + observaciones + ') CP: '+codigoPostal 
	}
}
