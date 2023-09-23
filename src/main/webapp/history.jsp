
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<link rel="stylesheet" href="./assets/css/history.css">
<link rel="stylesheet" href="./assets/css/common.css">
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>

<title>History</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="welcome">

		<div class="background">

			<div class="search">
				<img src="https://iili.io/HytCeYQ.png" alt="search"> <label
					for="search"></label> <input type="search" id="search"
					name="search" placeholder="History here">

			</div>

			<div class="right_filter">

				<div class="filter">

					<div class="filter_icon">

						<img src="https://iili.io/JHBiiGf.png" alt="filter_icon"> <span>Filter</span>
					</div>

					<img src="https://iili.io/JHBL1b1.png" alt="arrow_icon">

				</div>

				<div class="select_div">

					<select class="form-select accounts" id="from" required>

						<option value="">Choose your Ac.No</option>

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
						%> });

					</select>

					<button id="result_button">check</button>

					<button onclick="restart_tab()" id="restart">back</button>

				</div>

			</div>

		</div>

	</div>

	<main></main>
	<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
	<script src="assets/js/history.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/hover.js"></script>
</body>
</html>