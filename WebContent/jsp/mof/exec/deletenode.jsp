<%
	Object msg = request.getAttribute("deletefailed");
%>
<SCRIPT LANGUAGE="JAVASCRIPT">
<% if (msg != null){%>
parent.alertMessage();
<% } else {%>
parent.refreshTree();
<% } %>
</SCRIPT>