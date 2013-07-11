package com.deukin

import java.util.Date;

/**
 * Representa un estudio/curso realizado por una @Persona, y 
 * forma parte de un {@link Curriculum}
 * @author Ale Mobile
 *
 */
class EducacionAdquirida {

	String titulo
	Date fecha
	String descripcion
	
    static constraints = {
    }
}
