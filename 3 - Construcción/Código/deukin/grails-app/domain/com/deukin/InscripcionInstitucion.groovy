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
		nombre blank:false, maxSize:100
		apellido blank:false, maxSize:50
		calle blank:false, maxSize:100
		localidad blank:false, maxSize:100
		observaciones nullable:true
		telefonoNumero blank:false, maxSize:20
		tipoInscripcionInstitucion nullable:true
    }
	
	def numeroDocumentoAsText(){
		String texto =''
		if(TipoDocumento.CUIL.equals(tipoDocumento) || TipoDocumento.CUIT.equals(tipoDocumento)){
			texto = documentoNumero.toString()
			texto = texto.substring(0, 2) +'-'+ texto.substring(2, 10)+ '-'+texto.substring(10, 11)
		}else{
			texto = documentoNumero.toString()
		}
		texto
	}
}
