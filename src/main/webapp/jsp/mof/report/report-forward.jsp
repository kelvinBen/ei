<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="java.util.Map" %>
<%
   String jsp_url = (String)request.getAttribute("forward") ;
   
%>
JSP-URL : <%=jsp_url%>
<jsp:forward page="<%=jsp_url%>" />
