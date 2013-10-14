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
	<g:if test="${carreraInstance?.planesEstudio}">
				<ul class="one-to-many">
					
					
						<g:each in="${carreraInstance.planesEstudio}" var="p">
						<li class="property-value" aria-labelledby="planesEstudio-label"><g:link controller="planEstudio" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
						</g:each>
					</ul>
				
				</g:if>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'objetivos', 'error')} ">
	<label for="objetivos" class="control-label">
		<g:message code="carrera.objetivos.label" default="Objetivos" />
		
	</label>
		<g:if test="${carreraInstance?.objetivos}">
				<ul class="one-to-many">
					
					
						<g:each in="${carreraInstance.objetivos}" var="o">
						<li class="property-value" aria-labelledby="objetivos-label"><g:link controller="objetivoCarrera" action="edit" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
						</g:each>
					</ul>
				
				</g:if>
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

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'coordinador', 'error')} ">
	<label for="coordinador" class="control-label">
		<g:message code="carrera.coordinador.label" default="Coordinador" />
		
	</label>
	<g:select id="coordinador" name="coordinador.id" from="${com.deukin.Persona.list()}" optionKey="id" value="${carreraInstance?.coordinador?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'estado', 'error')} required">
	<label for="estado" class="control-label">
		<g:message code="carrera.estado.label" default="Estado" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="estado" from="${com.deukin.EstadoDeCreacion?.values()}" keys="${com.deukin.EstadoDeCreacion.values()*.name()}" required="" value="${carreraInstance?.estado?.name()}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'condicionIngreso', 'error')} ">
	<label for="condicionIngreso" class="control-label">
		<g:message code="carrera.condicionIngreso.label" default="Condicion Ingreso" />
		
	</label>
	<g:textField name="condicionIngreso" value="${carreraInstance?.condicionIngreso}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'materias', 'error')} ">
	<label for="materias" class="control-label">
		<g:message code="carrera.materias.label" default="Materias" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${carreraInstance?.materias?}" var="m">
    <li><g:link controller="materia" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="materia" action="create" params="['carrera.id': carreraInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'materia.label', default: 'Materia')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'modalidadAsistencia', 'error')} required">
	<label for="modalidadAsistencia" class="control-label">
		<g:message code="carrera.modalidadAsistencia.label" default="Modalidad Asistencia" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="modalidadAsistencia" from="${com.deukin.ModalidadAsistencia?.values()}" keys="${com.deukin.ModalidadAsistencia.values()*.name()}" required="" value="${carreraInstance?.modalidadAsistencia?.name()}"/>
</div>

