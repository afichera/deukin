package com.deukin

import com.deukin.exceptions.BusinessException

/**
 * Representa los servicios expuestos para {@link Equivalencia}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class EquivalenciaService {
	
	/**
	 * Valida si una {@link Equivalencia} puede ser dada de alta
	 * @param futuraEquivalencia
	 * @return
	 */
	def validar(Equivalencia futuraEquivalencia){
		if(futuraEquivalencia?.materiaPrincipal && futuraEquivalencia?.materiaEquivalente){
			if(futuraEquivalencia?.materiaPrincipal?.planEstudio.equals(futuraEquivalencia?.materiaEquivalente?.planEstudio)){
				throw new BusinessException('No se puede crear equivalencia entre materias del mismo Plan de estudio!')
			}
			
			def equivalenciaExistente = Equivalencia.findByMateriaPrincipalAndMateriaEquivalente(futuraEquivalencia.materiaPrincipal, futuraEquivalencia.materiaEquivalente)
			if(equivalenciaExistente){
				throw new BusinessException("La equivalencia que intenta crear ya existe!")
			}
		}		
	}
}
