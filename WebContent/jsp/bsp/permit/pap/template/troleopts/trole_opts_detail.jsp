<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<HTML>
<HEAD>
<TITLE>��Ȩģ���ɫ��Դ��ѯ</TITLE>
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

