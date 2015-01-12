<%@ page contentType="text/html;charset=GBK" %>
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
<TITLE>发送</TITLE>
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
	if(document.forms[0].partyId.value==""){
		if(!confirm("确定不选择参与者吗？"))return;
	
	}
	var result = new Array();
	var actInfo=document.all("acts").value.split("|");
	result[0]=actInfo[0];

	result[1]=actInfo[1];
	result[2]=document.forms[0].partyId.value;
	result[3]=document.forms[0].partyName.value;	
	//是否需要回执
//	var revertArray=document.forms[0].revert;
//	for(var i=0;i<revertArray.length;i++){
//		if(revertArray[i].checked==true)
//		{
			
			result[4]="否";
	//	}
//	}
	var msgTypeArray=document.forms[0].msgType;
	var msgTypes="";
	for(var i=0;i<msgTypeArray.length;i++){
		if(msgTypeArray[i].checked==true)
		{
			if(i>0)msgTypes=msgTypes+",";
			msgTypes+=msgTypeArray[i].value;
		}
		
	}
	
	
	//消息提醒方式，字符串组合格式：typeid,typeid,......
	result[5]=msgTypes;
	window.returnValue = result;
	window.close();
}
function actsChange(){
document.forms[0].partyId.value="";
document.forms[0].partyName.value="";
document.getElementById("partysIdName").innerHTML="";
}

function doimgclickt(){
	
	<%
	    String t_processId = request.getParameter("processId");
       // String t_curActDefId = request.getParameter("curActDefId");
	%>
	var actInfo=document.all("acts").value.split("|");
	var haveSelect="";
	if(document.forms[0].partyId.value!=""){
		var ids=document.forms[0].partyId.value.split(","); 
		var names=document.forms[0].partyName.value.split(","); 
		
		for(var i=0;i<ids.length;i++){
			if(i>0)haveSelect+="|";
			
			haveSelect+=ids[i]+","+names[i];
		}	
	}
	var url ="jsp/help.jsp?url=partynextactivityquery.cmd&clear=true&processId=<%=t_processId%>&curActDefId=" + actInfo[0]+"&haveSelect="+haveSelect;      
  	
  	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:650px;dialogHeight:500px");
 	 var curobj=window.event.srcElement;
 	 if(win==null)return;
  	 var result=parseTree(win);
  	document.forms[0].partyId.value=result[0];
  	document.forms[0].partyName.value=result[1];
 	curobj.nextSibling.innerHTML=result[1];
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
<div class="btnareaCss">
		<html:button name="确定" value="确定" onclick="forReturn()"></html:button>
		<html:button name="取消" value="取消" onclick="javascript:window.close();"></html:button>
</div>
<div align="center">

<br><fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
       <tr>
		<td class="tdLeft">选择消息提醒：</td>
		
			<td class="TdRight">			
			<%
				List msgTypeList=(List)request.getAttribute("messageTypeList");
				for(int i=0;i<msgTypeList.size();i++){
					Map msgm=(Map)msgTypeList.get(i);
					String msgTypeId=(String)msgm.get("msgTypeId");
					String msgTypeName=(String)msgm.get("msgTypeName");
					%>
					<input type="checkbox" name="msgType" value="<%=msgTypeId%>"><%=msgTypeName%>&nbsp;&nbsp;
					<%
				}
			%>
			</td>
		</tr>			
		<tr>
		<td class="tdLeft">选择环节：</td>
			<td class="TdRight">
									
	          <select name="acts" onChange="actsChange()">
	         
				<%
					List nextActivities=(List)request.getAttribute("nextActivities");
					for(int i=0;i<nextActivities.size();i++){
						Map am=(Map)nextActivities.get(i);
						String actDefId=(String)am.get("activityDefId");
						String actDisName=(String)am.get("activityDefName");
						String limitTime=(String)am.get("limitTime");
						String warnTime=(String)am.get("warnTime");
						String durationUnit=(String)am.get("durationUnit");
					%>
					
					<option value="<%=actDefId%>|<%=actDisName%>|<%=limitTime%>|<%=warnTime%>|<%=durationUnit%>"><%=actDisName%></option>
					<%	

					}
				%>
			 </select>	 

	        </td>
		</tr> 
		<tr>
		<td class="tdLeft">选择参与者：</td>
			<td class="TdRight">
			     <input type="hidden" name="partyId" value="">
                 <input type="hidden" name="partyName" value="">
                   	 <img src="skins/default/images/liulan.gif" onclick="doimgclickt()" style="cursor:hand;" border="0"><span id="partysIdName"></span>
	        </td>
		</tr>
	</table>
</fieldset>
</div>
</html:form>
</BODY>
</HTML>
<script language="javascript">
actsChange();
</script>
