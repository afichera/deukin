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
	
	Integer cantCuatrimestre() {
		((anio -1)*2)+cuatrimestre
	}
	
}
