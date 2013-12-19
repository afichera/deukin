package com.deukin

/**
 * Representa un documento de una {@link Persona}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class Documento {
	
	Long numero
	TipoDocumento tipoDocumento
	static belongsTo = Persona
    static constraints = {
		numero(unique:['tipoDocumento'])
    }
	
	def numeroAsText(){
		String texto =''
		if(TipoDocumento.CUIL.equals(tipoDocumento) || TipoDocumento.CUIT.equals(tipoDocumento)){
			texto = numero.toString()
			texto = texto.substring(0, 2) +'-'+ texto.substring(2, 10)+ '-'+texto.substring(10, 11) 
		}else{ 
			texto = numero.toString()
		}		
		texto
	}
}
