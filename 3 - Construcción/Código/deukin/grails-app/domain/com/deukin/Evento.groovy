package com.deukin


/**
 * Representa un Evento "Curso Libre" del cual se quiera 
 * @author Ale Mobile
 *
 */
class Evento {

	String titulo
	String descripcion
	Integer cupoMaximo
	Date fechaInicio
	Date fechaFin
	EspacioFisico espacioFisico
	static transients = ['startTime', 'endTime']

	Integer horaInicio
	Integer minutosInicio
	Integer horaFin
	Integer minutosFin

	static hasMany = [alumnos:Alumno, docentes:Docente]

	static constraints = {
		titulo(unique:[
			'fechaInicio',
			'espacioFisico'
		], maxSize:200)
		descripcion(nullable:true)
		horaInicio range: 0..23
		horaFin range: 0..23
		minutosInicio range: 0..59
		minutosFin range: 0..59
	
	}
	
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
	
}


