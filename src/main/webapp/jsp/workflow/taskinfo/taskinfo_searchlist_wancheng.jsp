<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-support" prefix="support"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<HTML>
<HEAD>
<TITLE></TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='dcwork.js'/>"></script>
</HEAD>
<div class="btnareaCss">
<html:button name="返回" value="返回" onclick="forReturn()"></html:button>
</div>
<BODY topmargin="10px">
<%

String statusType=request.getParameter("statusType");
if(statusType==null)statusType="";
String user_id=request.getParameter("user_id");
if(user_id==null)user_id="";
String process_creator=request.getParameter("process_creator");
if(process_creator==null)process_creator="";
String process_startTime=request.getParameter("process_startTime");
if(process_startTime==null)process_startTime="";
String process_endTime=request.getParameter("process_endTime");
if(process_endTime==null)process_endTime="";
String processType=request.getParameter("processType");
if(processType==null)processType="";

String SUBJECT=request.getParameter("SUBJECT");
if(SUBJECT==null)SUBJECT="";
String EDOC_TYPE=request.getParameter("EDOC_TYPE");
if(EDOC_TYPE==null)EDOC_TYPE="";
String SECRET_LEVEL=request.getParameter("SECRET_LEVEL");
if(SECRET_LEVEL==null)SECRET_LEVEL="";
String KEEP_SECRET_TIME=request.getParameter("KEEP_SECRET_TIME");
if(KEEP_SECRET_TIME==null)KEEP_SECRET_TIME="";
String INSTANT_LEVEL=request.getParameter("INSTANT_LEVEL");
if(INSTANT_LEVEL==null)INSTANT_LEVEL="";
String CREATE_ORGAN=request.getParameter("CREATE_ORGAN");
if(CREATE_ORGAN==null)CREATE_ORGAN="";
String WORD_NUMBER=request.getParameter("WORD_NUMBER");
if(WORD_NUMBER==null)WORD_NUMBER="";
String MAIN_SEND_ORGAN=request.getParameter("MAIN_SEND_ORGAN");
if(MAIN_SEND_ORGAN==null)MAIN_SEND_ORGAN="";
String APPROVE_DATE=request.getParameter("APPROVE_DATE");
if(APPROVE_DATE==null)APPROVE_DATE="";
String S_KEYWORD=request.getParameter("KEYWORD");
if(S_KEYWORD==null)S_KEYWORD="";
String COPY_SEND_ORGAN=request.getParameter("COPY_SEND_ORGAN");
if(COPY_SEND_ORGAN==null)COPY_SEND_ORGAN="";
String OUTER_SEND_ORGAN=request.getParameter("OUTER_SEND_ORGAN");
if(OUTER_SEND_ORGAN==null)OUTER_SEND_ORGAN="";
String CREATE_DATE=request.getParameter("CREATE_DATE");
if(CREATE_DATE==null)CREATE_DATE="";
String APPROVE_USER_ID=request.getParameter("APPROVE_USER_ID");
if(APPROVE_USER_ID==null)APPROVE_USER_ID="";
String reserveStr=request.getParameter("reserveStr");
if(reserveStr==null)reserveStr="";
String returnUrl="taskinfosearch.cmd?method=search";
	   returnUrl+="&statusType="+statusType;
	   returnUrl+="&user_id="+user_id;
	   returnUrl+="&process_creator="+process_creator;
	   returnUrl+="&process_startTime="+process_startTime;
	   returnUrl+="&process_endTime="+process_endTime;
	   returnUrl+="&processType="+processType;
	   
	   returnUrl+="&SUBJECT="+SUBJECT;
	   returnUrl+="&EDOC_TYPE="+EDOC_TYPE;
	   returnUrl+="&SECRET_LEVEL="+SECRET_LEVEL;
	   returnUrl+="&KEEP_SECRET_TIME="+KEEP_SECRET_TIME;
	   returnUrl+="&INSTANT_LEVEL="+INSTANT_LEVEL;
	   returnUrl+="&CREATE_ORGAN="+CREATE_ORGAN;
	   returnUrl+="&WORD_NUMBER="+WORD_NUMBER;
	   returnUrl+="&MAIN_SEND_ORGAN="+MAIN_SEND_ORGAN;
	   returnUrl+="&APPROVE_DATE="+APPROVE_DATE;
	   returnUrl+="&\40COPY_SEND_ORGAN="+COPY_SEND_ORGAN;
	   returnUrl+="&OUTER_SEND_ORGAN="+OUTER_SEND_ORGAN;
	   returnUrl+="&CREATE_DATE="+CREATE_DATE;
	   returnUrl+="&APPROVE_USER_ID="+APPROVE_USER_ID;
	   returnUrl+="&KEYWORD="+S_KEYWORD;
	   returnUrl+="&reserveStr="+reserveStr;
%>
<html:form name="frmList" action="">

<input type="hidden" name="EXT_RETURN_URL" value="<%=returnUrl%>">
<input type="hidden" name="statusType" value="<%=statusType%>">
<input type="hidden" name="user_id" value="<%=user_id%>">
<input type="hidden" name="process_creator" value="<%=process_creator%>">
<input type="hidden" name="process_startTime" value="<%=process_startTime%>">
<input type="hidden" name="process_endTime" value="<%=process_endTime%>">
<input type="hidden" name="processType" value="<%=processType%>">
<input type="hidden" name="SUBJECT" value="<%=SUBJECT%>">
<input type="hidden" name="EDOC_TYPE" value="<%=EDOC_TYPE%>">
<input type="hidden" name="SECRET_LEVEL" value="<%=SECRET_LEVEL%>">
<input type="hidden" name="KEEP_SECRET_TIME" value="<%=KEEP_SECRET_TIME%>">
<input type="hidden" name="INSTANT_LEVEL" value="<%=INSTANT_LEVEL%>">
<input type="hidden" name="CREATE_ORGAN" value="<%=CREATE_ORGAN%>">
<input type="hidden" name="WORD_NUMBER" value="<%=WORD_NUMBER%>">
<input type="hidden" name="MAIN_SEND_ORGAN" value="<%=MAIN_SEND_ORGAN%>">
<input type="hidden" name="APPROVE_DATE" value="<%=APPROVE_DATE%>">
<input type="hidden" name="KEYWORD" value="<%=S_KEYWORD%>">
<input type="hidden" name="COPY_SEND_ORGAN" value="<%=COPY_SEND_ORGAN%>">
<input type="hidden" name="OUTER_SEND_ORGAN" value="<%=OUTER_SEND_ORGAN%>">
<input type="hidden" name="CREATE_DATE" value="<%=CREATE_DATE%>">
<input type="hidden" name="APPROVE_USER_ID" value="<%=APPROVE_USER_ID%>">
<support:flexgrid name="grid" height="200" action="" isSubmit="false">
                         
                          <flex:flexCol caption='流程ID' width="100" property="id" sortName="taskinfo.sysProcessId" style="display:none"></flex:flexCol>						  				  
                          <flex:flexCol caption='标题' width="300" property="SUBJECT" sortName="taskinfo.sysProcessName"></flex:flexCol>						  
                          
                          <flex:flexCol caption='发起人' width="100" property="resourceReqName" sortName="taskinfo.sysResourceReqName"></flex:flexCol>
                          <flex:flexCol caption='发起时间' width="150" property="startedTime" sortName="taskinfo.sysProcStartedTime"></flex:flexCol>
                          <flex:flexCol caption='结束时间' width="150" property="lastStateTime" sortName="taskinfo.sysLastStateTime"></flex:flexCol>
                         
                         
</support:flexgrid>
</html:form>
<script language="javascript">
setTitleInTreeBar("工作流程－任务管理－结束任务");
//setGridHeight("grid",0.5);
grid.show();
grid.setSumText("");
for(var i=1;i<grid.returnRowCount()+1;i++){
		
		var process_id=grid.getCellValue(i, 1);
		var subject=grid.getCellValue(i, 2);
		grid.getCell(i, 2).innerHTML ="<span nowrap='true'><a href=\"javascript:forEnd('"+process_id+"')\">"+subject+"</a></span>";
								
}
function forEnd(process_id){
	
  document.forms[0].action ="taskinfo.cmd?method=forend&processId="+process_id;    
  document.forms[0].submit();	
}
function forReturn(){
	document.forms[0].action ="taskinfosearch.cmd?method=forsearch&processType=<%=processType%>";
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