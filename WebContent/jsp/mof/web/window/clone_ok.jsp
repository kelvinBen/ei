<%@ page contentType="text/html;charset=gb2312" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
String new_windowName = request.getParameter("new_windowname");
String cloneOK = (String)request.getAttribute("cloneok");
%>
<HTML>
<HEAD><TITLE>���ڸ��Ƴɹ� </TITLE> </HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<body>
</body>
<script language = "javascript">
if("true"=="<%=cloneOK%>")
alert("����[<%=new_windowName%>]���Ƴɹ���");
else
alert("����[<%=new_windowName%>]����ʧ��,����log��");
parent.close();
</script>
</HTML>