package com.deukin

import com.sun.xml.internal.ws.api.streaming.XMLStreamReaderFactory.Default;

class ConfiguracionCursoDia {


	DiaSemana diaSemana
	EspacioFisico espacioFisico
	static belongsTo=[curso:Curso]
	static hasMany = [asignacionesDocenteCurso:AsignacionDocenteCurso]
	static transients = ['startTime', 'endTime','getSumaHoras']
	
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
		espacioFisico nullable:false, blank:false 
		

	  horaInicio  validator:{val, obj ->
		  def desde=0
		  def hasta=0
		  
		  if (obj.properties['diaSemana']!=DiaSemana.SABADO) {
			   desde = obj.properties['curso'].turno.horaSemanaDesde
			   hasta = obj.properties['curso'].turno.horaSemanaHasta
		  }
		  else {
			   desde = obj.properties['curso'].turno.horaSabadoDesde
			   hasta = obj.properties['curso'].turno.horaSabadoHasta
		  }
		  
		  
				  if (val>=desde&&val<hasta) {
								  true
							   }
				  else {
					  ['configuracionCursoDia.horarioInicioIncorrecto']
				  }	 }
	  
	  horaFin  validator:{val, obj ->
		  def desde=0
		  def hasta=0
		  def minHasta=obj.properties['minutosFin']
		  
		  if (obj.properties['diaSemana']!=DiaSemana.SABADO) {
			   desde = obj.properties['curso'].turno.horaSemanaDesde
			   hasta = obj.properties['curso'].turno.horaSemanaHasta
			   
		  }
		  else {
			   desde = obj.properties['curso'].turno.horaSabadoDesde
			   hasta = obj.properties['curso'].turno.horaSabadoHasta
			  
		  }
		  
		  
				  if ((val>desde&&val<hasta)||(val==hasta&&minHasta==0)) {
								  true
							   }
				  else {
					  ['configuracionCursoDia.horarioFinIncorrecto']
				  }	 }

	  
	  
	}
	  
	 def getSumaHoras(){
		 def sumaHoras
		 def sumaMinutos
		 //se fue al otro día
		 if(horaFin<horaInicio){
			sumaHoras = (24-horaInicio+horaFin) 
		 }else{
		 	sumaHoras  = horaFin - horaInicio
		 }
		 
		 sumaHoras = sumaHoras*60
		 sumaMinutos = minutosFin-minutosInicio		
		 sumaHoras +=sumaMinutos
		 sumaHoras = sumaHoras/60
		 sumaHoras
	 }
	
	
	
}
