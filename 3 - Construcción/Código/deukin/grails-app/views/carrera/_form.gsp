<%@ page import="com.deukin.Carrera" %>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'titulo', 'error')} row">
	<label for="titulo" class="col-lg-2 control-label">
		<g:message code="carrera.titulo.label" default="Titulo" />
		: 
	</label>
	<div class=" col-lg-10"><g:textField class="form-control"  name="titulo" maxlength="200" value="${carreraInstance?.titulo}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'estado', 'error')} required row">
	<label for="estado" class="col-lg-2 control-label">
		<g:message code="carrera.estado.label" default="Estado" />
		<span class="required-indicator">*</span>: 
	</label>
	<div class=" col-lg-10">
	<g:select class="form-control"  name="estado" from="${com.deukin.EstadoDeCreacion?.values()}" keys="${com.deukin.EstadoDeCreacion.values()*.name()}" required="" value="${carreraInstance?.estado?.name()}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'modalidadAsistencia', 'error')} required row">
	<label for="modalidadAsistencia" class="col-lg-2 control-label">
		<g:message code="carrera.modalidadAsistencia.label" default="Modalidad Asistencia" />
		<span class="required-indicator">*</span>: 
	</label>
	<div class=" col-lg-10"><g:select class="form-control"  name="modalidadAsistencia" from="${com.deukin.ModalidadAsistencia?.values()}" keys="${com.deukin.ModalidadAsistencia.values()*.name()}" required="" value="${carreraInstance?.modalidadAsistencia?.name()}"/></div>
</div>
<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'condicionIngreso', 'error')} row">
	<label for="condicionIngreso" class="col-lg-2 control-label">
		<g:message code="carrera.condicionIngreso.label" default="Condicion Ingreso" />
		: 
	</label>
	<div class="col-lg-10"><g:textField class="form-control" name="condicionIngreso" value="${carreraInstance?.condicionIngreso}"/></div>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'fundamentacion', 'error')} row">
	<label for="fundamentacion" class="col-lg-2 control-label">
		<g:message code="carrera.fundamentacion.label" default="Fundamentacion" />: 
		
	</label>
	<div class="col-lg-10">
	<g:textArea  class="form-control" rows="5" name="fundamentacion" value="${carreraInstance?.fundamentacion}"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'objetivos', 'error')} row ">
	<label for="objetivos" class="col-lg-2 control-label">
		<g:message code="carrera.objetivos.label" default="Objetivos" />: 
		
	</label>
	<div class="col-lg-10">	<g:if test="${carreraInstance?.objetivos}">
				<ul class="one-to-many">
					
					
						<g:each in="${carreraInstance.objetivos}" var="o">
						<li class="property-value" aria-labelledby="objetivos-label"><g:link controller="objetivoCarrera" action="edit" id="${o.id}">${o?.encodeAsHTML()}</g:link></li>
						</g:each>
						</ul>
				</g:if>
</div>
</div>


<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'perfilDelGraduado', 'error')} row">
	<label for="perfilDelGraduado" class="col-lg-2 control-label">
		<g:message code="carrera.perfilDelGraduado.label" default="Perfil Del Graduado" />: 
		
	</label>
	<div class=" col-lg-10">
	<g:textArea class="form-control" rows="5" name="perfilDelGraduado" value="${carreraInstance?.perfilDelGraduado}"/>
	</div>
</div>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'descripcion', 'error')} row">
	<label for="descripcion" class="col-lg-2 control-label">
		<g:message code="carrera.descripcion.label" default="Descripcion" />: 
		
	</label>
	<div class=" col-lg-10"><g:textArea  rows="5" class="form-control" name="descripcion" value="${carreraInstance?.descripcion}"/></div>
</div>



<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'coordinador', 'error')} row">
	<label for="coordinador" class="col-lg-2 control-label">
		<g:message code="carrera.coordinador.label" default="Coordinador" />: 
		
	</label>
	<div class="col-lg-10">
<%--	<g:select class="form-control"  id="coordinador" name="coordinador.id" from="${com.deukin.Persona.list()}" optionKey="id" value="${carreraInstance?.coordinador?.id}" class="many-to-one" noSelection="['null': '']"/>--%>
	<g:hiddenField id ="coordinador.id" name ="coordinador.id" value="${carreraInstance?.coordinador?.id}"/>
	<richui:autoComplete class="form-control"  name="coordinadorNombre" minQueryLength="2" onItemSelect="eligeCoordinador(id)" value="${carreraInstance?.coordinador}"
		action="${createLinkTo('dir': 'carrera/searchCoordinadores')}" forceSelection="false"/>
		</div>
</div>

<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'planesEstudio', 'error')} row">
	<label for="planesEstudio" class="col-lg-2 control-label">
		<g:message code="carrera.planesEstudio.label" default="Planes Estudio" />: 
		
	</label>
	<div class="col-lg-10">
	<g:if test="${carreraInstance?.planesEstudio}">
										<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th>${message(code: 'planEstudio.identificacion.label', default: 'Identificación')}</th>
					
						<th>${message(code: 'planEstudio.estado.label', default: 'Estado')}</th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carreraInstance.planesEstudio}" status="i"  var="pl" >
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="planEstudio" action="show" id="${pl.id}">${fieldValue(bean: pl, field: "identificacion")}</g:link></td>
					
						<td>${fieldValue(bean: pl, field: "estado")}</td>
					
									
					</tr>
				</g:each>
				</tbody>
			</table>


				
				</g:if>
				
				</div>
</div>


<div class="fieldcontain ${hasErrors(bean: carreraInstance, field: 'materias', 'error')} row">
	<label for="materias" class="col-lg-2 control-label">
		<g:message code="carrera.materias.label" default="Materias" />: 
		
	</label>
	<div class="col-lg-10">
	<g:if test="${carreraInstance?.materias}">
									<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
					
						<th>${message(code: 'materia.codigo.label', default: 'Codigo')}</th>
					
						<th>${message(code: 'materia.nombre.label', default: 'Nombre')}</th>
					
							
						<th>${message(code: 'materia.cantidadDocentesRequeridos.label', default: 'Cantidad Docentes Requeridos')}</th>
					
						<th>${message(code: 'materia.cantidadUnidadesHorarias.label', default: 'Cantidad Unidades Horarias')}</th>

					
					</tr>
				</thead>
				<tbody>
				<g:each in="${carreraInstance.materias.sort{a,b-> a.codigo.compareTo(b.codigo)}}" status="i"  var="m" >
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link controller="materia" action="show" id="${m.id}">${fieldValue(bean: m, field: "codigo")}</g:link></td>
					
						<td>${fieldValue(bean: m, field: "nombre")}</td>
					
						<td>${fieldValue(bean: m, field: "cantidadDocentesRequeridos")}</td>
					
						<td>${fieldValue(bean: m, field: "cantidadUnidadesHorarias")}</td>

					
					</tr>
				</g:each>
				</tbody>
			</table>
</g:if>
</div>
</div>



