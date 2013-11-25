package com.deukin

class DocenteService {

	/**
	 * Obtiene los docentes tales que cumplan en nombre, apellido o nro de documento con el query
	 * @param queryRegex
	 * @return
	 */
	def obtenerDocentesLikeQueryRegexInNombreOrApellidoOrDocumentoNumero(def queryRegex){
		def docentes
		def docentesResultantes = []
		docentes = Docente.list()
		for (docente in docentes) {
			if(docente.nombre.toUpperCase().contains(queryRegex.toUpperCase())
			|| docente.apellido.toString().toUpperCase().contains(queryRegex.toUpperCase())
			|| docente.documento.numeroAsText().toUpperCase().contains(queryRegex.toUpperCase())){
				docentesResultantes.add(docente)
			}
		}
		docentesResultantes
	}
}
