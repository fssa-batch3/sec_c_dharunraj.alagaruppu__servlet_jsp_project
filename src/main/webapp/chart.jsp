<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chart</title>
<link rel="stylesheet" href="./assets/css/chart.css">
<link rel="stylesheet" href="./assets/css/common.css">
<script
	src="https://cdn.jsdelivr.net/gh/LieutenantPeacock/SmoothScroll@1.2.0/src/smoothscroll.min.js"
	integrity="sha384-UdJHYJK9eDBy7vML0TvJGlCpvrJhCuOPGTc7tHbA+jHEgCgjWpPbmMvmd/2bzdXU"
	crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="start_build back" id="start_build">

		<div class="open_account">

			<span class="heading">Why do banks enforce the minimum balance
				account requirements?</span>

			<div class="box_content">

				<div class="content_text">
					<p>Banks also use the cash deposited by account holders for
						different purposes,by urging account holders to maintain a minimum
						balance in their accounts.</p>

					<p>The bank ensures that a substantial volume of cash is always
						available at the bank for deployment in various investment
						avenues.</p>
				</div>

			</div>

		</div>

		<img src="https://iili.io/JJALj4e.png" alt="2nd image">

	</div>

	<div class="select_div">

		<select class="form-select accounts" id="from" required>

			<option value="">Choose your Ac.No</option>

		</select>

		<button type="button" id="result_button">check</button>

		<button type="button" id="restart">back</button>

	</div>

	<div class="calculation">

		<h2>
			<strong>How is MAB calculated?</strong>
		</h2>

		<p>Banks use a very simple formula to calculate the account holder
			MAB:</p>

		<p>MAB = (The total of end-of-the-day closing balances) / (number
			of days in the month)</p>

		<p>Hence, the monthly average balance will be calculated using two
			figures:</p>
		<p>
		<ol>
			<li>Calculating the total sum of closing balances in the month</li>
			<li>Number of days in the month</li>
		</ol>
		</p>

		<p>The average monthly balance is then calculated by dividing the
			total closing balances by the number of days in a month.</p>

		<p>Lets look at an example to understand this.</p>

		<p>Alagar opened a current account in a bank. The bank required
			him to maintain a monthly average balance of Rs 10,000.</p>

		<p>Lets assume Alagar account had Rs 25,000 on June 1.</p>

		<p>On June 5, he withdrew Rs 10,000, and on June 10, another Rs
			10,000 was debited from his account to meet some business expenses.</p>

		<p>On June 15, Rs 5,000 was credited to his account. On June 29,
			another Rs 5,000 was credited to Alagar account.</p>

		<p>Therefore, Alagar monthly average balance will be:</p>

		<table>
			<caption>If you don't understand this table,please read
				again above the example</caption>
			<tr>
				<th><b>Days</b></th>
				<th><b>Total days (A)</b></th>
				<th><b>Amount in the account at end of the day (B)</b></th>
				<th><b>A x B</b></th>
			</tr>
			<tr>
				<td>First 4 days</td>
				<td>4</td>
				<td>Rs 25,000</td>
				<td>1,00,000</td>
			</tr>
			<tr>
				<td>5th to 9th day</td>
				<td>5</td>
				<td>Rs 15,000</td>
				<td>75,000</td>

			</tr>
			<tr>
				<td>10th to 14th day</td>
				<td>5</td>
				<td>Rs 5,000</td>
				<td>25,000</td>

			</tr>
			<tr>
				<td>15th to 28th day</td>
				<td>14</td>
				<td>Rs 10,000</td>
				<td>1,40,000</td>

			</tr>
			<tr>
				<td>29th to 30th day</td>
				<td>2</td>
				<td>Rs 20,000</td>
				<td>40,000</td>

			</tr>
		</table>

		<p>Using the formula, monthly average balance comes out to be:</p>

		<p>= (1,00,000 + 75000 + 25000 + 1,40,000 + 40,000) / 30</p>

		<p>= 3,80,000 / 30</p>

		<p>= Rs 12,666.66</p>

		<p>Hence, Alagar monthly average balance is much above the
			mandated Rs 10,000 and he will not be charged any penalty.</p>

		<p>Lets look at your own account given below.</p>

	</div>

	<script src="<%=request.getContextPath()%>/assets/js/hover.js"></script>
	</ body>
</html>