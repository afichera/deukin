
<%@ page import="com.deukin.ConfiguracionCursoDia"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'configuracionCursoDia.label', default: 'ConfiguracionCursoDia')}" />
<title><g:message code="cursos.list.label" /></title>
<script src="${createLink(uri: '/')}js/jquery.js"></script>
<script type="text/javascript">
		$(document).ready( function() {
			$("#planEstudioFiltro").val(${params?.planEstudio?.id});
			
			$("#cicloLectivoFiltro").val(${params?.cicloLectivo?.id});
			});

		
		function filtros(){
		var planId = $('#planEstudioFiltro').val();
		var cicloId = $('#cicloLectivoFiltro').val();
		if (planId!="undefined"||cicloId!="undefined")
			window.location.href=${createLink(uri: '/')} +'cursos/list?planEstudio.id='+planId+'&'+'cicloLectivo.id='+cicloId;
		else
			window.location.href=${createLink(uri: '/')} +'cursos/list';
			
		}
</script>

</head>
<body>
	<div class="navbar navbar-inverse" role="navigation">
		<ul class="nav navbar-nav">
			<li><g:link class="create" action="create">
					<g:message code="cursos.create.label" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-configuracionCursoDia" class="content scaffold-list"
		role="main">
		<h1>
			<g:message code="cursos.list.label" />
		</h1>

		<div class="row">
			<label class="col-lg-2"><g:message
					code="control-label cursos.planEstudio.label"
					default="Plan de Estudio" /></label>
			<div class="col-lg-4">
				<g:select id="planEstudioFiltro" name="planEstudioFiltro"
					from="${com.deukin.PlanEstudio.list()}" optionKey="id"
					value="${planEstudio?.id}" class="many-to-one" onchange="filtros()"
					noSelection="${['undefined':'TODOS']}" />




			</div>
			<label class="col-lg-2"><g:message
					code="control-label cursos.cicloLectivo.label"
					default="Ciclo Lectivo" /></label>
			<div class="col-lg-4">
				<g:select id="cicloLectivoFiltro" name="cicloLectivoFiltro"
					from="${com.deukin.CicloLectivo.list()}" optionKey="id" required=""
					value="${cicloLectivo?.id}" class="many-to-one"
					onchange="filtros()" noSelection="${['undefined':'TODOS']}" />
			</div>
		</div>

		<g:if test="${flash.message}">
			<div class="message alert alert-info" role="status">
				${flash.message}
			</div>
		</g:if>
		<table class="table table-striped table-bordered table-hover">
			<thead>
				<tr>

					<th>
						${message(code: 'cursos.anio.label', default: 'Año')}
					</th>

					<th>
						${message(code: 'cursos.cuatrimestre.label', default: 'Cuatrimestre')}
					</th>

					<th>
						${message(code: 'cursos.codigo.label', default: 'Código')}
					</th>

					<th>
						${message(code: 'cursos.materia.label', default: 'Materia')}
					</th>

					<th>
						${message(code: 'cursos.espacioFisico.label', default: 'Aula/Laboratorio')}
					</th>

					<th>
						${message(code: 'configuracionCursoDia.diaSemana.label', default: 'Día')}
					</th>

					<th>
						${message(code: 'configuracionCursoDia.horario.label', default: 'Horario')}
					</th>

					<th>
						${message(code: 'configuracionCursoDia.docentes.label', default: 'Docentes')}
					</th>



				</tr>
			</thead>
			<tbody>
				<g:each in="${configuracionCursoDiaInstanceList}" status="i"
					var="configuracionCursoDiaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td>
							${fieldValue(bean: configuracionCursoDiaInstance?.curso?.materia?.periodo, field: "anio")}
						</td>

						<td>
							${fieldValue(bean: configuracionCursoDiaInstance?.curso?.materia?.periodo, field: "cuatrimestre")}
						</td>

						<td><g:link action="show"
								id="${configuracionCursoDiaInstance.curso.id}">
								${fieldValue(bean: configuracionCursoDiaInstance?.curso, field: "codigo")}
							</g:link></td>

						<td>
							${fieldValue(bean: configuracionCursoDiaInstance?.curso, field: "materia")}
						</td>

						<td>
							${fieldValue(bean: configuracionCursoDiaInstance, field: "espacioFisico")}
						</td>

						<td>
							${fieldValue(bean: configuracionCursoDiaInstance, field: "diaSemana")}
						</td>

						<td>
							${configuracionCursoDiaInstance.getStartTime()}-${configuracionCursoDiaInstance.getEndTime()}
						</td>

						<td><g:each
								in="${configuracionCursoDiaInstance.asignacionesDocenteCurso}"
								status="y" var="a">
								<g:link controller="docente" action="show" id="${a.docente.id}">
									${fieldValue(bean: a, field: "docente")}
								</g:link>
								<br />
							</g:each></td>



					</tr>
				</g:each>
			</tbody>
		</table>
<g:if test="${!params.planEstudio || (params?.planEstudio?.id=='undefined'&&params?.cicloLectivo?.id=='undefined')}">
		<div class="pagination">
			<g:paginate total="${configuracionCursoDiaInstanceTotal}" />
		</div>
		</g:if>
	</div>
</body>
</html>
