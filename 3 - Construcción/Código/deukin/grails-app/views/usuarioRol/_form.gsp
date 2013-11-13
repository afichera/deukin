<%@ page import="com.deukin.UsuarioRol" %>



<div class="fieldcontain ${hasErrors(bean: usuarioRolInstance, field: 'rol', 'error')} required">
	<label for="rol" class="control-label">
		<g:message code="usuarioRol.rol.label" default="Rol" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="rol" name="rol.id" from="${com.deukin.Rol.list()}" optionKey="id" required="" value="${usuarioRolInstance?.rol?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioRolInstance, field: 'usuario', 'error')} required">
	<label for="usuario" class="control-label">
		<g:message code="usuarioRol.usuario.label" default="Usuario" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="usuario" name="usuario.id" from="${com.deukin.Usuario.list()}" optionKey="id" required="" value="${usuarioRolInstance?.usuario?.id}" class="many-to-one"/>
</div>

