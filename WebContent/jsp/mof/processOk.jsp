<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.List,net.mast.mof.model.MofWindow"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%
String message = (String)request.getAttribute("mof_message");
if( message == null || message.equals("") )
	message = "执行成功!";
%>
<HTML>
<HEAD>
<TITLE>执行成功</TITLE>

<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<widgets:container title="<%=message%>" >
	<table width="100%" cellpadding="0" class="tblContent" style="border:1px solid #000000">
	<tr>
		<td class="tdTitle" style="text-align:left" colspan="4"><%=message%></td>
	</tr>
	</table>

</widgets:container>
</html:form>
</BODY>
</HTML>