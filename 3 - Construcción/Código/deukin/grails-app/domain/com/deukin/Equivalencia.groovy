package com.deukin


/**
 * Representa una configuración de Equivalencia entre {@link Materia}
 * La colección representa las que equivalen a la Instancia.
 * @author Ale Mobile
 *
 */
class Equivalencia{

	Materia materiaPrincipal//Matematica Gral
	Materia materiaEquivalente//calculo, discreta, etc

	static constraints = {
		materiaPrincipal(unique:'materiaEquivalente')
	}

	String toString(){
		'Materia: '+materiaPrincipal.toString()+' tiene como equivalente a: '+materiaEquivalente.toString()
	}
}
