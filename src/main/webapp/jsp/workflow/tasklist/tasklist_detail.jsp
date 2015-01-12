<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>保留域明细</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px" onload="setTitleInTreeBar('工作流－任务列表明细')">
<div class="btnareaCss">
<html:button name="修改" value="修改" onclick="forUpdate()"></html:button>&nbsp;<html:button name="返回"  value="返回"onclick="forReturn()"></html:button>
</div>
<%
String processtype=(String)request.getSession().getAttribute("tasklist_processtype");
%>
<html:form  name="frmList"  action="">
<fieldset class="FieldsetCss">

 <table width="100%" cellpadding="0" class="tblContent" cellspacing="0">

<input type="hidden" name="processtype" value="<%=processtype%>">


		<html:hidden name="tasklistPK" property="field-id" write="false"/></td>
		
		<tr>
			<td class="TdLeft">显示名称：</td>
			<td class="TdRight"><html:hidden name="title" property="title" write="true"/></td>
		</tr>
		<tr>
			<td class="TdLeft">序号：</td>
			<td class="TdRight"><html:hidden name="index" property="index" write="true"/></td>
		</tr> 				                  
		<tr>
			<td class="TdLeft">html样式：</td>
			<td class="TdRight"><html:hidden name="html-style" property="html-style" write="true"/></td>
		</tr> 	
		<tr>
			<td class="TdLeft">是否保留域：</td>
			<td class="TdRight"><html:hidden name="isReservedName" property="isReservedName" write="true"/></td>
		</tr> 
  </table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forUpdate(){
  
  document.forms[0].action ="tasklist.cmd?method=forupdate";
  document.forms[0].submit();	
}
function forReturn(){
 
  document.forms[0].action ="tasklistquery.cmd";
  document.forms[0].submit();	
}
</script>