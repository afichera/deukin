package com.deukin


class Domicilio {
	
	String calle
	Integer numero
	String localidad
	Integer codigoPostal
	String observaciones
	
	static belongsTo = Contacto
	
    static constraints = {
		calle(maxLength:200)
		localidad(maxLenght:100)
		observaciones(nullable:true)
    }
}
