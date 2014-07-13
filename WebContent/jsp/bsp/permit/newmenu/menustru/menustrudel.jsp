<%@ page contentType="text/html;charset=GBK" %>
<%
	String flag=(String)request.getAttribute("flag");
	if(flag == null){
		flag = "OK";
	}	
	out.println(flag);	
%>
