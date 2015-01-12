<%@ page contentType="text/html;charset=GBK" %>
<%
	String message="´ß°ì³É¹¦£¡";
	response.getWriter().print(message);
%>
<script language="javascript">
var resultValue="<%=message%>";
parent.fillResult(resultValue);
</script>