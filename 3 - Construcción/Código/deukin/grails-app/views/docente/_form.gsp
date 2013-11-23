<%@ page import="com.deukin.Docente" %>



<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'usuario', 'error')} ">
	<label for="usuario" class="control-label"> <g:message
			code="docente.usuario.label" default="Usuario" /><span
		class="required-indicator">*</span>
	</label>
	<g:textField name="usuarioUsername"
		value="${docenteInstance?.usuario?.username}" disabled="true" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'apellido', 'error')} ">
	<label for="apellido" class="control-label"> <g:message
			code="docente.apellido.label" default="Apellido" /><span
		class="required-indicator">*</span>

	</label>
	<g:textField name="apellido" value="${docenteInstance?.apellido}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'nombre', 'error')} ">
	<label for="nombre" class="control-label"> <g:message
			code="docente.nombre.label" default="Nombre" /><span
		class="required-indicator">*</span>

	</label>
	<g:textField name="nombre" value="${docenteInstance?.nombre}" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'documento.tipoDocumento', 'error')} required">
	<label for="documento.tipoDocumento" class="control-label"> <g:message
			code="documento.tipoDocumento.label" default="Tipo Documento" /> <span
		class="required-indicator">*</span>
	</label>
	<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
		<g:select name="documento.tipoDocumento"
			from="${com.deukin.TipoDocumento?.values()}"
			keys="${com.deukin.TipoDocumento.values()*.name()}" required="true"
			value="${docenteInstance?.documento?.tipoDocumento?.name()}" />
	</sec:ifAnyGranted>
	<sec:ifAnyGranted roles="ROLE_DOCENTE, ROLE_COORDINADOR, ROLE_ADMINISTRATIVO">
		<g:select name="documento.tipoDocumento" disabled="true"
			from="${com.deukin.TipoDocumento?.values()}"
			keys="${com.deukin.TipoDocumento.values()*.name()}" required="true"
			value="${docenteInstance?.documento?.tipoDocumento?.name()}" />
	</sec:ifAnyGranted>

</div>


<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'documento.numero', 'error')} required">
	<label for="documento.numero" class="control-label"> <g:message
			code="documento.numero.label" default="Numero" /> <span
		class="required-indicator">*</span>
	</label>
	<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
	<g:field name="documento.numero" type="number"
		value="${docenteInstance?.documento?.numero}" required="true" />
	
	</sec:ifAnyGranted>
	<sec:ifAnyGranted roles="ROLE_DOCENTE, ROLE_COORDINADOR, ROLE_ADMINISTRATIVO">
	<g:field name="documento.numero" type="number" disabled="true"
		value="${docenteInstance?.documento?.numero}" required="true" />
	
	</sec:ifAnyGranted>

</div>

<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'departamento', 'error')} required">
	<label for="departamento" class="control-label">
		<g:message code="docente.departamento.label" default="Departamento" /><span
		class="required-indicator">*</span>
	</label>
	
	<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
		<g:select id="departamento" name="departamento.id" from="${com.deukin.Departamento.list()}" optionKey="id" value="${docenteInstance?.departamento?.id}"  noSelection="['null': '']"/>	
	</sec:ifAnyGranted>
		<sec:ifAnyGranted roles="ROLE_DOCENTE, ROLE_COORDINADOR, ROLE_ADMINISTRATIVO">
	<g:field name="departamento" type="text" disabled="true"
		value="${docenteInstance?.departamento}" required="true" />
	
	</sec:ifAnyGranted>
	
</div>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'fotoPerfil', 'error')} ">
	<label for="fotoPerfil" class="control-label"> <g:message
			code="docente.fotoPerfil.label" default="Foto Perfil" />
	</label>
	<g:if test="${docenteInstance?.fotoPerfil}">
		<li class="fieldcontain"><rendering:inlinePng
				bytes="${docenteInstance.fotoPerfil}" height="200" /></li>
		<g:link controller="alumno" action="eliminarFotoPerfil"
			id="${docenteInstance?.id}">Quitar
		</g:link>
	</g:if>



	<g:if test="${docenteInstance?.fotoPerfil == null}">
		<li class="fieldcontain"><span id="fotoPerfil-label"
			class="property-label"></span> <img height="200"
			src="${resource(dir: 'images', file: 'buddyicon.jpg')}" alt="Grails" /></li>
	</g:if>
	<input type="file" id="fotoPerfil" name="fotoPerfil" />
</div>

<%--<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'nombramiento', 'error')} ">--%>
<%--	<label for="nombramiento" class="control-label col-lg-2">--%>
<%--		<g:message code="docente.nombramiento.label" default="Nombramiento" />--%>
<%--		--%>
<%--	: </label>--%>
<%--	<div class="col-lg-10">--%>
<%--	--%>
<%--<ul class="one-to-many">--%>
<%--<g:each in="${docenteInstance?.nombramiento?}" var="n">--%>
<%--    <li><g:link controller="nombramiento" action="show" id="${n.id}">${n?.encodeAsHTML()}</g:link></li>--%>
<%--</g:each>--%>
<%--<li class="add">--%>
<%--<g:link controller="nombramiento" action="create" params="['docente.id': docenteInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'nombramiento.label', default: 'Nombramiento')])}</g:link>--%>
<%--</li>--%>
<%--</ul>--%>
<%----%>
<%--	</div>--%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'curriculumDocente', 'error')} ">--%>
<%--	<label for="curriculumDocente" class="control-label col-lg-2">--%>
<%--		<g:message code="docente.curriculumDocente.label" default="Curriculum Docente" />--%>
<%--		--%>
<%--	: </label>--%>
<%--	<div class="col-lg-10">--%>
<%--	<g:select id="curriculumDocente" name="curriculumDocente.id" from="${com.deukin.Curriculum.list()}" optionKey="id" value="${docenteInstance?.curriculumDocente?.id}" class="many-to-one" noSelection="['null': '']"/>--%>
<%--	</div>--%>
<%--</div>--%>



<%--<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'contacto', 'error')} required">--%>
<%--	<label for="contacto" class="control-label col-lg-2">--%>
<%--		<g:message code="docente.contacto.label" default="Contacto" />--%>
<%--		<span class="required-indicator">*</span>--%>
<%--	: </label>--%>
<%--	<div class="col-lg-10">--%>
<%--	<g:select id="contacto" name="contacto.id" from="${com.deukin.Contacto.list()}" optionKey="id" required="" value="${docenteInstance?.contacto?.id}" class="many-to-one"/>--%>
<%--	</div>--%>
<%--</div>--%>

<%--<div class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'curriculums', 'error')} ">--%>
<%--	<label for="curriculums" class="control-label col-lg-2">--%>
<%--		<g:message code="docente.curriculums.label" default="Curriculums" />--%>
<%--		--%>
<%--	: </label>--%>
<%--	<div class="col-lg-10">--%>
<%--	<g:select name="curriculums" from="${com.deukin.Curriculum.list()}" multiple="multiple" optionKey="id" size="5" value="${docenteInstance?.curriculums*.id}" class="many-to-many"/>--%>
<%--	</div>--%>
<%--</div>--%>

<div
	class="fieldcontain ${hasErrors(bean: docenteInstance, field: 'curriculumsAdjuntos', 'error')} ">
	<label for="curriculumsAdjuntos" class="control-label"> <g:message
			code="docente.curriculumsAdjuntos.label"
			default="Curriculums Adjuntos" />

	</label>

	<ul class="one-to-many">
		<g:each in="${docenteInstance?.curriculumsAdjuntos?}" var="c">
			<li><g:link controller="curriculumAdjunto" action="show"
					id="${c.id}">
					${c?.nombreArchivo}
				</g:link></li>
		</g:each>
		<li class="add"><g:link controller="curriculumAdjunto"
				action="create" params="['persona.id': docenteInstance?.id]">
				${message(code: 'default.add.label', args: [message(code: 'curriculumAdjunto.label', default: 'CurriculumAdjunto')])}
			</g:link></li>
	</ul>

</div>

