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
		double minRemining = min_balance - remaining;
		 
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
			</span> <br>If you will make this transaction your balance is (&#x20B9;
			<%=remaining%>)<br> It will affect your today minimum balance of
			(&#x20B9;
			<%=minRemining%>)<br> If you have another account please split
			and send that amount. It will maintain your MAB.
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
					title="Your bank account number should be between 9 and 18 digits."
					pattern="^\d{9,18}$" minlength="9" maxlength="18"
					aria=" Receiver Account " value="<%=remittanceAccRetrieve%>"
					required> <label for="ifsc">Receiver IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					pattern="^[A-Z]{4}0[A-Z0-9]{6}$"
					title="1. The first four digits identify the bank’s name 2.The fifth digit in the IFSC is always a zero 3.Sixth to ninth digits identify the branch of the bank 4.The tenth and eleventh digits identify the type of account"
					maxlength="11" aria="Receiver IFSC"
					value="<%=remittanceIfscRetrieve%>" required> <label
					for="amount"> Transfer amount (&#8377;) </label> <input
					class="form-control" type="number" id="amount" name="amount"
					aria=" Transfer Amount" min="1" maxlength="6"
					value="<%=transAmountRetrieve%>" required>
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
					title="Your bank account number should be between 9 and 18 digits."
					pattern="^\d{9,18}$" minlength="9" maxlength="18"
					aria=" Receiver Account " required> <label for="ifsc">Receiver
					IFSC code<code></code>
				</label> <input class="form-control" type="text" id="ifsc" name="ifsc"
					pattern="^[A-Z]{4}0[A-Z0-9]{6}$"
					title="1. The first four digits identify the bank’s name 2.The fifth digit in the IFSC is always a zero 3.Sixth to ninth digits identify the branch of the bank 4.The tenth and eleventh digits identify the type of account"
					maxlength="11" aria="Receiver IFSC" required> <label
					for="amount"> Transfer amount (&#8377;) </label> <input
					class="form-control" type="number" id="amount" name="amount"
					aria=" Transfer Amount" min="1" maxlength="6" required>
				<div class="form-outline w-75 mb-4">
					<label class="form-label" for="textAreaExample6">Remarks
						(Optional)</label>
					<textarea class="form-control textAreaExample6 textarea"
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