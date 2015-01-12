<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-seltree" prefix="tree"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
	String parentId = (String)request.getAttribute("parentId");
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<BODY>
<html:form name="form1" action="">
</html:form>
</BODY>
</html>
<SCRIPT LANGUAGE="JavaScript">
	parent.refreshTree("<%=parentId%>");
</SCRIPT>