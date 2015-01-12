<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

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
<html:button onclick="forCancelAssignment()" name="btn_cancel" value="取消委派"></html:button>
<html:button onclick="forCloseAssignment()" name="btn_close" value="结束委派"></html:button>
<html:button onclick="forReAssignment()" name="btn_re" value="重新委派"></html:button>
<html:button onclick="forReturn()" name="btn_return" value="返回"></html:button>
</div>
<br>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";
String processId=(String)request.getAttribute("processId");
if(processId==null)processId="";
String activityId=(String)request.getAttribute("activityId");
if(activityId==null)activityId="";
String returnUrl = (String)request.getAttribute("returnUrl");
if(returnUrl==null) returnUrl="";
%>
<html:form name="frmList" action="">

<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="<%=processId%>">
<input type="hidden" name="wfactId" value="<%=activityId%>">
<input type="hidden" name="returnUrl" value="<%=returnUrl%>">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="选择" width="35" property="resKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
                          <flex:flexCol caption='处理人' width="100" property="userName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='类型' width="100" property="resType" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='类型' width="100" property="resTypeName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='环节状态' width="100" property="actCurrentState" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='开始时间' width="100" property="fromDate" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='发送环节' width="100" property="previousActName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='发送人' width="100" property="previousResName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='工作顺序' width="100" property="workOrder" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='流程id' width="100" property="procId" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='环节id' width="100" property="actId" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='处理人key' width="100" property="resKey" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='创建时间' width="100" property="createTime" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='环节名称' width="100" property="actName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='请求人' width="100" property="resourceReqId" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='优先级' width="100" property="priority" sortName="a.b"></flex:flexCol>

</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程-流程监控-环节委派列表");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
function forCancelAssignment(){
if(!getSelect())return;
	var row=grid.getCheckAll().split(",");
	var resKey=row[0];
	var resType=row[2];
document.forms[0].action ="assignmentadmin.cmd?method=cancelAssignment&resKey="+resKey+"&resType="+resType;
document.forms[0].submit();	
}
function forCloseAssignment(){
if(!getSelect())return;
	var row=grid.getCheckAll().split(",");
	var resKey=row[0];
	var resType=row[2];
document.forms[0].action ="assignmentadmin.cmd?method=closeAssignment&resKey="+resKey+"&resType="+resType;
document.forms[0].submit();	
}
function forReAssignment(){
if(!getSelect())return;
var url ="struhelp.cmd?method=getSelectRoot&isCheckBox=0&isIncludeSelf=0&isTree=1&isIncludeSubCorporation=1&nevervote=1&organType=8";   
  	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	var curobj=window.event.srcElement;
 	if(win==null)return;
 	if(win.length==0)return;
	if(win[0]==""){
		return;
	}
	var targetId=win[0];
	var row=grid.getCheckAll().split(",");
	var sourceId=row[0];
	var sourceType=row[2];
document.forms[0].action ="assignmentadmin.cmd?method=reAssignment&targetId="+targetId+"&sourceId="+sourceId+"&sourceType="+sourceType;
document.forms[0].submit();	
}
function forReturn(){
document.forms[0].action ="wfadminquery.cmd?method=getActivityList&returnType=processall";
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
</script>