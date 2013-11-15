<%@ page import="com.deukin.Materia" %>



<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'codigo', 'error')} required row">
	<label for="codigo" class="control-label col-lg-3">
		<g:message code="materia.codigo.label" default="Codigo" />
		*: 
	</label>
	<div class=" col-lg-9 "><g:field  class="form-control" name="codigo" type="number" value="${materiaInstance.codigo}" required=""/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'nombre', 'error')} row">
	<label for="nombre" class="control-label col-lg-3">
		<g:message code="materia.nombre.label" default="Nombre" />: 
		
	</label>
	<div class=" col-lg-9 "><g:textField class="form-control" name="nombre" value="${materiaInstance?.nombre}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'bibliografia', 'error')}  row">
	<label for="bibliografia" class="control-label col-lg-3">
		<g:message code="materia.bibliografia.label" default="Bibliografia" />: 
		
	</label>
	<div class=" col-lg-9 "><g:textArea class="form-control" rows="5" name="bibliografia" value="${materiaInstance?.bibliografia}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cantidadDocentesRequeridos', 'error')} required  row">
	<label for="cantidadDocentesRequeridos" class="control-label col-lg-3">
		<g:message code="materia.cantidadDocentesRequeridos.label" default="Cantidad Docentes Requeridos" />
		*: 
	</label>
<div class=" col-lg-9 ">	<g:field  class="form-control" name="cantidadDocentesRequeridos" type="number" value="${materiaInstance.cantidadDocentesRequeridos}" required=""/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cantidadUnidadesHorarias', 'error')} required row">
	<label for="cantidadUnidadesHorarias" class="control-label col-lg-3">
		<g:message code="materia.cantidadUnidadesHorarias.label" default="Cantidad Unidades Horarias" />
		*: 
	</label>
	<div class=" col-lg-9 "><g:field  class="form-control" name="cantidadUnidadesHorarias" type="number" value="${materiaInstance.cantidadUnidadesHorarias}" required=""/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'carrera', 'error')} required row">
	<label for="carrera" class="control-label col-lg-3">
		<g:message code="materia.carrera.label" default="Carrera" />
		*: 
	</label>
	<g:hiddenField id ="carrera.id" name ="carrera.id" value="${materiaInstance?.carrera?.id}"/>
<div class=" col-lg-9 ">	<richui:autoComplete name="carreraTitulo" minQueryLength="2" onItemSelect="eligeCarrera(id)" value="${materiaInstance?.carrera}"
		action="${createLinkTo('dir': 'materia/searchCarrerasAutocomplete')}" forceSelection="false"  class="form-control" /></div>
<%--	<g:select id="carrera" name="carrera.id" from="${com.deukin.Carrera.list()}" optionKey="id" required="" value="${materiaInstance?.carrera?.id}" class="many-to-one"/>--%>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'contenidoMinimo', 'error')}  row">
	<label for="contenidoMinimo" class="control-label col-lg-3">
		<g:message code="materia.contenidoMinimo.label" default="Contenido Minimo" />: 
		
	</label>
	<div class=" col-lg-9 "><g:textArea rows="5"  class="form-control" name="contenidoMinimo" value="${materiaInstance?.contenidoMinimo}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cupoMaximoAlumnos', 'error')} required row">
	<label for="cupoMaximoAlumnos" class="control-label col-lg-3">
		<g:message code="materia.cupoMaximoAlumnos.label" default="Cupo Maximo Alumnos" />
		*: 
	</label>
<div class=" col-lg-9 ">	<g:field  class="form-control"  name="cupoMaximoAlumnos" type="number" value="${materiaInstance.cupoMaximoAlumnos}" required=""/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'cupoMinimoAlumnos', 'error')} required row">
	<label for="cupoMinimoAlumnos" class="control-label col-lg-3">
		<g:message code="materia.cupoMinimoAlumnos.label" default="Cupo Minimo Alumnos" />
		*: 
	</label>
<div class=" col-lg-9 ">	<g:field  class="form-control" name="cupoMinimoAlumnos" type="number" value="${materiaInstance.cupoMinimoAlumnos}" required=""/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'objetivosEspecificos', 'error')}  row">
	<label for="objetivosEspecificos" class="control-label col-lg-3">
		<g:message code="materia.objetivosEspecificos.label" default="Objetivos Especificos" />: 
		
	</label>
	
<div class=" col-lg-9 "><ul class="one-to-many">
<g:each in="${materiaInstance?.objetivosEspecificos?}" var="o">
    <li><g:link controller="objetivoEspecifico" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link class=" btn btn-primary btn-small" controller="objetivoEspecifico" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetivoEspecifico.label', default: 'ObjetivoEspecifico')])}</g:link>
</li>
</ul>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'objetivosGenerales', 'error')}  row">
	<label for="objetivosGenerales" class="control-label col-lg-3">
		<g:message code="materia.objetivosGenerales.label" default="Objetivos Generales" />: 
		
	</label>
	<div class=" col-lg-9 ">
<ul class="one-to-many">
<g:each in="${materiaInstance?.objetivosGenerales?}" var="o">
    <li><g:link controller="objetivo" action="show" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link class=" btn btn-primary btn-small" controller="objetivo" action="create" params="['materia.id': materiaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'objetivo.label', default: 'Objetivo')])}</g:link>
</li>
</ul>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: materiaInstance, field: 'tiposRecurso', 'error')}  row">
	<label for="tiposRecurso" class="control-label col-lg-3">
		<g:message code="materia.tiposRecurso.label" default="Tipos Recurso" />: 
		
	</label>
<div class=" col-lg-9 ">	<g:select  class="form-control" name="tiposRecurso" from="${com.deukin.TipoRecurso.list()}" multiple="multiple" optionKey="id" size="5" value="${materiaInstance?.tiposRecurso*.id}" class="many-to-many"/></div>
</div>

