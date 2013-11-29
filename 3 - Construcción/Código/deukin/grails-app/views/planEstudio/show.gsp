

<%@ page import="com.deukin.PlanEstudio"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'planEstudio.label', default: 'PlanEstudio')}" />
<title><g:message code="planEstudio.show.label" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="planEstudio.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="planEstudio.new.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-planEstudio" class="content scaffold-show" role="main">
		<h1>
			<g:message code="planEstudio.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message  alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">



					<div class="fieldcontain row">
						<label id="identificacion-label" class="property-label col-lg-3"><g:message
								code="planEstudio.identificacion.label" default="Identificacion" />:
						</label>
						
							<div class="property-value  col-lg-9"
								aria-labelledby="identificacion-label">
								<g:if test="${planEstudioInstance?.identificacion}">
								<g:fieldValue
									bean="${planEstudioInstance}" field="identificacion" />
									</g:if>
									</div>
						
					</div>


					<div class="fieldcontain row">
						<label id="estado-label" class="property-label col-lg-3"><g:message
								code="planEstudio.estado.label" default="Estado" />: </label>
						
							<div class="property-value col-lg-9" aria-labelledby="estado-label">
							
							<g:if test="${planEstudioInstance?.estado}"><g:fieldValue
									bean="${planEstudioInstance}" field="estado" />
									</g:if></div>
						
					</div>


					<div class="fieldcontain row">
						<label id="carrera-label" class="property-label col-lg-3"><g:message
								code="planEstudio.carrera.label" default="Carrera" />: </label>
						
							<div class="property-value col-lg-9" aria-labelledby="carrera-label">
							<g:if test="${planEstudioInstance?.carrera}">
							<g:link
									controller="carrera" action="show"
									id="${planEstudioInstance?.carrera?.id}">
									${planEstudioInstance?.carrera?.encodeAsHTML()}
								</g:link>
									</g:if>
								</div>
					
					</div>


					<div class="fieldcontain row">
						<label id="cantidadPeriodosAcademicos-label"
							class="property-label col-lg-3"><g:message
								code="planEstudio.cantidadPeriodosAcademicos.label"
								default="Cantidad Periodos Academicos" />: </label>

						<div class="property-value col-lg-9"
							aria-labelledby="cantidadPeriodosAcademicos-label">
							<g:if test="${planEstudioInstance?.cantidadPeriodosAcademicos}">
								<g:fieldValue bean="${planEstudioInstance}"
									field="cantidadPeriodosAcademicos" />
							</g:if>
						</div>

					</div>





					<div class="fieldcontain row">
						<label id="materias-label" class="property-label col-lg-3"><g:message
								code="planEstudio.materias.label" default="Materias" />: <g:link
								controller="materia" action="create"
								params="['planEstudio.id': planEstudioInstance?.id]">
								<span class="glyphicon glyphicon-plus"
									title="${message(code: 'default.add.label', args: [message(code: 'materia.label', default: 'Materia')])}"></span>
							</g:link> </label>
						<div class="col-lg-12">
							<g:if test="${planEstudioInstance?.materias}">

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
												${message(code: 'materia.anio.label', default: 'Año')}
											</th>

											<th>
												${message(code: 'materia.cuatrimestre.label', default: 'Cuatrimestre')}
											</th>

											<th>
												${message(code: 'materia.correlativas.label', default: 'Correlativas')}
											</th>

										</tr>
									</thead>
									<tbody>
										<g:each
											in="${planEstudioInstance.materias.sort{a,b-> a.codigo.compareTo(b.codigo)}}"
											status="k" var="m">
											<tr class="${(k % 2) == 0 ? 'even' : 'odd'}">

												<td><g:link controller="materia" action="show"
														id="${m.id}">
														${fieldValue(bean: m, field: "codigo")}
													</g:link></td>

												<td>
													${fieldValue(bean: m, field: "nombre")}
												</td>

												<td>
													${fieldValue(bean: m, field: "cantidadDocentesRequeridos")}
												</td>

												<td>
													${fieldValue(bean: m, field: "cantidadUnidadesHorarias")}
												</td>

												<td>
													${fieldValue(bean: m.periodo, field: "anio")}
												</td>

												<td>
													${fieldValue(bean: m.periodo, field: "cuatrimestre")}
												</td>



												<td><g:if test="${correlatividades}">


														<g:each in="${correlatividades}" status="y" var="c">
															<g:if test="${c?.materiaPrincipal?.id==m?.id}">
																<g:link controller="materia" action="show"
																	id="${c.materiaPredecesora.id}">
																	${c?.materiaPredecesora?.encodeAsHTML()}<br />
																</g:link>
															</g:if>
														</g:each>

													</g:if></td>


											</tr>
										</g:each>
									</tbody>
								</table>

							</g:if>
						</div>
					</div>








					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${planEstudioInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${planEstudioInstance?.id}">
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
