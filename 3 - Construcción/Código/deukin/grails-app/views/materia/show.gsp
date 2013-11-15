<%@ page import="com.deukin.Materia"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'materia.label', default: 'Materia')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="materia.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="materia.create.label" />
				</g:link></li>
		</ul>
	</div>

	<div id="show-materia" class="content scaffold-show" role="main">
		<h1>
			Materia:
			<g:if test="${materiaInstance?.nombre}">
				<g:fieldValue bean="${materiaInstance}" field="nombre" />
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


						<label id="codigo-label" class="property-label col-lg-3"><g:message
								code="materia.codigo.label" default="Codigo" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.codigo}">
								<g:fieldValue bean="${materiaInstance}" field="codigo" />


							</g:if>
						</div>
					</div>

					<div class="row">


						<label id="bibliografia-label" class="property-label col-lg-3"><g:message
								code="materia.bibliografia.label" default="Bibliografia" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.bibliografia}">
								<g:fieldValue bean="${materiaInstance}" field="bibliografia" />


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="cantidadDocentesRequeridos-label"
							class="property-label col-lg-3"><g:message
								code="materia.cantidadDocentesRequeridos.label"
								default="Cantidad Docentes Requeridos" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.cantidadDocentesRequeridos}">
								<g:fieldValue bean="${materiaInstance}"
									field="cantidadDocentesRequeridos" />


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="cantidadUnidadesHorarias-label"
							class="property-label col-lg-3"><g:message
								code="materia.cantidadUnidadesHorarias.label"
								default="Cantidad Unidades Horarias" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.cantidadUnidadesHorarias}">
								<g:fieldValue bean="${materiaInstance}"
									field="cantidadUnidadesHorarias" />


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="carrera-label" class="property-label col-lg-3"><g:message
								code="materia.carrera.label" default="Carrera" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.carrera}">
								<g:link controller="carrera" action="show"
									id="${materiaInstance?.carrera?.id}">
									${materiaInstance?.carrera?.encodeAsHTML()}
								</g:link>


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="contenidoMinimo-label" class="property-label col-lg-3"><g:message
								code="materia.contenidoMinimo.label" default="Contenido Minimo" />:
						</label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.contenidoMinimo}">
								<g:fieldValue bean="${materiaInstance}" field="contenidoMinimo" />


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="cupoMaximoAlumnos-label"
							class="property-label col-lg-3"><g:message
								code="materia.cupoMaximoAlumnos.label"
								default="Cupo Maximo Alumnos" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.cupoMaximoAlumnos}">
								<g:fieldValue bean="${materiaInstance}"
									field="cupoMaximoAlumnos" />

							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="cupoMinimoAlumnos-label"
							class="property-label col-lg-3"><g:message
								code="materia.cupoMinimoAlumnos.label"
								default="Cupo Minimo Alumnos" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.cupoMinimoAlumnos}">
								<g:fieldValue bean="${materiaInstance}"
									field="cupoMinimoAlumnos" />


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="objetivosEspecificos-label"
							class="property-label col-lg-3"><g:message
								code="materia.objetivosEspecificos.label"
								default="Objetivos Especificos" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.objetivosEspecificos}">
								<g:each in="${materiaInstance.objetivosEspecificos}" var="o">
									<span class="property-value"
										aria-labelledby="objetivosEspecificos-label"><g:link
											controller="objetivoEspecifico" action="show" id="${o.id}">
											${o?.encodeAsHTML()}
										</g:link></span>
								</g:each>


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="objetivosGenerales-label"
							class="property-label col-lg-3"><g:message
								code="materia.objetivosGenerales.label"
								default="Objetivos Generales" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.objetivosGenerales}">
								<g:each in="${materiaInstance.objetivosGenerales}" var="o">
									<span class="property-value"
										aria-labelledby="objetivosGenerales-label"><g:link
											controller="objetivo" action="show" id="${o.id}">
											${o?.encodeAsHTML()}
										</g:link></span>
								</g:each>


							</g:if>
						</div>
					</div>
					<div class="row">


						<label id="tiposRecurso-label" class="property-label col-lg-3"><g:message
								code="materia.tiposRecurso.label" default="Tipos Recurso" />: </label>
						<div class="col-lg-9">
							<g:if test="${materiaInstance?.tiposRecurso}">
								<g:each in="${materiaInstance.tiposRecurso}" var="t">
									<span class="property-value"
										aria-labelledby="tiposRecurso-label"><g:link
											controller="tipoRecurso" action="show" id="${t.id}">
											${t?.encodeAsHTML()}
										</g:link></span>
								</g:each>


							</g:if>
						</div>

					</div>
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${materiaInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${materiaInstance?.id}">
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
