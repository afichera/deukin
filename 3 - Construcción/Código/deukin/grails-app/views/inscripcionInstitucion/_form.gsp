<%@ page import="com.deukin.InscripcionInstitucion"%>



<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'documentoNumero', 'error')} required">
	<label for="documentoNumero" class="control-label"> <g:message
			code="inscripcionInstitucion.documentoNumero.label"
			default="Documento Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="documentoNumero" type="number"
		value="${inscripcionInstitucionInstance.documentoNumero}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'fechaBaja', 'error')} ">
	<label for="fechaBaja" class="control-label"> <g:message
			code="inscripcionInstitucion.fechaBaja.label" default="Fecha Baja" />

	</label>
	<g:datePicker name="fechaBaja" precision="day"
		value="${inscripcionInstitucionInstance?.fechaBaja}" default="none"
		noSelection="['': '']" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'nombre', 'error')} required">
	<label for="nombre" class="control-label"> <g:message
			code="inscripcionInstitucion.nombre.label" default="Nombre" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required=""
		value="${inscripcionInstitucionInstance?.nombre}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'apellido', 'error')} required">
	<label for="apellido" class="control-label"> <g:message
			code="inscripcionInstitucion.apellido.label" default="Apellido" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="apellido" required=""
		value="${inscripcionInstitucionInstance?.apellido}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'calle', 'error')} required">
	<label for="calle" class="control-label"> <g:message
			code="inscripcionInstitucion.calle.label" default="Calle" /> <span
		class="required-indicator">*</span>
	</label>
	<g:textField name="calle" required=""
		value="${inscripcionInstitucionInstance?.calle}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'localidad', 'error')} required">
	<label for="localidad" class="control-label"> <g:message
			code="inscripcionInstitucion.localidad.label" default="Localidad" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="localidad" required=""
		value="${inscripcionInstitucionInstance?.localidad}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'observaciones', 'error')} ">
	<label for="observaciones" class="control-label"> <g:message
			code="inscripcionInstitucion.observaciones.label"
			default="Observaciones" />

	</label>
	<g:textField name="observaciones"
		value="${inscripcionInstitucionInstance?.observaciones}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'telefonoNumero', 'error')} required">
	<label for="telefonoNumero" class="control-label"> <g:message
			code="inscripcionInstitucion.telefonoNumero.label"
			default="Telefono Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:textField name="telefonoNumero" required=""
		value="${inscripcionInstitucionInstance?.telefonoNumero}" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'calleNumero', 'error')} required">
	<label for="calleNumero" class="control-label"> <g:message
			code="inscripcionInstitucion.calleNumero.label"
			default="Calle Numero" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="calleNumero" type="number"
		value="${inscripcionInstitucionInstance.calleNumero}" required="" />
</div>

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'codigoPostal', 'error')} required">
	<label for="codigoPostal" class="control-label"> <g:message
			code="inscripcionInstitucion.codigoPostal.label"
			default="Codigo Postal" /> <span class="required-indicator">*</span>
	</label>
	<g:field name="codigoPostal" type="number"
		value="${inscripcionInstitucionInstance.codigoPostal}" required="" />
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

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'fechaInscripcion', 'error')} required">
	<label for="fechaInscripcion" class="control-label"> <g:message
			code="inscripcionInstitucion.fechaInscripcion.label"
			default="Fecha Inscripcion" /> <span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fechaInscripcion" precision="day"
		value="${inscripcionInstitucionInstance?.fechaInscripcion}" />
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

<div
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'sexo', 'error')} ">
	<label for="sexo" class="control-label"> <g:message
			code="inscripcionInstitucion.sexo.label" default="Sexo" />

	</label>
	<g:textField name="sexo"
		value="${inscripcionInstitucionInstance?.sexo}" />
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
	class="fieldcontain ${hasErrors(bean: inscripcionInstitucionInstance, field: 'usuarioRegistro', 'error')} required">
	<label for="usuarioRegistro" class="control-label"> <g:message
			code="inscripcionInstitucion.usuarioRegistro.label"
			default="Usuario Registro" /> <span class="required-indicator">*</span>
	</label>
	<g:select id="usuarioRegistro" name="usuarioRegistro.id"
		from="${com.deukin.UsuarioRegistro.list()}" optionKey="id" required=""
		value="${inscripcionInstitucionInstance?.usuarioRegistro?.id}"
		class="many-to-one" />
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


