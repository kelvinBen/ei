<%@ page language="java" contentType="text/html;charset=GBK"%>
<%
  String html ="/"+ (String)request.getAttribute("formHtml");
%>
<jsp:forward page="<%=html%>" />