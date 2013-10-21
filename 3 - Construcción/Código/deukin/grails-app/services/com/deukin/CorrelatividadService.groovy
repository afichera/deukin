package com.deukin

import com.deukin.exceptions.BusinessException

class CorrelatividadService {

    def serviceMethod() {

    }
	

	def validarCorrelatividad(def futuraCorrelatividad){
		
		def materiaPrincipal = Materia.get(futuraCorrelatividad.materiaPrincipal.id)
		def materiaPredecesora = Materia.get(futuraCorrelatividad.materiaPredecesora.id)
		def correlatividadAux
		def asignacionPeriodoMateriaPrincipal = AsignacionPeriodoMateria.findByMateria(materiaPrincipal)
		def asignacionPeriodoMateriaPredecesora = AsignacionPeriodoMateria.findByMateria(materiaPredecesora)
		
		def valida = false
		
		if(materiaPrincipal?.equals(materiaPredecesora)){
			throw new BusinessException('No puede crear una correlatividad de una materia en si misma.')
		}

		correlatividadAux = Correlatividad.findByMateriaPrincipalAndMateriaPredecesora(materiaPrincipal, materiaPredecesora)

		if(correlatividadAux == null){
			
			if(!materiaPrincipal.carrera.equals(materiaPredecesora.carrera)){
				throw new BusinessException('Las materias seleccionadas son de diferentes carreras.')
			}
			
			if(asignacionPeriodoMateriaPrincipal == null){
				throw new BusinessException('La materia principal no se encuentra asignada a un plan de estudio.')
			}
			
			if(asignacionPeriodoMateriaPredecesora == null){
				throw new BusinessException('La materia predecesora no se encuentra asignada a un plan de estudio.')
			}
			
			if(!asignacionPeriodoMateriaPrincipal.planEstudio.equals(asignacionPeriodoMateriaPredecesora.planEstudio)){
				throw new BusinessException('Las materias deben pertenecer al mismo Plan de Estudio.')
			}
			
			
			//Luego en Predecesoras si existen con la principal que viene por parametro
			//Verifico en la primer linea si existe la materia que vino como predecesora y sino recursivamente c/u de ellas.
			valida = busquedaCorrelatividadRecursiva(materiaPrincipal, futuraCorrelatividad)
	
			if(!valida){
				throw new BusinessException('No se puede crear Correlatividad por transitividad de correlativas.')
			}
			
			valida = busquedaCorrelatividadInversa(materiaPrincipal, materiaPredecesora)
			if(!valida){
				throw new BusinessException('No se puede crear correlatividad porque ya son correlativas directas en orden inverso.')
			}
		}else{
			throw new BusinessException("La correlatividad que intenta crear ya existe")
		}

		valida		
	}
		
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
	
	def busquedaCorrelatividadInversa(def materiaPrincipal,def materiaPredecesora){
		def correlatividad = Correlatividad.findByMateriaPredecesoraAndMateriaPrincipal(materiaPrincipal, materiaPredecesora)
		if(correlatividad == null || correlatividad.id == null){
			return true
		}
		return false
	}
}
