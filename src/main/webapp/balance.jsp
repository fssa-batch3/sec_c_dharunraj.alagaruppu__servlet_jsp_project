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

			<form action="<%=request.getContextPath()%>/Balance" method="post">

				<button type="submit" class="bank_no"
					style="border: none; font-size: 15px;">
					<input type="hidden" value="<%=acc.getAccountNumber()%>"
						name="acc_no"> <img src="https://iili.io/HytQ3rJ.png"
						alt="NetBliz">
					<h4 class="account_num" id="account"><%=acc.getAccountNumber()%></h4>
					<h3 class="bank_name" id="bank_name"><%=acc.getIfsc()%></h3>
				</button>
			</form>

			<%
			}
			}
			%>

		</div>

		<%
		Account findAcc = (Account) request.getAttribute("findAcc");

		if (findAcc != null) {
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
							<h2 id="customer_ac"><%=findAcc.getAccountNumber()%></h2>
						</div>

						<div class="account_type">

							<span>Minimum balance :</span>
							<h2 id="ac_type">
								&#8377;<%=findAcc.getMinimumBalance()%></h2>
						</div>

					</div>

					<div class="account_balance">

						<span>Available money :</span>
						<h1 id="balance">
							&#8377;<%=findAcc.getAvailableBalance()%></h1>
					</div>

				</div>

				<div class="back_button">

					<a href="./transfer.jsp">Transfer money</a> <a href="./balance.jsp">Back
						to balance enquire</a>
				</div>

			</div>

		</div>

		<%
		}
		%>
	</main>


	<script>
		const find_acc = document.querySelector(".container1");
		const bank_details = document.querySelector(".bank_details");

		if (find_acc) {

			bank_details.style.display = "none";
		} else {

			bank_details.style.display = "block";
		}
	</script>
	<script src="<%=request.getContextPath()%>/assets/js/hover.js"></script>
</body>
</html>