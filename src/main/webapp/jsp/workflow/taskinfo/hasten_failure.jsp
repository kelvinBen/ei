<%@ page contentType="text/html;charset=GBK" %>
<%
	String message="�߰�ʧ�ܣ�";
	response.getWriter().print(message);
%>
<script language="javascript">
var resultValue="<%=message%>";
parent.fillResult(resultValue);
</script>