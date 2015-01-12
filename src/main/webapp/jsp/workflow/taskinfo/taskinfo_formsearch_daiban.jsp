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
<TITLE></TITLE>
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
<html:button name="����" value="����" onclick="forReturn()"></html:button>
</div>	
<html:messages/>
<flex:flexgrid name="grid" height="360" action="" isSubmit="false">
                          
                          <flex:flexCol caption='����ʵ��ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='����ID' width="100" property="sysActivityId" sortName="taskinfo.sysActivityId" style="display:none" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='����' width="100" property="SUBJECT" sortName="SUBJECT.SUBJECT" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='���ȼ�' width="60" property="sysPriority" sortName="WF_TASK_LIST.PRIORITY" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='��ǰ����' width="100" property="sysActivityName" sortName="WF_TASK_LIST.ACTIVITY_NAME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='��ǰ������' width="100" property="sysUserName" sortName="WF_TASK_LIST.USER_NAME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='���ͻ���' width="100" property="sysPreviousActivityName" sortName="WF_TASK_LIST.PREVIOUS_ACTIVITY_NAME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="sysPreviousResourceName" sortName="WF_TASK_LIST.PREVIOUS_RESOURCE_NAME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='����ʱ��' width="100" property="sysActCreateTime" sortName="WF_TASK_LIST.CREATE_TIME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='��������' width="100" property="sysProcessName" sortName="WF_TASK_LIST.PROCESS_NAME" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='��ǰ״̬' width="100" property="sysActCurrentState" sortName="WF_TASK_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='����״̬' width="100" property="sysReadMark" sortName="WF_TASK_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="false"></flex:flexCol>
</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("�������̣���ѯ��������ѯ������/�ڰ�����");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 2);
		var process_id=grid.getCellValue(i, 1);
		
		var subject=grid.getCellValue(i, 3);
		if(subject=="") subject = grid.getCellValue(i,10);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+activity_id+"','"+process_id+"')\">"+subject+"</a></span>";
								
}
function forDeal(activity_id,process_id){
	var url="taskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id; 
	//var return_url="formdataquery.cmd?method=query";
	//return_url=return_url+"&process_kind="+document.all("process_kind").value; 
	//return_url=return_url+"&formId="+document.all("formId").value; 
	//return_url=return_url+"&process_creator="+document.all("process_creator").value; 
	//return_url=return_url+"&processType="+document.all("processType").value; 
	//return_url=return_url+"&process_startTime="+document.all("process_startTime").value; 
	//return_url=return_url+"&process_endTime="+document.all("process_endTime").value; 
	//document.all("EXT_RETURN_URL").value=return_url;
	//�޸�ԭ�򣬰������ֶβ�ѯ���������ܱ��� 
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