<%@ page import="com.deukin.InscripcionInstitucion"%>

<div>
	<label class="control-label"> <g:message
			code="inscripcionInstitucion.datosPersonales.label" />
	</label>

</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance?.usuarioRegistro, field: 'username', 'error')} required">
	<label for="usuarioRegistro" class="control-label"> <g:message
			code="inscripcionInstitucion.usuarioRegistro.label"
			default="Usuario Registro" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="true" maxlength="50"
		value="${inscripcionInstitucionInstance?.usuarioRegistro?.username}" />

</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'apellido', 'error')} required">
	<label for="apellido" class="control-label"> <g:message
			code="inscripcionInstitucion.apellido.label" default="Apellido" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required="true" maxlength="50"
		value="${inscripcionInstitucionInstance?.apellido}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'nombre', 'error')} required">
	<label for="nombre" class="control-label"> <g:message
			code="inscripcionInstitucion.nombre.label" default="Nombre" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="true" maxlength="100"
		value="${inscripcionInstitucionInstance?.nombre}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'sexo', 'error')} ">
	<label for="sexo" class="control-label"> <g:message
			code="inscripcionInstitucion.sexo.label" default="Sexo" />

	</label>
	<g:select name="sexo" from="['M', 'F']"
		value="${inscripcionInstitucionInstance.sexo}"
		valueMessagePrefix="sexos" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoDocumento', 'error')} required">
	<label for="tipoDocumento" class="control-label"> <g:message
			code="inscripcionInstitucion.tipoDocumento.label"
			default="Tipo Documento" /> <span class="required-indicator">*</span>
	</label>
	<g:select name="tipoDocumento"
		from="${com.deukin.TipoDocumento?.values()}"
		keys="${com.deukin.TipoDocumento.values()*.name()}" required=""
		value="${inscripcionInstitucionInstance?.tipoDocumento?.name()}" />
</div>


<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'documentoNumero', 'error')} required">
	<label for="documentoNumero" class="control-label"> <g:message
			code="inscripcionInstitucion.documentoNumero.label"
			default="Documento Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="documentoNumero" type="number"
		value="${inscripcionInstitucionInstance.documentoNumero}"
		required="true" onkeyup="soloNumeros(this,'#validaDocumento')"/>
	<span class="alert alert-error" id="validaDocumento" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	

</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'fechaNacimiento', 'error')} required">
	<label for="fechaNacimiento" class="control-label"> <g:message
			code="inscripcionInstitucion.fechaNacimiento.label"
			default="Fecha Nacimiento" /> <span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaNacimiento" precision="day"
		value="${inscripcionInstitucionInstance?.fechaNacimiento}" />
</div>
<br />
<div>
	<label class="control-label"> <g:message
			code="inscripcionInstitucion.titulos.datosContacto" />
	</label>

</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'calle', 'error')} required">
	<label for="calle" class="control-label"> <g:message
			code="inscripcionInstitucion.calle.label" default="Calle" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="calle" required="true" maxlength="100"
		value="${inscripcionInstitucionInstance?.calle}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'calleNumero', 'error')} required">
	<label for="calleNumero" class="control-label"> <g:message
			code="inscripcionInstitucion.calleNumero.label"
			default="Calle Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="calleNumero" type="number"
		value="${inscripcionInstitucionInstance.calleNumero}" required="true"  onkeyup="soloNumeros(this,'#validaNumeroCalle')"/>
	<span class="alert alert-error" id="validaNumeroCalle" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
	
</div>


<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'localidad', 'error')} required">
	<label for="localidad" class="control-label"> <g:message
			code="inscripcionInstitucion.localidad.label" default="Localidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="localidad" required="true" maxlength="100"
		value="${inscripcionInstitucionInstance?.localidad}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal" class="control-label"> <g:message
			code="inscripcionInstitucion.codigoPostal.label"
			default="Codigo Postal" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="codigoPostal" type="number"
		value="${inscripcionInstitucionInstance.codigoPostal}" required="true"  onkeyup="soloNumeros(this,'#validaCodigo')"/>
	<span class="alert alert-error" id="validaCodigo" style="display:none;">		<g:message code="invalid.soloNumeros" /></span>
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones" class="control-label"> <g:message
			code="inscripcionInstitucion.observaciones.label"
			default="Observaciones" />

	</label>
	<g:textField name="observaciones" maxlength="250"
		value="${inscripcionInstitucionInstance?.observaciones}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoTelefono', 'error')} required">
	<label for="tipoTelefono" class="control-label"> <g:message
			code="inscripcionInstitucion.tipoTelefono.label"
			default="Tipo Telefono" /> <span class="required-indicator">*</span>
	</label>
	<g:select name="tipoTelefono"
		from="${com.deukin.TipoTelefono?.values()}"
		keys="${com.deukin.TipoTelefono.values()*.name()}" required=""
		value="${inscripcionInstitucionInstance?.tipoTelefono?.name()}" />
</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'telefonoNumero', 'error')} required">
	<label for="telefonoNumero" class="control-label"> <g:message
			code="inscripcionInstitucion.telefonoNumero.label"
			default="Telefono Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="telefonoNumero" required="true" maxlength="20"
		value="${inscripcionInstitucionInstance?.telefonoNumero}" />
</div>

<div>
	<label class="control-label"> <g:message
			code="inscripcionInstitucion.datosInscripcion.label"
			class="control-label" />
	</label>

</div>
<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'fechaInscripcion', 'error')} required">
	<label for="fechaInscripcion" class="control-label"> <g:message
			code="inscripcionInstitucion.fechaInscripcionLarga.label"
			default="Fecha Inscripcion" /> <span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInscripcion" precision="day"
		value="${inscripcionInstitucionInstance?.fechaInscripcion}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'estadoInscripcionInstitucion', 'error')} required">
	<label for="estadoInscripcionInstitucion" class="control-label">
		<g:message
			code="inscripcionInstitucion.estadoInscripcionInstitucion.label"
			default="Estado Inscripcion Institucion" /> <span
		class="required-indicator">*</span>
	</label>
	<g:select name="estadoInscripcionInstitucion"
		from="${com.deukin.EstadoInscripcionInstitucion?.values()}"
		keys="${com.deukin.EstadoInscripcionInstitucion.values()*.name()}"
		required=""
		value="${inscripcionInstitucionInstance?.estadoInscripcionInstitucion?.name()}" />
</div>







<sec:ifAnyGranted roles="ROLE_ADMINISTRADOR_SISTEMA">
	<div
		class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'tipoInscripcionInstitucion', 'error')} required">
		<label for="tipoInscripcionInstitucion" class="control-label">
			<g:message
				code="inscripcionInstitucion.tipoInscripcionInstitucion.label"
				default="Tipo de Inscripcion" /> <span class="required-indicator">*</span>
		</label>
		<g:select name="tipoInscripcionInstitucion"
			from="${com.deukin.TipoInscripcionInstitucion?.values()}"
			keys="${com.deukin.TipoInscripcionInstitucion.values()*.name()}"
			required="true"
			value="${inscripcionInstitucionInstance?.tipoInscripcionInstitucion?.name()}" />

	</div>
</sec:ifAnyGranted>


