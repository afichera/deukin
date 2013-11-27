package com.deukin

class ConfiguracionCursoDia {


	DiaSemana diaSemana
	EspacioFisico espacioFisico
	static belongsTo=[curso:Curso]
	static hasMany = [asignacionesDocenteCurso:AsignacionDocenteCurso]
	static transients = ['startTime', 'endTime']
	
	  Integer horaInicio
	  Integer minutosInicio	
	  Integer horaFin
	  Integer minutosFin
	
	  private String formatTime(Integer hours, Integer mins) {
		String formattedHours = hours < 10 ? "0$hours" : hours.toString()
		String formattedMins = mins < 10 ? "0$mins" : mins.toString()
		"$formattedHours:$formattedMins"
	  }
	
	  String getStartTime() {
		formatTime(horaInicio, minutosInicio)
	  }
	
	  String getEndTime() {
		formatTime(horaFin, minutosFin)
	  }
	
	  static constraints = {
		horaInicio range: 0..23
		horaFin range: 0..23	
		minutosInicio range: 0..59
		minutosFin range: 0..59	
	  }
	
	
	
}
