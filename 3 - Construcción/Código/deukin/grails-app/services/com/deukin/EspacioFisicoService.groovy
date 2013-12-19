package com.deukin

/**
 * Representa los servicios expuestos para un {@link EspacioFisico}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class EspacioFisicoService {

	/**
	 * Obtiene una lista de {@link EspacioFisico} por Numero o Ubicacion segun texto recibido.
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
