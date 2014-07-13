<%@ page contentType="text/html;charset=GBK" %>
<%@ taglib uri="/tags/web-flex" prefix="flex"%>
<%@ taglib uri="/tags/web-grid" prefix="grid"%>
<%@ taglib uri="/tags/web-html" prefix="html"%>
<%@ taglib uri="/tags/web-mast" prefix="mast"%>
<%@ taglib uri="/tags/web-widgets" prefix="widgets"%>
<%@ taglib uri="/tags/mast-bsp" prefix="bsp"%>
<%@ page import="net.mast.waf.ResourcesFactory"%>

<%
      String sessionId = (String)request.getAttribute("sessionId");
%>

<HTML>
<HEAD>
<TITLE>会话追踪</TITLE>
<link rel="stylesheet" type="text/css" href="<mast:ui css='skin.css'/>">
<link rel="stylesheet" type="text/css" href="<mast:ui css='css_xp4.css'/>">
</HEAD>
<BODY topmargin="10px">
<script language="javascript" src="<mast:ui js='bsp.js'/>"></script>
<script language="javascript" src="<mast:ui js='flexgrid.js'/>"></script>
<script language="javascript" src="<mast:ui js='calendar.js'/>"></script>
<link rel="stylesheet" type="text/css" href="<mast:ui css='flexgrid.css'/>">

<bsp:container title="会话追踪" >
<bsp:containbutton onclick="forDetail()" text="明细" action="securityLog.cmd?method=detail"></bsp:containbutton>
<bsp:containbutton onclick="forBeanDetail()" text="对应Cmd 明细" action="CmdLog.cmd?method=detailCmdBean"></bsp:containbutton>
<bsp:containbutton onclick="javascript:window.history.go(-1)" text="返回"></bsp:containbutton>
<html:messages></html:messages>
<html:form name="frmList" action="">
<html:hidden name="sessionId" value="<%=sessionId%>" />
<flex:flexgrid name="grid" height="340" action="" isSubmit="true">
                                <flex:radioCol caption="选择" width="40" property="logId"  name="primaryKey" sortName="PUB_SECURITY_LOG.LOG_ID"></flex:radioCol> 				
                                <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_ID")%>' width="100" property="logId" sortName="PUB_SECURITY_LOG.LOG_ID" style="display:none"></flex:flexCol>
                                <flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.SESSION_ID")%>' width="100" property="sessionId" sortName="PUB_SECURITY_LOG.SESSION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_ID")%>' width="100" property="userId" sortName="PUB_SECURITY_LOG.USER_ID"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_NAME")%>' width="100" property="userName" sortName="PUB_SECURITY_LOG.USER_NAME"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TYPE_NAME")%>' width="100" property="logTypeName" sortName="PUB_SECURITY_LOG.LOG_TYPE_NAME"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.USER_LEVEL")%>' width="100" property="userLevel" sortName="PUB_SECURITY_LOG.USER_LEVEL" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.CORPORATION_ID")%>' width="100" property="corporationId" sortName="PUB_SECURITY_LOG.CORPORATION_ID" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.CORPORATION_NAME")%>' width="100" property="corporationName" sortName="PUB_SECURITY_LOG.CORPORATION_NAME" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TIME")%>' width="120" property="logTime" sortName="PUB_SECURITY_LOG.LOG_TIME" ></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEADDR")%>' width="100" property="remoteaddr" sortName="PUB_SECURITY_LOG.REMOTEADDR" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEHOST")%>' width="100" property="remotehost" sortName="PUB_SECURITY_LOG.REMOTEHOST" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.REMOTEPORT")%>' width="100" property="remoteport" sortName="PUB_SECURITY_LOG.REMOTEPORT" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALADDR")%>' width="100" property="localaddr" sortName="PUB_SECURITY_LOG.LOCALADDR" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALHOST")%>' width="100" property="localhost" sortName="PUB_SECURITY_LOG.LOCALHOST" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOCALPORT")%>' width="100" property="localport" sortName="PUB_SECURITY_LOG.LOCALPORT" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.RESOURCE_ID")%>' width="100" property="resourceId" sortName="PUB_SECURITY_LOG.RESOURCE_ID" style="display:none"></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.RESOURCE_ALIAS")%>' width="100" property="resourceAlias" sortName="PUB_SECURITY_LOG.RESOURCE_ALIAS" ></flex:flexCol>
  				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.SECURITY_LEVEL")%>' width="100" property="securityLevel" sortName="PUB_SECURITY_LOG.SECURITY_LEVEL" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_TYPE")%>' width="100" property="logType" sortName="PUB_SECURITY_LOG.LOG_TYPE" style="display:none"></flex:flexCol>
				<flex:flexCol caption='<%=ResourcesFactory.getString("PUB_SECURITY_LOG.LOG_CONTENT")%>' width="100" property="logContent" sortName="PUB_SECURITY_LOG.LOG_CONTENT" style="display:none"></flex:flexCol>
</flex:flexgrid>
</html:form>
</bsp:container>
</body>
</html>
<script language="javascript">
grid.dblclickEvent=function()
{var logTime = grid.getCellValue(grid.getCurrentLine(),10);
var id = grid.getCellValue(grid.getCurrentLine(),1);
location.href="securityLog.cmd?method=detail&logTime="+logTime+"&primaryKey="+id;
}
grid.show();
grid.setSumText("");
function forDetail(){
  if(!getSelect()) return;
  var rowAll = grid.getCheckAll();
  var  row=rowAll.split(",");
  var logTime = row[9];
  document.forms[0].action ="securityLog.cmd?method=detail&logTime="+logTime;     
  document.forms[0].submit();	
}
function forBeanDetail(){
  if(!getSelect()) return;
 // var row = grid.getCurrentLine();
  //var securityLogId = grid.getCellValue(row,1);
  //if(securityLogId==null||securityLogId==""){
  //alert("请选择一条记录");
   // return;
  //}
  var rowAll = grid.getCheckAll();
  var  row=rowAll.split(",");
  var securityLogId = row[0];
  document.forms[0].action ="CmdLog.cmd?method=detailCmdBean&securityLogId="+securityLogId;    
  document.forms[0].submit();	
}

function forReturn(){
  self.location.href ="querySecurityLog.cmd?clear=true";
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