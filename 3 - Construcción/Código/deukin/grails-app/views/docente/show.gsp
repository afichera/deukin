

<%@ page import="com.deukin.Docente"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'docente.label', default: 'Docente')}" />
<title><g:message code="docente.show.label" /></title>
</head>
<body>
	<sec:ifAnyGranted
		roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
		<div class="navbar navbar-inverse" role="navigation">
			<ul class="nav navbar-nav">
				<li><g:link class="list" action="list">
						<g:message code="docente.list.label" />
					</g:link></li>
			</ul>
		</div>
	</sec:ifAnyGranted>
	<div id="show-docente" class="content scaffold-show" role="main">
		<h1>
			<g:message code="docente.label" default="Docente" />
			:
			<g:fieldValue bean="${docenteInstance}" field="apellido" />
			,
			<g:fieldValue bean="${docenteInstance}" field="nombre" />
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
						<div class="col-lg-2 foto">
							<g:if test="${docenteInstance?.fotoPerfil}">
								<div class="fieldcontain">
									<rendering:inlinePng bytes="${docenteInstance.fotoPerfil}"
										width="165" />
								</div>
							</g:if>

							<g:if test="${docenteInstance?.fotoPerfil == null}">
								<div class="fieldcontain">
									<img width="165"
										src="${resource(dir: 'images', file: 'buddyicon.jpg')}"
										alt="foto de perfil" />
								</div>
							</g:if>
						</div>
						<div class="col-lg-10">

							<div class="fieldcontain row ">
								<label id="usuario-label" class="property-label col-lg-2"><g:message
										code="docente.mail.label" default="Mail" />: </label> <span
									class="property-value col-lg-10"
									aria-labelledby="usuario-label"> <g:if
										test="${docenteInstance?.usuario}">
										<a
											href="mailto:${fieldValue(bean: docenteInstance, field: "usuario.username")}"><g:fieldValue
												bean="${docenteInstance}" field="usuario.username"></g:fieldValue></a>
									</g:if>
								</span>
							</div>



							<div class="fieldcontain row">
								<label id="documento-label" class="property-label col-lg-2"><g:message
										code="docente.documento.label" default="Documento" />: </label>
								<div class="property-value col-lg-10"
									aria-labelledby="documento-label">
									<g:if test="${docenteInstance?.documento}">
										${docenteInstance?.documento?.tipoDocumento} - ${docenteInstance?.documento?.numeroAsText()}
									</g:if>
								</div>
							</div>





							<div class="fieldcontain row">
								<label id="departamento-label" class="property-label col-lg-2"><g:message
										code="docente.departamento.label" default="Departamento" /></label> <span
									class="property-value col-lg-10"
									aria-labelledby="departamento-label"><g:if
										test="${docenteInstance?.departamento}">
										<g:fieldValue bean="${docenteInstance}" field="departamento"></g:fieldValue>
									</g:if> </span>
							</div>




							<div class="fieldcontain row">
								<label id="domicilio-label" class="property-label col-lg-2"><g:message
										code="docente.documentodomicilio.label" default="Domicilio" />:
								</label>
								<div class="property-value col-lg-10"
									aria-labelledby="domicilio-label">
									<g:if test="${docenteInstance?.contacto}">
										${docenteInstance?.contacto?.domicilio.encodeAsHTML()}
									</g:if>
								</div>


							</div>

							<div class="fieldcontain row">
								<label id="telefonos-label" class="property-label col-lg-2"><g:message
										code="docente.telefonos.label" default="Teléfonos" />: <sec:ifAnyGranted
										roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_DOCENTE,ROLE_ADMINISTRATIVO"><g:link
										controller="telefono" action="create"
										params="['contacto.id': docenteInstance?.contacto?.id,'origen':'docente','docente.id':docenteInstance?.id]">
										<span class="glyphicon glyphicon-plus"
											title="${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Teléfono')])}"></span>
									</g:link></sec:ifAnyGranted> </label>
								<div class="property-value col-lg-10"
									aria-labelledby="telefono-label">
									<g:if test="${docenteInstance?.contacto?.telefonos}">
										<g:each in="${docenteInstance.contacto.telefonos}" var="t">
											${t?.encodeAsHTML()}
											<sec:ifAnyGranted
										roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_DOCENTE,ROLE_ADMINISTRATIVO"><g:link controller="telefono" action="delete" id="${t?.id}"
												params="[origen:'docente']">
												<span class="glyphicon glyphicon-trash"
													title="${message(code: 'default.delete.label', args: [message(code: 'telefono.label', default: 'Teléfono')])}"
													onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"></span>
											</g:link></sec:ifAnyGranted>


											<br />

										</g:each>
									</g:if>
								</div>
							</div>
							<div class="fieldcontain row">
								<label id="curriculumsAdjutntos-label"
									class="property-label col-lg-2"><g:message
										code="curriculumAdjunto.list.label"
										default="Curriculums Adjuntos" />:<sec:ifAnyGranted
										roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_DOCENTE,ROLE_ADMINISTRATIVO"> <g:link
										controller="curriculumAdjunto" action="create"
										params="['persona.id': docenteInstance?.id]">
										<span class="glyphicon glyphicon-plus"
											title="${message(code: 'curriculumAdjunto.New.label')}"></span>
									</g:link></sec:ifAnyGranted> </label>
								<div class="property-value col-lg-10"
									aria-labelledby="curriculumsAdjuntos-label">
									<g:if test="${docenteInstance?.curriculumsAdjuntos}">
										<g:each
												in="${docenteInstance.curriculumsAdjuntos}" var="c">
												<span class="property-value"
													aria-labelledby="curriculumsAdjuntos-label">
													<g:link  class="curriculumAdjunto" controller="curriculumAdjunto" action="showArchivo" id="${c?.id}">${c?.nombreArchivo}</g:link>
												</span>
												<sec:ifAnyGranted
										roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_DOCENTE,ROLE_ADMINISTRATIVO"><g:link controller="curriculumAdjunto" action="delete"
													id="${c?.id}" params="['persona.id': docenteInstance?.id]">
													<span class="glyphicon glyphicon-trash"
														title="${message(code: 'default.delete.label', args: [message(code: 'curriculumAdjunto.label', default: 'Curriculum')])}"
														onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"></span>
												</g:link></sec:ifAnyGranted>

											</g:each>
									</g:if>

								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<label class="col-lg-12" id="asignaciones-label"
							class="property-label col-lg-2"><g:message
								code="docente.asignaciones.label" default="Asignaciones" />:</label>
						<div class="col-lg-12">

							<g:if test="${asignacionDocenteCursoInstanceList}">
								<div class="table-responsive">
									<table
										class="table table-responsive table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th><g:message
														code="asignacionDocenteCurso.cicloLectivo.label" /></th>
												<th><g:message
														code="asignacionDocenteCurso.periodoAcademico.label" /></th>

												<th><g:message
														code="asignacionDocenteCurso.curso.label" /></th>

												<th><g:message
														code="asignacionDocenteCurso.materia.label" /></th>

												<th><g:message code="asignacionDocenteCurso.dia.label" /></th>

												<th><g:message
														code="asignacionDocenteCurso.turno.label" /></th>

												<th><g:message
														code="asignacionDocenteCurso.horario.label" /></th>
												<th><g:message
														code="asignacionDocenteCurso.espacioFisico.label" /></th>
												<th><g:message
														code="asignacionDocenteCurso.cantidadHoras.label" /></th>
											</tr>
										</thead>


										<tbody>
											<g:each in="${asignacionDocenteCursoInstanceList}" status="i"
												var="asignacionDocenteCursoInstance">
												<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.cronogramaCarrera?.cicloLectivo?.codigo}

													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.periodoAcademico?.toString()}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.codigo}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.materia?.toString()}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.diaSemana?.name}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.curso?.turno?.codigo}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.startTime}
														- ${asignacionDocenteCursoInstance?.configuracionCursoDia?.endTime}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.configuracionCursoDia?.espacioFisico?.numero}
													</td>

													<td>
														${asignacionDocenteCursoInstance?.cantidadHorasAsignacion}
													</td>



												</tr>
											</g:each>
										</tbody>
									</table>
								</div>
							</g:if>

						</div>
						<div class="col-lg-12">
							<g:form>
								<fieldset class="buttons">
									<sec:ifAnyGranted
										roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_DOCENTE,ROLE_ADMINISTRATIVO">
										<g:hiddenField name="id" value="${docenteInstance?.id}" />
										<g:link class="btn btn-info" action="edit"
											id="${docenteInstance?.id}">
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link>
									</sec:ifAnyGranted>
								</fieldset>
							</g:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
