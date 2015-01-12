<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<%
//	Map stateMap = new HashMap();
//		stateMap.put("0", "启用");
//		stateMap.put("1", "停用");
//		request.setAttribute("statelist", stateMap);
//		Map onlynewMap = new HashMap();
//		onlynewMap.put("0", "否");
//		onlynewMap.put("1", "是");
//		request.setAttribute("onlynewlist", onlynewMap);
		
String process_name=request.getParameter("PROCESS_NAME");
if(process_name==null)process_name="";
String state_search=request.getParameter("CURRENT_STATE"); 
if(state_search==null)state_search="";
String onlynew_search=request.getParameter("onlynew_search");
if(onlynew_search==null)onlynew_search="";
%>
<BODY topmargin="10px" >
<div class="btnareaCss">

<!--<html:button onclick="forUpload()" name="btn_upload" value="导入"></html:button> 
<html:button onclick="forProcess()" name="btn_process" value="查看流程实例"></html:button>-->
<html:button onclick="forStart()" name="btn_start" value="启动"></html:button>
<html:button onclick="forStop()" name="btn_stop" value="停止"></html:button>
<html:button onclick="forDelete()" name="btn_delete" value="删除"></html:button>
<!--  
<html:button onclick="forEndList()" name="btn_endlist" value="查看结束流程"></html:button>-->
<bsp:button onclick="forActivityLastTime()" action="wflasttime.cmd?method=activityLastTime" name="btn_activitylasttime" value="环节平均持续时间"></bsp:button>
</div>
<br>
<html:messages/>
<html:form name="frmList" action="">
<input type="hidden" name="wfmgrname" value="">

<table id="tblSearch">
<flex:search>
	<tr>
 
    <td>
    流程名称：<flex:searchText name="PROCESS_NAME" searchName="WF_PROCESS_MGR.PROCESS_NAME" dataType="java.lang.String" operSymbol="=" value="<%=process_name%>" size="12"/>
    </td>

    <td>只显示最新版本:
    <flex:searchSelect name="onlynew_search" labeltitle="" size="1" searchName="processmgr.onlynew" dataType="java.lang.String" operSymbol="=" value="<%=onlynew_search%>">
	<html:option value=""></html:option>
	<html:option value="1">是</html:option>
	<html:option value="0">否</html:option>
	</flex:searchSelect>
    </td>  
    <td>状态：
    <flex:searchSelect name="CURRENT_STATE" labeltitle="" size="1" searchName="processmgr.state" dataType="java.lang.String" operSymbol="=" value="<%=state_search%>">
	<html:option value=""></html:option>
	<html:option value="0">启用</html:option>
	<html:option value="1">停用</html:option>
	</flex:searchSelect>
	
    </td>
    
    <td><flex:searchImg name="chaxun" action="processmgradminquery.cmd?clear=true" image="search.gif"/></td>
	</tr>
</flex:search>
</table>

<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
  <flex:checkboxCol caption="选择" width="35" property="name"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
  <flex:flexCol caption='流程ID' width="300" property="processDefinitionId" sortName="WF_PROCESS_MGR.PROCESS_NAME" style="display:none" canSort="false"></flex:flexCol>
  <flex:flexCol caption='流程名称' width="300" property="processDisName" sortName="WF_PROCESS_MGR.PROCESS_NAME" canSort="false"></flex:flexCol>
  <flex:flexCol caption='流程版本' width="100" property="version" sortName="WF_PROCESS_MGR.PROC_VERSION"></flex:flexCol>
  <flex:flexCol caption='流程状态' width="100" property="state" sortName="a.b" style="display:none"></flex:flexCol>

  <flex:flexCol caption='流程状态' width="100" property="mgrState" sortName="a.b" ></flex:flexCol>
  <flex:flexCol caption='未完成流程实例数' width="150" property="procCount" sortName="a.b" ></flex:flexCol>
  <flex:flexCol caption='已完成流程实例数' width="150" property="procEndCount" sortName="a.b" ></flex:flexCol>
  
  <flex:flexCol caption='所属机构ID' width="100" property="procOrg" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='所属机构' width="100" property="procOrgName" sortName="a.b" ></flex:flexCol>
  <flex:flexCol caption='流程类型ID' width="100" property="processType" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='流程类型' width="100" property="procTypeName" sortName="a.b" ></flex:flexCol>

</flex:flexgrid>
<flex:pagePolit action="processmgradminquery.cmd?clear=true">
</flex:pagePolit>
</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-已载入引擎流程定义列表");
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
	var wfmgrname=grid.getCellValue(i, 1);
	var procName=grid.getCellValue(i, 3);
	var processDefinitionId= grid.getCellValue(i, 2);
	var versionId=grid.getCellValue(i,4);
	//换成显示流程图 --待完善
	//grid.getCell(i, 2).innerHTML ="<span nowrap='true'><a href=\"javascript:getProcessList('"+versionId+"','"+wfmgrname+"')\">"+procName+"</a></span>";
	grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:showProcStatus('"+processDefinitionId+"')\">"+procName+"</a></span>";
	
	var procCount=grid.getCellValue(i,7);
	grid.getCell(i, 7).innerHTML ="<span nowrap='true'><a href=\"javascript:getProcessList('"+versionId+"','"+wfmgrname+"')\">"+procCount+"</a></span>";
	
	var procEndCount=grid.getCellValue(i,8);
	grid.getCell(i, 8).innerHTML ="<span nowrap='true'><a href=\"javascript:forEndList( '"+wfmgrname+"')\">"+procEndCount+"</a></span>";
	
							
								
}
function getProcessList(versionId,wfmgrname){
	document.all("wfmgrname").value=wfmgrname;
  document.forms[0].action ="wfadminquery.cmd?method=getProcessList";  
  
  document.forms[0].submit();	
}
function forEndList(wfmgrname){
if(wfmgrname){
	document.all("wfmgrname").value=wfmgrname;
	document.forms[0].action ="processendadminquery.cmd";  
    resetPageIndex(); 
    document.forms[0].submit();
    return ;
}else if(!getSelect())return;

document.all("wfmgrname").value=grid.getCheckLine();
 resetPageIndex(); 
//  var proc_nameSearch=document.all("procDefName_search");
//  if(proc_nameSearch.value==null || proc_nameSearch.value==""){
//  	proc_nameSearch.value=grid.getCellValue(grid.getCheckLineNo(),2);
//  }
  document.forms[0].action ="processendadminquery.cmd";  
  resetPageIndex(); 
  document.forms[0].submit();
}

function forUpload(){
window.location.href="processmgr.cmd?method=forupload";
}
function forActivityLastTime(){
if(!getSelect())return;
var mgrName=grid.getCheckLine();
document.all("wfmgrname").value=mgrName;
  document.forms[0].action ="wflasttime.cmd?method=activityLastTime";  
  document.forms[0].submit();
}
//启动流程
function forStart(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		//流程状态
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	
	  	if(stateCode=="0"){
		  	alert("流程["+procName+"]已经启动！");
		  	return;
	    }
  }
  
  document.forms[0].action ="processmgr.cmd?method=startProcessMgr";  
  document.forms[0].submit();
}
//停止
function forStop(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	
	  	if(stateCode!="0"){
		  	alert("流程["+procName+"]已经停用！");
		  	return;
	    }
  }
  document.forms[0].action ="processmgr.cmd?method=stopProcessMgr";  
  document.forms[0].submit();
}

function forDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("请选择一条记录!");
    return false;
  }
  
    var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var procCount=row[i].split(",")[6];
	  	var procEndCount=row[i].split(",")[7];
	  	var procName=row[i].split(",")[2];
	  	if(procCount>0){
		  	alert("流程["+procName+"]存在["+procCount+"]个未完成流程实例，不允许删除！");
		  	return;
		  }
		 if(procEndCount>0){
		  	alert("流程["+procName+"]存在["+procEndCount+"]个已完成流程实例，不允许删除！");
		  	return;
		  } 
  }
  
  if(!confirm("该操作不可恢复，是否继续？"))return;
  document.forms[0].action ="processmgr.cmd?method=deleteProcessMgr";  
  document.forms[0].submit();
}

function forReturn(){
	window.history.back();
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

function forProcess(){
  document.forms[0].action ="processalladminquery.cmd";  
  resetPageIndex(); 
  document.forms[0].submit();
}

//显示流程图：
function showProcStatus(curFlowId){

   	var url="taskinfo.cmd?method=displaystatus&processId="+ ""+ "&curFormId=" +""+"&curFlowId="+curFlowId;
	window.open(url);
}


</script>