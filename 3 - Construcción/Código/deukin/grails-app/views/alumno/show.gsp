

<%@ page import="com.deukin.Alumno"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
 "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'alumno.label', default: 'Alumno')}" />
<title><g:message code="alumno.title" /></title>
</head>
<body>
<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_COORDINADOR,ROLE_ADMINISTRATIVO">
<div class="navbar navbar-inverse" role="navigation">
<ul class="nav navbar-nav">
<li><g:link class="list" action="list">
	<g:message code="alumno.list.label" />
</g:link></li>

</ul>
</div>
</sec:ifAnyGranted>
<div id="show-alumno" class="content scaffold-show" role="main">
<h1>
<g:message code="alumno.show.label" args="${[alumnoInstance?.encodeAsHTML()]}" />
</h1>
<g:if test="${flash.message}">
	<div class="message alert alert-info" role="status">
	${flash.message}
	</div>
</g:if>
<div class="row">
<div class="col-lg-12 col-md-12 col-sx-12 lista-propiedades">
			
<div class="well">
<div class="row">
						<div class="col-lg-2 foto">

<g:if test="${alumnoInstance?.fotoPerfil}">
	<div class="fieldcontain"> <rendering:inlinePng
		bytes="${alumnoInstance.fotoPerfil}" width="160" />
	</div>
</g:if>

<g:if test="${alumnoInstance?.fotoPerfil == null}">
	<div class="fieldcontain"> <img
		height="165" src="${resource(dir: 'images', file: 'buddyicon.jpg')}"
		alt="foto de perfil" />
	</div>
</g:if>
</div>
<div class="col-lg-10">

	<div class="fieldcontain row"> <label id="usuario-label"
		class="property-label col-lg-2"><g:message code="alumno.mail.label"
		default="Mail" />: </label> 
		
		<g:if test="${alumnoInstance?.usuario}">
		<div class="property-value col-lg-10""
		aria-labelledby="usuario-label"><a
											href="mailto:${fieldValue(bean: alumnoInstance, field: "usuario.username")}"><g:fieldValue
												bean="${alumnoInstance}" field="usuario.username" ></g:fieldValue>
		
	</a></div>
</g:if>
	</div>




	





	<div class="fieldcontain row"> <label id="documento-label"
		class="property-label col-lg-2"><g:message code="alumno.documento.label"
		default="Documento" />: </label> 
		<g:if test="${alumnoInstance?.documento}">
		<div class="property-value col-lg-10""
		aria-labelledby="documento-label">
		${alumnoInstance?.documento?.tipoDocumento} - ${alumnoInstance?.documento?.numeroAsText()}
	</div>
</g:if>

	</div>



	<div class="fieldcontain row">
								<label id="domicilio-label" class="property-label col-lg-2"><g:message
										code="alumno.documentodomicilio.label" default="Domicilio" />:
								</label>
								<div class="property-value col-lg-10"
									aria-labelledby="domicilio-label">
									<g:if test="${alumnoInstance?.contacto}">
										${alumnoInstance?.contacto?.domicilio.encodeAsHTML()}
									</g:if>
								</div>


							</div>

							<div class="fieldcontain row">
								<label id="telefonos-label" class="property-label col-lg-2"><g:message
										code="alumno.telefonos.label" default="Teléfonos" />: 
										<g:link controller="telefono"
								action="create" params="['contacto.id': alumnoInstance?.contacto?.id,'origen':'alumno','alumno.id':alumnoInstance?.id]">
								<span class="glyphicon glyphicon-plus"
									title="${message(code: 'default.add.label', args: [message(code: 'telefono.label', default: 'Teléfono')])}"></span>
							</g:link>
										
										</label>
										<div class="property-value col-lg-10"
									aria-labelledby="telefono-label">
								<g:if test="${alumnoInstance?.contacto}">
									<g:each in="${alumnoInstance?.contacto?.telefonos}" var="t">
										 ${t?.encodeAsHTML()}<br />
										
									</g:each>
								</g:if>
								</div>
							</div>




</div>
</div>

<g:form>
	<fieldset class="buttons">
	<g:hiddenField name="id" value="${alumnoInstance?.id}" />
	<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA,ROLE_ALUMNO,ROLE_ADMINISTRATIVO">
	<g:link class="btn btn-info" action="edit" id="${alumnoInstance?.id}">
		<g:message code="default.button.edit.label" default="Edit" />
	</g:link>
	</sec:ifAnyGranted>
	<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
	<g:actionSubmit class="btn btn-danger" action="delete"
		value="${message(code: 'default.button.delete.label', default: 'Delete')}"
		onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />	
	</sec:ifAnyGranted>
	</fieldset>
</g:form>
</div>

</div>
</div>
</div>
</body>
</html>
