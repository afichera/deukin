

<%@ page import="com.deukin.Carrera"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'carrera.label', default: 'Carrera')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-carrera" class="content scaffold-show" role="main">
		<h1>
			<g:if test="${carreraInstance?.titulo}">
				<g:fieldValue bean="${carreraInstance}" field="titulo" />
			</g:if>
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<div class="row">
						<g:if test="${carreraInstance?.estado}">
							<label id="estado-label" class="col-lg-2 control-label"><g:message
									code="carrera.estado.label" default="Estado" />:</label>
							<div class=" col-lg-10"
								aria-labelledby="estado-label">
								<g:fieldValue bean="${carreraInstance}" field="estado" />
							</div>
						</g:if>
					</div>
					<g:if test="${carreraInstance?.modalidadAsistencia}">
						<div class="row">
							<label id="modalidadAsistencia-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.modalidadAsistencia.label"
									default="Modalidad Asistencia" />:</label>
							<div class="  col-lg-10 "
								aria-labelledby="modalidadAsistencia-label">
								<g:fieldValue bean="${carreraInstance}"
									field="modalidadAsistencia" />
							</div>
						</div>
					</g:if>


					<g:if test="${carreraInstance?.condicionIngreso}">
						<div class="row">
							<label id="condicionIngreso-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.condicionIngreso.label"
									default="Condicion Ingreso" /></label>
							<div class=" col-lg-10 "
								aria-labelledby="condicionIngreso-label">
								<g:fieldValue bean="${carreraInstance}" field="condicionIngreso" />
							</div>
						</div>
					</g:if>

					<g:if test="${carreraInstance?.fundamentacion}">
						<div class="row">
							<label id="fundamentacion-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.fundamentacion.label" default="Fundamentacion" />:
							</label>

							<div class="  col-lg-10 "
								aria-labelledby="fundamentacion-label">
								<g:fieldValue bean="${carreraInstance}" field="fundamentacion" />
							</div>
						</div>
					</g:if>

					<g:if test="${carreraInstance?.objetivos}">
						<div class="row">
							<label id="objetivos-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.objetivos.label" default="Objetivos" />:</label>
							<div class=" col-lg-10 ">
								<ul>
									<g:each in="${carreraInstance.objetivos}" var="o">
										<li><span class=""
											aria-labelledby="objetivos-label"> ${o?.encodeAsHTML()}
										</span></li>
									</g:each>
								</ul>
							</div>
						</div>
					</g:if>

					<g:if test="${carreraInstance?.perfilDelGraduado}">
						<div class="row">
							<label id="perfilDelGraduado-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.perfilDelGraduado.label"
									default="Perfil Del Graduado" />: </label>
							<div class=" col-lg-10 "
								aria-labelledby="perfilDelGraduado-label">
								<g:fieldValue bean="${carreraInstance}"
									field="perfilDelGraduado" />
							</div>
						</div>
					</g:if>
					<g:if test="${carreraInstance?.descripcion}">
						<div class="row">
							<label class="col-lg-2 control-label "><g:message
									code="carrera.descripcion.label" default="Descripcion" />: </label>
							<div class=" col-lg-10 "
								aria-labelledby="descripcion-label">
								<g:fieldValue bean="${carreraInstance}" field="descripcion" />
							</div>
						</div>
					</g:if>

					<g:if test="${carreraInstance?.coordinador}">
						<div class="row">
							<label id="coordinador-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.coordinador.label" default="Coordinador" />:</label>
							<div class=" col-lg-10 "
								aria-labelledby="coordinador-label">
								<g:link controller="persona" action="show"
									id="${carreraInstance?.coordinador?.id}">
									${carreraInstance?.coordinador?.encodeAsHTML()}
								</g:link>
							</div>
						</div>
					</g:if>

					<g:if test="${carreraInstance?.planesEstudio}">
						<div class="row">
							<label id="planesEstudio-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.planesEstudio.label" default="Planes Estudio" />:</label>
							<div class=" col-lg-10 ">
								<ul>
									<g:each in="${carreraInstance.planesEstudio}" var="p">
										<li><span class=""
											aria-labelledby="planesEstudio-label"><g:link
													controller="planEstudio" action="show" id="${p.id}">
													${p?.encodeAsHTML()}
												</g:link></span></li>
									</g:each>
								</ul>
							</div>
						</div>

					</g:if>









					<g:if test="${carreraInstance?.materias}">
						<div class="row">
							<label id="materias-label"
								class="col-lg-2 control-label property-label"><g:message
									code="carrera.materias.label" default="Materias" /></label>
							<div class=" col-lg-10 ">

							
							
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
						</div></div>
					</g:if>




					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${carreraInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${carreraInstance?.id}">
								<g:message code="default.button.edit.label" default="Edit" />
							</g:link>
							<g:actionSubmit class="btn btn-danger" action="delete"
								value="${message(code: 'default.button.delete.label', default: 'Delete')}"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
