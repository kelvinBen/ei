<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>

<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='XMLSelTree.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
</HEAD>
<%
//	Map stateMap = new HashMap();
//		stateMap.put("0", "����");
//		stateMap.put("1", "ͣ��");
//		request.setAttribute("statelist", stateMap);
//		Map onlynewMap = new HashMap();
//		onlynewMap.put("0", "��");
//		onlynewMap.put("1", "��");
//		request.setAttribute("onlynewlist", onlynewMap);
		
String process_name=request.getParameter("PROCESS_NAME");
if(process_name==null)process_name="";
String state_search=request.getParameter("CURRENT_STATE"); 
if(state_search==null)state_search="";
String onlynew_search=request.getParameter("onlynew_search");
if(onlynew_search==null)onlynew_search="";
%>
<BODY topmargin="10px" >
<div class="btnareaCss">

<!--<html:button onclick="forUpload()" name="btn_upload" value="����"></html:button> 
<html:button onclick="forProcess()" name="btn_process" value="�鿴����ʵ��"></html:button>-->
<html:button onclick="forStart()" name="btn_start" value="����"></html:button>
<html:button onclick="forStop()" name="btn_stop" value="ֹͣ"></html:button>
<html:button onclick="forDelete()" name="btn_delete" value="ɾ��"></html:button>
<!--  
<html:button onclick="forEndList()" name="btn_endlist" value="�鿴��������"></html:button>-->
<bsp:button onclick="forActivityLastTime()" action="wflasttime.cmd?method=activityLastTime" name="btn_activitylasttime" value="����ƽ������ʱ��"></bsp:button>
</div>
<br>
<html:messages/>
<html:form name="frmList" action="">
<input type="hidden" name="wfmgrname" value="">

<table id="tblSearch">
<flex:search>
	<tr>
 
    <td>
    �������ƣ�<flex:searchText name="PROCESS_NAME" searchName="WF_PROCESS_MGR.PROCESS_NAME" dataType="java.lang.String" operSymbol="=" value="<%=process_name%>" size="12"/>
    </td>

    <td>ֻ��ʾ���°汾:
    <flex:searchSelect name="onlynew_search" labeltitle="" size="1" searchName="processmgr.onlynew" dataType="java.lang.String" operSymbol="=" value="<%=onlynew_search%>">
	<html:option value=""></html:option>
	<html:option value="1">��</html:option>
	<html:option value="0">��</html:option>
	</flex:searchSelect>
    </td>  
    <td>״̬��
    <flex:searchSelect name="CURRENT_STATE" labeltitle="" size="1" searchName="processmgr.state" dataType="java.lang.String" operSymbol="=" value="<%=state_search%>">
	<html:option value=""></html:option>
	<html:option value="0">����</html:option>
	<html:option value="1">ͣ��</html:option>
	</flex:searchSelect>
	
    </td>
    
    <td><flex:searchImg name="chaxun" action="processmgradminquery.cmd?clear=true" image="search.gif"/></td>
	</tr>
</flex:search>
</table>

<flex:flexgrid name="grid" height="350" action="" isSubmit="false">
  <flex:checkboxCol caption="ѡ��" width="35" property="name"  name="primaryKey" sortName="a.b"></flex:checkboxCol>
  <flex:flexCol caption='����ID' width="300" property="processDefinitionId" sortName="WF_PROCESS_MGR.PROCESS_NAME" style="display:none" canSort="false"></flex:flexCol>
  <flex:flexCol caption='��������' width="300" property="processDisName" sortName="WF_PROCESS_MGR.PROCESS_NAME" canSort="false"></flex:flexCol>
  <flex:flexCol caption='���̰汾' width="100" property="version" sortName="WF_PROCESS_MGR.PROC_VERSION"></flex:flexCol>
  <flex:flexCol caption='����״̬' width="100" property="state" sortName="a.b" style="display:none"></flex:flexCol>

  <flex:flexCol caption='����״̬' width="100" property="mgrState" sortName="a.b" ></flex:flexCol>
  <flex:flexCol caption='δ�������ʵ����' width="150" property="procCount" sortName="a.b" ></flex:flexCol>
  <flex:flexCol caption='���������ʵ����' width="150" property="procEndCount" sortName="a.b" ></flex:flexCol>
  
  <flex:flexCol caption='��������ID' width="100" property="procOrg" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='��������' width="100" property="procOrgName" sortName="a.b" ></flex:flexCol>
  <flex:flexCol caption='��������ID' width="100" property="processType" sortName="a.b" style="display:none"></flex:flexCol>
  <flex:flexCol caption='��������' width="100" property="procTypeName" sortName="a.b" ></flex:flexCol>

</flex:flexgrid>
<flex:pagePolit action="processmgradminquery.cmd?clear=true">
</flex:pagePolit>
</html:form>
<script language="javascript">
setTitleInTreeBar("��������-���̼��-�������������̶����б�");
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
	var wfmgrname=grid.getCellValue(i, 1);
	var procName=grid.getCellValue(i, 3);
	var processDefinitionId= grid.getCellValue(i, 2);
	var versionId=grid.getCellValue(i,4);
	//������ʾ����ͼ --������
	//grid.getCell(i, 2).innerHTML ="<span nowrap='true'><a href=\"javascript:getProcessList('"+versionId+"','"+wfmgrname+"')\">"+procName+"</a></span>";
	grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:showProcStatus('"+processDefinitionId+"')\">"+procName+"</a></span>";
	
	var procCount=grid.getCellValue(i,7);
	grid.getCell(i, 7).innerHTML ="<span nowrap='true'><a href=\"javascript:getProcessList('"+versionId+"','"+wfmgrname+"')\">"+procCount+"</a></span>";
	
	var procEndCount=grid.getCellValue(i,8);
	grid.getCell(i, 8).innerHTML ="<span nowrap='true'><a href=\"javascript:forEndList( '"+wfmgrname+"')\">"+procEndCount+"</a></span>";
	
							
								
}
function getProcessList(versionId,wfmgrname){
	document.all("wfmgrname").value=wfmgrname;
  document.forms[0].action ="wfadminquery.cmd?method=getProcessList";  
  
  document.forms[0].submit();	
}
function forEndList(wfmgrname){
if(wfmgrname){
	document.all("wfmgrname").value=wfmgrname;
	document.forms[0].action ="processendadminquery.cmd";  
    resetPageIndex(); 
    document.forms[0].submit();
    return ;
}else if(!getSelect())return;

document.all("wfmgrname").value=grid.getCheckLine();
 resetPageIndex(); 
//  var proc_nameSearch=document.all("procDefName_search");
//  if(proc_nameSearch.value==null || proc_nameSearch.value==""){
//  	proc_nameSearch.value=grid.getCellValue(grid.getCheckLineNo(),2);
//  }
  document.forms[0].action ="processendadminquery.cmd";  
  resetPageIndex(); 
  document.forms[0].submit();
}

function forUpload(){
window.location.href="processmgr.cmd?method=forupload";
}
function forActivityLastTime(){
if(!getSelect())return;
var mgrName=grid.getCheckLine();
document.all("wfmgrname").value=mgrName;
  document.forms[0].action ="wflasttime.cmd?method=activityLastTime";  
  document.forms[0].submit();
}
//��������
function forStart(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		//����״̬
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	
	  	if(stateCode=="0"){
		  	alert("����["+procName+"]�Ѿ�������");
		  	return;
	    }
  }
  
  document.forms[0].action ="processmgr.cmd?method=startProcessMgr";  
  document.forms[0].submit();
}
//ֹͣ
function forStop(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
	  	var stateCode=row[i].split(",")[4];
	  	var procName=row[i].split(",")[2];
	  	
	  	if(stateCode!="0"){
		  	alert("����["+procName+"]�Ѿ�ͣ�ã�");
		  	return;
	    }
  }
  document.forms[0].action ="processmgr.cmd?method=stopProcessMgr";  
  document.forms[0].submit();
}

function forDelete(){
  var sel=grid.getCheckLine();
  if(sel==""){
    alert("��ѡ��һ����¼!");
    return false;
  }
  
    var row=grid.getCheckAll().split("|");
  
  for(var i=0;i<row.length;i++){
  		
	  	var procCount=row[i].split(",")[6];
	  	var procEndCount=row[i].split(",")[7];
	  	var procName=row[i].split(",")[2];
	  	if(procCount>0){
		  	alert("����["+procName+"]����["+procCount+"]��δ�������ʵ����������ɾ����");
		  	return;
		  }
		 if(procEndCount>0){
		  	alert("����["+procName+"]����["+procEndCount+"]�����������ʵ����������ɾ����");
		  	return;
		  } 
  }
  
  if(!confirm("�ò������ɻָ����Ƿ������"))return;
  document.forms[0].action ="processmgr.cmd?method=deleteProcessMgr";  
  document.forms[0].submit();
}

function forReturn(){
	window.history.back();
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

function forProcess(){
  document.forms[0].action ="processalladminquery.cmd";  
  resetPageIndex(); 
  document.forms[0].submit();
}

//��ʾ����ͼ��
function showProcStatus(curFlowId){

   	var url="taskinfo.cmd?method=displaystatus&processId="+ ""+ "&curFormId=" +""+"&curFlowId="+curFlowId;
	window.open(url);
}


</script>