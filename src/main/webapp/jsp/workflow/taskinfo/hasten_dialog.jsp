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
<TITLE>催办</TITLE>
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
function checkHasten(){
/*  var MESSAGE_MANAGER = document.forms[0].MESSAGE_MANAGER;
  if (trim(MESSAGE_MANAGER.value)=="")
  {
    alert("请输入催办人！");
    return false;
  }
  MESSAGE_MANAGER.value = trim(MESSAGE_MANAGER.value) ;
*/
  var INFO_NOTE = document.forms[0].INFO_NOTE;
/*  if (trim(INFO_NOTE.value)=="")
  {
    alert("请输入催办内容！");
    INFO_NOTE.focus();
    return false;
  }
  INFO_NOTE.value = trim(INFO_NOTE.value) ;
*/
	if(byteLength(INFO_NOTE.value)>350){
		alert("催办内容长度不能超过350个字符！");
		INFO_NOTE.focus();
		return false;
	}
	return true;
}
function forReturn(){
	if(!checkHasten()){
		return;
	}

	var url="taskinfo.cmd?method=hasten";
	url=url+"&SUBJECT="+document.all("SUBJECT").value;
	url=url+"&ACTIVITY_ID="+document.all("ACTIVITY_ID").value;
	url=url+"&ACTIVITY_NAME="+document.all("ACTIVITY_NAME").value;
	url=url+"&ACTIVITY_USER="+document.all("ACTIVITY_USER").value;
	url=url+"&ACTIVITY_USER_NAME="+document.all("ACTIVITY_USER_NAME").value;
	url=url+"&ACTIVATED_TIME="+document.all("ACTIVATED_TIME").value;
	url=url+"&LIMIT_TIME="+document.all("LIMIT_TIME").value;
	url=url+"&IS_OVERTIME="+document.all("IS_OVERTIME").value;
	url=url+"&IS_URGENCY="+document.all("IS_URGENCY").value;
	var MANNER_CODES=document.forms[0].MANNER_CODES;
	var msgTypes="";
	for(var i=0;i<MANNER_CODES.length;i++){
		if(MANNER_CODES[i].checked==true)
		{
			if(i>0)msgTypes=msgTypes+",";
			msgTypes+=MANNER_CODES[i].value;
		}
		
	}
	url=url+"&MANNER_CODES="+msgTypes;
	url=url+"&MESSAGE_MANAGER="+document.all("MESSAGE_MANAGER").value;
	url=url+"&INFO_NOTE="+document.all("INFO_NOTE").value;
	url=url+"&PROCESS_ID="+document.all("PROCESS_ID").value;
	url=url+"&FORM_ID="+document.all("FORM_ID").value;
	url=url+"&curFlowId="+document.all("curFlowId").value;
	url=url+"&curFlowName="+document.all("curFlowName").value;
	url=url+"&DATA_ID="+document.all("DATA_ID").value;
	url=url+"&curActDefId="+document.all("curActDefId").value;
	var f = document.getElementById("dataFrame");
	f.src = url;  
}
function fillResult(resultValue){
	alert(resultValue);
	window.close();
}
function selEmp(){
  var url ="struhelp.cmd?method=getCheckEmpRoot";      
  var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px"); 
  if (win == null)return;
  if(typeof(win)=="string" && win == ""){
	  document.all("MESSAGE_MANAGER").value="";
	  document.all("MESSAGE_MANAGER_NAME").value="";
	  document.getElementById("MESSAGE_MANAGER_IDNAME").innerHTML="";
  }else{
  
	  var x = eval("/"+MatrixCol+"/g;");
	  document.all("MESSAGE_MANAGER").value=win[0].replace(x,",");
	  document.all("MESSAGE_MANAGER_NAME").value=win[1].replace(x,",");
	  document.getElementById("MESSAGE_MANAGER_IDNAME").innerHTML=win[1].replace(x,",");
  }
//  checkinputNullInDcWork ('MESSAGE_MANAGER','MESSAGE_MANAGER_span');
}
</script>
</HEAD>

<BODY topmargin="10px">

<html:form  name="frmList"  action="">
<input type="hidden" name="actDefId" value="">
<input type="hidden" name="actDisName" value="">
<div class="btnareaCss">
		<html:button name="确定" value="确定" onclick="forReturn()"></html:button>
		<html:button name="关闭" value="关闭" onclick="javascript:window.close();"></html:button>
</div>

<div align="center">

<br><fieldset class="FieldsetCss">
	<table width="100%" cellpadding="0" class="tblContent">
		<tr>
		<td class="tdLeft">公文名称：</td>
		<td class="TdRight">
		<%
			String SUBJECT=(String)request.getAttribute("SUBJECT");
			String PROCESS_ID=(String)request.getAttribute("PROCESS_ID");
			String FORM_ID=(String)request.getAttribute("FORM_ID");
			String DATA_ID=(String)request.getAttribute("DATA_ID");
			String curFlowId=request.getParameter("curFlowId");
			String curFlowName=request.getParameter("curFlowName");
			String curActDefId=request.getParameter("curActDefId");
			if(curActDefId==null)
				curActDefId="";
		%>
		<html:hidden name="PROCESS_ID" value="<%=PROCESS_ID%>"/>
		<html:hidden name="FORM_ID" value="<%=FORM_ID%>"/>
		<html:hidden name="DATA_ID" value="<%=DATA_ID%>"/>
		<html:hidden name="curFlowId" value="<%=curFlowId%>"/>
		<html:hidden name="curFlowName" value="<%=curFlowName%>"/>
		<html:text name="SUBJECT" value="<%=SUBJECT%>" size="60"  readonly="true"/>
		<html:hidden name="curActDefId" value="<%=curActDefId%>" />
		</td>
		</tr>
		<tr>
		<td class="tdLeft">环节名称：</td>
		<td class="TdRight">
		<%
			String ACTIVITY_ID=(String)request.getAttribute("ACTIVITY_ID");
			String ACTIVITY_NAME=(String)request.getAttribute("ACTIVITY_NAME");
		%>
		<html:hidden name="ACTIVITY_ID" value="<%=ACTIVITY_ID%>"/>
		<html:text name="ACTIVITY_NAME" value="<%=ACTIVITY_NAME%>" size="50"  readonly="true"/>
		
		</td>
		</tr>
		<tr>
		<td class="tdLeft">环节处理人：</td>
		<td class="TdRight">
		<%
			String ACTIVITY_USER=(String)request.getAttribute("ACTIVITY_USER");
			String ACTIVITY_USER_NAME=(String)request.getAttribute("ACTIVITY_USER_NAME");
		%>		
		<html:hidden name="ACTIVITY_USER" value="<%=ACTIVITY_USER%>"/>
		<html:text name="ACTIVITY_USER_NAME" value="<%=ACTIVITY_USER_NAME%>" size="60"  readonly="true"/>
		
		</td>
		</tr>
		<tr>
		<td class="tdLeft">到达时间：</td>
		<td class="TdRight">
		<%
			String ACTIVATED_TIME=(String)request.getAttribute("ACTIVATED_TIME");
			
		%>	
				
		<html:text name="ACTIVATED_TIME" value="<%=ACTIVATED_TIME%>" size="50"  readonly="true"/>
		</td>
		</tr>	
		<tr>
		<td class="tdLeft">限时要求：</td>
		<td class="TdRight">
		<%
			String LIMIT_TIME=(String)request.getAttribute("LIMIT_TIME");
			if(LIMIT_TIME==null || LIMIT_TIME.length()>17)LIMIT_TIME="";
			
		%>		
		<html:text name="LIMIT_TIME" value="<%=LIMIT_TIME%>" size="50"  readonly="true"/>
		
		</td>
		</tr>
		<tr>
		<td class="tdLeft">是否已超时：</td>
		<td class="TdRight">
		<%
		String IS_OVERTIME=(String)request.getAttribute("IS_OVERTIME");
		if("0".equals(IS_OVERTIME)){
		%>
		否
		<%}else{%>
		是
		<%}%>
		<input type="hidden" name="IS_OVERTIME" value="<%=IS_OVERTIME%>">
		
		
		</td>
		</tr>	
		<tr>
		<td class="tdLeft">是否已催办：</td>
		<td class="TdRight">
		<%
		String IS_URGENCY=(String)request.getAttribute("IS_URGENCY");
		if("0".equals(IS_URGENCY)){
		%>
		否
		<%}else{%>
		是
		<%}%>
		<input type="hidden" name="IS_URGENCY" value="<%=IS_URGENCY%>">
		</td>
		</tr>									
		<tr>
		<td class="tdLeft">催办方式：</td>
		<td class="TdRight">
			<%
				List msgTypeList=(List)request.getAttribute("messageTypeList");
				for(int i=0;i<msgTypeList.size();i++){
					Map msgm=(Map)msgTypeList.get(i);
					String msgTypeId=(String)msgm.get("msgTypeId");
					String msgTypeName=(String)msgm.get("msgTypeName");
					%>
					<input type="checkbox" name="MANNER_CODES" value="<%=msgTypeId%>"><%=msgTypeName%>&nbsp;&nbsp;
					<%
				}
			%>		
		</td>
		</tr>	
		<tr>
		<td class="tdLeft">催办人：</td>
		<td class="TdRight">
		<input type="hidden" name="MESSAGE_MANAGER" value=""><input type="hidden" name="MESSAGE_MANAGER_NAME" value=""><img src="skins/default/images/liulan.gif" style="cursor:hand" border="0" onclick="selEmp()"><span id="MESSAGE_MANAGER_IDNAME"></SPAN>
		</td>
		</tr>
	
		<tr>
		<td class="tdLeft">催办内容：</td>
		<td class="TdRight"><textarea cols="40" rows="5" name="INFO_NOTE"></textarea>
		</td>
		</tr>
		</table>
</fieldset>
</div>
<iframe id="dataFrame" style="display:none"></iframe>
</html:form>
</BODY>
</HTML>

