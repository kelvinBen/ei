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
<html:button onclick="forDelete()" name="btn_del" value="ɾ��"></html:button>
<html:button onclick="openFlow()" name="btn_openflow" value="��ת״̬"></html:button>
<html:button onclick="forReturn()" name="btn_return" value="����"></html:button>
<html:button onclick="forReturnCur()" name="btn_return2" value="���ص���ǰ����"></html:button>
</div>
<br>
<html:messages/>
<%
String processMgrId=(String)request.getAttribute("processMgrId");
if(processMgrId==null)processMgrId="";
String procDefName_search=request.getParameter("procDefName_search");
if(procDefName_search==null)procDefName_search="";
%>
<html:form name="frmList" action="">

<input type="hidden" name="procDefName_search" value="<%=procDefName_search%>">
<input type="hidden" name="wfmgrname" value="<%=processMgrId%>">
<input type="hidden" name="processId" value="">
<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
  <flex:checkboxCol caption="ѡ��" width="35" property="procKey"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
  <flex:flexCol caption='����' width="250" property="procName" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='��������' width="250" property="procName" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='��ת״̬' width="100" property="procState" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='��ʼʱ��' width="100" property="startTime" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='����ʱ��' width="100" property="lastStateTime" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='��������ID' width="100" property="procType" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='��������' width="100" property="procTypeName" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='��������ID' width="100" property="procOrg" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='��������' width="100" property="procOrganName" sortName="a.b"></flex:flexCol>
  <flex:flexCol caption='����key' width="100" property="procKey" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='˵��' width="100" property="description" sortName="a.b"></flex:flexCol>

</flex:flexgrid>
<flex:pagePolit action="processendadminquery.cmd">
</flex:pagePolit>
</html:form>
<script language="javascript">
setTitleInTreeBar("��������-���̼��-�ѽ�������ʵ���б�");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var processId=grid.getCellValue(i, 1);
		var procName=grid.getCellValue(i, 3);
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:getActivityList('"+processId+"')\">"+procName+"</a></span>";
								
}
function getActivityList(processId){
	document.all("processId").value=processId;
  document.forms[0].action ="wfadminquery.cmd?method=getActivityEndList";  
  
  document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var sel=grid.getCheckLine();
var url="taskinfo.cmd?method=displaystatus&processId="+sel;
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  if(!confirm("�ò������ɻָ���ȷ��������"))return;
	document.forms[0].action ="processendadmin.cmd?method=deleteProcessEnd";
	document.forms[0].submit();	  
}
function forReturn(){
	document.all("procDefName_search").value="";
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
function forReturnCur(){
	document.forms[0].action ="processmgradminquery.cmd?clear=true";
	document.forms[0].submit();	
}
</script>