<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>

<%@ page import="net.mast.util.RequestUtil"%>
<%@ page import="java.util.*"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script type="text/javascript">
function openDiv(){
	var _temp = window.parent.frames["banner"];
	if(null == _temp){
		var _otherTemp = window.parent.parent.frames["banner"];
		if(null == _otherTemp){
			window.parent.parent.parent.frames["banner"].closeDiv();
			window.parent.parent.parent.frames["contents"].closeDiv();
		}else{
			window.parent.parent.frames["banner"].closeDiv();
			window.parent.parent.frames["contents"].closeDiv();
		}
	}else{
		window.parent.frames["banner"].closeDiv();
		window.parent.frames["contents"].closeDiv();
	}
}
</script>
</HEAD>
<BODY topmargin="10px" onload="init();openDiv();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script type="text/javascript" src="js/sp/FlexGridOverride.js"></script>

<% 
String process_subject=request.getParameter("process_subject");
if(process_subject==null){
	process_subject="";
}
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
	String processType=RequestUtil.getAttrOrPara2String(request,"processType");
	if(processType==null)processType="";
	String procDefId=RequestUtil.getAttrOrPara2String(request,"procDefId");
	if(procDefId==null)procDefId="";
	String extReturnUrl="taskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&readMark="+readMark+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;	
	// List reserveList=(List)request.getAttribute("reserveList");
	String processSender=request.getParameter("processSender");
	if(processSender==null)processSender="";
%>
<html:form name="frmList" action="taskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="processSender" value="<%=processSender%>">
<div class="btnareaCss">
<!-- // 
<html:button onclick="openFlow()" name="btn_openflow" value="查看流程图"></html:button>

<html:button onclick="forReturn()" name="btn_deal" value="返回"></html:button>
-->
</div>
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
<tr>
<%
Map searchColums= (Map)request.getAttribute("searchColums");
if(searchColums!=null){
Iterator<String> its = searchColums.keySet().iterator();
int cnt=0;
while(its.hasNext()){
String fieldid=(String)its.next();
String value=RequestUtil.getPara2String(request,fieldid);
String title=(String)searchColums.get(fieldid);
if(cnt%2==0){ //每个查询条件输出一行
} 
%>
<td class="tdLeft"><%=title %>：</td>
<td class="tdRight" >
<html:text name="<%=fieldid %>" value="<%=value%>" size="20"></html:text></td><%if(cnt%2==1){ %>
<% 	
}
cnt++;
}
}
%><td width="100" align="center"><flex:searchImg name="chaxun" action="taskinfoquery.cmd" image="search.gif"/></td>
	</tr>
	<tr>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
        <flex:checkboxCol caption='选择' width="50" property="ACTIVITY_ID" name="primaryKey" sortName="taskinfo.ACTIVITY_ID"  canSort="false"></flex:checkboxCol>
        <flex:flexCol caption='流程实例ID' width="100" property="PROCESS_ID" sortName="taskinfo.PROCESS_ID" style="display:none" canSort="false"></flex:flexCol>
		<flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" style="display:none" canSort="false"></flex:flexCol>
        <flex:flexCol caption='表单类型' width="100" property="PROCESS_RESERVE_TYPE_ID" style="display:none" sortName="WF_TASK_LIST.PROCESS_RESERVE_TYPE_ID"  canSort="false">  </flex:flexCol>         
        <flex:flexCol caption='优先级' width="60" property="PRIORITY" sortName="WF_TASK_LIST.PRIORITY" style="display:none" canSort="true"></flex:flexCol>
        <flex:flexCol caption='当前处理人ID' width="100" property="USER_ID" sortName="WF_TASK_LIST.USER_ID" canSort="true" style="display:none"></flex:flexCol>
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
        <flex:flexCol caption='当前处理人' width="100" property="USER_NAME" sortName="P.USER_NAME" canSort="true"></flex:flexCol>
        <flex:flexCol caption='发送环节' width="100" property="PREVIOUS_ACTIVITY_NAME" sortName="P.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
        <flex:flexCol caption='发送人' width="100" property="PREVIOUS_RESOURCE_NAME" sortName="P.PREVIOUS_RESOURCE_NAME" canSort="true"></flex:flexCol>
        <flex:flexCol caption='发送时间' width="140" property="CREATE_TIME" sortName="P.CREATE_TIME" canSort="true"></flex:flexCol>
        <flex:flexCol caption='流程名称' style="display:none" width="250" property="PROCESS_NAME" sortName="P.PROCESS_NAME" canSort="true"></flex:flexCol>
        <flex:flexCol caption='当前状态' width="100" property="ACT_CURRENT_STATE" style="display:none" sortName="P.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
        <flex:flexCol caption='查阅状态' width="100" property="READ_MARK" sortName="P.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="true" style="display:none"></flex:flexCol>
		<flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false" style="display:none"></flex:flexCol>
 </support:flexgrid>
<flex:pagePolit action="taskinfoquery.cmd">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
	var activity_id=grid.getCellValue(i, 1);
	var process_id=grid.getCellValue(i, 2);
	var organ_id=grid.getCellValue(i,6);
	var subject=grid.getCellValue(i, 3);
	var formPlugin = grid.getCellValue(i,4);
	
	//var readMark=grid.getCellValue(i,13);
	var readMark = null;
	
	var prapplyno = grid.getCellValue(i, 7);
	
	var changeapplyno = grid.getCellEx(i, "FLD_CHANGENO");
	// grid.getCell(i, 7).innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+activity_id+"','"+process_id+"','"+organ_id+"','"+formPlugin+"','"+readMark+"','"+1+"')\">"+prapplyno+"</a></span>";						
	
	if(changeapplyno==null||changeapplyno.innerText.length<=0){
		grid.getCellEx(i, "FLD_APPLYNO").innerHTML ="<span nowrap='true'><a href=\"javascript:forDeal('"+activity_id+"','"+process_id+"','"+organ_id+"','"+formPlugin+"','"+readMark+"','"+1+"')\">"+prapplyno+"</a></span>";						
	}else{
		// grid.getCell(i, 7).innerHTML ="<span nowrap='true'><a href=\"javascript:forDealEx('"+activity_id+"','"+process_id+"','"+organ_id+"','"+formPlugin+"','"+readMark+"','"+1+"')\">"+prapplyno+"</a></span>";						
		grid.getCellEx(i, "FLD_CHANGENO").innerHTML ="<span nowrap='true'><a href=\"javascript:forDealEx('"+activity_id+"','"+process_id+"','"+organ_id+"','"+formPlugin+"','"+readMark+"','"+2+"')\">"+changeapplyno.innerText+"</a></span>";						
		
	}
	
}
}

function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="taskinfo.cmd?method=displaystatus&processId="+row[1];  
showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forDeal(activity_id,process_id,organ_id,formPlugin,readMark){
//可以在此对自己写的url进行特别处理，可进行扩展
 if(formPlugin.indexOf("Jsp_NoneField")>=0){
    	document.forms[0].action ="wftaskdeal.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;  
  	}else if(formPlugin.indexOf("Jsp_Field")>=0){
  		document.forms[0].action = "jspfield.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
  	}else if(formPlugin.indexOf("MdaForm")>=0){
  		document.forms[0].action = "moftaskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
  	}else if(formPlugin.indexOf("JspForm")>=0){
  		document.forms[0].action = "jspformtaskdeal.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
  	}else if(formPlugin.indexOf("wfd_self")>=0){
  		document.forms[0].action = "taskinfo.cmd?method=forwfd_selfdeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;
	}else{
	    document.forms[0].action ="taskinfo.cmd?method=fordeal&activityId="+activity_id+"&processId="+process_id+"&sysOrganId="+organ_id+"&readMark="+readMark;  
	}
	document.forms[0].submit();
}
function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else{
		var readMark=document.all("readMark").value;
		if(readMark=="" || readMark=="0")
		window.location.href="taskinfodaiban.cmd?method=getProcessTypeList"; 
		else
		window.location.href="taskinfozaiban.cmd?method=getProcessTypeList"; 
	}		
}
//取消了时间的查询
function forsearch(){
	var startTime=document.all("startTime").value;
	var endTime=document.all("endTime").value;
	if(startTime!="" && endTime!=""){
		if(startTime>endTime){
			alert("结束日期不能小于开始日期！");
			return;
		}
	}
	document.forms[0].action="taskinfoquery.cmd";
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

function batchapply(){

}
</script>
 
<script type="text/javascript" src="jsp/workflow/taskinfo/sp_custom.js"></script>