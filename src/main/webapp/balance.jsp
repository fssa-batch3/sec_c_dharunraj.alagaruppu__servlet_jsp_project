<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance</title>
<link rel="stylesheet" href="./assets/css/common.css">
<link rel="stylesheet" href="./assets/css/balance.css">
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<main>

		<h3 id="balance_name">Bank balance details</h3>
		<div class="bank_details">
			<%
			List<Account> accountList = (List<Account>) session.getAttribute("accountList");
			if (accountList != null) {
				for (Account acc : accountList) {
			%>

			<div class="bank_no">
				<img src="https://iili.io/HytQ3rJ.png" alt="NetBliz">
				<h4 class="account_num" id="account"><%=acc.getAccountNumber()%></h4>
				<h3 class="bank_name" id="bank_name"><%=acc.getIfsc()%></h3>
			</div>


			<%
			}
			}
			%>


		</div>

		<%
		List<Account> account = (List<Account>) session.getAttribute("accountList");
		if (account != null) {
			for (Account acc : account) {
				
				if(acc.getAccountNumber().equals(""))
		%>

		<div class="container1">

			<div class="content1">
				<h2>Successfully your balance is fetched !!</h2>
				<img id="tick" src="https://iili.io/J9qfbj9.png" alt="tick">
			</div>

			<div class="account">

				<div class="balance_data">

					<div class="number_type">

						<div class="account_number">

							<span>Account Number :</span>
							<h2 id="customer_ac"><%=acc.getAccountNumber()%></h2>
						</div>

						<div class="account_type">

							<span>Account Type :</span>
							<h2 id="ac_type"></h2>
						</div>

					</div>

					<div class="account_balance">

						<span>Available money :</span>
						<h1 id="balance"></h1>
					</div>

				</div>

				<div class="back_button">

					<a href="./transfer.jsp">Transfer money</a> <a href="./balance.jsp">Back
						balance enquire</a>
				</div>

			</div>

		</div>

		<%
		}
		}
		%>

	</main>
	<script type="text/javascript">


	const user_acc = document.querySelectorAll(".bank_no"); // no of div
	const account_num = document.querySelectorAll(".account_num");
	const customer_num = document.getElementById("customer_ac");

	let ref_num;

	for (let p = 0; p < user_acc.length; p++) {
	  user_acc[p].addEventListener("click", () => {
		  
	    document.querySelector(".container1").style.display = "block";

	    document.querySelector("#balance_name").style.display = "none";

	    document.querySelector(".bank_details").style.display = "none";
	    

	    ref_num =  account_num[p].innerHTML;
	    
	  });
	}
	
	function account_details(acc_no){
		
		user_acc.forEach((e)=>{
			
			
		}
		
	}

	</script>
</body>
</html>