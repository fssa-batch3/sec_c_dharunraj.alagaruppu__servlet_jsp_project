<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Balance</title>
<link rel="stylesheet" href="../assets/css/common.css">
<link rel="stylesheet" href="../assets/css/balance.css">
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<main>

		<h3 id="balance_name">Bank balance details</h3>
		<%
		List<Account> accountList = (List<Account>) session.getAttribute("accountList");
		if (accountList != null) {
			for (Account acc : accountList) {
		%>

		<a href="?accnumber=<%=acc.getAccountNumber()%>">
			<div class="bank_list">
				<div class="bank_no">
					<img src="https://iili.io/HytQ3rJ.png" alt="Net Bliz">
					<h4 class="account_num" id="account"><%=acc.getAccountNumber()%></h4>
					<h3 class="bank_name" id="bank_name"><%=acc.getIfsc()%></h3>
				</div>
			</div>
		</a>


		<%
		}
		}
		%>

		<%
		List<Account> insertAccountDetails = (List<Account>) session.getAttribute("accountList");

		for (Account acc : insertAccountDetails) {
			String accNo = (String) request.getParameter("accnumber");
			if (accNo != null) {
				if (accNo.equals(acc.getAccountNumber())) {
		%>

		<div class="container56656">

			<div class="content1">
				<h2>Successfully your balance is fetched !!</h2>
				<img id="tick" src="https://iili.io/J9qfbj9.png" alt="tick">
			</div>

			<div class="account">

				<div class="main_hiden">

					<div class="hiden_left">
						<span>Account Number :
							<h2 id="customer_ac"></h2>
						</span>Account Type : <span>
							<h2 id="ac_type"></h2>
						</span>
						<div class="back_button">

							<a href="./fund_transfer.html">Transfer money</a> <a
								href="./balance_enquire.html">Back balance enquire</a>
						</div>
					</div>

					<div class="hiden_right">
						<span>Available money :
							<h1 id="balance"></h1>
						</span>
					</div>
				</div>

			</div>

		</div>

		<%
		}
		}
		}
		%>

	</main>

	<script>
		const user_acc = document.querySelectorAll(".bank_no"); // no of div
		const container = document.querySelector(".container1");
		const bankList = document.querySelectorAll(".bank_list");
		let ref_num;

		for (let p = 0; p < user_acc.length; p++) {
			
		  user_acc[p].addEventListener("click", () => {
		    
		    user_acc.style.display = "none";
		    
		    container.style.display = "block";
		    
		  });
		}
		
		
		
	</script>
</body>
</html>