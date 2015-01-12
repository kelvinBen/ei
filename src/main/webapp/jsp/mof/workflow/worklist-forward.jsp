<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="java.util.Map,net.mast.mof.exec.MofCommand" %>
<%@ page import="net.mast.mof.util.MultiRequestUtil"%>
<%
   String extReturnUrl = "/"+MultiRequestUtil.getParameter(request,"EXT_RETURN_URL");
   //String jsp_url = (String)request.getAttribute("forward") ;
   //RequestDispatcher dispatcher = request.getRequestDispatcher(jsp_url);
   request.removeAttribute("__bsp_integration_fitlerapplied");
   
 
   //dispatcher.forward(request, response);
%>
<jsp:forward page="<%=extReturnUrl%>" />