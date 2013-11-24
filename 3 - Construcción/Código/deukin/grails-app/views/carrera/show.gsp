

<%@page import="com.deukin.MateriaService"%>
<%@ page import="com.deukin.Carrera"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'carrera.label', default: 'Carrera')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
<resource:accordion skin="custom" />
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="carrera.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="carrera.new.label" />
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
			<div class="message  alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
					<div class="row">
						<label id="estado-label" class="col-lg-2 control-label"><g:message
								code="carrera.estado.label" default="Estado" />:</label>
						<g:if test="${carreraInstance?.estado}">

							<div class=" col-lg-10" aria-labelledby="estado-label">
								<g:fieldValue bean="${carreraInstance}" field="estado" />
							</div>
						</g:if>
					</div>

					<div class="row">
						<label id="modalidadAsistencia-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.modalidadAsistencia.label"
								default="Modalidad Asistencia" />:</label>

						<div class="  col-lg-10 "
							aria-labelledby="modalidadAsistencia-label">
							<g:if test="${carreraInstance?.modalidadAsistencia}">
								<g:fieldValue bean="${carreraInstance}"
									field="modalidadAsistencia" />
							</g:if>
						</div>

					</div>

				<div class="row">
						<label id="condicionIngreso-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.condicionIngreso.label"
								default="Condicion Ingreso" />: </label>
						<div class=" col-lg-10 " aria-labelledby="condicionIngreso-label">
							<g:if test="${carreraInstance?.condicionIngreso}">
								<g:fieldValue bean="${carreraInstance}" field="condicionIngreso" />
							</g:if>
						</div>
					</div>

					<div class="row">
						<label id="fundamentacion-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.fundamentacion.label" default="Fundamentacion" />:
						</label>

						<div class="  col-lg-10 " aria-labelledby="fundamentacion-label">
							<g:if test="${carreraInstance?.fundamentacion}">
								<g:fieldValue bean="${carreraInstance}" field="fundamentacion" />

							</g:if>
						</div>
					</div>

					<div class="row">
						<label id="objetivos-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.objetivos.label" default="Objetivos" />: <g:link
								controller="objetivoCarrera" action="create"
								params="['carrera.id': carreraInstance?.id]">
								<span class="glyphicon glyphicon-plus"
									title="${message(code: 'default.add.label', args: [message(code: 'objetivoCarrera.label', default: 'ObjetivoCarrera')])}"></span>
							</g:link></label>


						<div class=" col-lg-10 ">
							<g:if test="${carreraInstance?.objetivos}">
								<ul>
									<g:each in="${carreraInstance.objetivos}" var="o">
										<li><span class="" aria-labelledby="objetivos-label">
										<g:link
											controller="objetivoCarrera" action="edit" id="${o.id}">
												${o?.encodeAsHTML()}</g:link>
										</span></li>
									</g:each>
								</ul>
							</g:if>
						</div>



					</div>

					<div class="row">
						<label id="perfilDelGraduado-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.perfilDelGraduado.label"
								default="Perfil Del Graduado" />: </label>
						<div class=" col-lg-10 " aria-labelledby="perfilDelGraduado-label">
							<g:if test="${carreraInstance?.perfilDelGraduado}">
								<g:fieldValue bean="${carreraInstance}"
									field="perfilDelGraduado" />
							</g:if>
						</div>
					</div>

					<div class="row">
						<label class="col-lg-2 control-label "><g:message
								code="carrera.descripcion.label" default="Descripcion" />: </label>
						<div class=" col-lg-10 " aria-labelledby="descripcion-label">
							<g:if test="${carreraInstance?.descripcion}">
								<g:fieldValue bean="${carreraInstance}" field="descripcion" />
							</g:if>
						</div>
					</div>

					<div class="row">
						<label id="coordinadores-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.coordinadores.label" default="Coordinadores" />:
								</label>
										
							<div class=" col-lg-10 ">
							<g:if test="${carreraInstance?.coordinadores}">
								<ul>
									<g:each in="${carreraInstance.coordinadores}" var="co">
									
										<li><span class="" aria-labelledby="coordinadores-label">
										<g:link
											controller="coordinadores" action="show" id="${co.id}">
												${co?.encodeAsHTML()}<g:if test="${co.coordinadorGeneral}"> (Coordinador General)</g:if></g:link>
										</span></li>
									</g:each>
								</ul>
							</g:if>
						</div>
					</div>

					<div class="row">
						<label id="planesEstudio-label"
							class="col-lg-2 control-label property-label"><g:message
								code="carrera.planesEstudio.label" default="Planes Estudio" />:
 <g:link
								controller="planEstudio" action="create"
								params="['carrera.id': carreraInstance?.id]">
								<span class="glyphicon glyphicon-plus"
									title="${message(code: 'default.add.label', args: [message(code: 'planEstudio.label', default: 'Plan de Estudio')])}"></span>
							</g:link>
						</label>
						<div class=" col-lg-10 ">
							<g:if test="${carreraInstance?.planesEstudio}">
						<g:each in="${carreraInstance.planesEstudio}" status="i"
											var="pl">
					<richui:accordion>
					<richui:accordionItem caption="${fieldValue(bean: pl, field: "identificacion")} - ${fieldValue(bean: pl, field: "estado")}">
					
					<%--

												<td><g:link controller="planEstudio" action="show"
														id="${pl.id}">
														${fieldValue(bean: pl, field: "identificacion")}
													</g:link></td>

												--%>
				

								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>

											<th>
												${message(code: 'materia.codigo.label', default: 'Codigo')}
											</th>

											<th>
												${message(code: 'materia.nombre.label', default: 'Nombre')}
											</th>


											<th>
												${message(code: 'materia.cantidadDocentesRequeridos.label', default: 'Cantidad Docentes Requeridos')}
											</th>

											<th>
												${message(code: 'materia.cantidadUnidadesHorarias.label', default: 'Cantidad Unidades Horarias')}
											</th>

											<th>
												${message(code: 'materia.correlativas.label', default: 'Correlativas')}
											</th>

										</tr>
									</thead>
									<tbody>
										<g:each
											in="${pl.asignacionesPeriodosMaterias.sort{a,b-> a.materia.codigo.compareTo(b.materia.codigo)}}"
											status="k" var="m">
											<tr class="${(k % 2) == 0 ? 'even' : 'odd'}">

												<td><g:link controller="materia" action="show"
														id="${m.materia.id}">
														${fieldValue(bean: m.materia, field: "codigo")}
													</g:link></td>

												<td>
													${fieldValue(bean: m.materia, field: "nombre")}
												</td>

												<td>
													${fieldValue(bean: m.materia, field: "cantidadDocentesRequeridos")}
												</td>

												<td>
													${fieldValue(bean: m.materia, field: "cantidadUnidadesHorarias")}
												</td>
												<td>
																			<g:if test="${correlatividades}">

								
									<g:each in="${correlatividades}" status="y" var="c">
									<g:if test="${c?.materiaPrincipal?.id==m?.id}">
										<g:link controller="materia" action="show"
												id="${c.id}">
												${c?.materiaPredecesora?.encodeAsHTML()}<br/>
											</g:link>
											</g:if>
									</g:each>
								
							</g:if>	
												
												</td>


											</tr>
										</g:each>
									</tbody>
								</table>
								<g:link controller="planEstudio" action="show"
														id="${pl.id}">
														Ir al plan
													</g:link>
						</richui:accordionItem>
						</richui:accordion>	


										
										</g:each>
							
							</g:if>
						</div>
					</div>

	
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
