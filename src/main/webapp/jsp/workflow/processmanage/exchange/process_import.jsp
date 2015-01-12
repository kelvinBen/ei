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
	String proctype=(String)request.getAttribute("proctype");
	String processDefId=(String)request.getAttribute("processDefId");
	String processDefName=(String)request.getAttribute("processDefName");
	String formname=(String)request.getAttribute("formname");
	String formId=(String)request.getAttribute("formId");
	String organ=(String)request.getAttribute("organ");

%>
<html:form  name="frmList"  action="">
<div class="btnareaCss">
<html:button name="确定" value="确定" onclick="forReturn()"></html:button>
</div>

<fieldset class="FieldsetCss">
<table  cellpadding="0" cellspacing="0" class="tblContent">
	<tr>
	<td class="tdTitle">流程类型：</td>
	<td class="tdRight"><%=proctype%></td>
	</tr>
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
<html:messages></html:messages>
</html:form>
</BODY>
</HTML>
<script language="javascript">
function forReturn() {
  document.forms(0).action ="processquery.cmd?clear=true";  
  document.forms(0).submit();
}

</script>