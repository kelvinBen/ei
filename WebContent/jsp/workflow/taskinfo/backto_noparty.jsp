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
<TITLE></TITLE>
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
	var actDefId=document.forms[0].actDefId.value;
	var actDisName=document.forms[0].actDisName.value;
	var result = new Array();
	result[0]=actDefId;
	result[1]=actDisName;
	result[7]=document.forms[0].limitTimeUnit.value;
	result[8]=document.forms[0].limitTime.value;
	result[9]=document.forms[0].warnTime.value;	
	window.returnValue = result;
	window.close();
}
function actsChange(){
var acts=document.forms[0].acts.value;
var actsArray=acts.split(":");
var actDefId="";
var actDisName="";
for(var i=0;i<actsArray.length;i++)
	{
	 	if(i==0) 
	 		actDefId = actsArray[i];	
	 	else if(i==1) 
	 		actDisName= actsArray[i];
	}		
document.forms[0].actDefId.value=actDefId;
document.forms[0].actDisName.value=actDisName;

}
function checkInt(){
if(window.event.srcElement.value=="")return;
if(!isInteger(window.event.srcElement)){
	alert("请输入整数！");
	window.event.srcElement.focus();
	window.event.srcElement.value="";
	
}
}
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<input type="hidden" name="actDefId" value="">
<input type="hidden" name="actDisName" value="">
<div class="btnareaCss">
		<html:button name="确定" value="确定" onclick="forReturn()"></html:button>
		<html:button name="取消" value="取消" onclick="javascript:window.close();"></html:button>
</div>
<div align="center">

<br><fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
		<td class="tdLeft">选择环节：</td>
			<td class="TdRight">
									
	          <select name="acts" onChange="actsChange()">
	         
				<%
					List nextActivities=(List)request.getAttribute("nextActivities");
					for(int i=0;i<nextActivities.size();i++){
						Map am=(Map)nextActivities.get(i);
						String actDefId=(String)am.get("actDefId");
						String actDisName=(String)am.get("actDisName");
					    String selected="";
					    if(i==0) 
						   selected="selected ";
					    else
						   selected="";
					%>
					<option value="<%=actDefId%>:<%=actDisName%>" <%=selected%>><%=actDisName%></option>
					<%	

					}
				%>
			 </select>	 
	        </td>
		</tr> 
	<tr>
		<td class="tdLeft">限时单位：</td>
			<td class="TdRight">
     <html:select name="limitTimeUnit"  property="limitTimeUnit">
        <html:options collection="WF_TASKINFO_LIMIT_TIME_UNIT_COLLECTION" property="key" labelProperty="value"/>
     </html:select> 			
			</td>
		</tr>
		<tr>
			<td class="tdLeft">限制时间：</td>
			<td class="TdRight">
			<html:text name="limitTime" property="limitTime" onblur="checkInt()"></html:text>	
			</td>
		</tr>	
		<tr>
			<td class="tdLeft">警告时间：</td>
			<td class="TdRight">
			<html:text name="warnTime" property="warnTime" onblur="checkInt()"></html:text>	
			</td>
		</tr>
		<tr>
		</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
actsChange();
</script>
