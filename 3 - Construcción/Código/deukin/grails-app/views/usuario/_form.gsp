<%@ page import="com.deukin.Usuario"%>



<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'username', 'error')} required row">
	<label for="username" class="control-label col-lg-2"> <g:message
			code="usuario.username.label" />*:
	</label>
	<div class="col-lg-10">
		<g:textField name="username" class="form-control" required=""
			value="${usuarioInstance?.username}" />
	</div>
</div>


<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'accountLocked', 'error')} row">
	<div class="col-lg-12">
		<label for="accountLocked" class="control-label"> <g:message
				code="usuario.accountLocked.label" />:

		</label> &nbsp;
		<g:checkBox name="accountLocked" 
			value="${usuarioInstance?.accountLocked}" />
	</div>
</div>

<div
	class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'enabled', 'error')} row">
	<div class="col-lg-12">
		<label for="enabled" class="control-label "> <g:message
				code="usuario.enabled.label" />:

		</label> &nbsp;
		<g:checkBox name="enabled"
			value="${usuarioInstance?.enabled}" />
	</div>
</div>
