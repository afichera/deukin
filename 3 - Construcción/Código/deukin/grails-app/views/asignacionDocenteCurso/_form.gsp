<%@ page import="com.deukin.AsignacionDocenteCurso" %>



<div class="fieldcontain ${hasErrors(bean: asignacionDocenteCursoInstance, field: 'configuracionCursoDia', 'error')} required  row">
	<label for="configuracionCursoDia" class="control-label col-lg-3">
		<g:message code="asignacionDocenteCurso.curso.label" default="Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-9">
	<g:hiddenField id ="configuracionCursoDia" name ="configuracionCursoDia.id" value="${asignacionDocenteCursoInstance?.configuracionCursoDia?.id}"/>
	${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.codigo} - ${asignacionDocenteCursoInstance?.configuracionCursoDia?.diaSemana.encodeAsHTML()} ${asignacionDocenteCursoInstance?.configuracionCursoDia.getStartTime()}-${asignacionDocenteCursoInstance?.configuracionCursoDia.getEndTime()}
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: asignacionDocenteCursoInstance, field: 'docente', 'error')} required  row">
	<label for="docente" class="control-label col-lg-3">
		<g:message code="asignacionDocenteCurso.docente.label" default="Docente" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-9">
	<g:select id="docente" name="docente.id" from="${com.deukin.Docente.list()}" optionKey="id" required="" value="${asignacionDocenteCursoInstance?.docente?.id}" class="many-to-one"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: asignacionDocenteCursoInstance, field: 'tipoPorcentajeAsignacion', 'error')} required  row">
	<label for="tipoPorcentajeAsignacion" class="control-label col-lg-3">
		<g:message code="asignacionDocenteCurso.tipoPorcentajeAsignacion.label" default="Porcentaje hs de la Asignacion" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-9">
	<g:select name="tipoPorcentajeAsignacion" from="${com.deukin.TipoPorcentajeAsignacion?.values()}" keys="${com.deukin.TipoPorcentajeAsignacion.values()*.name()}" required="" value="${asignacionDocenteCursoInstance?.tipoPorcentajeAsignacion?.name()}"/>
	</div>
</div>

