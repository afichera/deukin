<html>

<head>
<meta name='layout' content='main' />
<title><g:message code="springSecurity.login.title" /></title>
</head>
<body>

	<p />

	<div class="login s2ui_center ui-corner-all"
		style='text-align: center;'>
		<div class="login-inner">
			<form action='${postUrl}' method='POST' id="loginForm"
				class="form-signin" name="loginForm" autocomplete='off'>
				<h2 class="form-signin-heading">
					<g:message code="springSecurity.login.header" />
				</h2>
				<g:if test='${flash.message}'>
					<div class="alert alert-danger">
						${flash.message}
					</div>
				</g:if>

				<p>
					<input type="email" class="form-control"
						placeholder="<g:message code="springSecurity.login.username.label"/>"
						autofocus name='j_username' id='username' size="50">
				</p>

				<p>
					<input type="password" class="form-control" name='j_password'
						id='password' size="20"
						placeholder="<g:message code="springSecurity.login.password.label"/>">
				</p>

				<p>
					<g:checkBox name="${rememberMeParameter}" id="remember_me" checked="checked" />
					<label for='remember_me'><g:message
							code='springSecurity.login.remember.me.label' /></label> |  
					<span
						class="forgot-link"> <g:link controller='login'
							action='recuperarPassword'>
							<g:message code='spring.security.ui.login.forgotPassword' />
						</g:link>
					</span>

				</p>

				<input type='submit' class="btn btn-large btn-primary btn-block"
					type='submit' id="submit"
					value='${message(code: "springSecurity.login.button")}' />
				<s2ui:linkButton elementId='register' controller='inscripcionInstitucion'
					class="btn btn-large btn-primary btn-block"
					messageCode='registro.boton.label' />
			</form>
		</div>
	</div>

	<script>
		$(document).ready(function() {
			$('#username').focus();
		});

		<s2ui:initCheckboxes/>
	</script>

</body>
</html>
