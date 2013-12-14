

<%@ page import="com.deukin.Curso" %>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'curso.label', default: 'Curso')}" />
<title><g:message code="cursos.show.label"  /></title>
</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="list" action="list">
					<g:message code="cursos.list.label" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="cursos.new.label"  />
				</g:link></li>
		</ul>
	</div>

	<div id="show-curso"
		class="content scaffold-show" role="main">
		<h1>
			<g:message code="cursos.show.label" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">${flash.message}</div>
		</g:if>
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
				<div class="well">
				
						
				
				<div class="fieldcontain row">
					<label id="codigo-label" class="property-label col-lg-3"><g:message code="curso.codigo.label" default="Codigo" />: </label>
					<g:if test="${cursoInstance?.codigo}">
						<div class="property-value col-lg-9" aria-labelledby="codigo-label"><g:fieldValue bean="${cursoInstance}" field="codigo"/></div>
						</g:if>
				</div>
			
							<div class="fieldcontain row">
					<label id="materia-label" class="property-label col-lg-3"><g:message code="curso.materia.label" default="Materia" />: </label>
					<g:if test="${cursoInstance?.materia}">
						<div class="property-value col-lg-9" aria-labelledby="materia-label"><g:link controller="materia" action="show" id="${cursoInstance?.materia?.id}">${cursoInstance?.materia?.encodeAsHTML()}</g:link></div>
					</g:if>
				</div>
				
								<div class="fieldcontain row">
					<label id="turno-label" class="property-label col-lg-3"><g:message code="curso.turno.label" default="Turno" />: </label>
						<g:if test="${cursoInstance?.turno}">
						<div class="property-value col-lg-9" aria-labelledby="turno-label">${cursoInstance?.turno?.encodeAsHTML()}</div>
						</g:if>
				</div>
				
				<div class="fieldcontain row">
					<label id="configuracionesCursoDia-label" class="property-label col-lg-3"><g:message code="curso.configuracionesCursoDia.label" default="Días y horarios" />: 								<g:link
								controller="configuracionCursoDia" action="create"
								params="['curso.id': cursoInstance?.id]">
								<span class="glyphicon glyphicon-plus"
									title="${message(code: 'configuracionCursoDia.add.label', args: [message(code: 'configuracionCursoDia.label', default: 'configuracionCursoDia')])}"></span>
							</g:link></label>
							<div class="col-lg-9">
					<g:if test="${cursoInstance?.configuracionesCursoDia}">
						
		
				<g:each in="${cursoInstance.configuracionesCursoDia}" status="i" var="configuracionCursoDiaInstance">
		
							<div class="panel">
              <div class="panel-heading">${fieldValue(bean: configuracionCursoDiaInstance, field: "diaSemana")}&nbsp;&nbsp;&nbsp;    
              <g:link
								controller="configuracionCursoDia" action="edit"
								id="${configuracionCursoDiaInstance?.id }">
								<span class="glyphicon glyphicon-pencil"
									title="${message(code: 'configuracionCursoDia.edit.label', args: [message(code: 'configuracionCursoDia.label', default: 'configuracionCursoDia')])}"></span>
							</g:link>
              </div>
              				<ul>		
							<li>${message(code: 'configuracionCursoDia.horario.label', default: 'Horario')}: ${configuracionCursoDiaInstance?.getStartTime()}-${configuracionCursoDiaInstance?.getEndTime()}</li>
						
							<li>${message(code: 'cursos.espacioFisico.label', default: 'Aula/Laboratorio')}: ${fieldValue(bean: configuracionCursoDiaInstance, field: "espacioFisico")}</li>
						<li>
						${message(code: 'configuracionCursoDia.docentes.label', default: 'Docentes')}: <g:link
								controller="asignacionDocenteCurso" action="create"
								params="['configuracionCursoDia.id': configuracionCursoDiaInstance?.id]">
								<span class="glyphicon glyphicon-plus"
									title="${message(code: 'asignacionDocenteCurso.add.label', args: [message(code: 'asignacionDocenteCurso.label', default: 'Asignacion Docente')])}"></span>
							</g:link>
						<ul>
						<g:each
								in="${configuracionCursoDiaInstance.asignacionesDocenteCurso}"
								status="y" var="a">
								<li><g:link controller="asignacionDocenteCurso" action="edit" id="${a.id}">
									${fieldValue(bean: a, field: "docente")}
								</g:link></li>
								
							</g:each>
						</ul>
						
						</li>
						
						</ul>
            </div>
				</g:each>
			</tbody>
		</table></div>
				
		
				
						
					</g:if>
					</div>
				</div>
				
			
				

				
						<div class="fieldcontain row">
					<label id="cicloLectivo-label" class="property-label col-lg-3"><g:message code="curso.cicloLectivo.label" default="Ciclo Lectivo" />: </label>
				<g:if test="${cursoInstance?.materia}">	
						<div class="property-value col-lg-9" aria-labelledby="cicloLectivo-label">${cursoInstance?.cronogramaCarrera?.cicloLectivo.encodeAsHTML()}</div>
					</g:if>
				</div>
					
				
				<div class="fieldcontain row">
					<label id="estadoCurso-label" class="property-label col-lg-3"><g:message code="curso.estadoCurso.label" default="Estado Curso" />: </label>
					
					<g:if test="${cursoInstance?.estadoCurso}">
						<div class="property-value col-lg-9" aria-labelledby="estadoCurso-label"><g:fieldValue bean="${cursoInstance}" field="estadoCurso"/></div>
						</g:if>
				</div>
			
			
				

			<div class="fieldcontain row">
				<g:if test="${cursoInstance?.periodoAcademico}">
				
					<label id="periodoAcademico-label" class="property-label col-lg-3"><g:message code="curso.periodoAcademico.label" default="Periodo Academico" />: </label>
					
						<div class="property-value col-lg-9" aria-labelledby="periodoAcademico-label">${cursoInstance?.periodoAcademico?.encodeAsHTML()}</div>
					
				
				</g:if>
				</div>

			
			
					<g:form>
						<fieldset class="buttons">
							<g:hiddenField name="id" value="${cursoInstance?.id}" />
							<g:link class="btn btn-info" action="edit"
								id="${cursoInstance?.id}">
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
