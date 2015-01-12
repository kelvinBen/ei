<%@ page contentType="text/html;charset=GBK" %>
<%
	String flag=(String)request.getAttribute("FLAG");
	if(flag == null){
		flag = "OK";
	}	
	out.println(flag);	
%>
