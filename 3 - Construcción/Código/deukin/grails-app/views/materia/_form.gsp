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

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'predecesoraCorrelatividad', 'error')} ">
	<label for="predecesoraCorrelatividad" class="control-label">
		<g:message code="materia.predecesoraCorrelatividad.label" default="Predecesora Correlatividad" />
		
	</label>
	<g:select id="predecesoraCorrelatividad" name="predecesoraCorrelatividad.id" from="${com.deukin.Materia.list()}" optionKey="id" value="${materiaInstance?.predecesoraCorrelatividad?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'predecesoraEquivalente', 'error')} ">
	<label for="predecesoraEquivalente" class="control-label">
		<g:message code="materia.predecesoraEquivalente.label" default="Predecesora Equivalente" />
		
	</label>
	<g:select id="predecesoraEquivalente" name="predecesoraEquivalente.id" from="${com.deukin.Materia.list()}" optionKey="id" value="${materiaInstance?.predecesoraEquivalente?.id}" class="many-to-one" noSelection="['null': '']"/>
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

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'carrera', 'error')} required">
	<label for="carrera" class="control-label">
		<g:message code="materia.carrera.label" default="Carrera" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="carrera" name="carrera.id" from="${com.deukin.Carrera.list()}" optionKey="id" required="" value="${materiaInstance?.carrera?.id}" class="many-to-one"/>
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
	
<ul class="one-to-many">
<g:each in="${materiaInstance?.materiasCorrelativas?}" var="m">
    <li><g:link controller="materia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materia" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materia.label', default: 'Materia')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'materiasEquivalentes', 'error')} ">
	<label for="materiasEquivalentes" class="control-label">
		<g:message code="materia.materiasEquivalentes.label" default="Materias Equivalentes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materiaInstance?.materiasEquivalentes?}" var="m">
    <li><g:link controller="materia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materia" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materia.label', default: 'Materia')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'objetivosEspecificos', 'error')} ">
	<label for="objetivosEspecificos" class="control-label">
		<g:message code="materia.objetivosEspecificos.label" default="Objetivos Especificos" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materiaInstance?.objetivosEspecificos?}" var="o">
    <li><g:link controller="objetivoEspecifico" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objetivoEspecifico" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'objetivosGenerales', 'error')} ">
	<label for="objetivosGenerales" class="control-label">
		<g:message code="materia.objetivosGenerales.label" default="Objetivos Generales" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${materiaInstance?.objetivosGenerales?}" var="o">
    <li><g:link controller="objetivo" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="objetivo" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetivo.label', default: 'Objetivo')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'tiposRecurso', 'error')} ">
	<label for="tiposRecurso" class="control-label">
		<g:message code="materia.tiposRecurso.label" default="Tipos Recurso" />
		
	</label>
	<g:select name="tiposRecurso" from="${com.deukin.TipoRecurso.list()}" multiple="multiple" optionKey="id" size="5" value="${materiaInstance?.tiposRecurso*.id}" class="many-to-many"/>
</div>

