package com.deukin
/**
 * Representa la Inscripcion de una Persona a la Institución.
 * @author Ale Mobile
 *
 */
class InscripcionInstitucion {
	
	String nombreUsuario
	String password
	String nombre
	String apellido
	Long documentoNumero
	TipoDocumento tipoDocumento
	
	String calle
	Integer calleNumero
	String localidad
	Integer codigoPostal
	String observaciones
	
	String telefonoNumero
	TipoTelefono tipoTelefono
	Carrera carrera
		
	Date fechaInscripcion
	Date fechaBaja	
	EstadoInscripcionInstitucion estadoInscripcionInstitucion	

    static constraints = {
		documentoNumero(unique:['tipoDocumento'])
		fechaBaja nullable:true
		nombre blank:false
		apellido blank:false
		calle blank:false
		localidad blank:false
		observaciones nullable:true
		telefonoNumero blank:false
		nombreUsuario blank: false, unique: true
		password blank: false
    }
	
	static mapping = {
		password column: '`password`'
	}
}
