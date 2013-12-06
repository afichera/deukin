package com.deukin

import org.springframework.transaction.annotation.Transactional

import com.deukin.exceptions.BusinessException

class CursoService {

	/**
	 * Valida si el curso puede darse de alta y en tal caso lo crea, 
	 * En caso contrario lanza una BusinessException
	 * @param curso
	 * @return
	 */
	@Transactional
	def crearCurso(Curso curso){
		def cursoPrevio = Curso.findByCodigo(curso.codigo)
		def horasDelCurso = 0
		if(cursoPrevio){
			throw new BusinessException("El código que ingresó ya se encuentra ocupado por otro curso.")
		}
		def materiaDelCurso = curso.materia
		def configuracionesCursoDia = curso.configuracionesCursoDia
		if(configuracionesCursoDia){
			for (configuracionCurso in configuracionesCursoDia) {
				horasDelCurso += configuracionCurso.getSumaHoras()				
			}
		}
		
		if(horasDelCurso > (materiaDelCurso.cantidadUnidadesHorarias*2) ){
			throw new BusinessException("La cantidad de Horas ingresadas no pueden superar las informadas en la materia.")
		}

		curso.save(failOnError:true)

	}
}
