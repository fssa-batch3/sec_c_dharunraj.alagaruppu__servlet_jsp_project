<%@page import="java.util.jar.Attributes.Name"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="./assets/css/home.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<link rel="stylesheet" href="./assets/css/common.css">

</head>
<body>
	<%
	String success = (String) request.getAttribute("successMsg");
	String error = (String) request.getAttribute("errorMsg");
	if (error != null && !(error.isEmpty())) {
	%>
	<h3 class="text-center text-danger mt-2"><%=error%></h3>
	<%
	}
	if (success != null && !(success.isEmpty()) && error == null) {
	%>
	<h3 class="text-center text-success mt-2"><%=success%></h3>
	<%
	}
	%>
	<main>
		<jsp:include page="./header.jsp"></jsp:include>

		<%
		List<Customer> detail = (List<Customer>) session.getAttribute("customerDetails");

		if (detail != null) {

			for (Customer name : detail) {
		%>


		<div class="welcome">

			<div class="welcome_sms">
				<span>Welcome </span> <span class="fname"><%=name.getFirstName()%>,</span>
			</div>

			<div class="search">
				<img src="https://iili.io/HytCeYQ.png" alt="search"> <label
					for="search"></label> <input type="search" id="search"
					name="search" placeholder="Search here">

			</div>

				<div class="profile">
					<img src="https://iili.io/HytC4Cg.png" alt="account">
					<div class="detail">
						<span class="fname"><%=name.getFirstName()%></span> <span>customer</span>
					</div>

				</div>
			

		</div>

		<%
		}
		}
		%>
		<div class="back_link">

			<img src="https://iili.io/HyhTRY7.gif" alt="intro">
			<div class="link_bank">

				<h2>Link a bank account</h2>
				<p>You'll need to link and confirm to our bank account before
					you can receive Payment with Banking. We'll automatically withdraw
					the funds in your NET BLIZ account to the bank account</p>

				<form action="./AddAccount" method="post">
					<label for="accountnumber"> Account number </label> <input
						class="form-control" name="accountnumber" type="text" id="account"
						title="Remember !! Your bank account number should be 16 numbers"
						autofocus required> <label for="ifsc"> IFSC code </label>
					<span id="alert_icon"></span> <input class="form-control"
						name="ifsc" type="text" id="ifsc" pattern="[0-9A-Za-z]{5,15}"
						title="Are you sure !! minium Your ifsc number should be 12 numbers"
						required> <label for="phone">Phone number</label> <input
						class="form-control" name="phone" type="tel" id="phone"
						title=" Enter your correct phone number that you logged in"
						required>

					<h6>Choose minimum balance</h6>
					<div class="input-group mb-3 drop_down">

						<select class="form-select" id="inputGroupSelect03" name="min"
							aria-label="Example select with button addon" required>

							<option value="">please select correctly amount *</option>
							<!-- <option value="0">₹ 0-/</option> -->
							<option value="500.0">&#8377; 500-/</option>
							<option value="1000.0">&#8377; 1,000-/</option>
							<option value="2500.0">&#8377; 2,500-/</option>
							<option value="5000.0">&#8377; 5,000-/</option>
							<option value="10000.0">&#8377; 10,000-/</option>
							<option value="25000.0">&#8377; 25,000-/</option>

						</select>
					</div>

					<h5>Account type</h5>

					<input type="radio" name="type" id="personal" value="SAVINGS"
						required> <label for="personal">Savings Account</label> <br>
					<input type="radio" name="type" id="business" value="CURRENT">
					<label for="business">Current Account </label> <br>

					<p>Remember to double-check your account number . Banks may not
						flag errors until you transfer funds</p>

					<input class="btn btn-primary" type="submit" value="Link your bank">

				</form>
			</div>

		</div>

		<div class="bank_account remove_hide " id="bank_account">

			<%
			List<Account> accountList = (List<Account>) session.getAttribute("accountList");
			if (accountList != null) {
				for (Account acc : accountList) {
			%>

			<div class="bank">
				<!--	<img src="https://iili.io/HyraKWg.png" alt="hello"
				class="bank_detail_image"> -->

				<h4>Account Details</h4>

				<div class="form-floating mb-3">
					<input type="text" id="account_give"
						class="account_give form-control input_size" name="account"
						disabled placeholder="Account no"
						value=<%=acc.getAccountNumber()%>><label for="account">Account
						no</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" id="ifsc_give"
						class="ifsc_give form-control input_size" name="ifsc_give"
						disabled placeholder="IFSC Code" value=<%=acc.getIfsc()%>><label
						for="ifsc_give">IFSC code</label>
				</div>
				<div class="form-floating mb-3">
					<input type="text" id="branch"
						class="branch form-control input_size" name="branch" disabled
						placeholder="Branch Name" value=<%=acc.getCategory()%>><label
						for="branch">Account type</label>
				</div>


				<a href="./AccountDelete?acc=<%=acc.getAccountNumber()%>">
					<button id="remove_bk" class="btn btn-primary remove_bk">Remove
						bank account !!</button>
				</a>

			</div>

			<%
			}
			}
			%>


		</div>
	</main>
</body>
</html>