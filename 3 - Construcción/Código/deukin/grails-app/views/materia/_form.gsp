<%@ page import="com.deukin.Materia" %>



<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'codigo', 'error')} required">
	<label for="codigo" class="control-label">
		<g:message code="materia.codigo.label" default="Codigo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="codigo" type="number" value="${materiaInstance.codigo}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'nombre', 'error')} ">
	<label for="nombre" class="control-label">
		<g:message code="materia.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${materiaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'bibliografia', 'error')} ">
	<label for="bibliografia" class="control-label">
		<g:message code="materia.bibliografia.label" default="Bibliografia" />
		
	</label>
	<g:textField name="bibliografia" value="${materiaInstance?.bibliografia}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cantidadDocentesRequeridos', 'error')} required">
	<label for="cantidadDocentesRequeridos" class="control-label">
		<g:message code="materia.cantidadDocentesRequeridos.label" default="Cantidad Docentes Requeridos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadDocentesRequeridos" type="number" value="${materiaInstance.cantidadDocentesRequeridos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cantidadUnidadesHorarias', 'error')} required">
	<label for="cantidadUnidadesHorarias" class="control-label">
		<g:message code="materia.cantidadUnidadesHorarias.label" default="Cantidad Unidades Horarias" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cantidadUnidadesHorarias" type="number" value="${materiaInstance.cantidadUnidadesHorarias}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'contenidoMinimo', 'error')} ">
	<label for="contenidoMinimo" class="control-label">
		<g:message code="materia.contenidoMinimo.label" default="Contenido Minimo" />
		
	</label>
	<g:textField name="contenidoMinimo" value="${materiaInstance?.contenidoMinimo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cupoMaximoAlumnos', 'error')} required">
	<label for="cupoMaximoAlumnos" class="control-label">
		<g:message code="materia.cupoMaximoAlumnos.label" default="Cupo Maximo Alumnos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cupoMaximoAlumnos" type="number" value="${materiaInstance.cupoMaximoAlumnos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cupoMinimoAlumnos', 'error')} required">
	<label for="cupoMinimoAlumnos" class="control-label">
		<g:message code="materia.cupoMinimoAlumnos.label" default="Cupo Minimo Alumnos" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="cupoMinimoAlumnos" type="number" value="${materiaInstance.cupoMinimoAlumnos}" required=""/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'materiasCorrelativas', 'error')} ">
	<label for="materiasCorrelativas" class="control-label">
		<g:message code="materia.materiasCorrelativas.label" default="Materias Correlativas" />
		
	</label>
	<g:select name="materiasCorrelativas" from="${com.deukin.Materia.list()}" multiple="multiple" optionKey="id" size="5" value="${materiaInstance?.materiasCorrelativas*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'materiasEquivalentes', 'error')} ">
	<label for="materiasEquivalentes" class="control-label">
		<g:message code="materia.materiasEquivalentes.label" default="Materias Equivalentes" />
		
	</label>
	<g:select name="materiasEquivalentes" from="${com.deukin.Materia.list()}" multiple="multiple" optionKey="id" size="5" value="${materiaInstance?.materiasEquivalentes*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'objetivosEspecificos', 'error')} ">
	<label for="objetivosEspecificos" class="control-label">
		<g:message code="materia.objetivosEspecificos.label" default="Objetivos Especificos" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'objetivosGenerales', 'error')} ">
	<label for="objetivosGenerales" class="control-label">
		<g:message code="materia.objetivosGenerales.label" default="Objetivos Generales" />
		
	</label>
	
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'tiposRecurso', 'error')} ">
	<label for="tiposRecurso" class="control-label">
		<g:message code="materia.tiposRecurso.label" default="Tipos Recurso" />
		
	</label>
	<g:select name="tiposRecurso" from="${com.deukin.TipoRecurso.list()}" multiple="multiple" optionKey="id" size="5" value="${materiaInstance?.tiposRecurso*.id}" class="many-to-many"/>
</div>

