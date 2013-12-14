<html>

<head>
<title><g:message code='spring.security.ui.forgotPassword.title' /></title>
<meta name='layout' content='main' />
</head>

<body>

	<p />
	<div class="login s2ui_center ui-corner-all"
		style='text-align: center;'>
		<s2ui:form width='350' height='220'
			elementId='forgotPasswordFormContainer'
			titleCode='spring.security.ui.forgotPassword.header' center='true'>

			<g:form action='forgotPassword' name="forgotPasswordForm"
				autocomplete='off' class="form-signin">

				<g:if test='${emailSent}'>
					<br />
					<g:message code='spring.security.ui.forgotPassword.sent' />
				</g:if>

				<g:else>

					<br />
					<h4>
						<g:message code='spring.security.ui.forgotPassword.description' />
					</h4>

					<table>
						<tr>
							<td><label for="username"><g:message
										code='spring.security.ui.forgotPassword.username'
										default="Usuario" /></label></td>
							<td><g:textField name="username" size="50" /></td>
						</tr>
					</table></div>
					Resetear Password
					<s2ui:submitButton elementId='reset' controller='login'
						form="forgotPasswordForm"
						messageCode='spring.security.ui.forgotPassword.submit' />


				</g:else>

			</g:form>
		</s2ui:form>

	</div>

	<script>
		$(document).ready(function() {
			$('#username').focus();
		});
	</script>

</body>
</html>
