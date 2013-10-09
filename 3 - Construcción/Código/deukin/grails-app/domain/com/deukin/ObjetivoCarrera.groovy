package com.deukin
/**
 * Creada para persistir una Lista de Objetivos asociado a una Carrera
 * @author juandi
 *
 */
class ObjetivoCarrera {
	String descripcion
	static belongsTo = [carrera:Carrera]

    static constraints = {
    }
	String toString(){
		descripcion
	}
}
