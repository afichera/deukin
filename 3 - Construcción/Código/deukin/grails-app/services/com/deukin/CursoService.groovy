package com.deukin


import org.apache.commons.lang.exception.ExceptionUtils
import org.springframework.transaction.annotation.Transactional

import com.deukin.exceptions.BusinessException

class CursoService {

	/**
	 * Valida si el curso puede darse de alta 
	 * En caso contrario lanza una BusinessException
	 * @param curso
	 * @return
	 */
	
	def validaCurso(Curso curso){
		def cursoPrevio = Curso.findByCodigo(curso.codigo)
		def horasCurso =0
		if(cursoPrevio){
			throw new BusinessException("El código que ingresó ya se encuentra ocupado por otro curso.")
			
		}
		def materiaDelCurso = curso.materia
		def configuracionesCursoDia = curso.configuracionesCursoDia
		if(configuracionesCursoDia!=null){
			for (configuracionCurso in configuracionesCursoDia) {
				horasCurso += configuracionCurso.getSumaHoras()				
			}
		}
		Integer horasMateria = new Integer(materiaDelCurso.cantidadUnidadesHorarias.multiply(2))
		Integer horasCursoEntero = new Integer(horasCurso.intValue())
		if(horasCursoEntero.compareTo(horasMateria) > 0 ){
			throw new BusinessException("La cantidad de Horas ingresadas no pueden superar las informadas en la materia.")
		}
		
	}
	
	@Transactional
	def crearCurso(def cursoInstance){
		validaCurso(cursoInstance)
		
		try{
			cursoInstance.save(failOnError:true)	
		}catch(Exception e){
			log.error 'Ocurrió un error al intentar crear el curso. Detalle: '+ExceptionUtils.getRootCauseStackTrace(e)
			throw new BusinessException("Ocurrió un error al crear el curso. Detalle: "+ExceptionUtils.getRootCauseMessage(e))
		}
//		try{
//			configuracionCursoDiaInstance.save(failOnError:true)
//		}catch(Exception e){
//			log.error 'Ocurrió un error al intentar crear la ConfiguracionCursoDia. Detalle: '+ExceptionUtils.getRootCauseStackTrace(e)
//			throw new BusinessException("Ocurrió un error al intentar crear la ConfiguracionCursoDia. Detalle: "+ExceptionUtils.getRootCauseMessage(e))
//		}
		log.info "Curso generado correctamente. CursoId:  $cursoInstance.id"
		
	}
}
