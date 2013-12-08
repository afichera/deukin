package com.deukin




class CursoService {

	/**
	 * Valida si el curso puede darse de alta 
	 * En caso contrario lanza una BusinessException
	 * @param curso
	 * @return
	 */

	public String validaCurso(Curso curso){
		String retorno = 'OK'
		def cursoPrevio = Curso.findByCodigo(curso.codigo)
		def horasCurso = 0
		if(!cursoPrevio){
			if(curso?.configuracionesCursoDia && curso?.configuracionesCursoDia.size()>0){
				for (configuracionCurso in curso?.configuracionesCursoDia) {
					horasCurso += configuracionCurso.getSumaHoras()
				}
			}
			Float horasMateria = curso?.materia?.cantidadUnidadesHorarias.multiply(2) / curso?.periodoAcademico?.cantidadSemanas
			
			if(horasCurso<horasMateria.intValue()){
				retorno = 'OK'
			}else{
				retorno = 'La cantidad de Horas ingresadas no pueden superar las informadas en la materia.'
			}
		}else{
			retorno = 'El código que ingresó ya se encuentra ocupado por otro curso.'
		}
	}

}
