<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../assets/css/login.css">
<title>Login</title>
</head>
<body>

	<div class="main">

		<div class="log_in">
			<div class="start">
				<h1 class="tag_h1">Get Started</h1>
				<h2 class="tag_h3">Login your account now</h2>
			</div>
			<div class="right_container">
				<form action="/netbliz-web/Login" method="post">
					<label for="phone">Phone number:</label> 
					<input type="tel"
						name="phone" id="phone" placeholder="Enter your phone number"
						title="Please enter correct 'phone number' when you signup in this website only number accepted"> 
					<label for="email">Email id:</label>
					<input type="email" name="email" id="email"
						placeholder="Enter your email.id"
						title="You must put the email what you signup in this website"> 
					<label for="password">Password:</label> 
					<input type="password" name="password" id="password"
						placeholder="Enter your correct password"
						title="You must put the password when you signup in this website"> 
					<input class="bottom_button"
						id="button_1" type="submit" value="Login">
				</form>
				<img src="https://iili.io/HyOMUZJ.gif" alt="give and back">
			</div>
			<div class="btm_btn"></div>
		</div>
		<div class="welcome">
			<img src="https://iili.io/HyOM7El.gif" alt="Net Bliz">
			<h1>Let us help you to run your bank account on Net Bliz</h1>
			<h3>You are 30 seconds away to experiencing your new banking
				World</h3>
			<a href="registration.jsp"><button class="welcome_button">Have
					an account ?</button></a>
		</div>
	</div>
</body>
</html>