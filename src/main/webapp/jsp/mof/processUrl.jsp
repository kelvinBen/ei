<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.Map,net.mast.mof.exec.MofCommand" %>
<%
   String url = (String)request.getAttribute("forward") ;
	System.out.println("URL: " + url);
   //RequestDispatcher dispatcher = request.getRequestDispatcher(jsp_url);
   //System.out.println("dispatcher: " + dispatcher );
   
   //System.out.println("Jsp-url: " + jsp_url );
   //dispatcher.forward(request, response);
%>
<jsp:forward page="<%=url%>" />