<%@page import="java.awt.Window"%>
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
		double min_balance = (double) request.getAttribute("min");
		double avl_balance = (double) request.getAttribute("balance");
		double trans_amount = Double.parseDouble(request.getParameter("amount"));
		double remaining = avl_balance - trans_amount;
	%>

	<div id="delete_box">
		<h2 id="delete_file_text">Continue transaction ?</h2>
		<p>
			This transaction may impact your Monthly Average Balance (MAB) as
			follows: <br> <span id="reminder_calculation"> MAB =
				(&#x20B9; <%=min_balance%> )
			</span> <br> <span id="reminder_calculation"> (Available balance
				- Transfer amount = Remaining)<br>( <%=avl_balance%> - <%=trans_amount%>
				= &#x20B9; <%=remaining%>)
			</span> <br> Therefore, it is advisable to refrain from proceeding with
			this current transaction and instead consider splitting it with
			another account that you own. Being well-informed about the bank's
			terms and conditions related to MAB.
		</p>
		<div id="delete_box_btns">
			<form id="delete_btn" action="./MakeTransaction" method="post">
				<button type="submit">Continue</button>
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
				<h1>Account number to transfer money</h1>

				<h5>Account number</h5>
				<select class="form-select accounts" id="from" name="holder"
					autofocus required>

					<jsp:include page="./dropDownAccountNumber.jsp"></jsp:include>
				</select>
				<%
				if (session.getAttribute("transactionRetrieve") != null) {
					Transaction transRetrieve = (Transaction) session.getAttribute("transactionRetrieve");
					String remittanceAccRetrieve = transRetrieve.getRemittanceAccNo();
					String remittanceIfscRetrieve = transRetrieve.getReceiverIfscCode();
					double transAmountRetrieve = transRetrieve.getTransferAmount();
				%>

				<label for="remittance"> Receiver account number</label> <input
					class="form-control input" type="text" id="to" name="remittance"
					title="Remember !! Your bank account number should be 16 numbers"
					aria=" Receiver Account " value="<%=remittanceAccRetrieve%>"
					required> <label for="ifsc">Receiver IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					title="Are you sure !! minium Our ifsc number should be 11 numbers"
					aria="Receiver IFSC" value="<%=remittanceIfscRetrieve%>" required>
				<label for="amount"> Transfer amount (&#8377;) </label> <input
					class="form-control" type="number" id="amount" name="amount"
					aria=" Transfer Amount" min="1" value="<%=transAmountRetrieve%>"
					required>
				<div class="form-outline w-75 mb-4">
					<label class="form-label" for="textAreaExample6">Remarks
						(Optional)</label>
					<textarea class="form-control textAreaExample6"
						id="textAreaExample6" rows="2" name="textAreaExample6"></textarea>
				</div>

				<%
				} else {
				%>
				<label for="remittance"> Receiver account number</label> <input
					class="form-control input" type="text" id="to" name="remittance"
					title="Remember !! Your bank account number should be 16 numbers"
					aria=" Receiver Account " required> <label for="ifsc">Receiver
					IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					title="Are you sure !! minium Our ifsc number should be 11 numbers"
					aria="Receiver IFSC" required> <label for="amount">
					Transfer amount (&#8377;) </label> <input class="form-control"
					type="number" id="amount" name="amount" aria=" Transfer Amount"
					min="1" required>
				<div class="form-outline w-75 mb-4">
					<label class="form-label" for="textAreaExample6">Remarks
						(Optional)</label>
					<textarea class="form-control textAreaExample6"
						id="textAreaExample6" rows="2" name="textAreaExample6"></textarea>
				</div>
				<%
				}
				%>
				<br> <input type="submit" class="btn btn-primary" id="send"
					aria="Send button" value="Send">

			</form>

		</div>

	</div>

	<script type="text/javascript">
		function cancel_delectbox() {

			document.querySelector("#delete_box").style.display = "none";
		}
	</script>
	<script src="<%=request.getContextPath()%>/assets/js/hover.js"></script>
	<jsp:include page="./successOrErrorMsg.jsp"></jsp:include>
</body>

</html>