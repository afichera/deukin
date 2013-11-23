package com.deukin

/**
 * 
 * @author Ale Mobile
 *
 */
class PeriodoDedicacion {
	
	Integer anio
	Integer cuatrimestre
		 
    static constraints = {
		anio(unique:['cuatrimestre'])
    }
	
	String toString(){
		anio  + ' - '+ cuatrimestre
	}
	
}
