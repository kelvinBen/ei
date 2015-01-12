<%@ page contentType="text/html;charset=GBK" %>
<%
	String multiSelect = (String)request.getAttribute("multiSelect");
%>
<script language="javascript">
	var html="<select name='mofReferenceValue'>"+"<%=multiSelect%>"+"</select>";
	parent.fillData(html);
</script>