<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>
<%@ page import="net.mast.bsp.util.DateUtil"%>

<%
    String beginTime = request.getParameter("beginTime");
	if (beginTime==null){
	  String currentTime = DateUtil.getCurrentDateTime();
	  beginTime=currentTime.substring(0,14);
	}
    String endTime = request.getParameter("endTime");
	if (endTime==null){
	String currentTime = DateUtil.getCurrentDateTime();
	  endTime=currentTime.substring(0,14);
	}
    String logType = request.getParameter("logType");
	if (logType==null){
	  logType="";
	}
    String corporationId = request.getParameter("corporationId");
	if (corporationId==null){
	  corporationId="";
	}
    String corporationName = request.getParameter("corporationName");
	if (corporationName==null){
	  corporationName="";
	}
    String userId = request.getParameter("userId");
	if (userId==null){
	  userId="";
	}
    String remoteAddr = request.getParameter("remoteAddr");
	if (remoteAddr==null){
	  remoteAddr="";
	}
%>

<HTML>
<HEAD>
<TITLE>安全日志查询</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='mastfunction.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

<bsp:container title="安全日志查询" >
<bsp:containbutton onclick="forDetail()" text="明细" action="securityLog.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forBeanDetail()" text="Cmd 明细" action="CmdLog.cmd?method=detailCmdBean"></bsp:containbutton>

<bsp:containbutton onclick="forDelete()" text="批量删除日志" action="securityLog.cmd?method=forDelete"></bsp:containbutton>
<bsp:containbutton onclick="querySessionTerminal()" text="会话追踪" action="securityLog.cmd?method=querySessionTerminal"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="querySecurityLog.cmd">
<table id="tblSearch">
<flex:search>

	<tr　nowrap>
        <td align="left" nowrap>开始时间：</td>
        <td><flex:searchDate name="beginTime"  divname="date1" searchName="PUB_SECURITY_LOG.LOG_TIME" dataType="java.lang.String" operSymbol="=" value="<%=beginTime%>" hastime="true" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm" readonly="false" >
	</flex:searchDate><FONT COLOR=#ff0000>*</FONT></td>
	<td align="left" nowrap>结束时间：</td>
	<td nowrap><flex:searchDate name="endTime" divname="date2" searchName="PUB_SECURITY_LOG.LOG_TIME" dataType="java.lang.String" operSymbol="=" value="<%=endTime%>" hastime="true" sourceFormat="yyyyMMdd HH:mm" targetFormat="yyyyMMdd HH:mm" readonly="false">
	</flex:searchDate><FONT COLOR=#ff0000>*</FONT></td>
	<td align="left" nowrap>类型：</td>
	<td><flex:searchSelect name="logType" searchName="PUB_SECURITY_LOG.LOG_TYPE" dataType="java.lang.String" operSymbol="=" value="<%=logType%>" >
	              <html:options collection="logTypeCollection" labelProperty="logName" property="logId"/>
	</flex:searchSelect></td>
	</tr>
	<tr>
	<td align="left">所属机构：</td>
	<td>
	<flex:searchHidden name="corporationId" searchName="PUB_SECURITY_LOG.CORPORATION_ID" dataType="java.lang.String" operSymbol="=" value="<%=corporationId%>" >
	</flex:searchHidden>
	<flex:searchText name="corporationName" searchName="PUB_SECURITY_LOG.CORPORATION_NAME" dataType="java.lang.String" operSymbol="=" value="<%=corporationName%>" readonly="true" size="12" ondblclick="clean()">
	</flex:searchText><img src="skins/default/images/liulan.gif" width="28" style="cursor:hand" height="16" border="0" onclick="selectCorporation()">
	</td>
        <td align="left">用户帐号：</td>
        <td><flex:searchText name="userId" searchName="PUB_SECURITY_LOG.USER_ID" dataType="java.lang.String" operSymbol="=" value="<%=userId%>" size="12">
	</flex:searchText>
	</td>
	<td align="left" nowrap>客户端IP：</td>
	<td><flex:searchText name="remoteAddr" searchName="PUB_SECURITY_LOG.REMOTEADDR" dataType="java.lang.String" operSymbol="=" value="<%=remoteAddr%>" size="12">
	</flex:searchText></td>
	<td><flex:searchImg name="search" action="querySecurityLog.cmd" image="search.gif" imgClick="if(!check()) return false"/></td>
	</tr>
</flex:search>
</table>
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
                                <flex:radioCol caption="选择" width="40" property="logId"  name="primaryKey" sortName="PUB_SECURITY_LOG.LOG_ID"></flex:radioCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.SESSION_ID")%>' width="100" property="sessionId" sortName="PUB_SECURITY_LOG.SESSION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_ID")%>' width="100" property="userId" style="text-align:left" sortName="PUB_SECURITY_LOG.USER_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_NAME")%>' width="100" property="userName" style="text-align:left" sortName="PUB_SECURITY_LOG.USER_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TYPE_NAME")%>' width="100" property="logTypeName" style="text-align:left" sortName="PUB_SECURITY_LOG.LOG_TYPE_NAME"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_LEVEL")%>' width="100" property="userLevel" sortName="PUB_SECURITY_LOG.USER_LEVEL" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.CORPORATION_ID")%>' width="100" property="corporationId" sortName="PUB_SECURITY_LOG.CORPORATION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.CORPORATION_NAME")%>' width="100" property="corporationName" sortName="PUB_SECURITY_LOG.CORPORATION_NAME" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TIME")%>' width="100" property="logTime" style="text-align:left" sortName="PUB_SECURITY_LOG.LOG_TIME" ></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEADDR")%>' width="100" property="remoteaddr" style="text-align:left" sortName="PUB_SECURITY_LOG.REMOTEADDR"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEHOST")%>' width="100" property="remotehost" sortName="PUB_SECURITY_LOG.REMOTEHOST" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEPORT")%>' width="100" property="remoteport" sortName="PUB_SECURITY_LOG.REMOTEPORT" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALADDR")%>' width="100" property="localaddr" sortName="PUB_SECURITY_LOG.LOCALADDR" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALHOST")%>' width="100" property="localhost" sortName="PUB_SECURITY_LOG.LOCALHOST" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALPORT")%>' width="100" property="localport" sortName="PUB_SECURITY_LOG.LOCALPORT" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.RESOURCE_ID")%>' width="100" property="resourceId" sortName="PUB_SECURITY_LOG.RESOURCE_ID" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.RESOURCE_ALIAS")%>' width="100" property="resourceAlias" style="text-align:left" sortName="PUB_SECURITY_LOG.RESOURCE_ALIAS" ></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.SECURITY_LEVEL")%>' width="100" property="securityLevel" sortName="PUB_SECURITY_LOG.SECURITY_LEVEL" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TYPE")%>' width="100" property="logType" sortName="PUB_SECURITY_LOG.LOG_TYPE" style="display:none"></flex:flexCol>			
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_CONTENT")%>' width="100" property="logContent" sortName="PUB_SECURITY_LOG.LOG_CONTENT" style="display:none"></flex:flexCol>
</flex:flexgrid>
<flex:pagePolit action="querySecurityLog.cmd" pageSize="15">
</flex:pagePolit>
</html:form>
</bsp:container>
</body>
</html>
<script language="javascript">
grid.dblclickEvent=function()
{
var logTime = grid.getCellValue(grid.getCurrentLine(),9);
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="securityLog.cmd?method=detail&logTime="+logTime+"&primaryKey="+id;
}
function clean(){
	document.forms[0].corporationId.value="";
	document.forms[0].corporationName.value="";
}
grid.show();
grid.setSumText("");
grid.setTouAlign(3,"center");
grid.setTouAlign(4,"center");
grid.setTouAlign(5,"center");
grid.setTouAlign(9,"center");
grid.setTouAlign(10,"center");
grid.setTouAlign(17,"center");
function check(){
  var userId=document.all("userId");
  userId.value=trim(userId.value);
  var remoteAddr=document.all("remoteAddr");
  remoteAddr.value=trim(remoteAddr.value);

  var beginTime = document.all("beginTime").value;
  var endTime = document.all("endTime").value;
  var ip = remoteAddr.value;
  var day1 = beginTime.substring(0,8);
  var day2 = endTime.substring(0,8);
  if(trim(beginTime)==""){
     alert("开始时间不能为空！");
     return false;
  }
  if(!checkTimeFormat("yyyyMMdd hh:mm",beginTime)){
  	alert("开始时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("beginTime").select();
    document.all("beginTime").focus();
    return false;
  }
  if(trim(endTime)==""){
     alert("结束时间不能为空！");
     return false;
  }
  if(!checkTimeFormat("yyyyMMdd hh:mm",endTime)){
  	alert("结束时间格式应该是'yyyyMMdd hh:mm'的形式！");
  	document.all("endTime").select();
    document.all("endTime").focus();
    return false;
  }
  if(endTime<beginTime){
     alert("开始时间不能大于结束时间！");
     return false;
  }
 //20070205针对dcwork修改 
 // if(day1!=day2){
    // alert("查询范围：开始时间和结束时间必须在同一天！");
    // return false;
 // }
  if(ip==""||ip=="127.0.0.1"){
    return true;
  }
  if(!__checkIp(ip)){
     alert("请输入正确的IP格式！");
     return false;
  }
  return true
     
}
function forDetail(){
  if(!getSelect()) return;
   var rowAll = grid.getCheckAll();
   var  row=rowAll.split(",");
   var logTime=row[8];
  document.forms[0].action ="securityLog.cmd?method=detail&logTime="+logTime;    
  document.forms[0].submit();	
}

function forBeanDetail(){
  if(!getSelect()) return;
 // var row = grid.getCurrentLine();
 // var securityLogId = grid.getCellValue(row,1);
  //if(securityLogId==null||securityLogId==""){
  //alert("请选择一条记录");
  //return;
 // }
    var rowAll = grid.getCheckAll();
   var  row=rowAll.split(",");
   var securityLogId=row[0];
  document.forms[0].action ="CmdLog.cmd?method=detailCmdBean&securityLogId="+securityLogId;    
  document.forms[0].submit();	
}


function forDelete(){
  
  document.forms[0].action ="securityLog.cmd?method=forDelete";    
  document.forms[0].submit();	
}
function querySessionTerminal(){
  if(!getSelect()) return;
  var rowAll = grid.getCheckAll();
  var  row=rowAll.split(",");
  var sessionId = row[1];
  document.forms[0].action ="securityLog.cmd?method=querySessionTerminal&sessionId="+sessionId;    
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
function selectCorporation(){
      var cmdUrl ="stru.cmd&method=getSelectRoot&isCheckBox=0&isIncludeSelf=1&isTree=1&isIncludeSubCorporation=1&organType=1,2"; 
      var url ="jsp/help.jsp?url="+cmdUrl; 
      var win = showModalDialog(url,window,"scroll:yes;status:no;dialogWidth:512px;dialogHeight:384px"); 
      if (win == null) {  
  	return;
      }else{
      document.all("corporationId").value=win[2];
      document.all("corporationName").value=win[1];
      }
}
</script>