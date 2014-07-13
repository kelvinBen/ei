<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.*"%>

<%@page import="net.mast.util.RequestUtil"%>
<HTML>
<HEAD>
<TITLE>已办任务</TITLE>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
</HEAD>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<div class="btnareaCss">
<!--//<html:button onclick="openFlow()" name="btn_openflow" value="流转状态"></html:button>

<html:button name="btn_deal" value="返回" onclick="forReturn()"></html:button>
-->
</div>
<% 
String process_subject=request.getParameter("process_subject");
if(process_subject==null){
	process_subject="";
}
//out.print(request.getAttribute("flexgrid.data"));
String organId=(String)request.getAttribute("ORGAN_ID");
String startTime=request.getParameter("startTime");
String endTime=request.getParameter("endTime");
if(startTime==null)startTime="";
if(endTime==null)endTime="";
String isShowReturnBtn=request.getParameter("isShowReturnBtn");
if(isShowReturnBtn==null)isShowReturnBtn="";
String processType = RequestUtil.getAttrOrPara2String(request, "processType");
	if(processType==null)processType="";
    String procDefId = RequestUtil.getAttrOrPara2String(request, "procDefId");
	if(procDefId==null)procDefId="";
	String extReturnUrl="oldtaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
%>

<html:form name="frmList" action="oldtaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
<%
Map searchColums= (Map)request.getAttribute("searchColums");
if(searchColums!=null){
Iterator<String> its=searchColums.keySet().iterator();
int cnt=0;
while(its.hasNext()){
	String fieldid=(String)its.next();
	String value=RequestUtil.getPara2String(request,fieldid);
	String title=(String)searchColums.get(fieldid);
	if(cnt%2==0){ //每个查询条件输出一行
%>	
<%} %>
	<td class="tdLeft"><%=title %>：</td>
	<td class="tdRight" >
	<html:text name="<%=fieldid %>" value="<%=value%>" size="20"></html:text>	
	</td>
<%if(cnt%2==1){ %>
<% 	
}
cnt++;
}
}
%>	
	<td class="tdRight"><flex:searchImg name="chaxun" action="oldtaskinfoquery.cmd" image="search.gif"/></td>
	</tr>

	
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
      <flex:radioCol caption='选择' width="50" property="ACTIVITY_ID" name="primaryKey" sortName="taskinfo.sysActivityId"  canSort="false"></flex:radioCol>
      <flex:flexCol caption='流程实例ID' width="100" property="PROCESS_ID" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
      <flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="P.SUBJECT" style="display:none" canSort="false"></flex:flexCol>
      <flex:flexCol caption='当前处理人Id' width="100" property="CUR_USER_ID" sortName="P.CUR_USER_ID" style="display:none" canSort="false">  </flex:flexCol>
      <flex:flexCol caption='表单类型' width="100" property="PROCESS_RESERVE_TYPE_ID" style="display:none" sortName="P.PROCESS_RESERVE_TYPE_ID"  canSort="false">  </flex:flexCol>   
        
	  <%		
	  Map reserveM =(Map)request.getAttribute("reserveM");
	  if(reserveM!=null){
 	  Iterator it=reserveM.keySet().iterator();
      while(it.hasNext()){
	 String fieldid=(String)it.next();
	 String sortname="F."+fieldid;
	 String title=(String)reserveM.get(fieldid);
	 	if(fieldid.equals("FLD_ESTIMATE_CURRENCY")){
		 	%>
		 	 <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" type="enum" enumCollection="PRWPRAPPLY_FLDESTIMATECURRENCY_COLLECTION" enumKey ="key" enumValue="value" sortName="<%=sortname%>" />
		 	
		 	<%}else{
			%>
		     <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" sortName="<%=sortname%>" />
			<%
		 	}
	 		}
			}
			%>     
      <flex:flexCol caption='当前环节' width="150" property="ACTIVITY_NAME" sortName="P.ACTIVITY_NAME" canSort="true"></flex:flexCol>
      <flex:flexCol caption='当前处理人' width="100" property="CUR_USER_NAME" sortName="P.CUR_USER_NAME" canSort="true"></flex:flexCol>
      <flex:flexCol caption='发送环节' width="100" property="PREVIOUS_ACTIVITY_NAME" sortName="P.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
      <flex:flexCol caption='发送人' width="100" property="PREVIOUS_RESOURCE_NAME" sortName="P.PREVIOUS_RESOURCE_NAME" canSort="true"></flex:flexCol>
      <flex:flexCol caption='发送时间' width="150" property="CREATE_TIME" sortName="P.CREATE_TIME"  ></flex:flexCol>
      <flex:flexCol caption='流程名称' width="150" property="PROCESS_NAME" sortName="P.PROCESS_NAME" canSort="true"></flex:flexCol>
      <flex:flexCol caption='当前状态' width="100" property="ACT_CURRENT_STATE" sortName="P.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
      <flex:flexCol caption='查阅状态' width="100" property="READ_MARK" sortName="P.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="true" style="display:none"></flex:flexCol>
 </support:flexgrid>
 <a href="javascript:exportExcel()" style="text-align:center;padding:2" title="输出excel"><img src="skins/default/images/excel.gif" align="absmiddle" border="0">导出 Excel</a>
<flex:pagePolit action="oldtaskinfoquery.cmd">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function exportExcel(){
	var procDefId = document.all("procDefId").value;
	if (procDefId == "Package_78a048534f0_Wor1" ){
		document.forms[0].action="headTaskInfo.cmd?method=exportZaiBanExcel";
	}else if(procDefId == "Package_d710071985_Wor1"){
		document.forms[0].action="localTaskInfo.cmd?method=exportZaiBanExcel";
	}
	document.forms[0].submit();	
}
function init(){
setTitleInTreeBar("工作流程－任务管理－已办任务");

//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");

var procDefId = document.all("procDefId").value;
if (procDefId == "Package_78a048534f0_Wor1" || procDefId == "Package_d710071985_Wor1"){
	init2();
}else{
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 1);
		var process_id=grid.getCellValue(i, 2);
		var subject=grid.getCellValue(i, 6);
		var formplugin =grid.getCellValue(i, 5);
		var curUserId =grid.getCellValue(i, 4);
		grid.getCell(i, 6).innerHTML ="<span nowrap='true'><a href=\"javascript:forold('"+activity_id+"','"+process_id+"','"+formplugin+"','"+curUserId+"')\">"+subject+"</a></span>";
								
	}
}

}
/**
 * 已重写
 * @param {Object} activity_id
 * @param {Object} process_id
 * @param {Object} formplugin
 * @param {Object} curUserId
 * @param {Object} addUrl
 */
function forold(activity_id,process_id,formplugin,curUserId,addUrl){
//在此进行扩展，实现无表单的处理
  if(formplugin.indexOf("Jsp_NoneField")>=0){
  	document.forms[0].action ="wftaskdeal.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("Jsp_Field")>=0){
  document.forms[0].action ="jspfield.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("MdaForm")>=0){
    document.forms[0].action ="moftaskinfo.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  } else if(formplugin.indexOf("JspForm")>=0){
    document.forms[0].action ="jspformtaskdeal.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("wfd_self")>=0){
  		document.forms[0].action = "taskinfo.cmd?method=forwfd_selfold&activityId="+activity_id+"&processId="+process_id+"&user_id="+curUserId;
  }else{
  	document.forms[0].action ="taskinfo.cmd?method=forold&activityId="+activity_id+"&processId="+process_id+"&curUserId="+curUserId;
  }
  document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="taskinfo.cmd?method=displaystatus&processId="+row[1];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;
		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else
	window.location.href="taskinfoyiban.cmd?method=getProcessTypeList"; 
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
	document.forms[0].action="oldtaskinfoquery.cmd";
	document.forms[0].submit();	
}
</script>
<script type="text/javascript" src="js/sp/FlexGridOverride.js"></script>
<script type="text/javascript" src="jsp/workflow/taskinfo/old_custom.js"></script>