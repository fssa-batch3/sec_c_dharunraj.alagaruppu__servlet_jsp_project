<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
<link rel="stylesheet" href="../assets/css/registration.css">
</head>
<body>

	<div class="main">
		<div class="welcome">
			<img src="https://iili.io/Hy2UOlV.png" alt="Net Bliz">
			<h1>Welcome!!</h1>
			<h3>After fill all correct data once you click a register button
				it's take some time to verify your details.</h3>
			<a id="welcome_button" href="login.jsp"><button
					class="welcome_button">Login</button></a>
		</div>
		<div class="sign_up">
			<h1>Register here !!</h1>
			<form action="/netbliz-web/Registration" method="post">
				<label for="fname"></label> 
				<input type="text" name="fname"
					id="fname" placeholder="First Name *"
					title="Your pattern minimum length of 3 characters a_z or A_Z only">
				<label for="lname"></label> 
				<input type="text" name="lname"
					id="lname" placeholder="Last Name *"
					title="Your pattern is minium 1 to 20 character a_z or A_Z only">
				<label for="email"></label> 
				<input type="email" name="email"
					id="email" placeholder="Email.Id *"
					title="Check your email format "> 
				<label for="phone"></label>
				<input type="tel" name="phone" id="phone"
					placeholder="Phone number *"
					title="Your number should be 10 numbers"> 
				<label for="pass"></label>
				<input type="password" name="pass" id="new_pass"
					placeholder="Create password *"
					title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters">
				<label for="confirm"></label> 
				<input type="password" name="confirm"
					id="confirm" placeholder="Confirm password *"
					title="Must be Confirm password and New password should be equal">
				<div class="btm_btn">
					<input class="bottom_button" type="submit" value="Register">
				</div>
			</form>
		</div>
	</div>

</body>
</html>