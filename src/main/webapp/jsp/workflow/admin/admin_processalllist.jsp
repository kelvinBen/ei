<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.WfConstants"%>
<%@ page import="com.lc.dcwork.util.MatrixHref"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript">
function selectProcResRequester(){
	var url ="jsp/help.jsp?url=wf_struhelp.cmd&method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=1";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:550px");
	if(win==null)return;
	if(win.length == 0){
		document.forms[0].procResRequester_search.value="";
		document.forms[0].procResRequester_name.value="";
		document.getElementById("procResRequesterIdName").innerHTML="";
	}else{
		document.forms[0].procResRequester_search.value=win[0]["primary-value"];
		document.forms[0].procResRequester_name.value=win[0]["display-str"];
		document.getElementById("procResRequesterIdName").innerHTML="<span nowrap='true'><a href=\""+win[0]["display-url"]+"\">"+win[0]["display-str"];+"</a></span>";
	}
}
</script>
</HEAD>

<BODY topmargin="10px" >
<div class="btnareaCss">
<!--<html:button onclick="startActivity()" name="btn_startAct" value="启动环节"></html:button>-->

<html:button onclick="forSuspend()" name="btn_suspend" value="挂起"></html:button>
<html:button onclick="forResume()" name="btn_resume" value="恢复"></html:button>
<html:button onclick="forAbort()" name="btn_abort" value="中断"></html:button>
<html:button onclick="forTerminate()" name="btn_terminate" value="终止"></html:button>
<html:button onclick="forTerminateAndDelete()" name="btn_terminate" value="终止并删除"></html:button>
<html:button onclick="forCheckLimit()" name="btn_checklimit" value="超时检查"></html:button>

<html:button onclick="openFlow()" name="btn_openflow" value="流转状态"></html:button>
<html:button onclick="showHistory()" name="btn_showhistory" value="流转历史"></html:button>

<html:button onclick="forReturn()" name="btn_return" value="返回"></html:button>
</div>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";

Map stateMap = new HashMap();
	stateMap.put("0", "启用");
	stateMap.put("1", "停用");
	request.setAttribute("statelist", stateMap);
	Map onlynewMap = new HashMap();
	onlynewMap.put("0", "否");
	onlynewMap.put("1", "是");
	request.setAttribute("onlynewlist", onlynewMap);
	
String subject_search=request.getParameter("subject_search");
if(subject_search==null)subject_search="";
String procDefName_search=request.getParameter("procDefName_search");
if(procDefName_search==null)procDefName_search="";
String state_search=request.getParameter("state_search");
if(state_search==null)state_search="";
String onlynew_search=request.getParameter("onlynew_search");
if(onlynew_search==null)onlynew_search="";
String procResRequester_search=request.getParameter("procResRequester_search");
if(procResRequester_search==null) procResRequester_search="";
String procResRequester_name=request.getParameter("procResRequester_name");
if(procResRequester_name==null) procResRequester_name="";
String startTime_beagin=request.getParameter("startTime_beagin");
if(startTime_beagin==null)startTime_beagin="";
String startTime_end=request.getParameter("startTime_end");
if(startTime_end==null)startTime_end="";
%>

<html:form name="frmList" action="">

<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch" class="tblContent">
<flex:search>

	<tr>			
	<td class="tdTitle" style="width:100">标题:</td>
	<td class="tblContent" width="190"><html:text name="subject_search" value="<%=subject_search%>" size="15"></html:text></td>
    <td class="tdTitle" style="width:100">流程名称:</td>
    <td class="tblContent" width="190"><html:text name="procDefName_search" value="<%=procDefName_search%>" size="15"></html:text></td>
	<td class="tdTitle" style="width:190">只显示最新版本:</td>
	<td class="tblContent" width="190">
	    <flex:searchSelect name="onlynew_search" labeltitle="" size="1" searchName="processmgr.onlynew" dataType="java.lang.String" operSymbol="=" value="<%=onlynew_search%>">
		<html:options collection="onlynewlist" labelProperty="value" property="key"/>
		</flex:searchSelect>
    </td>
	</tr>
		<tr>
	<td class="tdTitle"  style="width:100" >开始时间：</td>
	<td class="tblContent" style="width:300;height:20" valign="top" ><date:date name="startTime_beagin"
				zindex="199" divname="BEGINTIMEdd" sourceFormat="yyyy-MM-dd hh:mm"
				targetFormat="yyyy-MM-dd hh:mm" hastime="true" value='<%=startTime_beagin%>'
				readonly="true"></date:date>
	</td>
	<td class="tdTitle"  style="width:100" >至：</td>
	<td class="tblContent" vAlign="top" style="width:300;height:20"><date:date name="startTime_end"
				zindex="118" divname="ENDTIMEdd" sourceFormat="yyyy-MM-dd hh:mm"
				targetFormat="yyyy-MM-dd hh:mm" hastime="true" value='<%=startTime_end%>'
				readonly="true" ></date:date></td>	
					<td class="tdTitle" style="width:100">发起人：</td>
	<td class="tblContent" width="190">
		<html:hidden name="procResRequester_search" value='<%=procResRequester_search%>' write="false"/>
        <html:hidden name="procResRequester_name" value='<%=procResRequester_name%>' write="false"/>
        <img src="skins/default/images/liulan.gif" onclick="selectProcResRequester()" style="cursor:hand;" border="0"><span id="procResRequesterIdName"></span></td>
    </tr>
	<tr>
    <td class="tdTitle" style="width:100">流程状态：</td>
	<td class="tblContent" width="190"  >
	    <flex:searchSelect name="state_search" labeltitle="" size="1" searchName="processmgr.state" dataType="java.lang.String" operSymbol="=" value="<%=state_search%>">
		<html:option value=""></html:option>
		<html:options collection="statelist" labelProperty="value" property="key"/>
		</flex:searchSelect>	
    <td align="center" ><flex:searchNoPageImg name="chaxun" action="processalladminquery.cmd" imgClick="if(forimgClick()) return false;" image="search.gif"/></td>
    </td>
    </tr>

</flex:search>
</table>

</fieldset></div>
<input type="hidden" name="wfmgrname" value="">
<input type="hidden" name="processId" value="">
<flex:flexgrid name="grid" height="300" action="" isSubmit="false">
						  <flex:checkboxCol caption="选择" width="35" property="procKey"  name="primaryKey" sortName="a.procKey"></flex:checkboxCol>
                          <flex:flexCol caption='标题' width="100" property="subject" sortName="a.procName"></flex:flexCol>
                          <flex:flexCol caption='流程名称' width="100" property="procName" sortName="a.procName" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='流程名称' width="250" property="procName" sortName="a.procName"></flex:flexCol>
                          <flex:flexCol caption='流转状态' width="100" property="procStateCode" sortName="a.procStateCode" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='流转状态' width="100" property="procState" sortName="a.procState"></flex:flexCol>
                          <flex:flexCol caption='发起人' width="100" property="procResRequesterId" sortName="a.procName" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='发起人' width="100" property="procResRequesterName" sortName="a.procName"></flex:flexCol>
                          <flex:flexCol caption='开始时间' width="100" property="startTime" sortName="a.startTime"></flex:flexCol>
                          <flex:flexCol caption='流程类型ID' width="100" property="procType" sortName="a.procType" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='流程类型' width="100" property="procTypeName" sortName="a.procTypeName"></flex:flexCol>
                          <flex:flexCol caption='所属机构ID' width="100" property="procOrg" sortName="a.procOrg" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='所属机构' width="100" property="procOrganName" sortName="a.procOrganName"></flex:flexCol>
                          <flex:flexCol caption='流程key' width="100" property="procKey" sortName="a.procKey" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='流程管理器Id' width="100" property="mgrname" sortName="a.mgrname" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="processalladminquery.cmd">
</flex:pagePolit>

</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-流程实例列表");
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var processId=grid.getCellValue(i, 1);
		var procName=grid.getCellValue(i, 3);
		var subject = grid.getCellValue(i,2);
		grid.getCell(i, 4).innerHTML ="<span nowrap='true'><a href=\"javascript:getActivityList('"+processId+"')\">"+procName+"</a></span>";
		grid.getCell(i, 2).innerHTML ="<span nowrap='true'><a href=\"javascript:getActivityList('"+processId+"')\">"+subject+"</a></span>";
		var resRequesterId = grid.getCellValue(i, 7);
		var resRequesterName = grid.getCellValue(i,8);
		
}
var procResRequesterId=document.all("procResRequester_search").value;
var procResRequesterName=document.all("procResRequester_name").value;
document.getElementById("procResRequesterIdName").innerHTML="<span nowrap='true'><a href=\"hrPerson.cmd?method=detail&primaryKey="+procResRequesterId+"\">"+procResRequesterName+"</a></span>";

function getActivityList(processId){
	document.all("processId").value=processId;
  document.forms[0].action ="wfadminquery.cmd?method=getActivityList&returnType=processall";  
  
  document.forms[0].submit();	
}
function forSuspend(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"==stateCode){
		  	alert("流程实例["+procName+"]已经挂起，不允许重复挂起！");
		  	return;
		  }
		if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN_NOT_RUNNING%>")!=-1){
		  	alert("流程实例["+procName+"]没有处于运行状态，不允许挂起！");
		  	return;
		  }
  }
	document.forms[0].action ="processalladmin.cmd?method=suspendProcess";  
	document.forms[0].submit();	
}
function forResume(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"!=stateCode){
		  	alert("流程实例["+procName+"]没有处于挂起状态，不允许恢复！");
		  	return;
		  }
		
  }  
document.forms[0].action ="processalladmin.cmd?method=resumeProcess";  
document.forms[0].submit();	
}
function forAbort(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  if(!confirm("该操作不可恢复，是否继续？"))return;
document.forms[0].action ="processalladmin.cmd?method=abortProcess";  
document.forms[0].submit();	
}
function forTerminate(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  if(!confirm("该操作不可恢复，是否继续？"))return;
document.forms[0].action ="processalladmin.cmd?method=terminateProcess";  
document.forms[0].submit();	
}
function forTerminateAndDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  if(!confirm("该操作不可恢复，是否继续？"))return;
  document.forms[0].action ="processalladmin.cmd?method=terminateProcessAndDeleteProcessEnd";  
  document.forms[0].submit();	
}
function forCheckLimit(){
document.forms[0].action ="processalladmin.cmd?method=checklimitProcess";  
document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var sel=grid.getCheckLine();
var url="taskinfo.cmd?method=displaystatus&processId="+sel;
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function showHistory(){
if(!getSelect())return;

document.forms[0].action ="processalladmin.cmd?method=showhistoryProcess&processId="+grid.getCheckLine();  
document.forms[0].submit();	
}
function forHistoryCompare(){
alert("未完成！");
}
function forReturn(){
	document.forms[0].action ="processmgradminquery.cmd?clear=true";
	document.forms[0].submit();	
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("请选择一条记录!");
    return false;
  }  
  return true;
}
function startActivity(){
	if(!getSelect())return;
	var processId=grid.getCheckLine();
	var actDefId=window.prompt("请输入要启动实例的环节定义ID:","");
	if(actDefId==null || actDefId=="")
		return ;
	document.forms[0].action ="processalladmin.cmd?method=startActivity&processId="+processId+"&actDefId="+actDefId;  
	document.forms[0].submit();	
}

function getMgrName(){
    var row=grid.getCheckLineNo();      
    var obj=row.split(",");
    for(var i=0;i<obj.length;i++){
    	var line = obj[i]*1;
    	if(grid.getCellValue(line,14)!="草稿"){
    	  	alert("您只能对草稿状态下的记录进行删除,您选择的记录中含有其他状态！");
  			return;
    	}
	}
}

function forimgClick(){
	var startTime_beagin=document.all("startTime_beagin").value;
	var startTime_end=document.all("startTime_end").value;
	if(startTime_beagin!="" && startTime_end!=""){
		if(startTime_beagin>startTime_end){
			alert("结束日期不能小于开始日期！");
			return true;
		}
	}
	return false;
}

</script>