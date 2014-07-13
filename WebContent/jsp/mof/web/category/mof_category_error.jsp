<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>

<HTML>
<HEAD>

<link rel="stylesheet" type="text/css" href="<mast:ui css='css-xp4.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<%
  String  message=(String)request.getAttribute("message");
  String  parentId=(String)request.getAttribute("parentId");
%>


<BODY topmargin="10px">
<html:form  name="frmList"  action="">
<widgets:container title="执行错误" >
<widgets:containbutton onclick="forQuery()" text="查询子类别"></widgets:containbutton>
<widgets:containbutton onclick="forReturn()" text="返回"></widgets:containbutton>
<html:messages></html:messages>

</widgets:container>
</html:form>
<script language="javascript">
<%if(message!=null){%>
   parent.alert('<%=message%>');
<%}%>
function forQuery(){
    document.forms[0].action ="mofcategoryquery.cmd?parentId="+'<%=parentId%>';    
    document.forms[0].submit();	
  }
function forReturn(){
    getMainFrame().location.href="jsp/content.jsp";
}
</script>
</BODY>
</HTML>

