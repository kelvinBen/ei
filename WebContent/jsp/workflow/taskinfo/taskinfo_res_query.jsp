<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ taglib uri="/tags/web-date" prefix="date"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List" %>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<%
String pageTitle=(String)request.getAttribute("title");
String processType=request.getParameter("processType");
	if(processType==null)processType="";
String procDefId=request.getParameter("procDefId");
	if(procDefId==null)procDefId="";
String isEdoc=(String)request.getParameter("isEdoc");	
if(isEdoc==null)isEdoc="0";
String extReturnUrl="restaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&isEdoc="+isEdoc;	
String process_subject=request.getParameter("process_subject");
if(process_subject==null){
	process_subject="";
}	
String readMark = request.getParameter("read_Mark");
if (readMark==null){
  readMark="";
}
List reserveList=(List)request.getAttribute("reserveList");
String startTime=request.getParameter("startTime");
String endTime=request.getParameter("endTime");
if(startTime==null)startTime="";
if(endTime==null)endTime="";
%>
<BODY topmargin="10px" onload="init();">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<div class="btnareaCss">
	<!--
<html:button name="btn_log" value="催办历史" onclick="forlog(1)"></html:button>
<html:button name="btn_log" value="改发历史" onclick="forlog(2)"></html:button>
<html:button name="btn_log" value="回收历史" onclick="hslog()"></html:button>
<html:button name="btn_log" value="跳过历史" onclick="forlog(4)"></html:button>
<html:button name="btn_log" value="冻结历史" onclick="forlog(5)"></html:button>
<html:button name="btn_log" value="解冻历史" onclick="forlog(6)"></html:button>
-->
<html:button onclick="openFlow()" name="btn_openflow" value="流转状态"></html:button>
<html:button onclick="reAssign()" name="btn_reAssign" value="改发"></html:button>
<html:button onclick="jumpTo()" name="btn_jumpTo" value="跳过"></html:button>
<html:button onclick="delFlow()" name="btn_delFlow" value="删除"></html:button>
<html:button name="btn_return" value="返回" onclick="doReturn()"></html:button>
</div>
<html:messages></html:messages>
<br>

<html:form name="frmList" action="restaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="isEdoc" value="<%=isEdoc%>">
<!--**********在监控任务中添加查询条件开始-->
<div><fieldset class="FieldsetCss"><legend>查询条件</legend>
<table id="tblSearch">
<flex:search>
	<tr>
	<td class="tdLeft">状态：</td>
    <td class="tdRight">
    <flex:searchSelect name="read_Mark" labeltitle="" size="1" searchName="taskinfo.readMark" dataType="java.lang.String" operSymbol="=" value="<%=readMark%>">
	<html:option value=""></html:option>
	<html:options collection="WF_TASKINFO_READMARK_COLLECTION" labelProperty="value" property="key"/>
	</flex:searchSelect>
	</td>
	<td class="tdLeft">标题：	</td>
	<td class="tdRight" >
	<flex:searchText name="process_subject" searchName="process.subject" value="<%=process_subject%>" size="20" dataType="java.lang.String" operSymbol="="></flex:searchText>
	</td>
	<tr>
    <td class="tdLeft" >开始日期：</td><TD class="tdRight"><date:date name="startTime" value="<%=startTime%>" zindex="20" divname="startTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"> </td>
    <td class="tdLeft" > 结束日期：</td><td class="tdRight"><date:date name="endTime" zindex="19" value="<%=endTime%>" divname="endTimedd" sourceFormat="yyyy-MM-dd" targetFormat="yyyy-MM-dd"  readonly="true"></date:date><input style="visibility:hidden"></td>
	<td class="tdRight"><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
	
</flex:search>
</table>
</fieldset>
 </div>

<!--***********在监控任务中添加查询条件结束-->
<div><fieldset class="FieldsetCss"><legend>预警标志说明</legend>
<table border=0><tr><td>
<font color='#FF0000' size='3'> <strong>! </strong> </font>表示任务已超时，<font color='#FFCC33' size='3'> <strong>! </strong> </font>表示任务已预警，<font color='#003399' size='3'> <strong>*</strong> </font>表示正常状态
</td></tr></table>
</fieldset>
 </div>
 
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
   <flex:flexCol caption='预警' width="50" property="icon" sortName="taskinfo.icon" canSort="false" showTitle="false"></flex:flexCol>
   <flex:checkboxCol caption="选择" width="50" property="ACTIVITY_ID"  name="primaryKey" sortName="taskinfo.sysActivityId" canSort="false"></flex:checkboxCol>
   <flex:flexCol caption='流程实例ID' width="100" property="PROCESS_ID" sortName="taskinfo.sysProcessId" style="display:none" canSort="false"></flex:flexCol>
   <flex:flexCol caption='环节ID' width="100" property="ACTIVITY_ID" sortName="taskinfo.sysActivityId" style="display:none" canSort="false"></flex:flexCol>
   <flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" canSort="false"></flex:flexCol>
   <flex:flexCol caption='当前环节' width="150" property="ACTIVITY_NAME" sortName="WF_ACT_LIST.ACTIVITY_NAME" canSort="true"></flex:flexCol>
   <flex:flexCol caption='当前处理人' width="100" property="CUR_USER_NAME" sortName="WF_ACT_LIST.CUR_USER_NAME" canSort="true"></flex:flexCol>
   <flex:flexCol caption='发送时间' width="150" property="CREATE_TIME" sortName="WF_ACT_LIST.CREATE_TIME" canSort="true"></flex:flexCol>
   <flex:flexCol caption='警告时间' width="150" property="warnTime" sortName="taskinfo.warnTime" canSort="false"></flex:flexCol>
   <flex:flexCol caption='限时时间' width="150" property="limitTime" sortName="taskinfo.limitTime" canSort="false"></flex:flexCol>
   <flex:flexCol caption='发送环节' width="100" property="PREVIOUS_ACTIVITY_NAME" sortName="WF_ACT_LIST.PREVIOUS_ACTIVITY_NAME" canSort="true"></flex:flexCol>
   <flex:flexCol caption='发送人' width="100" property="PREVIOUS_RESOURCE_NAME" sortName="WF_ACT_LIST.PREVIOUS_RESOURCE_NAME"  canSort="true"></flex:flexCol>
   <flex:flexCol caption='流程名称' width="250" property="PROCESS_NAME" sortName="WF_ACT_LIST.PROCESS_NAME" canSort="true"></flex:flexCol>
   <flex:flexCol caption='当前状态' width="100" property="ACT_CURRENT_STATE" sortName="WF_ACT_LIST.ACT_CURRENT_STATE"  type="enum" enumCollection="WF_STATE" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
   <flex:flexCol caption='查阅状态' width="100" property="READ_MARK" sortName="WF_ACT_LIST.READ_MARK"  type="enum" enumCollection="WF_TASKINFO_READMARK_COLLECTION" enumKey="key" enumValue="value" canSort="true"></flex:flexCol>
   <flex:flexCol caption='表单' width="100" property="FORM_ID" sortName="WF_TASK_LIST.FORM_ID" style="display:none" canSort="false">  </flex:flexCol>         
   <flex:flexCol caption='消息提醒方式' width="150" property="DCWORK_ACTIVITY_MSGTYPES" sortName="taskinfo.DCWORK_ACTIVITY_MSGTYPES" canSort="false"></flex:flexCol>
   <flex:flexCol caption='资源类型' width="150" property="RESOURCE_TYPE" sortName="taskinfo.RESOURCE_TYPE" canSort="false" style="display:none"></flex:flexCol>
   <flex:flexCol caption='当前处理人ID' width="150" property="CUR_USER_ID" sortName="taskinfo.sysResponseId" canSort="false" style="display:none"></flex:flexCol>
   <flex:flexCol caption='流程定义ID' width="150" property="PRO_DEFINITION_ID" sortName="taskinfo.PRO_DEFINITION_ID" canSort="false" style="display:none"></flex:flexCol>
   <flex:flexCol caption='环节定义ID' width="150" property="ACT_DEFINITION_ID" sortName="taskinfo.ACT_DEFINITION_ID" canSort="false" style="display:none"></flex:flexCol>
   <flex:flexCol caption='表单数据ID' width="150" property="SOURCE_REFERENCE_ID" sortName="taskinfo.SOURCE_REFERENCE_ID" canSort="false" style="display:none"></flex:flexCol>
   <flex:flexCol caption='流程类型ID' width="150" property="PROCESS_TYPE" sortName="taskinfo.PROCESS_TYPE" canSort="false" style="display:none"></flex:flexCol>
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
<flex:pagePolit action="restaskinfoquery.cmd">
</flex:pagePolit>

</html:form>
</body>
</html>
<script language="javascript">
function init(){
setTitleInTreeBar("<%=pageTitle%>");
//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		var activity_id=grid.getCellValue(i, 2);
		var process_id=grid.getCellValue(i, 3);
		var subject=grid.getCellValue(i, 5);
		var formplugin=grid.getCellValue(i ,16);
		grid.getCell(i, 5).innerHTML ="<span nowrap='true'><a href=\"javascript:forres('"+activity_id+"','"+process_id+"','"+formplugin+"')\">"+subject+"</a></span>";
								
}
}

function forres(activity_id,process_id,formplugin){
//在此可以对无表单url进行处理
 if(formplugin.indexOf("Jsp_NoneField")>=0){
	  document.forms[0].action ="wftaskdeal.cmd?method=forres&activityId="+activity_id+"&processId="+process_id;    
 }if(formplugin.indexOf("MdaForm")>=0){
	  document.forms[0].action ="moftaskinfo.cmd?method=forres&activityId="+activity_id+"&processId="+process_id;    
 }else{
      document.forms[0].action ="taskinfo.cmd?method=forres&activityId="+activity_id+"&processId="+process_id;     
 }
 document.forms[0].submit();	
}
function openFlow(){
if(!getSelect())return;
var row=grid.getCheckAll().split(",");
var url="taskinfo.cmd?method=displaystatus&processId="+row[2];
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
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
function doReturn(){
var edocSign=document.all("isEdoc").value;
if(edocSign=="1")
	window.location.href="taskinfomonitor.cmd?method=getProcessTypeList&processType=EDOC";
else	
	window.location.href="taskinfomonitor.cmd?method=getProcessTypeList";
}
function forlog(infoType){
  if(!getSelect())return;
  var row=grid.getCheckAll("$").split("$");

  //var row=grid.getCurrentLine();
  var processId=row[2];//grid.getCellValue(row,3);
  window.location.href="edocmonitorinfoquery.cmd?infoType="+infoType+"&processId="+processId;    

}
function hslog(){
	window.location.href="edocmonitorinfoquery.cmd?infoType=3";
}
function delFlow(){
	var sel=grid.getCheckLineNo();
  	if(sel==""){
	    alert("请选择一条记录!");
	    return false;
  	}
  	if(!confirm("确定要删除选中的记录吗，此操作不可恢复！")){
  		return false;
  	}
  	var processIds="";
  	var subjects="";
  	var rows=sel.split(",");
  	for(var i=0;i < rows.length; i++){
  		var procId=grid.getCellValue(rows[i],3);
  		var procSubject=grid.getCellValue(rows[i],5);
  		
  		if(i!=0){
  			processIds=processIds+",";
  			subjects=subjects+",";
  		}
  		processIds=processIds+procId;
  		subjects=subjects+procSubject;
  	}
  	document.forms[0].action="taskinfo.cmd?method=delProcessForMonitedTask&processIds="+processIds+"&processSubjects="+subjects;
  	document.forms[0].submit();
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
 document.forms[0].action ="restaskinfoquery.cmd";
 document.forms[0].submit();
 }
 /**改发：变更当前环节的处理人*/
function reAssign(){
	if(!getSelect())return;
	
	var row=grid.getCheckAll().split(",");
	var processId=row[2];
	var sourceId=row[18];
	var sourceName=row[6];
	var sourceType=row[17];
	if("HUMAN"!=sourceType){
		alert("对不起，角色任务不允许使用该操作！");
		return;
	}
	var url = "jsp/help.jsp?url=taskinfo.cmd&method=forassigndialog&processId="+processId+"&activityUser="+sourceId+"&activityUserType="+sourceType;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:600px;status:no;scroll:no');
	if(obj==null)return;
  
	var DCWORK_ACTIVITY_MSGTYPES =obj[0];
	var MESSAGE_MANAGER =obj[1];
	var NEW_USER_ID =obj[2];
	var NEW_USER_NAME =obj[3];
	var OPERATE_REASON =obj[4];
	var OLD_USER_NOTE =obj[5];
	var NEW_USER_NOTE =obj[6];
	//var OLD_USER_ID =obj[7];
	//var OLD_USER_NAME =obj[8];
	
	
	//var url ="struhelp.cmd?method=getSelectRoot&isCheckBox=0&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=1&nevervote=1&organType=8";   
  	//var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:500px;dialogHeight:550px");
 	//if(win==null)return;
 	//if(win.length==0)return;
	//if(win[0]==""){
	//	return;
	//}
	
	var operateType="改发";
	//var targetId=win[0];
	//var targetName=win[1];
	
	var activityId=row[1];
	var actName=row[5];
	var subject=row[4];
	var procDefId=row[19];
	var processName=row[12];
	var processType=row[22];
	var actDefId=row[20];
	var curFormId=row[15];
	var Ins_DATAID=row[21];
	if(NEW_USER_ID==sourceId){
		alert("选择的新处理人和原处理人相同，请重新选择!");
		return;
	}
	var url2="taskinfo.cmd?method=reAssign&processId="+processId+"&operateType="+operateType
			+"&activityId="+activityId+"&curFormId="+curFormId+"&Ins_DATAID="+Ins_DATAID
			+"&NEW_USER_ID="+NEW_USER_ID+"&NEW_USER_NAME="+NEW_USER_NAME+"&OLD_USER_ID="+sourceId
			+"&OLD_USER_NAME="+sourceName+"&activityUserType="+sourceType
			+"&actName="+actName+"&subject="+subject+"&procDefId="+procDefId+"&processName="+processName
			+"&processType="+processType+"&actDefId="+actDefId+"&DCWORK_ACTIVITY_MSGTYPES="+DCWORK_ACTIVITY_MSGTYPES
			+"&MESSAGE_MANAGER="+MESSAGE_MANAGER+"&OPERATE_REASON="+OPERATE_REASON+"&OLD_USER_NOTE="+OLD_USER_NOTE
			+"&NEW_USER_NOTE="+NEW_USER_NOTE;
	
	
	document.forms[0].action =url2;
	
	document.forms[0].submit();	
}
/**跳过：把任务从当前环节跳转到其它环节*/
function jumpTo(){
	if(!getSelect())return;
	
	var row=grid.getCheckAll().split(",");
	
	var processId=row[2];
	var procDefId=row[19];
	var userType=row[17];
	
	if(userType!="HUMAN"){
		alert("对不起，角色任务不允许使用该操作！");
		return;
	}
	var url="taskinfo.cmd?method=getjumpactivities&processId="+processId;
	var obj=showModalDialog(url,window,'dialogWidth:500px;dialogHeight:400px;status:no;scroll:no');
	if(obj==null)return;
	
	var nextActivityName=obj[0];
	var nextActivityDisName=obj[1];
	var nextActivityPartyName =obj[2];
	var nextActivityPartyDisName =obj[3];
	
	var DCWORK_ACTIVITY_ISREVERT =obj[4];
	var DCWORK_ACTIVITY_MSGTYPES =obj[5];
	var OPERATE_REASON =obj[6];
	var DCWORK_ACTIVITY_DURATION_UNIT =obj[7];
	var DCWORK_ACTIVITY_LIMIT_TIME =obj[8];
	var DCWORK_ACTIVITY_WARN_TIME =obj[9];
	
	var action="taskinfo.cmd?method=jumpTo";
	action+="&curFlowId="+procDefId;
	action+="&curFlowName="+row[12];
	action+="&curActDefId="+row[20];
	action+="&processId="+processId;
	action+="&activityId="+row[1];
	action+="&curActivityName="+row[5];
	action+="&nextActivityName="+nextActivityName;
	action+="&nextActivityDisName="+nextActivityDisName;
	action+="&curFormId="+row[15];
	action+="&dataId="+row[21];
	action+="&Ins_DATAID="+row[21];
	action+="&activityUser="+row[18];
	action+="&operateType=跳过";
	action+="&nextActivityPartyName="+nextActivityPartyName;
	action+="&nextActivityPartyDisName="+nextActivityPartyDisName;
	
	action+="&DCWORK_ACTIVITY_ISREVERT="+DCWORK_ACTIVITY_ISREVERT;
	action+="&DCWORK_ACTIVITY_MSGTYPES="+DCWORK_ACTIVITY_MSGTYPES;
	action+="&OPERATE_REASON="+OPERATE_REASON;
	action+="&DCWORK_ACTIVITY_DURATION_UNIT="+DCWORK_ACTIVITY_DURATION_UNIT;
	action+="&DCWORK_ACTIVITY_LIMIT_TIME="+DCWORK_ACTIVITY_LIMIT_TIME;
	action+="&DCWORK_ACTIVITY_WARN_TIME="+DCWORK_ACTIVITY_WARN_TIME;
	
	if(nextActivityPartyName==null || nextActivityPartyName==""){
		action+="&NOT_SELPARTY=yes";
	}
	
	window.event.srcElement.disabled = true;
	document.forms.item(0).action = action;
	if(!document.forms.item(0).submit(false)){
		window.event.srcElement.disabled = false;
	}
}
</script>