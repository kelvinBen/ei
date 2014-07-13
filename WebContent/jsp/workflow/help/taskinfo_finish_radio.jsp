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
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
</HEAD>
<BODY topmargin="10px">
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
	String extReturnUrl="finishtaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
	
List reserveList=(List)request.getAttribute("reserveList");
%>
<widgets:container title='流程任务信息' >
<html:form name="frmList" action="finishtaskinfoquery.cmd?isradiohelp=1">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
<table id="tblSearch">
<flex:search>
	<tr>
    
    <td  nowrap>开始日期：<date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	</tr>
	<tr>
	<td  nowrap>结束日期：<date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	<td><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
</flex:search>
</table>
<table border=0 width=100%>
<tr><td width=100%>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
                          <flex:radioCol caption="选择" width="35" property="id"  name="primaryKey" sortName="a.b"></flex:radioCol>
                          <flex:flexCol caption='标题' width="180" property="SUBJECT" sortName="taskinfo.SUBJECT"></flex:flexCol>						  
                          <flex:flexCol caption='流程名称' width="120" property="PROCESS_NAME" sortName="taskinfo.sysProcessName"></flex:flexCol>						  
                          <flex:flexCol caption='表单名称' width="150" property="FORM_ID" sortName="taskinfo.sysFormName" style="display:none"></flex:flexCol>
                          <flex:flexCol caption='发起人' width="60" property="RESOURCE_REQ_NAME" sortName="taskinfo.sysResourceReqName" ></flex:flexCol>
                          <flex:flexCol caption='发起时间' width="150" property="STARTED_TIME" sortName="taskinfo.sysProcStartedTime" ></flex:flexCol>
                          <flex:flexCol caption='结束时间' width="150" property="LAST_STATE_TIME" sortName="taskinfo.sysLastStateTime" style="display:none"></flex:flexCol>
                          
<%		for(int i=0;i<reserveList.size();i++){
			Map m = (Map)reserveList.get(i);
			String fieldid=(String)m.get("field-id");
			String title=(String)m.get("title");
			if("EDOC".equals(processType) && "EDOC_TYPE".equals(fieldid)){
%>
						   <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" sortName="taskinfo.<%=fieldid%>" type="enum" enumCollection="EDOC_TYPE_COLLECTION" enumKey="TYPE_ID" enumValue="TYPE_NAME" />
<%			
			} else {
%>
						   <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" sortName="taskinfo.<%=fieldid%>" />
<%
			}
		}
%>
</support:flexgrid>
<flex:pagePolit action="finishtaskinfoquery.cmd?isradiohelp=1">
</flex:pagePolit>
</td>
</tr>
</table>
<div align=center>
<table width=170><tr>
<td><button name="btnClose" onclick="doConfirm()"  class="advbutton"><%=ResourcesFactory.getString("button.confirm")%></button></td>
<td><button name="btnClose" onclick="doClose()"  class="advbutton"><%=ResourcesFactory.getString("button.close")%></button></td>
<td><button name="btnCancel" onclick="doCancel()"  class="advbutton"><%=ResourcesFactory.getString("button.cancel")%></button></td></tr></table></div>
</html:form>
</widgets:container>
<script language="javascript">
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
function getSelect(){
if(grid.getCurrentLine()==null){
	alert('<%=ResourcesFactory.getString("query.select")%>');
	return false;
}
  return true;
}
function doConfirm(){
	if(!getSelect()) return;
	var row=grid.getCurrentLine();
	var process_id=grid.getCellValue(row, 1);
	var result=new Array();
	var val=new Array();
	val["primary-value"]=grid.getCellValue(row,1);
	val["display-str"]=grid.getCellValue(row,2);
	val["display-url"]="taskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value+"&ishelp=1";	
	result[0]=val;
	parent.returnValue = result;
	parent.close();
}
function doCancel(){
	parent.returnValue="";
	parent.close();
}
function doClose(){
	parent.close();
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
	document.forms[0].action="finishtaskinfoquery.cmd?isradiohelp=1";
	document.forms[0].submit();	
}
</script>