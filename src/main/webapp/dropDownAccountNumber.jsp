<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="com.fssa.netbliz.model.*"%>

<option value="">Choose your account number</option>
<%
List<Account> accountList = (List<Account>) session.getAttribute("accountList");
if (accountList != null) {
	for (Account acc : accountList) {
%>

<option id="from" value=<%=acc.getAccountNumber()%>>
	<%=acc.getAccountNumber()%>
</option>

<%
}
}
%>