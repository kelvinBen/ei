<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.web.taglib.grid.flex.*"%>	
<%@ page import="java.util.*"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>

<HTML>
<HEAD>
<TITLE>��̬��ʱ</TITLE>
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
	var result = new Array();
	//�Ƿ���Ҫ��ִ
	var revertArray=document.forms[0].revert;
	for(var i=0;i<revertArray.length;i++){
		if(revertArray[i].checked==true)
		{
			
			result[0]=revertArray[i].value;
		}
	}
	window.returnValue = result;
	window.close();
}
	
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<div class="btnareaCss">
		<html:button name="ȷ��" value="ȷ��" onclick="forReturn()"></html:button>
		<html:button name="ȡ��" value="ȡ��" onclick="javascript:window.close();"></html:button>
</div>
<div align="center">

<br><fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		
		<tr>
		<td class="tdLeft">�Ƿ���Ҫ��ִ��</td>
			<td class="TdRight"><INPUT TYPE=RADIO NAME="revert" VALUE="0" checked>�� &nbsp;&nbsp;<INPUT TYPE=RADIO NAME="revert" VALUE="1">��</td>
		</tr>	 			                  
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
