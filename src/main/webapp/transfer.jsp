<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="./assets/css/transfer.css">
<link rel="stylesheet" href="./assets/css/common.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<title>Transfer</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<%
	String check = (String) request.getAttribute("confirmMsg");

	if (check != null && check.equals("true")) {
		
		request.setAttribute("transaction", (Transaction)request.getAttribute("transaction"));
		
	%>
	
	<div id="delete_box">
		<h2 id="delete_file_text">Continue transaction ?</h2>
		<p>If this transaction happens and your (MAB) is under maintenance
			for this month, it means I did not maintain the required minimum
			balance in my bank account. As a result, the bank may charge me an
			extra fee or penalty for not meeting the MAB requirement. It's
			important to be aware of the bank's terms and conditions regarding
			MAB to avoid these additional charges in the future.</p>
		<div id="delete_box_btns">
			<form id="delete_btn" action="./MakeTransaction"
				method="post">
				<button type="submit" >Continue</button>
			</form>
			<button onclick="cancel_delectbox()">Cancel</button>
		</div>
	</div>
	<%
	}
	%>

	<div class="for_back">
		<div class="right_contant">

			<img src="https://iili.io/Hyhajlj.png" alt="fund">

			<form action="./CheckMinimumBalance" method="post">
				<h1>Bank account to money transfer</h1>

				<h5>Account number</h5>
				<select class="form-select accounts" id="from" name="holder"
					autofocus required>

					<option value="<%=request.getParameter("holder")%>">Choose your account number</option>
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
				</select> 
				
				<%
				if(request.getParameter("remittance") != null){
				%>
				
				<label for="remittance"> Receiver account number</label> <input
					class="form-control input" type="text" id="to" name="remittance"
					title="Remember !! Your bank account number should be 16 numbers"
					aria=" Reciever Account "
					value="<%=request.getParameter("remittance")%>" required> <label
					for="ifsc">Receiver IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					title="Are you sure !! minium Our ifsc number should be 11 numbers"
					aria="Receiver IFSC" value="<%=request.getParameter("ifsc")%>" required> <label for="amount">
					Transfer amount </label> <input class="form-control" type="number"
					id="amount" name="amount" aria=" Transfer Amount" min="1"
					max="49999" title="You can only share amount between 50000 per day" value="<%=request.getParameter("amount")%>"
					required>
				<div class="form-outline w-75 mb-4">
					<label class="form-label" for="textAreaExample6">Remarks</label>
					<textarea class="form-control textAreaExample6" value="<%=request.getParameter("textAreaExample6")%>"
						id="textAreaExample6" rows="2" name="textAreaExample6"></textarea>
				</div>
				<br> <input type="submit" class="btn btn-primary" id="send"
					aria="Send button" value="Send">
				
				<%
				}
				else{
				%>	
				
				
				<label for="remittance"> Receiver account number</label> <input
					class="form-control input" type="text" id="to" name="remittance"
					title="Remember !! Your bank account number should be 16 numbers"
					aria=" Reciever Account " required> <label
					for="ifsc">Receiver IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					title="Are you sure !! minium Our ifsc number should be 11 numbers"
					aria="Receiver IFSC" required> <label for="amount">
					Transfer amount </label> <input class="form-control" type="number"
					id="amount" name="amount" aria=" Transfer Amount" min="1"
					max="49999" title="You can only share amount between 50000 per day" required>
				<div class="form-outline w-75 mb-4">
					<label class="form-label" for="textAreaExample6">Remarks</label>
					<textarea class="form-control textAreaExample6" id="textAreaExample6" rows="2" name="textAreaExample6"></textarea>
				</div>
				<br> <input type="submit" class="btn btn-primary" id="send"
					aria="Send button" value="Send">
					
				<%} %>
				
			</form>

		</div>

	</div>

	<script type="text/javascript">
		function cancel_delectbox() {

			document.querySelector("#delete_box").style.display = "none";
		}
	</script>
</body>
</html>