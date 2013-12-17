<%@ page import="com.deukin.InscripcionInstitucion"%>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'fechaInscripcion', 'error')} required row">

<div class="col-lg-12">
	<h3> <g:message
			code="inscripcionInstitucion.datosInscripcion.label"
			class="control-label" />
	: </h3></div>
	<label for="fechaInscripcion" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.fechaInscripcionLarga.label"
			default="Fecha Inscripcion" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:formatDate format="dd-MM-yyyy" date="${inscripcionInstitucionInstance?.fechaInscripcion}"/></div>
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'estadoInscripcionInstitucion', 'error')} required row">
	<label for="estadoInscripcionInstitucion" class="control-label col-lg-2">
		<g:message
			code="inscripcionInstitucion.estadoInscripcionInstitucion.label"
			default="Estado Inscripcion Institucion" /> <span
		class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:select  class="form-control" name="estadoInscripcionInstitucion"
		from="${com.deukin.EstadoInscripcionInstitucion?.values()}"
		keys="${com.deukin.EstadoInscripcionInstitucion.values()*.name()}"
		required=""
		value="${inscripcionInstitucionInstance?.estadoInscripcionInstitucion?.name()}" />
</div>



</div>




	<div
		class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoInscripcionInstitucion', 'error')} required row">
		<label for="tipoInscripcionInstitucion" class="control-label col-lg-2">
			<g:message
				code="inscripcionInstitucion.tipoInscripcionInstitucion.label"
				default="Tipo de Inscripcion" /> <span class="required-indicator">*</span>
		: </label><div class="col-lg-10">
		<g:select  class="form-control" name="tipoInscripcionInstitucion"
			from="${com.deukin.TipoInscripcionInstitucion?.values()}"
			keys="${com.deukin.TipoInscripcionInstitucion.values()*.name()}"
			required="true"
			value="${inscripcionInstitucionInstance?.tipoInscripcionInstitucion?.name()}" />

	</div></div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance?.usuarioRegistro, field: 'username', 'error')} required row">
<div class="col-lg-12">
	<h3> <g:message
			code="inscripcionInstitucion.datosPersonales.label" />
	: </h3></div>


	<label for="usuarioRegistro" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.usuarioRegistro.label"
			default="Usuario" /> 
	: </label><div class="col-lg-10">
	<a href="mailto:${inscripcionInstitucionInstance?.usuarioRegistro?.username}" target="_blank">${inscripcionInstitucionInstance?.usuarioRegistro?.username}</a>

</div></div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'apellido', 'error')} required row">
	<label for="apellido" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.apellido.label" default="Apellido" /> <span
		class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="apellido" required="true" maxlength="50"
		value="${inscripcionInstitucionInstance?.apellido}" />
</div></div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'nombre', 'error')} required row">
	<label for="nombre" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.nombre.label" default="Nombre" /> <span
		class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="nombre" required="true" maxlength="100"
		value="${inscripcionInstitucionInstance?.nombre}" />
</div></div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'sexo', 'error')}selectChico requireds row">
	<label for="sexo" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.sexo.label" default="Sexo" />

	: </label><div class="col-lg-10">
	<g:select  class="form-control" name="sexo" from="['M', 'F']"
		value="${inscripcionInstitucionInstance.sexo}"
		valueMessagePrefix="sexos" />
</div>
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoDocumento', 'error')} required row selectChico">
	<label for="tipoDocumento" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.tipoDocumento.label"
			default="Tipo de Documento" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-2">
	<g:select  class="form-control" name="tipoDocumento"
		from="${com.deukin.TipoDocumento?.values()}"
		keys="${com.deukin.TipoDocumento.values()*.name()}" required=""
		value="${inscripcionInstitucionInstance?.tipoDocumento?.name()}" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'documentoNumero', 'error')} required">
	<label for="documentoNumero" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.documentoNumero.label"
			default="Número" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-6">
	<g:textField class="form-control" name="documentoNumero" type="number"
		value="${inscripcionInstitucionInstance.documentoNumero}"
		required="true" onkeyup="soloNumeros(this,'#validaDocumento')"/>
	<span class="alert alert-error" id="validaDocumento" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	</div>
</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'fechaNacimiento', 'error')} required row">
	<label for="fechaNacimiento" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.fechaNacimiento.label"
			default="Fecha Nacimiento" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-10 selectChico">
	<g:datePicker name="fechaNacimiento" precision="day"
		value="${inscripcionInstitucionInstance?.fechaNacimiento}" />
</div></div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'calle', 'error')} required row">
<div class="col-lg-12">
	<h3> <g:message
			code="inscripcionInstitucion.titulos.datosContacto" />
	: </h3>
</div>

	<label for="calle" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.calle.label" default="Calle" /> <span
		class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="calle" required="true" maxlength="100"
		value="${inscripcionInstitucionInstance?.calle}" />
</div>
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'calleNumero', 'error')} required row">
	<label for="calleNumero" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.calleNumero.label"
			default="Número" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="calleNumero" type="number"
		value="${inscripcionInstitucionInstance.calleNumero}" required="true"  onkeyup="soloNumeros(this,'#validaNumeroCalle')"/>
	<span class="alert alert-error" id="validaNumeroCalle" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	
</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'localidad', 'error')} required row">
	<label for="localidad" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.localidad.label" default="Localidad" />
		<span class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="localidad" required="true" maxlength="100"
		value="${inscripcionInstitucionInstance?.localidad}" />
</div>
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'codigoPostal', 'error')} required row">
	<label for="codigoPostal" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.codigoPostal.label"
			default="Código Postal" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="codigoPostal" type="number"
		value="${inscripcionInstitucionInstance.codigoPostal}" required="true"  onkeyup="soloNumeros(this,'#validaCodigo')"/>
	<span class="alert alert-error" id="validaCodigo" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
</div>
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'observaciones', 'error')}  row">
	<label for="observaciones" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.observaciones.label"
			default="Observaciones" />

	: </label><div class="col-lg-10">
	<g:textField class="form-control" name="observaciones" maxlength="250"
		value="${inscripcionInstitucionInstance?.observaciones}" />
</div></div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoTelefono', 'error')} required row">
	<label for="tipoTelefono" class="control-label col-lg-2"> <g:message
			code="inscripcionInstitucion.tipoTelefono.label"
			default="Tipo de Teléfono" /> <span class="required-indicator">*</span>
	: </label><div class="col-lg-2 selectChico">
	<g:select  class="form-control" name="tipoTelefono"
		from="${com.deukin.TipoTelefono?.values()}"
		keys="${com.deukin.TipoTelefono.values()*.name()}" required=""
		value="${inscripcionInstitucionInstance?.tipoTelefono?.name()}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'telefonoNumero', 'error')} required ">
																				<label for="telefonoNumero"
																					class="control-label col-lg-2"> <g:message
																						code="inscripcionInstitucion.telefonoNumero.label"
																						default="Número" /> <span
																					class="required-indicator">*</span> :
																				</label>
																				<div class="col-lg-6">
																					<g:textField class="form-control" name="telefonoNumero" required="true"
																						maxlength="20"
																						value="${inscripcionInstitucionInstance?.telefonoNumero}" />
																				</div></div></div>