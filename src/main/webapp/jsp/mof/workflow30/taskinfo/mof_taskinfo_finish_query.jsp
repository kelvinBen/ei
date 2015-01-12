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
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
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
	String extReturnUrl="moffinishtaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
%>
<html:form name="frmList" action="moffinishtaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
    
    <td  nowrap>开始日期：<date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
    <td  nowrap>结束日期：<date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	<td><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:radioCol caption="选择" width="35" property="id"  name="primaryKey" sortName="a.b"></flex:radioCol>
                          <flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT"></flex:flexCol>						  
                          <flex:flexCol caption='流程名称' width="250" property="name" sortName="taskinfo.sysProcessName"></flex:flexCol>						  
                          <flex:flexCol caption='表单名称' width="250" property="formName" sortName="taskinfo.sysFormName"></flex:flexCol>
                          <flex:flexCol caption='发起人' width="100" property="resourceReqName" sortName="taskinfo.sysResourceReqName"></flex:flexCol>
                          <flex:flexCol caption='发起时间' width="150" property="startedTime" sortName="taskinfo.sysProcStartedTime"></flex:flexCol>
                          <flex:flexCol caption='结束时间' width="150" property="lastStateTime" sortName="taskinfo.sysLastStateTime"></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="moffinishtaskinfoquery.cmd">
</flex:pagePolit>
</html:form>

<script language="javascript">

setTitleInTreeBar("工作流程－任务管理－结束任务");

setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var process_id=grid.getCellValue(i, 1);
		
		var subject=grid.getCellValue(i, 2);
		var processName=grid.getCellValue(i, 3);
		grid.getCell(i, 2).innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"')\">"+subject+"</a></span>";
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"')\">"+processName+"</a></span>";
								
}
function openFlow(){
if(!getSelect())return;
var sel=grid.getCheckLine();
var url="moftaskinfo.cmd?method=displaystatus&processId="+sel;
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forEnd(process_id){
	
  document.forms[0].action ="moftaskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  document.forms[0].submit();	
}
function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;
		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else	
	window.location.href="moftaskinfofinish.cmd?method=getProcessTypeList"; 
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
	document.forms[0].action="moffinishtaskinfoquery.cmd";
	document.forms[0].submit();	
}
</script>