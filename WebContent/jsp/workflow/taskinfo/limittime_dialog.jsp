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

	result[0]=document.forms[0].limitTimeUnit.value;
	result[1]=document.forms[0].limitTime.value;
	result[2]=document.forms[0].warnTime.value;
	window.returnValue = result;
	window.close();
}

function checkInt(){
if(window.event.srcElement.value=="")return;
if(!isInteger(window.event.srcElement)){
	alert("������������");
	window.event.srcElement.focus();
	window.event.srcElement.value="";
	
}
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
		<td class="tdLeft">��ʱ��λ��</td>
			<td class="TdRight">
     <html:select name="limitTimeUnit"  property="DCWORK_ACTIVITY_DURATION_UNIT">
        <html:options collection="WF_TASKINFO_LIMIT_TIME_UNIT_COLLECTION" property="key" labelProperty="value"/>
     </html:select> 			
			</td>
		</tr>
		<tr>
			<td class="tdLeft">����ʱ�䣺</td>
			<td class="TdRight">
			<html:text name="limitTime" property="DCWORK_ACTIVITY_LIMIT_TIME" onblur="checkInt()"></html:text>	
			</td>
		</tr>	
		<tr>
			<td class="tdLeft">����ʱ�䣺</td>
			<td class="TdRight">
			<html:text name="warnTime" property="DCWORK_ACTIVITY_WARN_TIME" onblur="checkInt()"></html:text>	
			</td>
		</tr>	 			                  
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
