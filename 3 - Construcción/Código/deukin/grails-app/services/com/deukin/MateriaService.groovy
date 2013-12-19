package com.deukin


/**
 * Representa los servicios expuestos para {@link Materia}
 * @author Ale Mobile
 * @since 19/12/2013
 */
class MateriaService {


	/**
	 * Obtiene una lista de {@link Materia} que puedan ser predecesoras de una futura correlatividad para una materia principal
	 * @param queryRegex
	 * @param materiaPrincipal
	 * @return
	 */
	def obtenerMateriasCandidatasPredecesorasByQueryRegexAndMateriaPrincipal(def queryRegex, Materia materiaPrincipal){
		def planEstudio = materiaPrincipal.planEstudio
		def materiasDelPlan = Materia.findByPlanEstudio(planEstudio)
		def materiasMostrar = []
		def esCodigo = queryRegex.isInteger()
		def codigoNumero
		if(esCodigo){
			codigoNumero = new Integer(queryRegex)
		}

		for (materia in materiasDelPlan) {
			if(esCodigo){
				if((materia.nombre.contains(queryRegex) ||
				(materia.codigo.intValue() == codigoNumero.intValue()))
				&& materia.id != materiaPrincipal.id){
					materiasMostrar.add(materia)
				}
			}else{
				if(materia.nombre.contains(queryRegex) && materia.id != materiaPrincipal.id){
					materiasMostrar.add(materia)
				}
			}
		}
		materiasMostrar
	}

	/**
	 * Obtiene las materias que tiene a cargo un usuario con rol de Coordinador
	 * @param authorities
	 * @param usuario
	 * @return
	 */
	public obtenerMateriasDeCoordinador(def authorities, def usuario) {
		def filtrarPlan = false
		def materias
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarPlan = true
			}
		}

		if(filtrarPlan){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def coordinador = Coordinador.findByUsuario(usuarioDeukin)
			def planes = coordinador.carrera.planesEstudio
			materias = Materia.findAllByPlanEstudioInList(planes)
		}else{
			materias = Materia.list()
		}
	}

	/**
	 * Obtiene la lista de Materia para un usuario Coordinador segun texto recibido.
	 * @param authorities
	 * @param usuario
	 * @param queryRegex
	 * @return
	 */
	public obtenerMateriasDeCoordinadorLikeQueryRegex(def authorities, def usuario, def queryRegex) {
		def filtrarPlan = false
		def materias
		def materiasResultantes = []
		for (auto in authorities){
			if(auto.role.equals('ROLE_COORDINADOR') ){
				filtrarPlan = true
			}
		}
		if(filtrarPlan){
			def username = usuario?.getUsername()
			def usuarioDeukin = Usuario.findByUsername(username)
			def persona = Persona.findByUsuario(usuarioDeukin)
			def coordinador = Coordinador.findByUsuario(usuarioDeukin)

			def planes = coordinador.carrera.planesEstudio
			//			def planes = Carrera.findAllByCoordinadorOrCoordinadoresOperativos(persona, persona).planesEstudio
			materias = Materia.findAllByPlanEstudioInList(planes)
		}else{
			materias = Materia.list()
		}

		for (materia in materias) {
			if(materia.nombre.toUpperCase().contains(queryRegex.toUpperCase()) || materia.codigo.toString().toUpperCase().contains(queryRegex.toUpperCase())){
				materiasResultantes.add(materia)
			}
		}
		materiasResultantes
	}

	/**
	 * Obtiene la lista de {@link Materia} segun texto recibido
	 * @param queryRegex
	 * @return
	 */
	def obtenerMateriasLikeQueryRegex(def queryRegex){
		def materias
		def materiasResultantes = []
		materias = Materia.list()
		for (materia in materias) {
			if(materia.nombre.toUpperCase().contains(queryRegex.toUpperCase()) || materia.codigo.toString().toUpperCase().contains(queryRegex.toUpperCase())){
				materiasResultantes.add(materia)
			}
		}
		materiasResultantes
	}

	/**
	 * Obtiene la lista de {@link Materia} que sean equivalentes a la materia principal enviada.
	 * @param materiaPrincipal
	 * @return
	 */
	def obtenerEquivalentes(Materia materiaPrincipal) {
		def equivalencias = Equivalencia.findAllByMateriaPrincipal(materiaPrincipal,materiaPrincipal)
		def materiasequivalentes = []
		for (equivalenciaInstance in equivalencias) {
			materiasequivalentes.add(equivalenciaInstance.materiaEquivalente)
		}
		materiasequivalentes
	}

	/**
	 * Obtiene la lista de {@link Materia} predecesoras en {@link Correlatividad} de la materiaPrincipal enviada.
	 * @param materiaPrincipal
	 * @return
	 */
	def obtenerPredecesoras(Materia materiaPrincipal) {
		def correlatividades = Correlatividad.findAllByMateriaPrincipal(materiaPrincipal)
		def predecesoras = []
		for (correlatividadInstance in correlatividades) {
			predecesoras.add(correlatividadInstance.materiaPredecesora)
		}
		predecesoras
	}

	/**
	 * Servicio que valida datos numéricos de una Materia
	 * @param params
	 * @return
	 */
	public String validaNumeros (params) {
		String erroneas = ''

		if (!params.codigo.isInteger()&&params.codigo)
		erroneas = erroneas + '"Código", '

		if (!params.cantidadDocentesRequeridos.isInteger()&&params.cantidadDocentesRequeridos)
		erroneas = erroneas + '"Cantidad de Docentes Requeridos", '


		if (!params.cantidadUnidadesHorarias.isInteger()&&params.cantidadUnidadesHorarias)
		erroneas = erroneas + '"Cantidad de Unidades Horarias", '


		if (!params.cupoMaximoAlumnos.isInteger()&&params.cupoMaximoAlumnos)
		erroneas = erroneas + '"Cupo Máximo de Alumnos", '


		if (!params.cupoMinimoAlumnos.isInteger()&&params.cupoMinimoAlumnos)
		erroneas = erroneas + '"Cupo Mínimo de Alumnos", '

		erroneas
	}
}
