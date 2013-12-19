package com.deukin

import com.deukin.exceptions.BusinessException

/**
 * Representa los servicios expuestos para {@link Correlatividad}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class CorrelatividadService {


	/**
	 * Valida si una {@link Correlatividad} puede ser creada.
	 * 
	 * @param futuraCorrelatividad
	 * @return
	 */
	def validarCorrelatividad(def futuraCorrelatividad){
		
		def materiaPrincipal = Materia.get(futuraCorrelatividad.materiaPrincipal.id)
		def materiaPredecesora = Materia.get(futuraCorrelatividad.materiaPredecesora.id)
		def correlatividadAux
		
		
		def valida = false
		
		if(materiaPrincipal?.equals(materiaPredecesora)){
			throw new BusinessException('No puede crear una correlatividad de una materia en si misma.')
		}

		correlatividadAux = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materiaPrincipal, materiaPredecesora)

		if(correlatividadAux == null){
			
			if(!materiaPrincipal.planEstudio.equals(materiaPredecesora.planEstudio)){
				throw new BusinessException('Las materias seleccionadas son de diferentes planes de estudio.')
			}
			
			//Luego en Predecesoras si existen con la principal que viene por parametro
			//Verifico en la primer linea si existe la materia que vino como predecesora y sino recursivamente c/u de ellas.
			valida = busquedaCorrelatividadInversa(materiaPrincipal, materiaPredecesora)
			if(!valida){
				throw new BusinessException('No se puede crear correlatividad porque ya son correlativas directas en orden inverso.')
			}
			
			valida = busquedaCorrelatividadRecursiva(materiaPrincipal, futuraCorrelatividad)
	
			if(!valida){
				throw new BusinessException('No se puede crear Correlatividad por transitividad de correlativas.')
			}

		}else{
			throw new BusinessException('La correlatividad que intenta crear ya existe')
		}

		valida		
	}
	
	/**
	 * Realiza una busqueda de {@link Correlatividad} existente de forma recursiva por transitividad.	
	 * @param materiaPrincipal
	 * @param correlatividadOriginal
	 * @return
	 */
	Boolean busquedaCorrelatividadRecursiva(def materiaPrincipal, def correlatividadOriginal){
		def correlatividades = Correlatividad.findAllByMateriaPredecesora(materiaPrincipal)
		def flag = true
		if(correlatividades!=null && correlatividades.size()!=0){
			for (correlatividad in correlatividades) {
				if(correlatividad.materiaPrincipal.equals(materiaPrincipal)){
					flag = false									
				}
				
				if(correlatividad.materiaPrincipal.equals(correlatividadOriginal.materiaPredecesora)){
					flag = false
				}
				
				if(flag){
					flag = busquedaCorrelatividadRecursiva(correlatividad.materiaPrincipal, correlatividadOriginal)
				}
			}
		}
		flag
	}
	
	/**
	 * Busca y devuelve un Booleano que indica si existe {@link Correlatividad} a la inversa
	 * @param materiaPrincipal
	 * @param materiaPredecesora
	 * @return true si no existe, false si existe.
	 */
	def busquedaCorrelatividadInversa(def materiaPrincipal,def materiaPredecesora){
		def correlatividad = Correlatividad.findByMateriaPredecesoraAndMateriaPrincipal(materiaPrincipal, materiaPredecesora)
		if(correlatividad == null || correlatividad.id == null){
			return true
		}
		return false
	}
}
