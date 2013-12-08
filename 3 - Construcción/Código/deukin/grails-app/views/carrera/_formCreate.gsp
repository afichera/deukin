<%@ page import="com.deukin.Carrera" %>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'titulo', 'error')} row">
	<label for="titulo" class=" col-lg-3 control-label">
		<g:message code="carrera.titulo.label" default="Titulo" />: 
		
	</label>
	<div class="col-lg-9">
	<g:textField name="titulo" maxlength="200" value="${carreraInstance?.titulo}" required=""/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'planesEstudio', 'error')}row ">
	<label for="nuevoPlanEstudio" class=" col-lg-3 control-label">
		<g:message code="carrera.planesEstudio.nuevo.label" default="Nombre del nuevo Plan de Estudio" />
		: 
	</label>
	<div class="col-lg-9">
	<g:textField name="nombrePlanDeEstudio" required="" maxlength="200"/>
	</div>
</div>





<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'modalidadAsistencia', 'error')} required row">
	<label for="modalidadAsistencia" class=" col-lg-3 control-label">
		<g:message code="carrera.modalidadAsistencia.label" default="Modalidad Asistencia" />
		: 
	</label>
	<div class="col-lg-9">
	<g:select name="modalidadAsistencia" from="${com.deukin.ModalidadAsistencia?.values()}" keys="${com.deukin.ModalidadAsistencia.values()*.name()}" required="" value="${carreraInstance?.modalidadAsistencia?.name()}"/>
	</div>
</div>

