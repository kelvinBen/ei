<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.workflow.WfConstants"%>
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
<html:button onclick="startActivity()" name="btn_startAct" value="��������"></html:button>
<html:button onclick="forSuspend()" name="btn_suspend" value="����"></html:button>
<html:button onclick="forResume()" name="btn_resume" value="�ָ�"></html:button>
<html:button onclick="forAbort()" name="btn_abort" value="�ж�"></html:button>
<html:button onclick="forTerminate()" name="btn_terminate" value="��ֹ"></html:button>
<html:button onclick="showHistory()" name="btn_showhistory" value="��ת��ʷ"></html:button>

<html:button onclick="forReturn()" name="btn_return" value="����"></html:button>
</div>
<br>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";
String processId=(String)request.getAttribute("processId");
if(processId==null)processId="";
String returnUrl = (String)request.getAttribute("returnUrl");
if(returnUrl==null) returnUrl="";

%>
<html:form name="frmList" action="">
<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="<%=processId%>">
<input type="hidden" name="returnUrl" value="<%=returnUrl%>">
<input type="hidden" name="wfactId" value="">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
						  <flex:checkboxCol caption="ѡ��" width="35" property="actKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
                          <flex:flexCol caption='��������' width="150" property="actName" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��������' width="150" property="actName" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='��ת״̬' width="100" property="actStateCode" sortName="a.b" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='��ת״̬' width="100" property="actState" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='����ί����' width="100" property="assiCount" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='�Ƿ��ǩ' width="100" property="actIsMulti" sortName="a.b"></flex:flexCol>
                          <flex:flexCol caption='����key' width="100" property="actKey" sortName="a.b" style="display:none"></flex:flexCol>
                          
                          <flex:flexCol caption='˵��' width="100" property="description" sortName="a.b"></flex:flexCol>

</flex:flexgrid>

</html:form>
<script language="javascript">
setTitleInTreeBar("��������-���̼��-����ʵ���б�");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var wfactId=grid.getCellValue(i, 1);
		var actName=grid.getCellValue(i, 2);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:getAssignmentList('"+wfactId+"')\">"+actName+"</a></span>";
								
}
function getAssignmentList(wfactId){
	document.all("wfactId").value=wfactId;
  document.forms[0].action ="wfadminquery.cmd?method=getAssignmentList";  
  document.forms[0].submit();	
}
function forReturn(){
	if("<%=returnUrl%>"==""){
		document.forms[0].action ="wfadminquery.cmd?method=getProcessList&clear=true";
	}else{
		document.forms[0].action ="<%=returnUrl%>";
	}
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
  		
	  	var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"==stateCode){
		  	alert("����ʵ��["+actName+"]�Ѿ����𣬲������ظ�����");
		  	return;
		  }
		 if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN_NOT_RUNNING%>")!=-1){
		  	alert("����ʵ��["+actName+"]û�д�������״̬�����������");
		  	return;
		  }
		  if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_CLOSED%>")!=-1){
		  	alert("����ʵ��["+actName+"]�Ѿ����������������");
		  	return;
		  }
  }
document.forms[0].action ="activityadmin.cmd?method=suspendActivity";  
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
  		
	  	var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_CLOSED%>")!=-1){
		  	alert("����ʵ��["+actName+"]�Ѿ�������������ָ���");
		  	return;
		  }
		if("<%=WfConstants.STATE_OPEN_NOT_RUNNING_SUSPENDED%>"!=stateCode){
		  	alert("����ʵ��["+actName+"]û�д��ڹ���״̬��������ָ���");
		  	return;
		  }
  }
    
document.forms[0].action ="activityadmin.cmd?method=resumeActivity";  
document.forms[0].submit();	
}
function forAbort(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
   var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN%>")==-1){
		  	alert("����ʵ��["+actName+"]�Ѿ��������������жϣ�");
		  	return;
		}
		
  }  
   if(!confirm("�ò������ɻָ����Ƿ������"))return;
document.forms[0].action ="activityadmin.cmd?method=abortActivity";  
document.forms[0].submit();	
}
function forTerminate(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  for(var i=0;i<row.length;i++){
  		var stateCode=row[i].split(",")[3];
	  	var actName=row[i].split(",")[1];
	  	if(stateCode.indexOf("<%=WfConstants.STATEPREFIX_OPEN%>")==-1){
		  	alert("����ʵ��["+actName+"]�Ѿ���������������ֹ��");
		  	return;
		}
  }   
  if(!confirm("�ò������ɻָ����Ƿ������"))return;
document.forms[0].action ="activityadmin.cmd?method=terminateActivity";  
document.forms[0].submit();	
}
function showHistory(){
if(!getSelect())return;

document.forms[0].action ="activityadmin.cmd?method=showhistoryActivity";
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
function startActivity(){
	//if(!getSelect())return;
	var processId=document.all("processId").value;
	if(processId==null || processId==""){
		alert("ȱ������ʵ��ID");
		return;
	}
	var url="jsp/help.jsp?url=jsp/workflow/help/wf_activity_radio.jsp&processId="+processId;
	var actDefId=showModalDialog(url,window,"scroll:no;status:no;dialogWidth:500px;dialogHeight:400px");
	//var actDefId=window.prompt("������Ҫ����ʵ���Ļ��ڶ���ID:","");
	if(actDefId==null || actDefId=="")
		return ;
	document.forms[0].action ="activityadmin.cmd?method=startActivity&processId="+processId+"&actDefId="+actDefId;  
	document.forms[0].submit();	
}

</script>