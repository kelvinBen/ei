<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<HTML>
<HEAD>
<TITLE>����������</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
 
<% 

	String processType=request.getParameter("processType");
	if(processType==null)processType="";
	String procDefId=request.getParameter("procDefId");
	if(procDefId==null)procDefId="";
	String extReturnUrl="roletaskinfoquery.cmd?processType="+processType+"&procDefId="+procDefId;
%>
<bsp:container title="�������Ͳ�ѯ" >
<bsp:containbutton   onclick="openFlow()" text="��ת״̬ͼ"></bsp:containbutton>
<bsp:containbutton   onclick="delegate()" text="����ί��"></bsp:containbutton>
<bsp:containbutton   onclick="forReturn()" text="����"></bsp:containbutton>
 
<html:form name="frmList" action="roletaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<support:flexgrid name="grid" height="420" action="" isSubmit="true">
     <flex:radioCol caption="ѡ��" width="50" property="ACTIVITY_ID"  name="primaryKey" sortName="taskinfo.ACTIVITY_ID" canSort="false"></flex:radioCol>						  
     <flex:flexCol caption='����ʵ��ID' width="100" property="PROCESS_ID" sortName="taskinfo.PROCESS_ID" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol caption='����ID' width="100" property="ACTIVITY_ID" sortName="taskinfo.ACTIVITY_ID" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol caption='sysUserId' width="100" property="USER_ID" sortName="taskinfo.USER_ID" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol caption='RESOURCE_TYPE' width="150" property="RESOURCE_TYPE" sortName="taskinfo.RESOURCE_TYPE" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol caption='����' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>						  
     <flex:flexCol caption='���ȼ�' width="60" property="PRIORITY" sortName="WF_TASK_LIST.PRIORITY" canSort="true"></flex:flexCol>
     <flex:flexCol caption='��������' width="250" property="PROCESS_NAME" sortName="WF_TASK_LIST.PROCESS_NAME"   canSort="true"></flex:flexCol>						  
     <flex:flexCol caption='��ǰ������' width="100" property="USER_NAME" sortName="taskinfo.USER_NAME" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol caption='��ǰ����' width="100" property="ACTIVITY_NAME" sortName="WF_TASK_LIST.ACTIVITY_NAME" canSort="true"></flex:flexCol>						  						  
     <flex:flexCol caption='ί��ʱ��' width="150" property="FROM_DATE" sortName="taskinfo.FROM_DATE" style="display:none" canSort="false"></flex:flexCol>
     <flex:flexCol caption='��ǰ״̬' width="100" property="ACT_CURRENT_STATE" sortName="WF_TASK_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
     <flex:flexCol caption='����״̬' width="100" property="READ_MARK" sortName="WF_TASK_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" style="display:none" canSort="true"></flex:flexCol>
     <flex:flexCol caption='���ͻ���' width="100" property="PREVIOUS_ACTIVITY_NAME" sortName="WF_TASK_LIST.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
     <flex:flexCol caption='������' width="100" property="PREVIOUS_RESOURCE_NAME" sortName="WF_TASK_LIST.PREVIOUS_RESOURCE_NAME" canSort="true"></flex:flexCol>
     <flex:flexCol caption='����ʱ��' width="150" property="CREATE_TIME" sortName="WF_TASK_LIST.CREATE_TIME" canSort="true"></flex:flexCol>
     <flex:flexCol caption='������' width="100" property="PROCESS_RESERVE_TYPE_ID" sortName="WF_TASK_LIST.PROCESS_RESERVE_TYPE_ID" style="display:none" canSort="false">  </flex:flexCol>         
</support:flexgrid>
<flex:pagePolit action="roletaskinfoquery.cmd">
</flex:pagePolit>
</html:form>

</bsp:container>
</body>
</html>
<script language="javascript">
function init(){
 
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		var resKey=grid.getCellValue(i, 4);
		var resType=grid.getCellValue(i, 5);
		var subject=grid.getCellValue(i, 6);
		var formplugin=grid.getCellValue(i ,17);
		grid.getCell(i, 6).innerHTML ="<span nowrap='true'><a href=\"javascript:forrole('"+activity_id+"','"+process_id+"','"+resKey+"','"+resType+"','"+formplugin+"')\">"+subject+"</a></span>";
								
}
}

function forrole(activity_id,process_id,resKey,resType,formplugin){
//��������ԶԻ�ȡ���ޱ�url������չ����
 if(formplugin.indexOf("Jsp_NoneField")>=0){
	  document.forms[0].action ="wftaskdeal.cmd?method=forrole&activityId="+activity_id+"&processId="+process_id+"&resKey="+resKey+"&resType="+resType;    
 }else if(formplugin.indexOf("MdaForm")>=0){
	  document.forms[0].action ="moftaskinfo.cmd?method=forrole&activityId="+activity_id+"&processId="+process_id+"&resKey="+resKey+"&resType="+resType;    
 }else{
      document.forms[0].action ="taskinfo.cmd?method=forrole&activityId="+activity_id+"&processId="+process_id+"&resKey="+resKey+"&resType="+resType;    
  }if(formplugin.indexOf("wfd_self")>=0){ //�Զ����
	  document.forms[0].action ="taskinfo.cmd?method=forrole&formplugin=wfd_self&processId="+process_id+"&activityId="+activity_id+"&resKey="+resKey+"&resType="+resType;    
  }
  
 document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="taskinfo.cmd?method=displaystatus&processId="+row[1];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function delegate(){
	if(!getSelect())return;
  var row=grid.getCurrentLine();
  var processId=grid.getCellValue(row,2);
  var resKey=grid.getCellValue(row,4);
  var resType=grid.getCellValue(row,5);
  //  document.forms[0].EXT_RETURN_URL.value="taskinfo.cmd?method=fordeal&activityId="+grid.getCheckLine()+"&processId="+processId;
  var formplugin=grid.getCellValue(row ,17);
  if(formplugin.indexOf("Jsp_NoneField")>=0)
  {
    document.forms[0].action ="wftaskdeal.cmd?method=delegate&activityId="+grid.getCheckLine()+"&processId="+processId+"&resKey="+resKey+"&resType="+resType;    
   } else if(formplugin.indexOf("MdaForm")>=0){
     document.forms[0].action ="moftaskinfo.cmd?method=delegate&activityId="+grid.getCheckLine()+"&processId="+processId+"&resKey="+resKey+"&resType="+resType;    
   }else{
     document.forms[0].action ="taskinfo.cmd?method=delegate&activityId="+grid.getCheckLine()+"&processId="+processId+"&resKey="+resKey+"&resType="+resType;    
   }
   document.forms[0].submit();	
  }
function forReturn(){
	
	window.location.href="taskinforole.cmd?method=getProcessTypeList"; 
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