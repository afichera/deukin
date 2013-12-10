<%@ page import="com.deukin.UsuarioRol" %>



<div class="fieldcontain ${hasErrors(bean: usuarioRolInstance, field: 'rol', 'error')} required">
	<label for="rol" class="control-label col-lg-2">
		<g:message code="usuarioRol.rol.label" default="Rol" />
		
	</label>
	<g:select id="rol" name="rol.id" from="${com.deukin.Rol.list()}" optionKey="id" required="" value="${usuarioRolInstance?.rol?.id}" class="many-to-one form-control"/>
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioRolInstance?.usuario, field: 'username', 'error')} required">
	<label for="usuario" class="control-label col-lg-2" >
		<g:message code="usuarioRol.usuario.label" default="Usuario" />
		
	</label>
	
	<g:hiddenField id ="usuario.id" name ="usuario.id" value="${usuarioRolInstance?.usuario?.id}"/>
	<richui:autoComplete name="usuarioUsername" minQueryLength="2" onItemSelect="eligeUsuario(id)" value="${usuarioRolInstance?.usuario?.toString()}"
		action="${createLinkTo('dir': 'usuarioRol/searchUsuarios')}" forceSelection="true"/>

</div>

