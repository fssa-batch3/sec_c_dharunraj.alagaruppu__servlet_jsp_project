<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="../assets/css/transfer.css">
<link rel="stylesheet" href="../assets/css/common.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title>Transfer</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="for_back">
		<div class="right_contant">

			<img src="https://iili.io/Hyhajlj.png" alt="fund">

			<form action="/netbliz-web/MakeTransaction" method="post">
				<h1>Bank account to money transfer</h1>

				<h5>Account number</h5>
				<select class="form-select accounts" id="from" name="holder"
					required>

					<option value="">Choose your account number</option>
					<%
					List<Account> accountList = (List<Account>) session.getAttribute("accountList");
					if (accountList != null) {
						for (Account acc : accountList) {
					%>

					<option value=<%=acc.getAccountNumber()%>>
						<%=acc.getAccountNumber()%></option>

					<%
					}
					}
					%>
				</select> <label for="remittance"> Receiver account number</label> <input
					class="form-control input" type="text" id="to" name="remittance"
					title="Remember !! Your bank account number should be 16 numbers"
					aria=" Reciever Account "> <label for="ifsc">
					Receiver IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					title="Are you sure !! minium Our ifsc number should be 11 numbers"
					aria="Receiver IFSC"> <label for="amount"> Transfer
					amount </label> <input class="form-control" type="number" id="amount"
					name="amount" aria=" Transfer Amount" min="1" max="49999"
					title="You can only share amount between 50000 per day">

				<div class="form-outline w-75 mb-4">
					<label class="form-label" for="textAreaExample6">Remarks</label>
					<textarea class="form-control textAreaExample6"
						id="textAreaExample6" rows="2" name="textAreaExample6"></textarea>
				</div>
				<br> <a href="/netbliz-web/MakeTransaction"> <input
					type="submit" class="btn btn-primary" id="send" aria="Send button"
					value="Send">
				</a>
			</form>

		</div>

	</div>


</body>
</html>