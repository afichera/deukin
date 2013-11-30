<%@ page import="com.deukin.Curso" %>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'codigo', 'error')}   row">
	<label for="codigo" class="control-label col-lg-2">
		<g:message code="curso.codigo.label" default="Codigo" />
		
	*: </label>
	<div class="col-lg-10">
	<g:textField class="form-control" name="codigo" maxlength="20" value="${cursoInstance?.codigo}" autofocus=""/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'materia', 'error')} required  row">
	<label for="materia" class="control-label col-lg-2">
		<g:message code="curso.materia.label" default="Materia" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
<%--	<g:select id="materia" name="materia.id" from="${com.deukin.Materia.list()}" optionKey="id" required="" value="${cursoInstance?.materia?.id}" class="many-to-one form-control"/>--%>
	
	
	<g:hiddenField id ="materia.id" name ="materia.id" value="${cursoInstance?.materia?.id}"/>
	<richui:autoComplete name="materiaNombre" minQueryLength="2" onItemSelect="eligeMateria(id)" value="${cursoInstance?.materia}"
		action="${createLinkTo('dir': 'cursos/searchMateriasCoordinador')}" forceSelection="false" class="form-control"/>
	
	</div>
</div>
<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'turno', 'error')} required  row">
	<label for="turno" class="control-label col-lg-2">
		<g:message code="curso.turno.label" default="Turno" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="turno" name="turno.id" from="${com.deukin.Turno.list()}" optionKey="id" required="" value="${cursoInstance?.turno?.id}" class="many-to-one form-control"/>
	</div>
</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'configuracionesCursoDia', 'error')} required multiple row">
<label class="control-label col-lg-2">
		<g:message code="configuracionCursoDia.diasYHorarios.label" default="Días y Horarios" />
		
	: </label>
<div class="col-lg-10">
<em><g:message code="configuracionCursoDia.aclaracionEdit.label" default="" /></em>

</div>
</div>



<div class="fieldcontain required  row">
			<label class="col-lg-2"><g:message
					code="control-label cursos.cicloLectivo.label"
					default="Ciclo Lectivo" /></label>
			<div class="col-lg-10">
				<g:select id="cicloLectivo.id" name="cicloLectivo.id"
					from="${com.deukin.CicloLectivo.list()}" optionKey="id" required=""
					value="${cursoInstance?.cronogramaCarrera?.cicloLectivo?.id}" class="many-to-one  form-control"
					  />
			</div>
			</div>

<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'estadoCurso', 'error')} required  row">
	<label for="estadoCurso" class="control-label col-lg-2">
		<g:message code="curso.estadoCurso.label" default="Estado Curso" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select class=" form-control"name="estadoCurso" from="${com.deukin.EstadoCurso?.values()}" keys="${com.deukin.EstadoCurso.values()*.name()}" required="" value="${cursoInstance?.estadoCurso?.name()}"/>
	</div>
</div>



<div class="fieldcontain ${hasErrors(bean: cursoInstance, field: 'periodoAcademico', 'error')} required  row">
	<label for="periodoAcademico" class="control-label col-lg-2">
		<g:message code="curso.periodoAcademico.label" default="Periodo Academico" />
		<span class="required-indicator">*</span>
	: </label>
	<div class="col-lg-10">
	<g:select id="periodoAcademico" name="periodoAcademico.id" from="${com.deukin.PeriodoAcademico.list()}" optionKey="id" required="" value="${cursoInstance?.periodoAcademico?.id}" class="many-to-one form-control"/>
	</div>
</div>



