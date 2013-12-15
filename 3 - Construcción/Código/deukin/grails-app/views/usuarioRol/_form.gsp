<%@ page import="com.deukin.UsuarioRol" %>



<div class="fieldcontain ${hasErrors(bean: usuarioRolInstance, field: 'rol', 'error')} required row">
	<label for="rol" class="control-label col-lg-2">
		<g:message code="usuarioRol.rol.label" default="Rol" />: 
		
	</label>
	<div class="col-lg-10">
	<g:select id="rol" name="rol.id" from="${com.deukin.Rol.list()}" optionKey="id" required="" value="${usuarioRolInstance?.rol?.id}" class="many-to-one form-control"/>
</div>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioRolInstance?.usuario, field: 'username', 'error')} required row">
	<label for="usuario" class="control-label col-lg-2" >
		<g:message code="usuarioRol.usuario.label" default="Usuario" />: 
		
	</label>
	<div class="col-lg-10">
	<g:hiddenField id ="usuario.id" name ="usuario.id" value="${usuarioRolInstance?.usuario?.id}"/>
	${usuarioRolInstance?.usuario?.encodeAsHTML()}
</div>
</div>

