<%@ page import="com.deukin.Carrera" %>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'titulo', 'error')} ">
	<label for="titulo" class="control-label">
		<g:message code="carrera.titulo.label" default="Titulo" />
		
	</label>
	<g:textField name="titulo" maxlength="200" value="${carreraInstance?.titulo}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'planesEstudio', 'error')} ">
	<label for="planesEstudio" class="control-label">
		<g:message code="carrera.planesEstudio.label" default="Planes Estudio" />
		
	</label>
	<g:select name="planesEstudio" from="${com.deukin.PlanEstudio.list()}" multiple="multiple" optionKey="id" size="5" value="${carreraInstance?.planesEstudio*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'fundamentacion', 'error')} ">
	<label for="fundamentacion" class="control-label">
		<g:message code="carrera.fundamentacion.label" default="Fundamentacion" />
		
	</label>
	<g:textField name="fundamentacion" value="${carreraInstance?.fundamentacion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'perfilDelGraduado', 'error')} ">
	<label for="perfilDelGraduado" class="control-label">
		<g:message code="carrera.perfilDelGraduado.label" default="Perfil Del Graduado" />
		
	</label>
	<g:textField name="perfilDelGraduado" value="${carreraInstance?.perfilDelGraduado}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion" class="control-label">
		<g:message code="carrera.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${carreraInstance?.descripcion}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'condicionIngreso', 'error')} ">
	<label for="condicionIngreso" class="control-label">
		<g:message code="carrera.condicionIngreso.label" default="Condicion Ingreso" />
		
	</label>
	<g:textField name="condicionIngreso" value="${carreraInstance?.condicionIngreso}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'modalidadAsistencia', 'error')} required">
	<label for="modalidadAsistencia" class="control-label">
		<g:message code="carrera.modalidadAsistencia.label" default="Modalidad Asistencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="modalidadAsistencia" from="${com.deukin.ModalidadAsistencia?.values()}" keys="${com.deukin.ModalidadAsistencia.values()*.name()}" required="" value="${carreraInstance?.modalidadAsistencia?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'objetivos', 'error')} ">
	<label for="objetivos" class="control-label">
		<g:message code="carrera.objetivos.label" default="Objetivos" />
		
	</label>
	
</div>

