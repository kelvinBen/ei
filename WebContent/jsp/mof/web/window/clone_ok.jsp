<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
String new_windowName = request.getParameter("new_windowname");
String cloneOK = (String)request.getAttribute("cloneok");
%>
<HTML>
<HEAD><TITLE>窗口复制成功 </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<body>
</body>
<script language = "javascript">
if("true"=="<%=cloneOK%>")
alert("窗口[<%=new_windowName%>]复制成功！");
else
alert("窗口[<%=new_windowName%>]复制失败,请检查log！");
parent.close();
</script>
</HTML>