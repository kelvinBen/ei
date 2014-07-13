<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%	
	String contextPath=request.getContextPath();
%>
<html>
<head>
<meta http-equiv=Content-Type content="text/html;  charset=GB2312">
<title>工作台</title>
<script LANGUAGE=JavaScript>
</script>
</head>
<BODY SCROLL=no>
<iframe name="main" frameborder="0" src="<%=contextPath%>/taskinfodaiban.cmd?method=getProcessTypeList&clear=true"  style="width:100%;height:100%;"></iframe>
</BODY>
</html>