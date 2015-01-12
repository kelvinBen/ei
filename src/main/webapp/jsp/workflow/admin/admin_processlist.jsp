<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.workflow.WfConstants"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<HTML>

<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";

String subject_search=request.getParameter("subject_search");
if(subject_search==null)subject_search="";
String procResRequester_search=request.getParameter("procResRequester_search");
if(procResRequester_search==null) procResRequester_search="";
String procResRequester_name=request.getParameter("procResRequester_name");
if(procResRequester_name==null) procResRequester_name="";
String startTime_beagin=request.getParameter("startTime_beagin");
if(startTime_beagin==null)startTime_beagin="";
String startTime_end=request.getParameter("startTime_end");
if(startTime_end==null)startTime_end="";
%>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript">
function selectProcResRequester(){
	var url ="jsp/help.jsp?url=wf_struhelp.cmd&method=getSelectRoot&organType=8&isCheckBox=0&isIncludeSelf=0&isTree=1&rootId=1";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:550px");
	if(win==null)return;
	if(win.length == 0){
		document.forms[0].procResRequester_search.value="";
		document.forms[0].procResRequester_name.value="";
		document.getElementById("procResRequesterIdName").innerHTML="";

	}else{
		document.forms[0].procResRequester_search.value=win[0]["primary-value"];
		document.forms[0].procResRequester_name.value=win[0]["display-str"];
		document.getElementById("procResRequesterIdName").innerHTML="<span nowrap='true'><a href=\""+win[0]["display-url"]+"\">"+win[0]["display-str"];+"</a></span>";
	}
}
</script>
</HEAD>

<BODY topmargin="10px" >

<div class="btnareaCss">
<html:button onclick="forSuspend()" name="btn_suspend" value="����"></html:button>
<html:button onclick="forResume()" name="btn_resume" value="�ָ�"></html:button>
<html:button onclick="forAbort()" name="btn_abort" value="�ж�"></html:button>
<html:button onclick="forTerminate()" name="btn_terminate" value="��ֹ"></html:button>
<%--//<html:button onclick="forTerminateAndDelete()" name="btn_terminate" value="��ֹ��ɾ��"></html:button>
//--%>
<html:button onclick="forCheckLimit()" name="btn_checklimit" value="��ʱ���"></html:button>
<html:button onclick="openFlow()" name="btn_openflow" value="��ת״̬"></html:button>
<html:button onclick="showHistory()" name="btn_showhistory" value="��ת��ʷ"></html:button>

<html:button onclick="forReturn()" name="btn_return" value="����"></html:button>
</div>
<html:messages/>
<html:form name="frmList" action="">

<div><fieldset class="FieldsetCss"><legend>��ѯ����</legend>
<table id="tblSearch">
<flex:search>
	<tr>
	<td class="tdLeft">����:</td>
	<td class="tdRight"><html:text name="subject_search" value="<%=subject_search%>" size="15"></html:text></td>
	<td class="tdLeft" rowspan="2">��ʼʱ�䣺</td>
	<td class="tdRight" colspan="2">�ԣ�<date:date name="startTime_beagin"
				zindex="199" divname="BEGINTIMEdd" sourceFormat="yyyy-MM-dd hh:mm"
				targetFormat="yyyy-MM-dd hh:mm" hastime="true" value='<%=startTime_beagin%>'
				readonly="true"></date:date><input style="visibility: hidden"></td>
    </tr>
    <tr>
    <td class="tdLeft">�����ˣ�</td>
	<td class="tdRight">
		<html:hidden name="procResRequester_search" value='<%=procResRequester_search%>' write="false"/>
        <html:hidden name="procResRequester_name" value='<%=procResRequester_name%>' write="false"/>
        <img src="skins/default/images/liulan.gif" onclick="selectProcResRequester()" style="cursor:hand;" border="0"><span id="procResRequesterIdName"></span></td>
	<td class="tdRight">����<date:date name="startTime_end"
				zindex="118" divname="ENDTIMEdd" sourceFormat="yyyy-MM-dd hh:mm"
				targetFormat="yyyy-MM-dd hh:mm" hastime="true" value='<%=startTime_end%>'
				readonly="true"></date:date><input style="visibility: hidden"></td>	
    <td align="center"><flex:searchImg name="chaxun" action="wfadminquery.cmd?method=getProcessList" imgClick="if(forimgClick()) return false;" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset></div>
<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="ѡ��" width="35" property="procKey"  name="primaryKey" sortName="a.procKey"></flex:checkboxCol>
                          <flex:flexCol caption='����' width="100" property="subject" sortName="a.procName"></flex:flexCol>
                          <flex:flexCol caption='��������' width="100" property="procName" sortName="a.procName" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��������' width="100" property="procName" sortName="a.procName"></flex:flexCol>
                          <flex:flexCol caption='��ת״̬' width="100" property="procStateCode" sortName="a.procStateCode" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��ת״̬' width="100" property="procState" sortName="a.procState"></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="procResRequesterId" sortName="a.procName" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='������' width="100" property="procResRequesterName" sortName="a.procName"></flex:flexCol>
                          <flex:flexCol caption='��ʼʱ��' width="100" property="startTime" sortName="a.startTime"></flex:flexCol>
                          <flex:flexCol caption='��������ID' width="100" property="procType" sortName="a.procType" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��������' width="100" property="procTypeName" sortName="a.procTypeName"></flex:flexCol>
                          <flex:flexCol caption='��������ID' width="100" property="procOrg" sortName="a.procOrg" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��������' width="100" property="procOrganName" sortName="a.procOrganName"></flex:flexCol>
                          <flex:flexCol caption='����key' width="600" property="procKey" sortName="a.procKey"></flex:flexCol>
                          

</flex:flexgrid>

</html:form>
</BODY>
</HTML>
<script language="javascript">
setTitleInTreeBar("��������-���̼��-����ʵ���б�");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var processId=grid.getCellValue(i, 1);
		var procName=grid.getCellValue(i, 3);
		var subject = grid.getCellValue(i,2);
		grid.getCell(i, 4).innerHTML ="<span nowrap='true'><a href=\"javascript:getActivityList('"+processId+"')\">"+procName+"</a></span>";
		grid.getCell(i, 2).innerHTML ="<span nowrap='true'><a href=\"javascript:getActivityList('"+processId+"')\">"+subject+"</a></span>";
		var resRequesterId = grid.getCellValue(i, 7);
		var resRequesterName = grid.getCellValue(i,8);
		grid.getCell(i, 8).innerHTML = "<span nowrap='true'><a href=\"jsp/workflow/organ/matrix2stru4ogran.jsp?organId="+resRequesterId+"\">"+resRequesterName+"</a></span>";
}
var procResRequesterId=document.all("procResRequester_search").value;
var procResRequesterName=document.all("procResRequester_name").value;
document.getElementById("procResRequesterIdName").innerHTML="<span nowrap='true'><a href=\"jsp/workflow/organ/matrix2stru4ogran.jsp?organId="+procResRequesterId+"\">"+procResRequesterName+"</a></span>";

function getActivityList(processId){
	document.all("processId").value=processId;
  document.forms[0].action ="wfadminquery.cmd?method=getActivityList";  
  
  document.forms[0].submit();	
}
function forSuspend(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"==stateCode){
		  	alert("����ʵ��["+procName+"]�Ѿ����𣬲������ظ�����");
		  	return;
		  }
		if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN_NOT_RUNNING%>")!=-1){
		  	alert("����ʵ��["+procName+"]û�д�������״̬�����������");
		  	return;
		  }
  }
	document.forms[0].action ="processadmin.cmd?method=suspendProcess";  
	document.forms[0].submit();	
}
function forResume(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"!=stateCode){
		  	alert("����ʵ��["+procName+"]û�д��ڹ���״̬��������ָ���");
		  	return;
		  }
		
  }  
 
document.forms[0].action ="processadmin.cmd?method=resumeProcess";  
document.forms[0].submit();	
}
function forAbort(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  if(!confirm("�ò������ɻָ����Ƿ������"))return;
document.forms[0].action ="processadmin.cmd?method=abortProcess";  
document.forms[0].submit();	
}
function forTerminate(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  if(!confirm("�ò������ɻָ����Ƿ������"))return;
document.forms[0].action ="processadmin.cmd?method=terminateProcess";  
document.forms[0].submit();	
}
function forTerminateAndDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  if(!confirm("�ò������ɻָ����Ƿ������"))return;
  document.forms[0].action ="processadmin.cmd?method=terminateProcessAndDeleteProcessEnd";  
  document.forms[0].submit();	
}
function forCheckLimit(){
document.forms[0].action ="processadmin.cmd?method=checklimitProcess";  
document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var sel=grid.getCheckLine();
var url="taskinfo.cmd?method=displaystatus&processId="+sel;
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function showHistory(){
if(!getSelect())return;

document.forms[0].action ="processadmin.cmd?method=showhistoryProcess&processId="+grid.getCheckLine();  
document.forms[0].submit();	
}
function forHistoryCompare(){
alert("δ��ɣ�");
}
function forReturn(){
	document.forms[0].action ="processmgradminquery.cmd?clear=true";
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
function forimgClick(){
	var startTime_beagin=document.getElementsByName("startTime_beagin")[0].value;
	var startTime_end=document.getElementsByName("startTime_end")[0].value;
	//alert(startTime_end);
	if(startTime_beagin!="" && startTime_end!=""){
		if(startTime_beagin>startTime_end){
			alert("�������ڲ���С�ڿ�ʼ���ڣ�");
			return true;
		}
	}
	return false;
}
</script>