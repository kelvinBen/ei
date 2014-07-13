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
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
</HEAD>
<BODY topmargin="10px" onload="init();">
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
	String extReturnUrl="finishtaskinfoquery.cmd?procDefId="+procDefId+"&processType="+processType+"&organId="+organId+"&isShowReturnBtn="+isShowReturnBtn;
%>
<html:form name="frmList" action="finishtaskinfoquery.cmd">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="procDefId" value="<%=procDefId%>">
<input type="hidden" name="EXT_RETURN_URL" value="<%=extReturnUrl%>">
<input type="hidden" name="organId" value="<%=organId%>">
<input type="hidden" name="isShowReturnBtn" value="<%=isShowReturnBtn%>">
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
} %>
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
	<td class="tdRight"><flex:searchImg name="chaxun" action="javascript:forsearch()" image="search.gif"/></td>
	</tr>
	<tr>
	</tr>
</flex:search>
</table>
</fieldset>
 </div>
<support:flexgrid name="grid" height="360" action="" isSubmit="true">
     <flex:radioCol caption="选择" width="35" property="PROCESS_ID"  name="primaryKey" sortName="a.b"></flex:radioCol>
     <flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.SUBJECT" style="display:none"></flex:flexCol>						  
     <flex:flexCol caption='流程名称' width="250" property="PROCESS_NAME" sortName="taskinfo.PROCESS_NAME" style="display:none"></flex:flexCol>	
     <flex:flexCol caption='表单类型' width="100" property="PROCESS_RESERVE_TYPE_ID" sortName="taskinfo.PROCESS_RESERVE_TYPE_ID" style="display:none"  canSort="false">  </flex:flexCol>              
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
		 	 <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" type="enum" enumCollection="PRWPRAPPLY_FLDESTIMATECURRENCY_COLLECTION" enumKey ="key" enumValue="value" sortName="taskinfo.<%=fieldid%>" />
		 	
		 	<%}else{
			%>
		     <flex:flexCol caption="<%=title%>" width="150" property="<%=fieldid%>" sortName="taskinfo.<%=fieldid%>" />
			<%
		 	}
	 		}
			}
			%>    					  
     	<flex:flexCol caption='发起人' width="100" property="RESOURCE_REQ_NAME" sortName="taskinfo.RESOURCE_REQ_NAME"></flex:flexCol>
     	<flex:flexCol caption='发起时间' width="150" property="STARTED_TIME" sortName="taskinfo.STARTED_TIME"></flex:flexCol>
     	
     	<flex:flexCol caption='结束时间' width="150" property="LAST_STATE_TIME" sortName="taskinfo.LAST_STATE_TIME" ></flex:flexCol>
</support:flexgrid>
<flex:pagePolit action="allTaskInfo.cmd?method=queryYiBan">
</flex:pagePolit>
</html:form>
</body>
</html>
<script language="javascript">
function init(){
setTitleInTreeBar("工作流程－任务管理－结束任务");

//setGridHeight("grid",0.4);
grid.show();
grid.setSumText("");

var procDefId = document.all("procDefId").value;
if (procDefId == "Package_78a048534f0_Wor1" || procDefId == "Package_d710071985_Wor1"){
	init2();
}else{
	for(var i=1;i<grid.returnRowCount()+1;i++){
		var process_id=grid.getCellValue(i, 1);
		var subject=grid.getCellValue(i, 5);
		var processName=grid.getCellValue(i, 3);
		var formplugin=grid.getCellValue(i ,4);
		 grid.getCell(i, 5).innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"','"+formplugin+"')\">"+subject+"</a></span>";
		grid.getCell(i, 3).innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"','"+formplugin+"')\">"+processName+"</a></span>";
								
	}
}

}

function openFlow(){
if(!getSelect())return;
var sel=grid.getCheckLine();
var url="taskinfo.cmd?method=displaystatus&processId="+sel;
  
 showModalDialog(url,window,'dialogWidth:800px;dialogHeight:600px;status:no;scroll:yes');
}
function forEnd(process_id,formplugin,url){
//可以对无表单的url进行处理，可扩展
  if(formplugin.indexOf("Jsp_NoneField")>=0){
      document.forms[0].action ="wftaskdeal.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("Jsp_Field")>=0){
   document.forms[0].action ="jspfield.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("MdaForm")>=0){
  	  document.forms[0].action ="moftaskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }else if(formplugin.indexOf("JspForm")>=0){
  		document.forms[0].action = "jspformtaskdeal.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }if(formplugin.indexOf("wfd_self")>=0){
	  document.forms[0].action ="taskinfo.cmd?method=forwfd_selfend&processId="+process_id+"&user_id="+document.all("organId").value;

  }else{
	  document.forms[0].action ="taskinfo.cmd?method=forend&processId="+process_id+"&user_id="+document.all("organId").value;
  }
  document.forms[0].submit();	
}
function forReturn(){
	var isShowReturnBtn=document.all("isShowReturnBtn").value;
		
	if(isShowReturnBtn!="")
		window.location.href="taskinfoforemp.cmd?method=getTaskInfoForEmp&isShowReturnBtn="+isShowReturnBtn+"&organId="+document.all("organId").value;
	else	
	window.location.href="taskinfofinish.cmd?method=getProcessTypeList"; 
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

	//var startTime=document.all("startTime").value;
	//var endTime=document.all("endTime").value;
	//if(startTime!="" && endTime!=""){
	//	if(startTime>endTime){
	//		alert("结束日期不能小于开始日期！");
	///		return;
	//	}
	//}
	document.forms[0].action="allTaskInfo.cmd?method=queryYiBan";
	document.forms[0].submit();	
}
</script>
<script type="text/javascript" src="js/sp/FlexGridOverride.js"></script>
<script type="text/javascript" src="jsp/workflow/taskinfo/finish_custom.js"></script>