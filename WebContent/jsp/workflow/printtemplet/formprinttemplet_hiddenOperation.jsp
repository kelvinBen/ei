<%@ page contentType="text/html;charset=GBK" %>
<%
	response.getWriter().print((String)request.getAttribute("content"));
%>