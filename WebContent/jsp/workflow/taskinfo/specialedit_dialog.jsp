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
<TITLE>�༭��</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='grid.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript">
function forReturn(){
	window.returnValue = document.all("approveRemark").value
	window.close();
}
function load() {
	if (window.dialogArguments != null) {
		document.all("approveRemark").value = window.dialogArguments;
	}
}
</script>
</HEAD>
<BODY topmargin="10px" onload="load()">

<html:form  name="frmList"  action="">
<table width="100%" class="TabTitleCss" cellspacing=0 cellpadding=0>
	<TR>
		<TD><img src="<%=SkinUtils.getImage(request, "hdReport.gif")%>"	>��д����</td>
	</tr>
</table>
<div class="btnareaCss">
	<html:button name="ȷ��" value="ȷ��" onclick="forReturn()"></html:button>
	<html:button name="ȡ��" value="ȡ��" onclick="javascript:window.close();"></html:button>
</div>
<fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
			<td class="TdRight">
				<TEXTAREA name="approveRemark" rows="8" cols="60"></TEXTAREA>
	        </td>
		</tr> 
	</table>
</fieldset>
</html:form>
</BODY>
</HTML>