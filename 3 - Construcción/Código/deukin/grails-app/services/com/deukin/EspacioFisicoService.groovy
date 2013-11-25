package com.deukin

class EspacioFisicoService {

	/**
	 * Obtiene los espacios fisicos por Numero o Ubicacion segun Query
	 * @param queryRegex
	 * @return
	 */
	def obtenerEspaciosFisicosLikeQueryRegexInNumeroOrUbicacion(def queryRegex){
		def espaciosFisicos
		def espaciosFisicosResultantes = []
		espaciosFisicos = EspacioFisico.list()
		for (espacioFisico in espaciosFisicos) {
			if(espacioFisico.numero.toString().toUpperCase().contains(queryRegex.toUpperCase())
			|| espacioFisico.ubicacion.toUpperCase().contains(queryRegex.toUpperCase())){
				espaciosFisicosResultantes.add(espacioFisico)
			}
		}
		espaciosFisicosResultantes
	}
}
