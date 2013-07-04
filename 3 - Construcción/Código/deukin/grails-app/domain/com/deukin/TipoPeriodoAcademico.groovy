package com.deukin

enum TipoPeriodoAcademico {
	PRIMER_CUATRIMESTRE ('PRIMER CUATRIMESTRE'),
	SEGUNDO_CUATRIMESTRE ('SEGUNDO CUATRIMESTRE'),
	VERANO ('VERANO'),
	
	String name


	TipoPeriodoAcademico(String name){
		this.name = name
	}
	static list(){
		[
			PRIMER_CUATRIMESTRE,
			SEGUNDO_CUATRIMESTRE,
			VERANO
		]
	}
	public String toString(){
		return name
	}

}
