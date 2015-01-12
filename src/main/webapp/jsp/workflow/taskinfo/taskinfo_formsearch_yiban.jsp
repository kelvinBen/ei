<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<HTML>
<HEAD>
<TITLE>已办任务</TITLE>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>

<%
		String taskKind = request.getParameter("process_kind");
			if(taskKind==null)taskKind="";
        String formId = request.getParameter("formId");
        if(formId==null)formId="";
        String resourceReqId = request.getParameter("process_creator");
        if(resourceReqId==null)resourceReqId="";
        String processType = request.getParameter("processType");
        if(processType==null)processType="";
        String sDate = request.getParameter("process_startTime");
        if(sDate==null)sDate="";
        String eDate = request.getParameter("process_endTime");
        if(eDate==null)eDate="";
%>
<html:form name="frmList" action="formdataquery.cmd?method=query">
<input type="hidden" name="EXT_RETURN_URL" value="">
<input type="hidden" name="process_kind" value="<%=taskKind%>">
<input type="hidden" name="formId" value="<%=formId%>">
<input type="hidden" name="process_creator" value="<%=resourceReqId%>">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="process_startTime" value="<%=sDate%>">
<input type="hidden" name="process_endTime" value="<%=eDate%>">
<div class="btnareaCss">
<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
<support:flexgrid name="grid" height="360" action="" isSubmit="false">
                         <flex:flexCol caption='环节ID' width="150" property="sysActivityId" sortName="taskinfo.sysActivityId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='流程实例ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='标题' width="100" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='当前环节' width="100" property="sysActivityName" sortName="WF_ACT_LIST.ACTIVITY_NAME"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='当前处理人' width="100" property="sysResponseName" sortName="WF_ACT_LIST.CUR_USER_NAME"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='发送环节' width="100" property="sysPreviousActivityName" sortName="WF_ACT_LIST.PREVIOUS_ACTIVITY_NAME"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='发送人' width="100" property="sysPreviousResourceName" sortName="WF_ACT_LIST.PREVIOUS_RESOURCE_NAME"  canSort="false"></flex:flexCol>
                          <flex:flexCol caption='发送时间' width="150" property="sysActCreateTime" sortName="WF_ACT_LIST.CREATE_TIME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='流程名称' width="150" property="sysProcessName" sortName="WF_ACT_LIST.PROCESS_NAME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='当前状态' width="100" property="sysActCurrentState" sortName="WF_ACT_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='查阅状态' width="100" property="sysReadMark" sortName="WF_ACT_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value"  canSort="false" style="display:none"></flex:flexCol>
                         

</support:flexgrid>
<flex:pagePolit action="formdataquery.cmd?method=query">
</flex:pagePolit>
</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程－查询管理－表单查询－已办任务");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		
		var subject=grid.getCellValue(i, 3);
		if(subject=="") subject = grid.getCellValue(i,9);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:forold('"+activity_id+"','"+process_id+"')\">"+subject+"</a></span>";
								
}
function forold(activity_id,process_id){
	var url="taskinfo.cmd?method=forold&activityId="+activity_id+"&processId="+process_id; 
	//var return_url="formdataquery.cmd?method=query";
	//return_url=return_url+"&process_kind="+document.all("process_kind").value; 
	//return_url=return_url+"&formId="+document.all("formId").value; 
	//return_url=return_url+"&process_creator="+document.all("process_creator").value; 
	//return_url=return_url+"&processType="+document.all("processType").value; 
	//return_url=return_url+"&process_startTime="+document.all("process_startTime").value; 
	//return_url=return_url+"&process_endTime="+document.all("process_endTime").value; 
	//document.all("EXT_RETURN_URL").value=return_url;
	//修改原因，按表单的字段查询后，条件不能保留 
	document.all("EXT_RETURN_URL").value="javascript:history.go(-1)";
  document.forms[0].action =url;
  document.forms[0].submit();	
  
}
function forReturn(){
	window.location.href="formmanager.cmd?method=render&formId="+document.all("formId").value+"&processType="+document.all("processType").value; 
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