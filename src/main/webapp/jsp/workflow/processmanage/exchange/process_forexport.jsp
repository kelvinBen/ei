<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>

<BODY topmargin="10px">
<%
String processDefId=request.getParameter("processDefId");
String processDefName=request.getParameter("processDefName");
String formname=request.getParameter("formname");
String formId=request.getParameter("formId");
String organ=request.getParameter("organ");
String proctype=request.getParameter("proctype");
%>
<html:form  name="frmList"  action="">
<div class="btnareaCss">
<html:button name="导出流程" value="导出流程" onclick="doexport()"></html:button>&nbsp;<html:button name="返回" value="返回" onclick="back()"></html:button>
</div>
<html:hidden name="processDefName" value="<%=processDefName%>" />
<html:hidden name="processDefId" value="<%=processDefId%>" />
<html:hidden name="formname" value="<%=formname%>" />
<html:hidden name="formId" value="<%=formId%>" />
<html:hidden name="organ" value="<%=organ%>" />
<html:hidden name="proctype" value="<%=proctype%>" />

<fieldset class="FieldsetCss">
<table  cellpadding="0" cellspacing="0" class="tblContent">
	<tr>
	<td class="tdTitle">流程名称：</td>
	<td class="tdRight"><%=processDefName%></td>
	</tr>
	<tr>
	<td class="tdTitle">流程ID：</td>
	<td class="tdRight"><%=processDefId%></td>
	</tr>
	<tr>
	<td class="tdTitle">表单名称：</td>
	<td class="tdRight"><%=formname%></td>
	</tr>
	<tr>
	<td class="tdTitle">表单ID</td>
	<td class="tdRight"><%=formId%></td>
	</tr>
	<tr>
	<td class="tdTitle">组织机构</td>
	<td class="tdRight"><%=organ%></td>
	</tr>



</table>
</fieldset>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function doexport() {
  document.forms(0).action ="processExchange.cmd?method=export";  
  document.forms(0).submit();
}
function back() {
  document.forms[0].action ="processquery.cmd?clear=true";  
  document.forms[0].submit();
}
</script>