<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.web.taglib.util.skin.SkinUtils"%>
<%@ page import="net.mast.workflow.wfclient.utils.MatrixHref"%>	
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-tab" prefix="tab"%>	
<HTML>
<HEAD>
<TITLE>待办列表</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<script language="javascript" src="<mast:ui js='inching.js'/>"></script>
<script language="javascript" src="<mast:ui js='tab.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="jsp/workflow/resource/js/specialField.js"></script>
<script language="javascript">
function selectCreator(){
	var url ="jsp/help.jsp?url=stru.cmd&method=getEmpRoot";
	var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:580px;dialogHeight:530px");
	if(win==null)return;
	var ret = parseTree(win);
	document.all('process_creator').value=ret[0];
	document.all('process_creator_name').value=ret[1];	
	document.getElementById("process_creator_dis").innerHTML=getHref('jsp/workflow/organ/matrix2stru4ogran.jsp?organId=',ret[2]);
}
function selectHr(){
	selectField('jsp/help.jsp?url=wf_struhelp.cmd&method=getEmpRoot',document.all('process_selParty'),window.process_selParty_dis);
	document.all('process_selParty_name').value = window.process_selParty_dis.innerHTML;
}
function selectMeeting(){
	selectField('jsp/help.jsp?url=wfmeetinghelp.cmd',document.all('meeting_radio'),window.meeting_radio_dis);	
	document.all('meeting_radio_name').value = window.meeting_radio_dis.innerHTML;
}
function selectDoc(){
	selectField('jsp/help.jsp?url=wfdochelpradio.cmd',document.all('doc_radio'),window.doc_radio_dis);	
	
		
	var url=window.doc_radio_dis.innerHTML;
	url=url.replace("&","&matrix=true&");
	window.doc_radio_dis.innerHTML=url;
	
	
	document.all('doc_radio_name').value = window.doc_radio_dis.innerHTML;
}
</script>
</HEAD>

<%
	String process_kind = request.getParameter("process_kind");
	if(process_kind == null ){
		process_kind = "";
	}
	String process_startTime = request.getParameter("process_startTime");
	if(process_startTime == null ){
		process_startTime = "";
	}
	String process_endTime = request.getParameter("process_endTime");
	if(process_endTime == null ){
		process_endTime = "";
	}
	String process_creator = request.getParameter("process_creator");
	if(process_creator == null ){
		process_creator = "";
	}
	String process_creator_name = request.getParameter("process_creator_name");
	if(process_creator_name == null ){
		process_creator_name = "";
	}
	String process_selParty = request.getParameter("process_selParty");
	if(process_selParty == null ){
		process_selParty = "";
	}
	String process_selParty_name = request.getParameter("process_selParty_name");
	if(process_selParty_name == null ){
		process_selParty_name = "";
	}
	String process_subject=request.getParameter("process_subject");
	if(process_subject==null){
		process_subject="";
	}
	String meeting_radio = request.getParameter("meeting_radio");
	if(meeting_radio == null ){
		meeting_radio = "";
	}
	String meeting_radio_name = request.getParameter("meeting_radio_name");
	if(meeting_radio_name == null ){
		meeting_radio_name = "";
	}
	String doc_radio = request.getParameter("doc_radio");
	if(doc_radio == null ){
		doc_radio = "";
	}
	String doc_radio_name = request.getParameter("doc_radio_name");
	if(doc_radio_name == null ){
		doc_radio_name = "";
	}
%>

<script language='javascript'>
function search(){
	try {
	var startTime=document.all("process_startTime").value;
	var endTime=document.all("process_endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("结束时间不能小于开始时间！");
			return;
		}
	}
	document.forms[0].action ="taskquery.cmd";    
	document.forms[0].submit();
	}catch (err){
  	    return;
  	}
	    	
}
</script>


<BODY topmargin="10px" onload="init()">
<div class="btnareaCss">
	<html:button onclick="search()" name="chaxun" value="查询"></html:button>
	<html:button onclick="forDetail()" name="forDetail" value="查看"></html:button>
</div>
<fieldset class="FieldsetCss"><legend>查询条件</legend>
<html:form name="frmList" action="">
<table id="tblSearch" width="100%">
<input type="hidden" name="EXT_RETURN_URL" value="taskquery.cmd">
<flex:search>
	<tr>
		<td  class="TdLeft">流程状态：</td>
		<td  class="tdRight">
			<flex:searchSelect name="process_kind" searchName="taskinfo.process_kind" dataType="java.lang.String" operSymbol="=" value="<%=process_kind%>">
				<html:option value="daiBan">待办</html:option>
				<html:option value="zaiBan">在办</html:option>
				<html:option value="yiBan">已办</html:option>
				<html:option value="wanCheng">完成</html:option>
			</flex:searchSelect>
		</td>
		<td  class="TdLeft">创建人：</td>
		<td  class="tdRight">
			<img src="skins/default/images/liulan.gif" onclick="selectCreator()" style="cursor:hand;" border="0">
            <html:hidden name="process_creator" value="<%=process_creator%>" write="false"/>
			<html:hidden name="process_creator_name" value="<%=process_creator_name%>" write="false"/>
            <span id="process_creator_dis" ><%=process_creator_name%></span>
		</td>
	</tr>
	<tr>
		<td  class="TdLeft">开始时间：</td>
		<td  class="tdRight">
			<flex:searchDate name="process_startTime" searchName="taskinfo.process_startTime" dataType="java.lang.String" operSymbol="="   divname="beginDatedd" value="<%=process_startTime%>"   readonly="true">
			</flex:searchDate><input style="visibility:hidden">
		</td>
		<td  class="TdLeft">结束时间：</td>
		<td  class="tdRight" >
			<flex:searchDate name="process_endTime" searchName="taskinfo.process_endTime" dataType="java.lang.String" operSymbol="="   divname="endDatedd" value="<%=process_endTime%>"   readonly="true">
			</flex:searchDate><input style="visibility:hidden">
		</td>
	</tr>
	
	<tr>
	<!--  
		<td  class="TdLeft">人力资源：</td>
		<td  class="tdRight">
			<img title="tab0defr2c1" src="skins/default/images/liulan.gif" border="0" onclick="selectHr()" style="cursor: pointer;">
			<span id="process_selParty_dis" title="process_selParty_dis"><%=process_selParty_name%></span>
			<html:hidden name="process_selParty_key" value="renliziyuan_radio" write="false"/>
			<html:hidden name="process_selParty_name" value="<%=process_selParty_name%>" write="flase"/>
			<textarea name="process_selParty" style="display:none" notnull=""><%=process_selParty%></textarea>
		</td>
		-->
		<td class="TdLeft">流程名称：</td>
		<td  class="tdRight">
		<flex:searchText name="process_subject" searchName="process.subject" value="<%=process_subject%>" size="20" dataType="java.lang.String" operSymbol="="></flex:searchText>
		</td>
		
	</tr>
	
	<tr style="display:none">
		<td  class="TdLeft">相关知识：</td>
		<td  class="tdRight" >
			<img title="tab0defr2c1" src="skins/default/images/liulan.gif" border="0" onclick="selectDoc()" style="cursor: pointer;">
			<span id="doc_radio_dis" title="doc_radio_dis"><%=doc_radio_name%></span>
			<html:hidden name="doc_radio_key" value="doc_radio" write="false"/>
			<html:hidden name="doc_radio_name" value="<%=doc_radio_name%>" write="flase"/>
			<textarea name="doc_radio" style="display:none" notnull=""><%=doc_radio%></textarea>
		</td>
		<td  class="TdLeft">相关会议：</td>
		<td  class="tdRight">
			<img title="tab0defr2c1" src="skins/default/images/liulan.gif" border="0" onclick="selectMeeting()" style="cursor: pointer;">
			<span id="meeting_radio_dis" title="meeting_radio_dis"><%=meeting_radio_name%></span>
			<textarea name="meeting_radio" style="display:none" notnull=""><%=meeting_radio%></textarea>
			<html:hidden name="meeting_radio_key" value="meeting_radio" write="false"/>
			<html:hidden name="meeting_radio_name" value="<%=meeting_radio_name%>" write="flase"/>
		</td>
	</tr>
</flex:search>
</table>
</fieldset>
<flex:flexgrid name="grid" height="360" action="" isSubmit="true">
<%
	if(process_kind.equals("wanCheng")){
%>
		<flex:radioCol caption="选择" width="50" property="sysProcessId"  name="primaryKey" sortName="taskinfo.sysProcessId" onclick="setCurrentLine()"></flex:radioCol>
		<flex:flexCol caption='流程实例ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none"></flex:flexCol>
		<flex:flexCol caption='流程名称' width="250" property="sysProcessName" sortName="taskinfo.sysProcessName"></flex:flexCol>
		<flex:flexCol caption='创建人' width="100" property="sysResourceReqName" sortName="taskinfo.sysResourceReqName"></flex:flexCol>
		<flex:flexCol caption='结束时间' width="150" property="sysLastStateTime" sortName="taskinfo.sysLastStateTime"></flex:flexCol>
<%
	}else{	
%>
		<flex:radioCol caption="选择" width="50" property="sysActivityId"  name="primaryKey" sortName="taskinfo.sysActivityId" onclick="setCurrentLine()"></flex:radioCol>
		<flex:flexCol caption='流程实例ID' width="100" property="sysProcessId" sortName="taskinfo.sysProcessId" style="display:none"></flex:flexCol>
		<flex:flexCol caption='流程名称' width="250" property="sysProcessName" sortName="taskinfo.sysProcessName"></flex:flexCol>
		<flex:flexCol caption='当前环节' width="150" property="sysActivityName" sortName="taskinfo.sysActivityName"></flex:flexCol>
		<flex:flexCol caption='当前处理人' width="80" property="sysUserName" sortName="taskinfo.sysUserName"></flex:flexCol>
		<flex:flexCol caption='发送环节' width="100" property="sysPreviousActivityName" sortName="taskinfo.sysPreviousActivityName"></flex:flexCol>
		<flex:flexCol caption='发送人' width="80" property="sysPreviousResourceName" sortName="taskinfo.sysPreviousResourceName"></flex:flexCol>
		<flex:flexCol caption='发送时间' width="150" property="sysActCreateTime" sortName="taskinfo.sysActCreateTime"></flex:flexCol>
		<flex:flexCol caption='资源类型' width="150" property="RESOURCE_TYPE" sortName="taskinfo.RESOURCE_TYPE" canSort="false" ></flex:flexCol>
<%
	}
%>
        <flex:flexCol caption='创建时间' width="150" property="sysProcStartedTime" sortName="taskinfo.sysProcStartedTime"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="taskquery.cmd">
</flex:pagePolit>
<html:hidden name="currentLine" value="0" />
</html:form>
</body>
</html>
<script language="javascript">

function init(){
	setTitleInTreeBar("工作流程－查询管理－流程查询");
	//setGridHeight("grid",0.4);
	grid.show();
	grid.setSumText("");
	
}
function setCurrentLine(){
	var currentLine=document.all("currentLine");
	currentLine.value=grid.getCurrentLine();
	//alert(currentLine.value);
}

function forDetail(){
  if(!getSelect())return;
  //var row = grid.getCurrentLine();
  var row = document.all("currentLine").value;
  var processId = grid.getCellValue(row,2);
  var kind = document.forms[0].process_kind.value;
  var action = "";
  if(kind == "daiBan" ||kind == "zaiBan"){
	action = "taskinfo.cmd?method=fordeal&activityId="+grid.getCheckLine()+"&processId="+processId;
  }else if(kind == "yiBan"){
	action = "taskinfo.cmd?method=forold&activityId="+grid.getCheckLine()+"&processId="+processId;
  }else if(kind == "wanCheng"){
	action = "taskinfo.cmd?method=forend&processId="+processId; 
  }else{
	return;
  }
  document.forms[0].action = action;   
  document.forms[0].submit();	
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
</script>