package com.deukin
/**
 * Representa la Inscripcion de una Persona a la Institución.
 * @author Ale Mobile
 *
 */
class InscripcionInstitucion implements Serializable {
	
	UsuarioRegistro usuarioRegistro
	String nombre
	String apellido
	Long documentoNumero
	TipoDocumento tipoDocumento
	Date fechaNacimiento
	String sexo
	String calle
	Integer calleNumero
	String localidad
	Integer codigoPostal
	String observaciones
	
	String telefonoNumero
	TipoTelefono tipoTelefono

		
	Date fechaInscripcion
	Date fechaBaja	
	EstadoInscripcionInstitucion estadoInscripcionInstitucion
	TipoInscripcionInstitucion tipoInscripcionInstitucion	

    static constraints = {
		documentoNumero(unique:['tipoDocumento'])
		fechaBaja nullable:true
		nombre blank:false
		apellido blank:false
		calle blank:false
		localidad blank:false
		observaciones nullable:true
		telefonoNumero blank:false
		tipoInscripcionInstitucion nullable:true
    }
}
