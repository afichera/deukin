package com.deukin



/**
 * Representa una calificacion para un {@link Alumno} 
 * @author Ale Mobile
 *
 */
class Calificacion {

	Integer primerParcial
	Integer segundoParcial
	Integer notaFinal

	static constraints = {
		primerParcial(nullable: true, range: 1..10)
		segundoParcial(nullable: true, range: 1..10)
		notaFinal(nullable: true, range: 1..10)
	}
}
