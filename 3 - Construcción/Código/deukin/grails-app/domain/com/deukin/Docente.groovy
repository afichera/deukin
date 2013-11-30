package com.deukin
/**
 * Representa a un Docente
 * @author Ale Mobile
 *
 */
class Docente extends Persona {
	
	Curriculum curriculumDocente
	static belongsTo = [departamento:Departamento]
	static hasMany = [nombramiento:Nombramiento]
	static transients = ['cantidadHorasCicloActual']
	
	transient docenteService
	
    static constraints = {
		nombramiento nullable:true
		curriculumDocente nullable:true
		departamento nullable:true
    }
	
	def getCantidadHorasCicloActual(){
		def cantidadHorasActuales
		cantidadHorasActuales = docenteService.obtenerHorasByDocenteIdInCicloLectivoActual(this.id);
		cantidadHorasActuales	
	}
}
