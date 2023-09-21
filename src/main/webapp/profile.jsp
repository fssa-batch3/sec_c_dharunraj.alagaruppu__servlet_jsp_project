<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Account Details</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/account.css">
</head>
<body>
	<div class="main">
		<form id="right_form">
			<div class="edit_profile">
				<div class="heading_profile">
					<h2 class="heading">Edit Profile</h2>
				</div>
				<div class="form_profile">
					<div class="form-floating mb-3">
						<input for="fname" id="fname" placeholder="Name"
							pattern="^[a-zA-Z ]{3,50}$" type="text" min="undefined"
							title="Your pattern minium length of 2 characters a_z or A_Z only"
							aria="Name" class="form-control input input1" required="true"
							disabled=""><label for="fname">Name</label>
					</div>
					<div class="form-floating mb-3">
						<input for="phone" id="phone" placeholder="Phone.no"
							pattern="[0-9]{12}" type="tel" min="undefined"
							title="Number only allowed &amp;&amp; 10 numbers must"
							aria="Phone number" class="form-control input input1"
							required="undefined" disabled=""><label for="phone">Phone.no</label>
					</div>
					<div class="form-floating mb-3">
						<input for="email" id="email" placeholder="Email id"
							pattern="^[a-zA-Z0-9][a-zA-Z0-9._%+-]*@[a-zA-Z0-9.-]+[a-zA-Z]{2,}$"
							type="email" min="undefined" title="This is not a email format"
							aria="Email id" class="form-control input input1"
							required="undefined" disabled=""><label for="email">Email
							id</label>
					</div>
					<div class="form-floating mb-3">
						<input for="district" id="district" placeholder="District"
							pattern="^[a-zA-Z]{3,20}$" type="name" min="undefined"
							title="Your pattern minium length of 2 to 30 characters a_z or A_Z only"
							aria="District" class="form-control input input1"
							required="undefined" disabled=""
							onkeyup="this.value=this.value.replace(/[^A-z]/g,'');"><label
							for="district">District</label>
					</div>
					<div class="form-floating mb-3">
						<input for="state" id="state" placeholder="State"
							pattern="^[a-zA-Z]{3,20}$" type="name" min="undefined"
							title="Your pattern minium length of 2 to 20 characters a_z or A_Z only"
							aria="State" class="form-control input input1"
							required="undefined" disabled=""
							onkeyup="this.value=this.value.replace(/[^A-z]/g,'');"><label
							for="state">State</label>
					</div>
					<div class="form-floating mb-3">
						<input for="dob" id="dob" placeholder="DOB" pattern="undefined"
							type="date" min="undefined" title="This is not a date of birth"
							aria="Date of birth" class="form-control input input1"
							required="undefined" disabled="" max="[object HTMLDivElement]"><label
							for="dob">DOB</label>
					</div>
				</div>
				<div class="click_button">
					<a class="back_button" href="./home.html">Back to home</a><a
						class="back_button" id="edit_profiles">Edit</a> 
						<a class="back_button delete_button">Delete</a>
				</div>
			</div>
		</form>
	</div>
</body>
</html>