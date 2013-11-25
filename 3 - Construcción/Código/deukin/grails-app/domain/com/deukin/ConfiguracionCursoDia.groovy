package com.deukin

class ConfiguracionCursoDia {


	DiaSemana diaSemana
	def horaDesde
	def horaHasta
	EspacioFisico espacioFisico
	static belongsTo=[curso:Curso]	
    
	static constraints = {
		
    }
}
