<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<HTML>
<HEAD>
<TITLE>授权模板角色资源查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<%
  String  message=(String)request.getAttribute("message");
%>
<html:messages></html:messages>
<script language="javascript">
parent.refeshwindow();
</script>
</BODY >
</HTML>

