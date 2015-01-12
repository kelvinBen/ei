<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
</HEAD>
<%
  String  message=(String)request.getAttribute("message");
%>


<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<bsp:container title="增加资源出错" >
<html:messages></html:messages>

</bsp:container>
</html:form>
<script language="javascript">
   //parent.alert('<%=message%>');
</script>
</BODY>
</HTML>

