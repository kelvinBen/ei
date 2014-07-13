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
<div class="btnareaCss">
<html:button onclick="openFlow()" name="btn_openflow" value="流转状态"></html:button>
<html:button name="btn_deal" value="返回" onclick="forReturn()"></html:button>
</div>
<% 
String organId=(String)request.getAttribute("ORGAN_ID");
String startTime=request.getParameter("startTime");
String endTime=request.getParameter("endTime");
if(startTime==null)startTime="";
if(endTime==null)endTime="";
String isShowReturnBtn=request.getParameter("isShowReturnBtn");
if(isShowReturnBtn==null)isShowReturnBtn="";
	String processType=request.getParameter("processType");
	if(processType==null)processType="";
	String procDefId=request.getParameter("procDefId");
	if(procDefId==null)procDefId="";
	String extReturnUrl="mofoldtaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
%>

<html:form name="frmList" action="mofoldtaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    
    <td nowrap>开始日期：<date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
    <td nowrap>结束日期：<date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	<td><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:checkboxCol caption='选择' width="50" property="sysActivityId" sortName="taskinfo.sysActivityId"  canSort="false"></flex:checkboxCol>
                          <flex:flexCol caption='流程实例ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
                          
                          <flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='当前环节' width="150" property="sysActivityName" sortName="WF_ACT_LIST.ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='当前处理人' width="100" property="sysResponseName" sortName="WF_ACT_LIST.CUR_USER_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='发送环节' width="100" property="sysPreviousActivityName" sortName="WF_ACT_LIST.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='发送人' width="100" property="sysPreviousResourceName" sortName="WF_ACT_LIST.PREVIOUS_RESOURCE_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='发送时间' width="150" property="sysActCreateTime" sortName="WF_ACT_LIST.CREATE_TIME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='流程名称' width="150" property="sysProcessName" sortName="WF_ACT_LIST.PROCESS_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='当前状态' width="100" property="sysActCurrentState" sortName="WF_ACT_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='查阅状态' width="100" property="sysReadMark" sortName="WF_ACT_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="true" style="display:none"></flex:flexCol>
                         

</support:flexgrid>
<flex:pagePolit action="mofoldtaskinfoquery.cmd">
</flex:pagePolit>
</html:form>
<script language="javascript">

setTitleInTreeBar("工作流程－任务管理－已办任务");

setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		
		var subject=grid.getCellValue(i, 3);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:forold('"+activity_id+"','"+process_id+"')\">"+subject+"</a></span>";
								
}
function forold(activity_id,process_id){
	
  document.forms[0].action ="moftaskinfo.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="moftaskinfo.cmd?method=displaystatus&processId="+row[1];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;
		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else
	window.location.href="moftaskinfoyiban.cmd?method=getProcessTypeList"; 
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
function forsearch(){
	var startTime=document.all("startTime").value;
	var endTime=document.all("endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("结束日期不能小于开始日期！");
			return;
		}
	}
	document.forms[0].action="mofoldtaskinfoquery.cmd";
	document.forms[0].submit();	
}
</script>