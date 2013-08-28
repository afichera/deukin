<html>
<head>
	<meta name='layout' content='main'/>
	<title><g:message code="springSecurity.login.title"/></title>
	
</head>

<body>
<form action='${postUrl}' method='POST' id='loginForm' class="form-signin" autocomplete='off'>
        <h2 class="form-signin-heading"><g:message code="springSecurity.login.header"/></h2>
        <g:if test='${flash.message}'>
			<div class="alert alert-danger" >${flash.message}</div>
		</g:if>
        
		<input type="text" class="form-control" placeholder="<g:message code="springSecurity.login.username.label"/>" autofocus name='j_username' id='username'>
        <input type="password" class="form-control" name='j_password' id='password' placeholder="<g:message code="springSecurity.login.password.label"/>">
        <label class="checkbox">
          <input type="checkbox" name='${rememberMeParameter}' id='remember_me' <g:if test='${hasCookie}'>checked='checked'</g:if>> <g:message code="springSecurity.login.remember.me.label"/></label>
        </label>
        <input type='submit' class="btn btn-large btn-primary btn-block" type='submit' id="submit" value='${message(code: "springSecurity.login.button")}'/>
      </form>
      
 
<script type='text/javascript'>
	<!--
	(function() {
		document.forms['loginForm'].elements['j_username'].focus();
	})();
	// -->
</script>
</body>
</html>
