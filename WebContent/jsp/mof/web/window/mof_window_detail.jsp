<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<HTML>
<HEAD>
<TITLE>窗口明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<%
String refreshId=(String)request.getAttribute("refreshId");
if (refreshId==null||refreshId.equals("")){
    refreshId="";
}
%>
<html:form  name="frmList"  action="">
<widgets:container title="窗口明细" >
<widgets:containbutton text="修改" onclick="forUpdate()"></widgets:containbutton>
<widgets:containbutton text="返回" onclick="forReturn()"></widgets:containbutton>
<div align="center">
  <table width="100%" cellpadding="0" class="tblContent">
	<html:hidden name="mofWindowId" property="mofWindowId" write="false"/>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.NAME")%>：</td>
	<td class="tdRight"><html:hidden name="name" property="name" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.DESCRIPTION")%>：</td>
	<td class="tdRight"><html:hidden name="description" property="description" write="true"/></td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.ISACTIVE")%>：</td>
	<td class="tdRight">
	<html:label name="isactive" property="isactive" collection="MOFWINDOW_ISACTIVE_COLLECTION" labelProperty="value" labelKey="key" />
	</td>
	</tr>
	<tr>
	<td class="tdTitle"><%=ResourcesFactory.getString("MOF_WINDOW.FILTER")%>：</td>
	<td class="tdRight"><html:hidden name="filter" property="filter" write="true"/></td>
	</tr>
  </table>
</div>
</widgets:container>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  document.forms[0].action ="mofwindow.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
  document.forms[0].action ="mofwindowquery.cmd";
  document.forms[0].submit();	
}
function init(){
    var refreshId ="<%=refreshId%>";
    if (refreshId!=null&&refreshId!=""&&refreshId!=undefined){
        if(getTreeFrame().seltree)
            getTreeFrame().seltree.refreshNodeById(refreshId); 
    }
 }
 init();
</script>