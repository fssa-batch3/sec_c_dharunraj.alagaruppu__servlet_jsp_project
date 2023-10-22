<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
<%String errorMsg = (String) request.getAttribute("errorMsg");
String successMsg = (String) request.getAttribute("successMsg");
String path = (String) request.getAttribute("path");

System.out.println("Successmsg : " + successMsg + " errormsg :" + errorMsg + " Path :" + path);

if (errorMsg != null) {%>
swal("Failed!","<%=errorMsg%>", "error");
setTimeout(() => {
	window.location.href="<%=path%>";
}, 3000);

<%}%>

<%if (successMsg != null) {%>
console.log("<%=successMsg%>");
swal("Success!"," <%=successMsg%>", "success");
setTimeout(() => {

	window.location.href="<%=path%>";
}, 800);
<%}%>
</script>