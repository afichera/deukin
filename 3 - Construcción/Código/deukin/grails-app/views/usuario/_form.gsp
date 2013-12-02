<%@ page import="com.deukin.Usuario" %>



<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required">
	<label for="username" class="control-label">
		<g:message code="usuario.username.label" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${usuarioInstance?.username}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked" class="control-label">
		<g:message code="usuario.accountLocked.label"/>
		
	</label>
	<g:checkBox name="accountLocked" value="${usuarioInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} ">
	<label for="enabled" class="control-label">
		<g:message code="usuario.enabled.label"/>
		
	</label>
	<g:checkBox name="enabled" value="${usuarioInstance?.enabled}" />
</div>
