<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.YearMonth"%>

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

		<select class="form-select accounts" id="from" name="holder" required>

			<jsp:include page="./dropDownAccountNumber.jsp"></jsp:include>

		</select>

		<button type="submit" id="result_button">Check</button>

		<button type="button" onclick="restart_tab()" id="restart">Back</button>

	</div>
	<div class="calculation" id="calc-scroll">

		<%
		Account acc = (Account) request.getAttribute("accountMin");
		List<CronJob> list = (List<CronJob>) request.getAttribute("chart");
		String accNo = (String) request.getAttribute("selectedAccount");

		YearMonth currentYearMonth = YearMonth.now();
		// Number of days in the current month
		int daysInMonth = currentYearMonth.lengthOfMonth();
		int sNo = 1;
		double sum = 0;
		double avg = 0;

		if (list != null && !list.isEmpty()) {
		%>

		<h2>
			<strong>Calculation and your account statistics : </strong>

		</h2>

		<p>MAB = (The total of end-of-the-day closing balances) / (number
			of days in the month)</p>

		<p>Hence, the monthly average balance will be calculated using two
			figures:</p>
		<ol>
			<li>Calculating the total sum of closing balances in the month</li>
			<li>Number of days in the month</li>
		</ol>

		<p>Lets look at your account details :</p>

		<table>

			<caption>
				Selected account number : <span><b> <%=accNo%><b></span>
			</caption>
			<tr>
				<th><b>S.No</b></th>
				<th><b>Date</b></th>
				<th><b>End of the day closing balance<br>( EOD )<br></b></th>

			</tr>

			<%
			for (CronJob cj : list) {
				LocalDate localDate = cj.getDate();
				java.sql.Timestamp timestamp = java.sql.Timestamp.valueOf(localDate.atStartOfDay());
				SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy");
				String formattedDate = dateFormat.format(timestamp);
				sum += cj.getAvailableBalance();

				avg = sum / daysInMonth;
				avg = Math.round(avg * 100.0) / 100.0;
			%>


			<tr>
				<td><%=sNo++%></td>
				<td><%=formattedDate%></td>
				<td>&#8377; <%=cj.getAvailableBalance()%>
				</td>
			</tr>


			<%
			}
			}
			%>

		</table>

		<p>Using the formula, monthly average balance comes out to be:</p>
		<p>
			<%
			int i = 0;
			if (list != null && !list.isEmpty()) {
				for (CronJob cj : list) {
			%>

			<span> <%
 if (i == 0) {
 %> = (<%=cj.getAvailableBalance()%> <%
 } else {
 %> + <%=cj.getAvailableBalance()%> <%
 }
 %>

			</span>
			<%
			i = 1;
			}
			%>) /
			<%=daysInMonth%>


		</p>

		<p>
			=
			<%=sum%>
			/
			<%=daysInMonth%>
		</p>

		<p>
			= Rs
			<%=avg%>
		</p>

		<p>
			Hence, the monthly average balance for this account number must be
			above the mandated &#8377;
			<%=acc.getMinimumBalance()%>
			and only then will this account not be charged any penalty.
		</p>
		<%
		}
		%>
	</div>




	<%
	if (list == null || list.isEmpty()) {
	%>

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

	<%
	}
	%>

	<script src="<%=request.getContextPath()%>/assets/js/hover.js"></script>
	<jsp:include page="./successOrErrorMsg.jsp"></jsp:include>

	<script type="text/javascript">
	
	const url = window.location.search;
	const urlParams = new URLSearchParams(url);
	const charAcc = Number(urlParams.get("acc"));
	
	if(charAcc){
		
		setTimeout(function() {
		    // Scroll to the target content
		    document.getElementById('calc-scroll').scrollIntoView({ behavior: 'smooth' });
		  }, 700);
	}

                                    const result_button = document.querySelector("#result_button");


                                    result_button.addEventListener("click", () => {
                                        let drop_down = document.querySelector("#from").value;

                                        if (drop_down == "") {

                                            alert("click dropdown account number");
                                        }
                                        else {
                                            const calculation = document.querySelector(".calculation").style.display = "none";
                                            window.location.href = "./Chart?acc=" + drop_down;

                                        }

                                    });

                                    function restart_tab() {

                                        window.location.href = "./chart.jsp";

                                    }               
</script>
</body>
</html>