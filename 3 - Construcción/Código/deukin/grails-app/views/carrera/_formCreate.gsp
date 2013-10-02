<%@ page import="com.deukin.Carrera" %>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'titulo', 'error')} ">
	<label for="titulo" class="control-label">
		<g:message code="carrera.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" maxlength="200" value="${carreraInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'planesEstudio', 'error')} ">
	<label for="nuevoPlanEstudio" class="control-label">
		<g:message code="carrera.planesEstudio.nuevo.label" default="Nombre del nuevo Plan de Estudio" />
		
	</label>
	<g:textField name="nombrePlanDeEstudio" maxlength="200"/>
</div>





<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'modalidadAsistencia', 'error')} required">
	<label for="modalidadAsistencia" class="control-label">
		<g:message code="carrera.modalidadAsistencia.label" default="Modalidad Asistencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="modalidadAsistencia" from="${com.deukin.ModalidadAsistencia?.values()}" keys="${com.deukin.ModalidadAsistencia.values()*.name()}" required="" value="${carreraInstance?.modalidadAsistencia?.name()}"/>
</div>

