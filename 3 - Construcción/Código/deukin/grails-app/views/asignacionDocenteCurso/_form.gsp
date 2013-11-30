<%@ page import="com.deukin.AsignacionDocenteCurso" %>



<div class="fieldcontain ${hasErrors(bean: asignacionDocenteCursoInstance, field: 'configuracionCursoDia', 'error')} required  row">
	<label for="configuracionCursoDia" class="control-label col-lg-2">
		<g:message code="asignacionDocenteCurso.configuracionCursoDia.label" default="Configuracion Curso Dia" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="configuracionCursoDia" name="configuracionCursoDia.id" from="${com.deukin.ConfiguracionCursoDia.list()}" optionKey="id" required="" value="${asignacionDocenteCursoInstance?.configuracionCursoDia?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: asignacionDocenteCursoInstance, field: 'docente', 'error')} required  row">
	<label for="docente" class="control-label col-lg-2">
		<g:message code="asignacionDocenteCurso.docente.label" default="Docente" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="docente" name="docente.id" from="${com.deukin.Docente.list()}" optionKey="id" required="" value="${asignacionDocenteCursoInstance?.docente?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: asignacionDocenteCursoInstance, field: 'tipoPorcentajeAsignacion', 'error')} required  row">
	<label for="tipoPorcentajeAsignacion" class="control-label col-lg-2">
		<g:message code="asignacionDocenteCurso.tipoPorcentajeAsignacion.label" default="Tipo Porcentaje Asignacion" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select name="tipoPorcentajeAsignacion" from="${com.deukin.TipoPorcentajeAsignacion?.values()}" keys="${com.deukin.TipoPorcentajeAsignacion.values()*.name()}" required="" value="${asignacionDocenteCursoInstance?.tipoPorcentajeAsignacion?.name()}"/>
	</div>
</div>

