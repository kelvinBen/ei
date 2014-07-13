<%@ page contentType="text/html;charset=GBK" %>
<%
String menutype=(String)session.getAttribute("MENU_TYPE");
if(menutype!=null)
	out.print(menutype);
%>