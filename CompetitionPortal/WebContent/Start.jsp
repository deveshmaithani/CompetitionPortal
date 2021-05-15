<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="Style.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
function validLogin(){
if (document.form.user_name.value == ""){
alert ( "Please enter User Name." );
document.loginform.user_name.focus();
return false;
}
if (document.form.password.value == ""){
alert ( "Please enter password." );
document.userform.password.focus();
return false;
}
if (document.form.re_password.value == ""){
	alert ( "Please re enter password." );
	document.userform.re_password.focus();
	return false;
}
if (document.form.email.value == ""){
	alert ( "Please enter email id." );
	document.userform.email.focus();
	return false;
}
alert ( "Data is successfully inserted!" );
return true;
}
</script>
</head>
<body>
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
			<form action="LoginCheck.jsp" method="post">
				<div class="group">
				    
					<label for="user" class="label">User name</label>
					<input id="user" type="text" class="input" name="uname" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" name="pass" required>
				</div>
				
				
				<div class="group">
					<input type="submit" class="button" value="Sign In">
				</div>
				
			</form>	
			</div>
			<div class="sign-up-htm">
			<form name="form" action="RegisterDetails_Insertion.jsp" method="post" onsubmit="return validLogin();">
				<div class="group">
					<label for="user" class="label">User name</label>
					<input id="user" type="text" class="input" name="user_name" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password" class="input" name="password" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Repeat Password</label>
					<input id="pass" type="password" class="input" name="re_password" required>
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="pass" type="text" class="input" name="email" required>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
				</div>
			</form>	
			</div>
		</div>
	</div>
</div>
</div>

</body>
</html>