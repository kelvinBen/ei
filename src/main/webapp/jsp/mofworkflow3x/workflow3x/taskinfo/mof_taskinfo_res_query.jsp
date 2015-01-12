<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<%
String pageTitle=(String)request.getAttribute("title");
String processType=request.getParameter("processType");
	if(processType==null)processType="";
String procDefId=request.getParameter("procDefId");
	if(procDefId==null)procDefId="";
String isEdoc=(String)request.getParameter("isEdoc");	
if(isEdoc==null)isEdoc="0";
String extReturnUrl="mofrestaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&isEdoc="+isEdoc;	
%>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<div class="btnareaCss">
	<!--
<html:button name="btn_log" value="催办历史" onclick="forlog(1)"></html:button>
<html:button name="btn_log" value="改发历史" onclick="forlog(2)"></html:button>
<html:button name="btn_log" value="回收历史" onclick="hslog()"></html:button>
<html:button name="btn_log" value="跳过历史" onclick="forlog(4)"></html:button>
<html:button name="btn_log" value="冻结历史" onclick="forlog(5)"></html:button>
<html:button name="btn_log" value="解冻历史" onclick="forlog(6)"></html:button>
-->
<html:button onclick="openFlow()" name="btn_openflow" value="流转状态"></html:button>
<html:button name="btn_return" value="返回" onclick="doReturn()"></html:button>
</div>
<br>

<html:form name="frmList" action="mofrestaskinfoquery.cmd">

<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="isEdoc" value="<%=isEdoc%>">
<div><fieldset class="FieldsetCss"><legend>预警标志说明</legend>
<table border=0><tr><td>
<font color='#FF0000' size='3'> <strong>! </strong> </font>表示任务已超时，<font color='#FFCC33' size='3'> <strong>! </strong> </font>表示任务已预警，<font color='#003399' size='3'> <strong>*</strong> </font>表示正常状态
</td></tr></table>
</fieldset>
 </div>
 
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:flexCol caption='预警' width="50" property="icon" sortName="taskinfo.icon" canSort="false" showTitle="false"></flex:flexCol>
                          <flex:checkboxCol caption="选择" width="50" property="sysActivityId"  name="primaryKey" sortName="taskinfo.sysActivityId" canSort="false"></flex:checkboxCol>
                          
                          <flex:flexCol caption='流程实例ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='环节ID' width="100" property="sysActivityId" sortName="taskinfo.sysActivityId" style="display:none" canSort="false"></flex:flexCol>
                          
                          <flex:flexCol caption='标题'  style="text-align:left" width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='当前环节' width="150" property="sysActivityName" sortName="WF_ACT_LIST.ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='当前处理人' width="100" property="sysResponseName" sortName="WF_ACT_LIST.CUR_USER_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='发送时间' width="150" property="sysActCreateTime" sortName="WF_ACT_LIST.CREATE_TIME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='警告时间' width="150" property="warnTime" sortName="taskinfo.warnTime" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='限时时间' width="150" property="limitTime" sortName="taskinfo.limitTime" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='发送环节' width="100" property="sysPreviousActivityName" sortName="WF_ACT_LIST.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='发送人' width="100" property="sysPreviousResourceName" sortName="WF_ACT_LIST.PREVIOUS_RESOURCE_NAME"  canSort="true"></flex:flexCol>
                          <flex:flexCol caption='流程名称' width="250" property="sysProcessName" sortName="WF_ACT_LIST.PROCESS_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='当前状态' width="100" property="sysActCurrentState" sortName="WF_ACT_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='查阅状态' width="100" property="sysReadMark" sortName="WF_ACT_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
                         
                          <flex:flexCol caption='消息提醒方式' width="150" property="DCWORK_ACTIVITY_MSGTYPES" sortName="taskinfo.DCWORK_ACTIVITY_MSGTYPES" canSort="false"></flex:flexCol>
                         
</support:flexgrid>
<flex:pagePolit action="mofrestaskinfoquery.cmd">
</flex:pagePolit>

</html:form>
<script language="javascript">
setTitleInTreeBar("<%=pageTitle%>");
setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 2);
		var process_id=grid.getCellValue(i, 3);
		
		var subject=grid.getCellValue(i, 5);
		grid.getCell(i, 5).innerHTML ="<span nowrap='true'><a href=\"javascript:forres('"+activity_id+"','"+process_id+"')\">"+subject+"</a></span>";
								
}
function forres(activity_id,process_id){
	
  document.forms[0].action ="moftaskinfo.cmd?method=forres&activityId="+activity_id+"&processId="+process_id;    
  document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="moftaskinfo.cmd?method=displaystatus&processId="+row[2];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
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
function doReturn(){
var edocSign=document.all("isEdoc").value;
if(edocSign=="1")
	window.location.href="moftaskinfomonitor.cmd?method=getProcessTypeList&processType=EDOC";
else	
	window.location.href="moftaskinfomonitor.cmd?method=getProcessTypeList";
}
function forlog(infoType){
  if(!getSelect())return;
  var row=grid.getCheckAll("$").split("$");

  //var row=grid.getCurrentLine();
  var processId=row[2];//grid.getCellValue(row,3);
  window.location.href="edocmonitorinfoquery.cmd?infoType="+infoType+"&processId="+processId;    

}
function hslog(){
	window.location.href="edocmonitorinfoquery.cmd?infoType=3";
}
</script>