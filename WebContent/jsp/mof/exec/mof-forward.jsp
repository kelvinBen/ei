<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.Map,net.mast.mof.exec.MofCommand" %>
<%
   String jsp_url = "make/"+(String)request.getAttribute("forward") ;
   //RequestDispatcher dispatcher = request.getRequestDispatcher(jsp_url);
   //System.out.println("dispatcher: " + dispatcher );
   
   //System.out.println("Jsp-url: " + jsp_url );
   //dispatcher.forward(request, response);
%>
<jsp:forward page="<%=jsp_url%>" />