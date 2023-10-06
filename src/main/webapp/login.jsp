<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/login.css">
<title>Login</title>
</head>

<body>

	<div class="main">

		<div class="welcome">
			<img src="https://iili.io/HyOM7El.gif" alt="NETBLIZ">
			<h1>Let us help you to run your bank account on NETBLIZ</h1>
			<h3>You are 30 seconds away to experiencing your new banking
				World</h3>
			<a id="welcome_button" href="./index.jsp">Need more clarity ?</a> <a
				href="registration.jsp"><button class="welcome_button">Have
					an account ?</button></a>
		</div>

		<div class="log_in">
			<div class="start">
				<h1 class="tag_h1">Begin the login process correctly</h1>
				<h2 class="tag_h3">Enter the phone number and password you used
					during registration.</h2>
			</div>
			<div class="right_container">
				<form action="./Login" method="post">
					<label for="phone">Phone number:</label> <input type="tel"
						pattern="^[6-9]{1}[0-9]{9}$" name="phone" id="phone"
						placeholder="Enter your phone number"
						title="Please enter correct 'phone number' when you signup in this website only number accepted it's start's with 6,7,8,9"
						required> <label for="password">Password:</label> <input
						type="password" name="password" id="password"
						placeholder="Enter your correct password"
						title="You must put the password when you signup in this website"
						required> <input class="bottom_button" id="button_1"
						type="submit" value="Login">
				</form>
				<img src="https://iili.io/HyOMUZJ.gif" alt="give and back">
			</div>
			<div class="btm_btn"></div>
		</div>

	</div>
	<jsp:include page="./successOrErrorMsg.jsp"></jsp:include>
</body>

</html>