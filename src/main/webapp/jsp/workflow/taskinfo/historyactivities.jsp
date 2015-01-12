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
<TITLE>退回</TITLE>
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
	
	var rightOpts=document.all("rightOpts");
	
	var lens=rightOpts.options.length;
	if(lens==0){
		alert("请选择退回目标环节参与者！");
		return;
	}
	var result = new Array();
	result[0]=actDefId;
	result[1]=actDisName;
	var actUserIds="";
	var actUserNames="";
	for(var i=0;i<lens;i++)
	{
		var actUserName=rightOpts.options[i].innerText;
		var actUserId=rightOpts.options[i].value;	 	
	 	if(actUserIds!="") actUserIds=actUserIds+",";
	  		actUserIds=actUserIds+actUserId;
	 	if(actUserNames!="") actUserNames=actUserNames+",";
	  		actUserNames=actUserNames+actUserName;	  		
	 
	}	
	result[2]=actUserIds;
	result[3]=actUserNames;	
	result[4]=document.forms[0].reason.value;
	if(document.forms[0].reason.value.length>350){
		alert("操作原因内容长度不能超过350个字符！");
		document.forms[0].reason.focus();
		return;
	}
	result[5]=document.forms[0].limitTimeUnit.value;
	result[6]=document.forms[0].limitTime.value;
	result[7]=document.forms[0].warnTime.value;
	window.returnValue = result;
	window.close();
}
function actsChange(){
var leftOpts=document.all("leftOpts");
	var lens=leftOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
		leftOpts.options.remove(i);
	}
var rightOpts=document.all("rightOpts");
	var lens=rightOpts.options.length;
	for(var i=lens-1;i>=0;i--)
	{
		rightOpts.options.remove(i);
	}

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
	 	else{
	 		var usersArray=actsArray[i].split(",");
	 		for(var j=0;j<usersArray.length;j++){
	 			var userArray=usersArray[j].split("&");
	 			var actUserId=userArray[0];
	 			var actUserName=userArray[1];
	 			
	 			var opn=document.createElement("<OPTION>");
	 			leftOpts.options.add(opn);
	 			opn.innerText=actUserName;
	 			opn.value=actUserId;
	 		
	 		}
	 	}		
	}
document.forms[0].actDefId.value=actDefId;
document.forms[0].actDisName.value=actDisName;

}
function moveRight(){

	var leftOpts=document.all("leftOpts");
	var rightOpts=document.all("rightOpts");
	var lens=leftOpts.options.length;
	for(var i=0;i<lens;i++)
	{
	
	   if(leftOpts.options[i].selected)
	   {
	 	
	 			var opn=document.createElement("<OPTION>");
	 			rightOpts.options.add(opn);
	 			opn.innerText=leftOpts.options[i].innerText;
	 			opn.value=leftOpts.options[i].value;	 	
	 	
	   }
	 
	}
		
	for(var i=lens-1;i>=0;i--)
	{
	
	 if(leftOpts.options[i].selected)
	 {
	 	
	 	leftOpts.options.remove(i);
	 	
	 }
	 
	}
	lens=leftOpts.options.length;
	if(lens>0) leftOpts.options[lens-1].selected=true;


	
}
function moveLeft(){
	var leftOpts=document.all("leftOpts");
	var rightOpts=document.all("rightOpts");
	var lens=rightOpts.options.length;
	for(var i=0;i<lens;i++)
	{
	
	   if(rightOpts.options[i].selected)
	   {
	 	
	 			var opn=document.createElement("<OPTION>");
	 			leftOpts.options.add(opn);
	 			opn.innerText=rightOpts.options[i].innerText;
	 			opn.value=rightOpts.options[i].value;	 	
	 	
	   }
	 
	}
		
	for(var i=lens-1;i>=0;i--)
	{
	
	 if(rightOpts.options[i].selected)
	 {
	 	
	 	rightOpts.options.remove(i);
	 	
	 }
	 
	}
	lens=rightOpts.options.length;
	if(lens>0) rightOpts.options[lens-1].selected=true;
}
function moveUp(){
  var selOpts=document.all("rightOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  for(var i=1;i<len;i++){
  	if(selOpts.options[i].selected){
		  //生成
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  
		  selOpts.options(i).innerText = selOpts.options(i-1).innerText;
		  selOpts.options(i).value = selOpts.options(i-1).value;
		 
		  
		  selOpts.options(i-1).innerText = tmpOption.innerText;
		  selOpts.options(i-1).value =  tmpOption.value;
		 
		  selOpts.options(i-1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
  }	
}
function moveDown(){
  var selOpts=document.all("rightOpts");
  var selIndex = selOpts.selectedIndex;
  if(selIndex==-1)return;
  var len = selOpts.length;
  	
  if(selIndex==len-1)return;
  var len = selOpts.length;
  for(var i=len-2;i>=0;i--){
  	
  	if(selOpts.options[i].selected){
		  //生成
		  var tmpOption = document.createElement(selOpts.options(i).nodeName);
		  
		  tmpOption.innerText=selOpts.options(i).innerText;
		  tmpOption.value=selOpts.options(i).value;
		 
		  
		  selOpts.options(i).innerText = selOpts.options(i+1).innerText;
		  selOpts.options(i).value = selOpts.options(i+1).value;
		 
		  
		  selOpts.options(i+1).innerText = tmpOption.innerText;
		  selOpts.options(i+1).value =  tmpOption.value;
		 
		  selOpts.options(i+1).selected = true;
		  selOpts.options(i).selected = false;  		
  	}
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
						List actUsers=(List)am.get("actUsers");
						String users="";
						for(int j=0;j<actUsers.size();j++){
							Map um=(Map)actUsers.get(j);
							String actUserId=(String)um.get("actUserId");
							String actUserName=(String)um.get("actUserName");
							if(!users.equals("")) users=users+",";
							users=users+actUserId+"&"+actUserName;
						}
						
						String selected="";
						if(i==0) 
							selected=" selected ";
						else
							selected="";
					%>
					<option value="<%=actDefId%>:<%=actDisName%>:<%=users%>" <%=selected%>><%=actDisName%></option>
					<%	

					}
				%>
			 </select>	 
	        </td>
		</tr> 
			                  
	</table>
		<table width="100%" cellpadding="0" class="tblContent">
		<tr>
		<td align=center>
			<select name="leftOpts"  size="10"  style="width:100" multiple="multiple">
			</select>	
		</td>
		<td align=center>
			<html:button name="btnUp" value="∧" onclick="moveUp()"></html:button>
			<br><br>
			<html:button name="btnRight" value="＞" onclick="moveRight()"></html:button>
			<br><br>
			<html:button name="btnLeft" value="＜" onclick="moveLeft()"></html:button>
			<br><br>
			<html:button name="btnDown" value="∨" onclick="moveDown()"></html:button>		
		</td>
		<td align=center>
		<select name="rightOpts"  size="10"  style="width:100" multiple="multiple">
		</select>	
		</td>		
		</tr> 			
		</table>	
		
		<table width="100%" cellpadding="0" class="tblContent">
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
		<td class="tdLeft">退回原因：</td>
			<td class="TdRight"><textarea cols="40" rows="5" name="reason"></textarea></td></tr>
		</table>	
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
actsChange();
</script>
