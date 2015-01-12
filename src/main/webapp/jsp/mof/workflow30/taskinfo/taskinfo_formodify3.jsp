<%@ page contentType="text/html;charset=gb2312" %>

 

<%
   String jsp_url = "/"+(String)request.getAttribute("formHtml") ;
   RequestDispatcher dispatcher = request.getRequestDispatcher(jsp_url);
 
   request.removeAttribute("__bsp_integration_fitlerapplied");
    
   dispatcher.forward(request, response);
%>

 

 