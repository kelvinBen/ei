<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.WfConstants"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<BODY topmargin="10px" >
<div class="btnareaCss">
<html:button onclick="startActivity()" name="btn_startAct" value="启动环节"></html:button>
<html:button onclick="forSuspend()" name="btn_suspend" value="挂起"></html:button>
<html:button onclick="forResume()" name="btn_resume" value="恢复"></html:button>
<html:button onclick="forAbort()" name="btn_abort" value="中断"></html:button>
<html:button onclick="forTerminate()" name="btn_terminate" value="终止"></html:button>
<html:button onclick="showHistory()" name="btn_showhistory" value="流转历史"></html:button>

<html:button onclick="forReturn()" name="btn_return" value="返回"></html:button>
</div>
<br>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";
String processId=(String)request.getAttribute("processId");
if(processId==null)processId="";
String returnUrl = (String)request.getAttribute("returnUrl");
if(returnUrl==null) returnUrl="";

%>
<html:form name="frmList" action="">
<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="<%=processId%>">
<input type="hidden" name="returnUrl" value="<%=returnUrl%>">
<input type="hidden" name="wfactId" value="">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="选择" width="35" property="actKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
                          <flex:flexCol caption='环节名称' width="150" property="actName" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='环节名称' width="150" property="actName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='流转状态' width="100" property="actStateCode" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='流转状态' width="100" property="actState" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='任务委派数' width="100" property="assiCount" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='是否会签' width="100" property="actIsMulti" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='环节key' width="100" property="actKey" sortName="a.b" style="display:none"></flex:flexCol>
                          
                          <flex:flexCol caption='说明' width="100" property="description" sortName="a.b"></flex:flexCol>

</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-环节实例列表");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var wfactId=grid.getCellValue(i, 1);
		var actName=grid.getCellValue(i, 2);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:getAssignmentList('"+wfactId+"')\">"+actName+"</a></span>";
								
}
function getAssignmentList(wfactId){
	document.all("wfactId").value=wfactId;
  document.forms[0].action ="wfadminquery.cmd?method=getAssignmentList";  
  document.forms[0].submit();	
}
function forReturn(){
	if("<%=returnUrl%>"==""){
		document.forms[0].action ="wfadminquery.cmd?method=getProcessList&clear=true";
	}else{
		document.forms[0].action ="<%=returnUrl%>";
	}
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
  		
	  	var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"==stateCode){
		  	alert("环节实例["+actName+"]已经挂起，不允许重复挂起！");
		  	return;
		  }
		 if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN_NOT_RUNNING%>")!=-1){
		  	alert("环节实例["+actName+"]没有处于运行状态，不允许挂起！");
		  	return;
		  }
		  if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_CLOSED%>")!=-1){
		  	alert("环节实例["+actName+"]已经结束，不允许挂起！");
		  	return;
		  }
  }
document.forms[0].action ="activityadmin.cmd?method=suspendActivity";  
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
  		
	  	var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_CLOSED%>")!=-1){
		  	alert("环节实例["+actName+"]已经结束，不允许恢复！");
		  	return;
		  }
		if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"!=stateCode){
		  	alert("环节实例["+actName+"]没有处于挂起状态，不允许恢复！");
		  	return;
		  }
  }
    
document.forms[0].action ="activityadmin.cmd?method=resumeActivity";  
document.forms[0].submit();	
}
function forAbort(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
   var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN%>")==-1){
		  	alert("环节实例["+actName+"]已经结束，不允许中断！");
		  	return;
		}
		
  }  
   if(!confirm("该操作不可恢复，是否继续？"))return;
document.forms[0].action ="activityadmin.cmd?method=abortActivity";  
document.forms[0].submit();	
}
function forTerminate(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  for(var i=0;i<row.length;i++){
  		var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN%>")==-1){
		  	alert("环节实例["+actName+"]已经结束，不允许终止！");
		  	return;
		}
  }   
  if(!confirm("该操作不可恢复，是否继续？"))return;
document.forms[0].action ="activityadmin.cmd?method=terminateActivity";  
document.forms[0].submit();	
}
function showHistory(){
if(!getSelect())return;

document.forms[0].action ="activityadmin.cmd?method=showhistoryActivity";
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
	//if(!getSelect())return;
	var processId=document.all("processId").value;
	if(processId==null || processId==""){
		alert("缺少流程实例ID");
		return;
	}
	var url="jsp/help.jsp?url=jsp/workflow/help/wf_activity_radio.jsp&processId="+processId;
	var actDefId=showModalDialog(url,window,"scroll:no;status:no;dialogWidth:500px;dialogHeight:400px");
	//var actDefId=window.prompt("请输入要启动实例的环节定义ID:","");
	if(actDefId==null || actDefId=="")
		return ;
	document.forms[0].action ="activityadmin.cmd?method=startActivity&processId="+processId+"&actDefId="+actDefId;  
	document.forms[0].submit();	
}

</script>