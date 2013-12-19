package com.deukin
/**
 * Servicio Auxiliar para paginar las vistas
 * @author Ale Mobile
 * @since 19/12/2013
 */
class SubListaService {

	/**
	 * Devuelve una sublista de objetos segun los params.
	 * @param objectList
	 * @param params
	 * @return
	 */
   	def getSubList(List objectList, Map params) {
		//verify params
		try {
			params.max = params.max.toInteger()
			params.offset = params.offset.toInteger()
		} catch (Exception exceptionInstance) {
			params.max = 10
			params.offset = 0
		}
		//Verify pagination params... if not you add them
		if (params.max <= 0) {
			params.max = 10
		}
		//Get total size of the list
		def objectInstanceTotal = objectList.size()
		//verify offset.
		if (params.offset < 0 || params.offset > objectInstanceTotal) {
			params.offset = 0
		}
		//Verify the pagination border (don't excess from array border).
		Integer bordeInteger = params.max + params.offset
		if (bordeInteger > objectInstanceTotal) {
			bordeInteger = objectInstanceTotal
		}
	
		//Extract the sublist based on the pagination.
		def objectSubList = objectList.subList(params.offset, bordeInteger)
	
		return objectSubList
	}
}
