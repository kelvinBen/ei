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
<%@ page import="java.util.List"%>

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
String organId=(String)request.getAttribute("ORGAN_ID");
if(organId==null)organId="";
String startTime=request.getParameter("startTime");
String endTime=request.getParameter("endTime");
if(startTime==null)startTime="";
if(endTime==null)endTime="";
String isShowReturnBtn=request.getParameter("isShowReturnBtn");
if(isShowReturnBtn==null)isShowReturnBtn="";
%>

<% 
    String readMark = request.getParameter("readMark");
	if (readMark==null){
	  readMark="";
	}
	String processType=request.getParameter("processType");
	if(processType==null)processType="";
	String procDefId=request.getParameter("procDefId");
	if(procDefId==null)procDefId="";
	String extReturnUrl="moftaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&readMark="+readMark+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
        List reserveList=(List)request.getAttribute("reserveList");
%>


<html:form name="frmList" action="moftaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<div class="btnareaCss">
<html:button onclick="openFlow()" name="btn_openflow" value="��ת״̬"></html:button>
<html:button onclick="forReturn()" name="btn_deal" value="����"></html:button>
</div>
<div><fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    <td>
    <flex:searchSelect name="readMark" labeltitle="" size="1" searchName="taskinfo.readMark" dataType="java.lang.String" operSymbol="=" value="<%=readMark%>">
	<html:option value=""></html:option>
	<html:options collection="WF_TASKINFO_READMARK_COLLECTION" labelProperty="value" property="key"/>
	</flex:searchSelect>
	</td>
    <td nowrap>��ʼ���ڣ�<date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"> </td>
    <td nowrap> �������ڣ�<date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	<td><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">

                          <flex:radioCol caption='ѡ��' width="50" property="sysActivityId" name="primaryKey" sortName="taskinfo.sysActivityId"  canSort="false"></flex:radioCol>
                          <flex:flexCol caption='����ʵ��ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
                          
                          <flex:flexCol caption='����' style="text-align:left"  width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>
                          <flex:flexCol caption='���ȼ�' width="60" property="sysPriority" sortName="WF_TASK_LIST.PRIORITY" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='��ǰ����' width="150" property="sysActivityName" sortName="WF_TASK_LIST.ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='��ǰ������ID' width="100" property="sysUserId" sortName="WF_TASK_LIST.USER_ID" canSort="true" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��ǰ������' width="100" property="sysUserName" sortName="WF_TASK_LIST.USER_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='���ͻ���' width="100" property="sysPreviousActivityName" sortName="WF_TASK_LIST.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="sysPreviousResourceName" sortName="WF_TASK_LIST.PREVIOUS_RESOURCE_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='����ʱ��' width="140" property="sysActCreateTime" sortName="WF_TASK_LIST.CREATE_TIME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='��������' width="250" property="sysProcessName" sortName="WF_TASK_LIST.PROCESS_NAME" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='��ǰ״̬' width="100" property="sysActCurrentState" sortName="WF_TASK_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
                          <flex:flexCol caption='����״̬' width="100" property="sysReadMark" sortName="WF_TASK_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
                         <%for(int i=0;i<reserveList.size();i++){
	                   Map m = (Map)reserveList.get(i);
             		   String fieldid=(String)m.get("field-id");
                           String title=(String)m.get("title");
                         %>
		         <flex:flexCol caption='<%=title%>' width="100" property="<%=fieldid%>"
			  sortName="taskinfo.<%=fieldid%>"></flex:flexCol>
		         <%		
                          }
                         %>
                          
                          
                         
</support:flexgrid>
<flex:pagePolit action="moftaskinfoquery.cmd">
</flex:pagePolit>
</html:form>
<script language="javascript">

setTitleInTreeBar("�������̣������������/�ڰ�����");


setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		var organ_id=grid.getCellValue(i,6);
		var subject=grid.getCellValue(i, 3);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+activity_id+"','"+process_id+"','"+organ_id+"')\">"+subject+"</a></span>";
								
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="moftaskinfo.cmd?method=displaystatus&processId="+row[1];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forDeal(activity_id,process_id,organ_id){
	
  document.forms[0].action ="moftaskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id;    
  document.forms[0].submit();	
}
function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;
		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else{
		var readMark=document.all("readMark").value;
		if(readMark=="" || readMark=="0")
		window.location.href="moftaskinfodaiban.cmd?method=getProcessTypeList"; 
		else
		window.location.href="moftaskinfozaiban.cmd?method=getProcessTypeList"; 
	}	
	
}
function forsearch(){
	var startTime=document.all("startTime").value;
	var endTime=document.all("endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("�������ڲ���С�ڿ�ʼ���ڣ�");
			return;
		}
	}
	document.forms[0].action="moftaskinfoquery.cmd";
	document.forms[0].submit();	
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