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

	<main>
		<jsp:include page="./header.jsp"></jsp:include>

		<%
		Customer detail = (Customer) session.getAttribute("customerDetails");
		long phone = (long) session.getAttribute("phoneNumber");
		if (detail != null) {
		%>


		<div class="welcome">

			<div class="welcome_sms">
				<span>Welcome </span> <span class="fname"> <%=detail.getFirstName()%>,
				</span>
			</div>

			<div class="search">
				<img src="https://iili.io/HytCeYQ.png" alt="search"> <label
					for="search"></label> <input type="search" id="search"
					name="search" placeholder="Search here">

			</div>

			<div class="profile">
				<img src="https://iili.io/HytC4Cg.png" alt="account">
				<div class="detail">
					<span class="fname"> <%=detail.getFirstName()%>
					</span> <span>customer</span>
				</div>

			</div>

			<%
			}
			%>
		</div>


		<div class="back_link">

			<img src="https://iili.io/HyhTRY7.gif" alt="intro">
			<div class="link_bank">

				<h2>Link a bank account</h2>

				<p>You'll need to link and confirm to our bank account before
					you can receive Payment with Banking. We'll automatically withdraw
					the funds in your NETBLIZ account to the bank account</p>


				<form action="./AddAccount" method="post">

					<%
					if (session.getAttribute("retrieveAccountDetails") != null) {
						Account account = (Account) session.getAttribute("retrieveAccountDetails");
						String accNoRetrieve = account.getAccountNumber();
						String ifscRetrieve = account.getIfsc();
					%>

					<label for="accountnumber"> Account number </label> <input
						class="form-control" name="accountnumber" type="text" id="account"
						title="Your bank account number should be between 9 and 18 digits."
						pattern="^\d{9,18}$" minlength="9" maxlength="18"
						value="<%=accNoRetrieve%>" required> <label for="ifsc">
						IFSC code <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
					</label> <input class="form-control" name="ifsc" type="text" id="ifsc"
						pattern="^[A-Z]{4}0[A-Z0-9]{6}$"
						title="1. The first four digits identify the bank name 2.The fifth digit in the IFSC is always a zero 3.Sixth to ninth digits identify the branch of the bank 4.The tenth and eleventh digits identify the type of account"
						maxlength="11" value="<%=ifscRetrieve%>" required>

					<%
					} else {
					%>
					<label for="accountnumber"> Account number </label> <input
						class="form-control" name="accountnumber" type="text" id="account"
						title="Your bank account number should be between 9 and 18 digits."
						pattern="^\d{9,18}$" minlength="9" maxlength="18" required>
					<label for="ifsc"> IFSC code <i
						class="fa fa-exclamation-triangle" aria-hidden="true"></i>
					</label> <input class="form-control" name="ifsc" type="text" id="ifsc"
						pattern="^[A-Z]{4}0[A-Z0-9]{6}$"
						title="1. The first four digits identify the bank name 2.The fifth digit in the IFSC is always a zero 3.Sixth to ninth digits identify the branch of the bank 4.The tenth and eleventh digits identify the type of account"
						maxlength="11" required>


					<%
					}
					%>
					<div class="form-check terms">
						<input class="form-check-input" type="checkbox" id="gridCheck"
							required> <label class="form-check-label" for="gridCheck">
							I accept all terms and conditions</label>
					</div>
					<p>"Remember, if you click the 'Link Bank' button, all your
						data will be purchased by your bank will be linked with the
						netbliz application. Once you link with Netbliz, you can continue
						transactions within the application using this platform, and your
						minimum balance tracker will start properly."</p>

					<input class="btn btn-primary" type="submit" value="Link your bank">
				</form>

			</div>

		</div>

		<div class="bank_account remove_hide " id="bank_account">

			<%
			List<Account> accountList = (List<Account>) session.getAttribute("accountList");
			int sNo = 1;
			if (accountList != null) {
				for (Account acc : accountList) {
			%>

			<div class="bank">
				<!--	<img src="https://iili.io/HyraKWg.png" alt="hello"
				class="bank_detail_image"> -->

				<h4><%=sNo++%>. Account Details
				</h4>

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

				<div class="form-floating mb-3">
					<input type="text" id="minimum_balance"
						class="minimum_balance form-control input_size"
						name="minimum_balance" disabled placeholder="Minimum balance"
						value=<%=acc.getMinimumBalance()%>><label for="branch">Minimum
						balance</label>
				</div>
				<button id="remove_bk" class="btn btn-primary account_button">Remove
					bank account !!</button>

			</div>

			<%
			}
			}
			%>

		</div>
	</main>
	<script src="<%=request.getContextPath()%>/assets/js/hover.js"></script>
	<jsp:include page="./successOrErrorMsg.jsp"></jsp:include>

	<script type="text/javascript">
	
			const accountNumber = document.querySelectorAll(".account_give");
			const accountButton = document.querySelectorAll(".account_button");
			
			for(let i=0;i<accountNumber.length;i++){
				
				accountButton[i].addEventListener("click", ()=>{
					
				let	deleteAccount = accountNumber[i].value;
				
					let result = confirm("Are you sure you want to delete your account ?");
					if (result) {
                        console.log(deleteAccount);
						window.location.href = "./AccountDelete?acc="+deleteAccount;
					} else {
						console.log("block");
					}
					
				})
			
			}
		
	</script>
</body>

</html>