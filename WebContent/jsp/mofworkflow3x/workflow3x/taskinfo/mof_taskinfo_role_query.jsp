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
<TITLE>��ɫ�����б��ѯ</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<div class="btnareaCss">
<html:button onclick="openFlow()" name="btn_openflow" value="��ת״̬"></html:button>
<html:button name="btn_delegate" value="����ί��" onclick="delegate()"></html:button>
<html:button name="btn_deal" value="����" onclick="forReturn()"></html:button>
</div>
<br>
<% 

	String processType=request.getParameter("processType");
	if(processType==null)processType="";
	String procDefId=request.getParameter("procDefId");
	if(procDefId==null)procDefId="";
	String extReturnUrl="mofroletaskinfoquery.cmd?processType="+processType+"&procDefId="+procDefId;
%>
<html:form name="frmList" action="mofroletaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<support:flexgrid name="grid" height="260" action="" isSubmit="true">
                          <flex:checkboxCol caption="ѡ��" width="50" property="sysActivityId"  name="primaryKey" sortName="taskinfo.sysActivityId" canSort="false"></flex:checkboxCol>						  
                          <flex:flexCol caption='����ʵ��ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='����ID' width="100" property="sysActivityId" sortName="taskinfo.sysActivityId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='sysUserId' width="100" property="sysUserId" sortName="taskinfo.sysUserId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='sysResourceType' width="150" property="sysResourceType" sortName="taskinfo.sysResourceType" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='����' style="text-align:left"  width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>						  
                          <flex:flexCol caption='���ȼ�' width="60" property="sysPriority" sortName="WF_TASK_LIST.PRIORITY" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='��������' width="250" property="sysProcessName" sortName="WF_TASK_LIST.PROCESS_NAME"   canSort="true"></flex:flexCol>						  
                          <flex:flexCol caption='��ǰ������' width="100" property="sysResponseName" sortName="taskinfo.sysResponseName" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='��ǰ����' width="100" property="sysActivityName" sortName="WF_TASK_LIST.ACTIVITY_NAME" canSort="true"></flex:flexCol>						  						  
                          <flex:flexCol caption='ί��ʱ��' width="150" property="sysAssignFromTime" sortName="taskinfo.sysAssignFromTime" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='��ǰ״̬' width="100" property="sysActCurrentState" sortName="WF_TASK_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='����״̬' width="100" property="sysReadMark" sortName="WF_TASK_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" style="display:none" canSort="true"></flex:flexCol>
                         
                          <flex:flexCol caption='���ͻ���' width="100" property="sysPreviousActivityName" sortName="WF_TASK_LIST.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="sysPreviousResourceName" sortName="WF_TASK_LIST.PREVIOUS_RESOURCE_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='����ʱ��' width="150" property="sysActCreateTime" sortName="WF_TASK_LIST.CREATE_TIME" canSort="true"></flex:flexCol>
                          
                          
</support:flexgrid>
<flex:pagePolit action="mofroletaskinfoquery.cmd">
</flex:pagePolit>
</html:form>
<script language="javascript">
setTitleInTreeBar("�������̣����������ɫ����");
setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		var resKey=grid.getCellValue(i, 4);
		var resType=grid.getCellValue(i, 5);
		var subject=grid.getCellValue(i, 6);
		grid.getCell(i, 6).innerHTML ="<span nowrap='true'><a href=\"javascript:forrole('"+activity_id+"','"+process_id+"','"+resKey+"','"+resType+"')\">"+subject+"</a></span>";
								
}
function forrole(activity_id,process_id,resKey,resType){
	
  document.forms[0].action ="moftaskinfo.cmd?method=forrole&activityId="+activity_id+"&processId="+process_id+"&resKey="+resKey+"&resType="+resType;    
  document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="moftaskinfo.cmd?method=displaystatus&processId="+row[1];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function delegate(){
	if(!getSelect())return;
  var row=grid.getCurrentLine();
  var processId=grid.getCellValue(row,2);
  var resKey=grid.getCellValue(row,4);
  var resType=grid.getCellValue(row,5);
  //  document.forms[0].EXT_RETURN_URL.value="moftaskinfo.cmd?method=fordeal&activityId="+grid.getCheckLine()+"&processId="+processId;

  document.forms[0].action ="moftaskinfo.cmd?method=delegate&activityId="+grid.getCheckLine()+"&processId="+processId+"&resKey="+resKey+"&resType="+resType;    
  document.forms[0].submit();	
}
function forReturn(){
	
	window.location.href="moftaskinforole.cmd?method=getProcessTypeList"; 
}
function getSelect(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var obj=sel.split(",");  
  if(obj.length*1>1){
    alert("��ѡ��һ����¼!");
    return false;
  }  
  return true;
}
</script>